import 'package:flutter/material.dart';
import 'package:restaurant/my_verbal.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: restaurant(),
  ));
}

class restaurant extends StatefulWidget {
  const restaurant({Key? key}) : super(key: key);

  @override
  State<restaurant> createState() => _restaurantState();
}

class _restaurantState extends State<restaurant> {
  List temp = [];
  bool myvarbal = false;
  double rat = 0.0;

  @override
  void initState() {
    temp = List.filled(my_Verbal.imagesList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/menu1.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.lightGreen,
                    Colors.green
                  ])),
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/download.png")),
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(5)),
                ),
                title: Text("AVADH Restaurant",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Container(
                  height: 35,
                  width: 100,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(2),
                  child: Text(
                    "Rs.$rat",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(width: 5),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: my_Verbal.imagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                       CircleAvatar(
                          backgroundImage:
                          AssetImage("images/${my_Verbal.imagesList[index]}"),
                      ),
                      title: Text("${my_Verbal.foodList[index]}",
                        style: TextStyle(fontSize: 25, color: Colors.white),),
                      subtitle: Text("Rs. ${my_Verbal.RsfoodList[index]}",
                        style: TextStyle(fontSize: 20, color: Colors.white),),
                      trailing: Checkbox(
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          focusColor: Colors.pink,
                          value: temp[index],
                          onChanged: (value) {
                            temp[index] = value!;
                            print(value);
                            temp[index] ? rat = rat +
                                my_Verbal.RsfoodList[index] : rat =
                                rat - my_Verbal.RsfoodList[index];
                            setState(() {});
                          }),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
