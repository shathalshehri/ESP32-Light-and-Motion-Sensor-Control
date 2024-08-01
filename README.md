# ESP32 Light and Motion Sensor Control

This project demonstrates how to use an ESP32 to control an LED based on readings from a light sensor and a motion sensor. The LED will turn on when there is no light and motion is detected, and turn off otherwise. The sensor data is also sent to a database via a PHP script.

## Components

- **ESP32**: Microcontroller
- **Light Sensor**: Measures ambient light levels
- **Motion Sensor (PIR)**: Detects motion
- **LED**: Indicator light
- **WiFi Network**: For connecting the ESP32 to the server
- **Database**: MySQL or MariaDB to store sensor data

## Database Setup

1. **Create the Database and Table**

   [Download the SQL script](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/sensor_data.sql) and run it in your MySQL/MariaDB server to create the `sensor_data` table.

2. **PHP Script**

   Save the following PHP script as `update_sensor_data.php` on your server:

   [View the PHP script](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/update_sensor_data.php)

## ESP32 Code

Upload the following code to your ESP32 using the Arduino IDE:

[View the ESP32 code](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/electronics_sensors.ino)

```cpp
#include <WiFi.h>
#include <HTTPClient.h>

const int ledPin = 25;               // LED pin
const int lightSensorPin = 34;       // Light sensor pin
const int pirSensorPin = 27;          // Motion sensor pin

// Network credentials
const char* ssid = "your-SSID";       // Replace with your WiFi SSID
const char* password = "your-PASSWORD"; // Replace with your WiFi password

// PHP Script URL
const char* serverName = "http://your-server-url/update_sensor_data.php";

// Light threshold
const int LIGHT_THRESHOLD = 1000;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(pirSensorPin, INPUT);
  pinMode(lightSensorPin, INPUT);
  Serial.begin(115200);
  connectToWiFi();
}

void loop() {
  int lightLevel = analogRead(lightSensorPin);
  bool motionDetected = digitalRead(pirSensorPin);

  // Determine LED state based on light and motion sensor readings
  if (lightLevel < LIGHT_THRESHOLD && motionDetected == HIGH) {
    digitalWrite(ledPin, HIGH);  // Turn LED on
  } else {
    digitalWrite(ledPin, LOW);   // Turn LED off
  }

  // Send data to the server
  sendToServer(lightLevel, motionDetected);

  delay(10000); // Delay between readings
}

void connectToWiFi() {
  Serial.print("Connecting to WiFi");
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("Connected to WiFi");
}

void sendToServer(int lightLevel, bool motionDetected) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    String url = String(serverName) + "?light=" + String(lightLevel) + "&motion=" + (motionDetected ? "1" : "0");
    
    http.begin(url);
    int httpCode = http.GET();
    
    if (httpCode > 0) {
      String payload = http.getString();
      Serial.println("Server Response: " + payload);
    } else {
      Serial.println("Error on HTTP request: " + String(httpCode));
    }
    
    http.end();
  } else {
    Serial.println("Error: Not connected to WiFi");
  }
}
