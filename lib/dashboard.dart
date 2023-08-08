import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mqtt_service.dart'; // Import the MQTT service file

class Weather extends StatefulWidget {
  Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  //final MqttService mqttService = MqttService(); // Instantiate the MQTT service

  @override
  void initState() {
    super.initState();
    // Replace 'your_mqtt_username' and 'your_mqtt_password' with actual MQTT credentials
    //mqttService.connect('64c14253811ec75105c1948a', 'QuRHxlbi8RDbkv7Nkq77N3Ps');
  }

  //@override
  //void dispose() {
    //mqttService.disconnect(); // Disconnect from the MQTT broker when the widget is disposed
    //super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.33,
                width: size.width,
                margin: EdgeInsets.only(right: 20, left: 20),
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Shady Grove',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.white, 
                            fontSize: 40),
                        ),
                      ),
                    ), 
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, top: 10),
                            child: Image.asset(
                              'assets/sunny.png',
                              width: size.width * 0.25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0, top: 14),
                            child: Image.asset(
                              'assets/humidity.png',
                              width: size.width * .18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Text(
                              'Sunny',
                              style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 95.0),
                            child: Text(
                              'Humidity:',
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
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 65.0, bottom: 35),
                            child: Text(
                              '75°F',
                              style: GoogleFonts.cabin(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 132.0, bottom: 35),
                            child: Text(
                              '50%',
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
