# ESP32 Light and Motion Sensor Control

This project involves using an ESP32 to control an LED based on readings from a light sensor and a motion sensor. The LED will turn on when there is no light and motion is detected, and turn off in all other cases. The sensor data is also sent to a database via a PHP script.

## Components

- **ESP32**: Microcontroller
- **Light Sensor**: Measures ambient light levels
- **Motion Sensor (PIR)**: Detects motion
- **LED**: Indicator light
- **WiFi Network**: For connecting the ESP32 to the server
- **Database**: MySQL or MariaDB to store sensor data

