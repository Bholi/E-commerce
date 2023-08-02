import 'package:flutter/material.dart';

class Orders_Screen extends StatefulWidget {
  const Orders_Screen({super.key});

  @override
  State<Orders_Screen> createState() => _Orders_ScreenState();
}

class _Orders_ScreenState extends State<Orders_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 8.0,
                  // spreadRadius: 1.0,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black45),
            ),
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS7ycU5Be2KTotD2la8YLvaRYiSycelRpsMbdKBInIgXif6byqVC9JbgOTc3dupTsX8ik&usqp=CAU",
                    height: 80,
                    width: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Iphone 14 Pro Max",
                          style: TextStyle(
                            // fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        margin: EdgeInsets.only(left: 0, right: 54.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rs.2,00,00"),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(right: 11, left: 5),
                        child: Row(
                          children: [
                            Text("Processing"),
                          ],
                        ),
                      )
                      // TextButton(onPressed: (){}, child: Text("Processing",
                      // style: TextStyle(color: Colors.blue),),
                      // ),
                    ],
                  ),
                ),
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
