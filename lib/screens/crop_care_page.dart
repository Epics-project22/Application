import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlogin/screens/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CropCare());
}

class CropCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'పంట సంరక్షణ',
      home: DisplayCrops(),
    );
  }
}

class DisplayCrops extends StatelessWidget {
  const DisplayCrops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () { Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()));},
        ),
        backgroundColor: Colors.teal[300],
        title: const Text("పంట సంరక్షణ"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('crop').orderBy('name').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => ShowCrop(document['name'],document['url'],document['thumbnail'])),
                  );
                },
                child: Card(
                    elevation:5.0,
                    shadowColor: Colors.teal,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
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
                                    Text(
                                      'వివరాలను వీక్షించండి',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                        )
                    )
                ),
              );
            }).toList(),

          );
        },
      ),
    );
  }
}
class ShowCrop extends StatelessWidget {
  String name;
  String url;
  String thumbnail;
  ShowCrop(this.name, this.url,this.thumbnail,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text(name),
      ),
      body: IconButton(
        icon: Image(
      image:NetworkImage(thumbnail),
      ),
        iconSize: 500,
          onPressed: () async {
            if (await launch(url)) {
              await launch(url);
            } else {
              throw "Cannot load Url";
            }
          }
      ),
      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('crops').where('name', isEqualTo: name).snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return ListView(
      //       children: snapshot.data!.docs.map((document) {
      //         return Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text(
      //                             'Season',
      //                             style: TextStyle(
      //                               fontSize: 20,
      //                               color: Colors.teal[300],
      //                             ),
      //                           ),
      //                           Text(document['season'].replaceAll('\\n', '\n')),
      //                         ]))),
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text('Seed Treatment',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 color: Colors.teal[300],)),
      //                           Text(document['seed_treatment'].replaceAll('\\n', '\n')),
      //                         ]))),
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text('Processing',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 color: Colors.teal[300],)
      //                           ),
      //                           Text(document['processing'].replaceAll('\\n', '\n')),
      //                         ]))),
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text('Growth Promoters',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 color: Colors.teal[300],)
      //                           ),
      //                           Text(document['Growth_promoters'].replaceAll('\\n', '\n')),
      //                         ]))),
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text('Possible pests and cure',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 color: Colors.teal[300],)
      //                           ),
      //                           Text(document['plant_pests'].replaceAll('\\n', '\n')),
      //                         ]))),
      //             Card(
      //                 elevation:2.0,
      //                 child: Padding(
      //                     padding: const EdgeInsets.all(10.0),
      //                     child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text('Possible plant diseases and cure',
      //                               style: TextStyle(
      //                                 fontSize: 20,
      //                                 color: Colors.teal[300],)
      //                           ),
      //                           Text(document['plant_diseases'].replaceAll('\\n', '\n')),
      //                         ]
      //                     )
      //                 )
      //             ),
      //           ],
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
    );
  }
}