import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PaintScreen extends StatefulWidget {
  const PaintScreen({Key? key}) : super(key: key);

  @override
  _PaintScreenState createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late IO.Socket _socket;

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    try {
      _socket = IO.io('http://192.168.29.154:8080', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false
      });

      print('Socket created');

      _socket.onConnectError((data) {
        print('Connection error: $data');
      });

      _socket.connect();

      print('Connecting to socket...');

      _socket.onConnect((data) {
        print('Connection successful');
      });
    } catch (e) {
      print('Exception during connection: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
