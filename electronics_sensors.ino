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
