import 'package:newlogin/screens/home_page.dart';
import 'package:newlogin/screens/schemes/bheema.dart';
import 'package:newlogin/screens/schemes/pm.dart';
import 'package:newlogin/screens/schemes/soilhealth.dart';
import 'package:newlogin/screens/schemes/ysr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Govt());
}

class Govt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: const Text("ప్రభుత్వ పథకాలు"),
          centerTitle: true,
          backgroundColor: Colors.teal[300],
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kisan()));
                  },
                  child: Card(
                      elevation: 5.0,
                      shadowColor: Colors.teal,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    //border: Border.all(color: Colors.green, width: 2.0)
                                  ),
                                  height: 90,
                                  width: 130,
                                  child: const FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: AssetImage('images/pmkisan.png'),
                                    ),
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'పీఎం-కిసాన్ సమ్మాన్ \n            నిధి యోజన',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.teal[300],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'వివరాలను వీక్షించండి',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ]),
                            ],
                          ))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Soil()));
                  },
                  child: Card(
                      elevation: 5.0,
                      shadowColor: Colors.teal,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    //border: Border.all(color: Colors.green, width: 2.0)
                                  ),
                                  height: 90,
                                  width: 130,
                                  child: const FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: AssetImage('images/soil.png'),
                                    ),
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'సాయిల్ హెల్త్ కార్డు ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.teal[300],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      'వివరాలను వీక్షించండి',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                      )
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ysr()));
                  },
                  child: Card(
                      elevation: 5.0,
                      shadowColor: Colors.teal,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 90,
                                  width: 130,
                                  child: const FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: AssetImage('images/ysr.png'),
                                    ),
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'వైఎస్ఆర్ రైతు భరోసా',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.teal[300],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      'వివరాలను వీక్షించండి',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ]),
                            ],
                          ))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bheema()));
                  },
                  child: Card(
                      elevation: 5.0,
                      shadowColor: Colors.teal,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    //border: Border.all(color: Colors.green, width: 2.0)
                                  ),
                                  height: 90,
                                  width: 130,
                                  child: const FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: AssetImage('images/bheema.jpg'),
                                    ),
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'వైయస్సార్ పంటల బీమా',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.teal[300],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      'వివరాలను వీక్షించండి',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ]),
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
