import 'package:flutter/material.dart';
import 'result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetCampos() {
    weightController = TextEditingController();
    heightController = TextEditingController();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetCampos,
          )
        ], //<Widget>[]
      ), // app bar
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person, size: 120, color: Colors.blueAccent),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Weight (kg)",
                    labelStyle: TextStyle(color: Colors.blueAccent)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value!.isEmpty){
                    return "Enter your weight!";
                  }
                  else{
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Height (m)",
                    labelStyle: TextStyle(color: Colors.blueAccent)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your height!";
                  } 
                  else {
                    return null;
                  }
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calc();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            //  primary: Colors.blue,
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        child: const Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ))),
            ], //<widget>[]
          ),
        ),
      ),
    );
  }

  void _calc() {
    String text = "";
    String image = "";

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    double imc = weight / (height * height);

    if (imc < 18.6) {
      text = "Underweight (${imc.toStringAsPrecision(4)})";
      image = "images/thin.png";
    } else if (imc >= 18.6 && imc < 24.9) {
      text = "Ideal weight (${imc.toStringAsPrecision(4)})";
      image = "images/shape.png";
    } else if (imc >= 24.9 && imc < 29.9) {
      text = "Slightly overweight(${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 29.9 && imc < 34.9) {
      text = "Grade I obesity (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 34.9 && imc < 39.9) {
      text = "Grade II obesity (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 40) {
      text = "Grade III obesity (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Result(image, text)));
  }
}
