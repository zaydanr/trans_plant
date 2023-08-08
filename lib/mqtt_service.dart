import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final MqttServerClient _mqttClient = MqttServerClient('mqtt.things.ph', '64cd098d6f6b73d7c2f40ad9');

  // Sensor data
  double temperature = 0;
  double humidity = 0;
  double pressure = 0;
  int lightRelayStatus = 0;
  int pumpRelayStatus = 0;
  double moisture = 0;
  double light = 0;

  // Connect to the MQTT broker
  Future<void> connect(String username, String password) async {
    _mqttClient.logging(on: true);
    _mqttClient.onDisconnected = _onDisconnected;
    _mqttClient.onConnected = _onConnected;
    _mqttClient.onSubscribed = _onSubscribed;
    _mqttClient.onSubscribeFail = _onSubscribeFail;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('64cd098d6f6b73d7c2f40ad9')
        .authenticateAs('64c14253811ec75105c1948a', 'QuRHxlbi8RDbkv7Nkq77N3Ps')
        .startClean() // Non-persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    
    _mqttClient.connectionMessage = connMess;

    try {
      await _mqttClient.connect();
    } catch (e) {
      print('Exception: $e');
      _mqttClient.disconnect();
    }

    if (_mqttClient.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected');
      _subscribeToTopic('RasPiTransPlantMQTT'); // Subscribe to the sensors topic
    } else {
      print('MQTT client connection failed - disconnecting');
      _mqttClient.disconnect();
    }
  }

  void _onDisconnected() {
    print('MQTT client disconnected');
  }

  void _onConnected() {
    print('MQTT client connected');
  }

  void _onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void _onSubscribeFail(String topic) {
    print('Failed to subscribe to topic: $topic');
  }

  // Subscribe to the specified topic
  void _subscribeToTopic(String topic) {
    _mqttClient.subscribe(topic, MqttQos.atMostOnce);
    _mqttClient.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String payload = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('Received message from topic: $topic - Payload: $payload');

      // Parse the JSON payload and update sensor data
      final Map<String, dynamic> data = jsonDecode(payload);
      if (data.containsKey('temperature')) {
        temperature = data['temperature'];
      }
      if (data.containsKey('humidity')) {
        humidity = data['humidity'];
      }
      if (data.containsKey('pressure')) {
        pressure = data['pressure'];
      }
      if (data.containsKey('lightRelayStatus')) {
        lightRelayStatus = data['lightRelayStatus'];
      }
      if (data.containsKey('pumpRelayStatus')) {
        pumpRelayStatus = data['pumpRelayStatus'];
      }
      if (data.containsKey('moisture')) {
        moisture = data['moisture'];
      }
      if (data.containsKey('light')) {
        light = data['light'];
      }
    });
  }

  // Disconnect from the MQTT broker
  void disconnect() {
    if (_mqttClient.connectionStatus!.state == MqttConnectionState.connected) {
      _mqttClient.disconnect();
    }
  }
}
