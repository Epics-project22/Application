import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellCrop extends StatelessWidget {
  SellCrop({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const SellBuyPage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class SellBuyPage extends StatefulWidget {
  const SellBuyPage({Key? key}) : super(key: key);
  @override
  _SellBuyPageState createState() => _SellBuyPageState();
}

class _SellBuyPageState extends State<SellBuyPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);

  }

  void _handleTabSelection() => setState(() {});

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('పంట అమ్మకాలు'),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          TabBarView(controller: _tabController, children: [
            BuyPage(),
            sellpage(),
          ]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'కొనుగోలు',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'అమ్మకం',
          ),
        ],
      ),
    );
  }
}

String dropdownValue = 'కూరగాయలు';
class sellpage extends StatelessWidget {
  CollectionReference adds = FirebaseFirestore.instance.collection('adds');

  //values
  String crop = '';
  String description = '';
  int price = 0;
  int quantity = 0;
  String name = '';
  int mobile = 0;
  String village = '';
  // sellpage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  crop = value;
                  print(crop);
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "పంట పేరు",
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                "పంట రకం",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal[300],
                ),
              ),
              Container(
                width:150,
                child: DropdownButtonFormField<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    dropdownValue = newValue!;
                    print(dropdownValue);
                  },
                  value: dropdownValue,
                  items: <String>['కూరగాయలు','గింజలు','ధాన్యాలు','పప్పులు','పానీయాలు','పువ్వులు','పండ్లు','ఫైబర్', 'మత్తుమందులు','సుగంధ ద్రవ్యాలు','ఇతర పంటలు']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "వివరణ",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  price = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "కిలో ధర",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  quantity = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ఎన్ని కిలోలు?",
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                "మీ వివరాలను నమోదు చేయండి",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal[300],
                ),
              ),
              const SizedBox(height: 18.0),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "పేరు",
                ),
              ),
              const SizedBox(height: 18.0),
              TextField(
                onChanged: (value) {
                  mobile = int.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ఫోను నంబరు",
                ),
              ),
              const SizedBox(height: 18.0),
              TextField(
                onChanged: (value) {
                  village = value;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ప్రాంతం",
                ),
              ),
              const SizedBox(height: 18.0),
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal[300],
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 03.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () async {
                    await adds.add({
                      'crop':crop,
                      'name': name,
                      'mobile':mobile,
                      'village':village,
                      'description': description,
                      'price': price,
                      'quantity': quantity,
                      'type':dropdownValue
                    }).then((value) => print('added'));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SellBuyPage()));
                  },
                  child: const Text(
                    "విక్రయించు",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('adds').snapshots(),
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
                    MaterialPageRoute(
                        builder: (context) => viewDetails(
                            document['crop'],
                            document['quantity'].toString(),
                            document['price'].toString(),
                            document['description'],
                            document['quantity']*document['price'],
                            document['type'],
                            document['name'],
                            document['mobile'].toString(),
                            document['village'])));
              },
              child: Card(
                  elevation: 2.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              document['crop'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal[300],
                              ),
                            ),
                            const Text(' '),
                            Text(
                              document['quantity'].toString() + ' కిలోలు',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text('ధర: కేజీ రూ. ' + document['price'].toString()+'\\-'),
                            Text(
                              'వివరాలను వీక్షించండి',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue[600],
                              ),
                            ),
                          ]))));
            }).toList(),
          );
        },
      ),
    );
  }
}
class viewDetails extends StatelessWidget {
  String name;
  String quantity;
  String price;
  String description;
  String type;
  String crop;
  String mobile;
  String village;
  int total;
  viewDetails(this.crop, this.quantity, this.price, this.description,this.total,this.type,this.name,this.mobile,this.village);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("పంట అమ్మకాలు"),
          centerTitle: true,
          backgroundColor: Colors.teal[300],
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth:MediaQuery.of(context).size.width,
              ),
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(crop,style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.teal[300],
                        ),),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.teal[300],
                          ),
                          child: Text(
                            type,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text('మొత్తం                   '+quantity+' కిలోలు',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('ధర                         కేజీ రూ. '+price+'\\-',
                      style: const TextStyle(
                        fontSize: 17,
                      ),),
                    const SizedBox(height: 8.0),
                    Text('మొత్తం విలువ         రూ. '+total.toString()+'\\-',
                      style: const TextStyle(
                        fontSize: 17,
                      ),),
                    const SizedBox(height: 8.0),
                    Text('వివరణ                    '+description,
                      style: const TextStyle(
                        fontSize: 17,
                      ),),
                    const SizedBox(height: 18.0),
                    Text('రైతు వివరాలు',style: TextStyle(
                      fontSize: 25,
                      color: Colors.teal[300],
                    ),),
                    const SizedBox(height: 8.0),
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.teal[300],
                        shadowColor: Colors.black,
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('పేరు                     '+name,
                                style: const TextStyle(
                                  fontSize: 17,
                                color: Colors.white,
                              ),),
                              Text('ఫోను నంబరు       '+mobile,
                                style: const TextStyle(
                                  fontSize: 17,
                                color: Colors.white,
                              ),),
                              Text('ప్రాంతం                 '+village,
                                style: const TextStyle(
                                  fontSize: 17,
                                color: Colors.white,
                              ),),
                            ]
                          )
                        )
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}

