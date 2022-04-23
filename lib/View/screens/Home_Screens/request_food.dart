import 'package:flutter/material.dart';

class RequestFood extends StatelessWidget {
  const RequestFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Request Food',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        children: const [
          Text(
            'Request Food',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
