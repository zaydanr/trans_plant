import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mqtt_service.dart'; // Import the MQTT service file

class SensorsPage extends StatefulWidget {
  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  final MqttService mqttService = MqttService();

  @override
  void initState() {
    super.initState();
    mqttService.connect('your_mqtt_username', 'your_mqtt_password');
  }

  @override
  void dispose() {
    mqttService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Sensors'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 139, 236, 83), 
                  Color.fromARGB(193, 3, 145, 3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.2, 1.2],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
                children: [
                  Center( // Center the "Sensors Data" text
                    child: Text(
                      'Sensor Data',
                      style: GoogleFonts.cabin(
                        textStyle: TextStyle(
                          color: Colors.white, 
                          fontSize: 40),
                        ),
                      ),
                  ),
                  SizedBox(height: 20), // Add spacing between the title and the readings
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add space between the left edge of the box and the icon
                        child: Icon(Icons.thermostat, color: Colors.white, size: 30), // Icon for temperature
                      ),
                      SizedBox(width: 10), // Add spacing between icon and text
                      Text(
                        'Temperature: ',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${mqttService.temperature}°F',
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add spacing between the readings
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add space between the left edge of the box and the icon
                        child: Icon(Icons.opacity, color: Colors.white, size: 30), // Icon for humidity
                      ),
                      SizedBox(width: 10), // Add spacing between icon and text
                      Text(
                        'Humidity: ${mqttService.humidity}%',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Add spacing between the readings
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // Add space between the left edge of the box and the icon
                        child: Icon(Icons.speed, color: Colors.white, size: 30), // Icon for pressure (using wind speed icon for simplicity)
                      ),
                      SizedBox(width: 10), // Add spacing between icon and text
                      Text(
                        'Pressure: ${mqttService.pressure} hPa',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // You can add more sensor readings here if needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
