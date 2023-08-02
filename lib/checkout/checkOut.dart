import 'package:flutter/material.dart';

class CheckOut_Screen extends StatefulWidget {
  const CheckOut_Screen({super.key});

  @override
  State<CheckOut_Screen> createState() => _CheckOut_ScreenState();
}

class _CheckOut_ScreenState extends State<CheckOut_Screen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController address = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Form(
          key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: fullnameController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "City",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: fullnameController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(235, 228, 228, 0.694),
                      ),
                      labelText: "Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Color(Color.fromARGB(95, 62, 13, 13))),
                    ),
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Confirm Order",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
