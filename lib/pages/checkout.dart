import 'package:flutter/material.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MyCustomForm(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.red,
      title: Text('CheckOut'),
      centerTitle: true,
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String adress;
  String phone;
  String payment;
  String observations;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20.0),
                textFieldName(),
                SizedBox(height: 10.0),
                textFieldAdress(),
                SizedBox(height: 10.0),
                textFieldPhone(),
                SizedBox(height: 10.0),
                textFieldPayment(),
                SizedBox(height: 10.0),
                textFieldObservations(),
                SizedBox(height: 50.0),
                materialButtonSend()
              ],
            ),
          )),
    );
  }

  MaterialButton materialButtonSend() {
    return MaterialButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Send Whatsapp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                color: Colors.red,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    launchWhatsApp();
                  }
                },
              );
  }

  TextFormField textFieldObservations() {
    return TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Observations",
                    hoverColor: Colors.red,
                    helperText: "shipping schedule and other details"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some observations";
                  }
                  setState(() {
                    observations = value;
                  });
                },
              );
  }

  TextFormField textFieldPayment() {
    return TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Payment method",
                    hoverColor: Colors.red,
                    hintText: "Cash, Mercado pago, debit card, etc"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some valid text";
                  }
                  setState(() {
                    payment = value;
                  });
                },
              );
  }

  TextFormField textFieldPhone() {
    return TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone or Whatsapp",
                  hoverColor: Colors.red,
                  helperText: 'without "+"',
                  hintText: "54 221 1234567"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some phone";
                  }
                  if (!validateMobile(value)) {
                    return "Please enter a valid phone";
                  }
                  setState(() {
                    phone = value;
                  });
                },
              );
  }

  TextFormField textFieldAdress() {
    return TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Adress",
                  hoverColor: Colors.red,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some valid adress";
                  }
                  setState(() {
                    adress = value;
                  });
                },
              );
  }

  TextFormField textFieldName() {
    return TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  hoverColor: Colors.red,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some valid name";
                  }
                  setState(() {
                    name = value;
                  });
                },
              );
  }

  bool validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+54-2216797209',
    text: "*Name:* $name \n"
    "*Adress:* +$adress \n"
    "*Whatsapp:* $phone \n"
    "*Payment:* $payment \n"
    "*Observations*: $observations \n",
  );
  await launch('$link');
}
}
