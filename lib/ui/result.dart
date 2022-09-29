import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String _image;
  final String _text;

  const Result(this._image, this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Result"), backgroundColor: Colors.blueAccent),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            _image,
            fit: BoxFit.cover,
            height: 300.0,
          ),
          Center(
            child: Text(
              _text,
              style: const TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
