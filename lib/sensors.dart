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
    mqttService.connect('64c14253811ec75105c1948a', 'QuRHxlbi8RDbkv7Nkq77N3Ps');
  }

  // Helper method to convert pump/light status to On/Off
  String _getOnOffStatus(int status) {
    return status == 1 ? 'On' : 'Off';
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
            child: Column(
              children: [
                Container(
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
                      children: [
                        Text(
                          'Sensors Data',
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40),
                          ),
                        ),

                        SizedBox(height: 20), // Add space between each row

                        // Temperature
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.thermostat, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Temperature: ${mqttService.temperature}°C',
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

                        SizedBox(height: 20), // Add space between each row

                        // Humidity
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.opacity, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Humidity: ${mqttService.humidity}%',
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

                        SizedBox(height: 20), // Add space between each row

                        // Pressure
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.speed, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Pressure: ${mqttService.pressure} hPa',
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

                        SizedBox(height: 20), // Add space between each row

                        // Light Relay Status
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.lightbulb, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Light Relay Status: ${_getOnOffStatus(mqttService.lightRelayStatus)}',
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

                        SizedBox(height: 20), // Add space between each row

                        // Pump Relay Status
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.settings, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Pump Relay Status: ${_getOnOffStatus(mqttService.pumpRelayStatus)}',
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

                        SizedBox(height: 20), // Add space between each row

                        // Moisture
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.water, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Moisture: ${mqttService.moisture}%',
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

                        SizedBox(height: 20), // Add space between each row

                        // Light (Lux)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(Icons.lightbulb_outline, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                'Light: ${mqttService.light} Lux',
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

                        SizedBox(height: 20), // Add space between each row

                        // Add more sensors here

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
