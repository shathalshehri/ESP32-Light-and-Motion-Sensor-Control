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


## Testing 

To ensure your ESP32 project is functioning correctly, follow these steps to test the different scenarios:

1. **Setup Hardware and Software**
   - **Hardware**: Connect the light sensor, motion sensor, and LED to the ESP32 according to the provided circuit diagram.
   - **Software**: Ensure the ESP32 code is uploaded and configured correctly, and the PHP script is deployed on your server.

2. **Testing Scenarios**

   - **Scenario 1: No Light and Motion Detected**
     1. **Environment**: Place the light sensor in a completely dark area and ensure the motion sensor is detecting motion. Note that a blue tape is placed on top of the light sensor to block light.
     2. **Expected Outcome**: The LED should turn ON when the light sensor detects no light and the motion sensor detects motion.
     3. **Verification**: Check the LED state and monitor the serial output for confirmation of the sensor values and server response.
     4. **Demo**: View the demonstration of scenarios 1 and 2 in action by watching the following GIF:
 
 ![Testing Scenarios 1 & 2](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/TestingScenarios1%2B2.gif)


   - **Scenario 2: No Light and No Motion Detected**
     1. **Environment**: Place the light sensor in a dark area and ensure the motion sensor is not detecting any motion. Note that a blue tape is placed on top of the light sensor to block light.
     2. **Expected Outcome**: The LED should remain OFF when there is no light and no motion.
     3. **Verification**: Observe the LED state and check the serial output to verify that both sensors are reporting no light and no motion.
     4. **Demo**: See the GIF for scenarios (1 and 2) above.

   - **Scenario 3: Light Detected and No Motion**
     1. **Environment**: Expose the light sensor to light and ensure the motion sensor is not detecting any motion. 
     2. **Expected Outcome**: The LED should remain OFF when there is light and no motion.
     3. **Verification**: Confirm the LED state and check the serial output to verify that the light sensor is detecting light and the motion sensor is reporting no motion.
     4. **Picture**: View the setup for scenario 3 in the following image:
        ![Scenario 3](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/Scenario3.jpeg)
     5. **Serial Monitor**: Check the serial monitor output for scenario 3:
        ![Scenario 3 Serial Monitor](https://github.com/shathalshehri/ESP32-Light-and-MotionSensorControl/blob/main/Scenario3SerialMonitor.jpeg)

3. **Monitoring and Debugging**
   - **Serial Monitor**: Use the Serial Monitor in the Arduino IDE to observe the light levels, motion detection status, and server responses.
   - **Database**: Check the database to ensure that the sensor data is being recorded correctly as per the conditions set in the ESP32 code.

4. **Adjustments**
   - If the LED does not behave as expected, verify the sensor connections, check the code logic, and ensure the server URL and credentials are correct.
   - Adjust the `LIGHT_THRESHOLD` in the ESP32 code if needed to match the sensitivity of your light sensor.

By following these steps, you can verify that your ESP32 project accurately controls the LED based on the readings from the light and motion sensors, and correctly logs the sensor data to the database.

