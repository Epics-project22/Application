import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlogin/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Marketprice());
}

class Marketprice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'మార్కెట్ విలువ',
      home: Market(),
    );
  }
}

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () { Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()));},
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        title: const Text("మార్కెట్ విలువ"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('market').orderBy('name').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Card(
                  elevation:5.0,
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
                              height:90,
                              width:130,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image(
                                  image:NetworkImage(document['crop_image']),
                                ),
                              )
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  document['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal[300],
                                  ),
                                ),
                                const SizedBox(height: 40.0,),

                                Container(
                                  decoration: const BoxDecoration(
                                      color:Colors.teal,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'రూ. ' + document['price'].toString()+'\\-',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                ),
                              ]
                          ),
                        ],
                      )
                  )
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
