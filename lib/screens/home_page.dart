import 'package:flutter/material.dart';
import 'package:newlogin/screens/crop_care_page.dart';
import 'package:newlogin/screens/discussion_forum_page.dart';
import 'package:newlogin/screens/govt_scheme_page.dart';
import 'package:newlogin/screens/market_price_page.dart';
import 'package:newlogin/screens/sell_crop_page.dart';
import 'package:newlogin/screens/weather_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  static void showToastMessage(String s){
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal[300],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.teal[300],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'logout',
            onPressed: () {
              _auth.signOut();
              showToastMessage('Signed out successfully');
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth:MediaQuery.of(context).size.width,
          ),
           child:Column(
             children: [
              const SizedBox(height:15.0,),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyElevatedButton(
                      width: 150,
                      height:150,
                      onPressed: () {Navigator.push(context,
                          MaterialPageRoute(builder: (context) => weather_screen()));},
                      borderRadius: BorderRadius.circular(20),
                      t: 'వాతావరణం',
                      i:const Icon(
                        Icons.cloud_circle,
                        size: 30.0,
                      ),
                      c1: Colors.blue[300],
                      c2:Colors.pink[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyElevatedButton(
                      width: 150,
                      height:150,
                      onPressed: () {Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CropCare()));},
                      borderRadius: BorderRadius.circular(20),
                      t: 'పంట సంరక్షణ',
                      i:const Icon(
                        Icons.grass,
                        size: 30.0,
                      ),
                      c1: Colors.greenAccent[200],
                      c2:Colors.grey,
                    ),
                  ),
                ]
              ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyElevatedButton(
                              width: 150,
                              height:150,
                              onPressed: () {Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SellCrop()));},
                              borderRadius: BorderRadius.circular(20),
                              t: 'పంట అమ్మకాలు',
                              i:const Icon(
                                Icons.add_shopping_cart,
                                size: 30.0,
                              ),
                              c1: Colors.purple[300],
                              c2:Colors.green[300],
                            ),
                          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyElevatedButton(
                  width: 150,
                  height:150,
                  onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Marketprice()));},
                  borderRadius: BorderRadius.circular(20),
                  t: 'మార్కెట్ విలువ',
                  i:const Icon(
                    Icons.price_change,
                    size: 30.0,
                  ),
                  c1: Colors.pink[300],
                  c2:Colors.amber[300],
                ),
              ),
            ],
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyElevatedButton(
                          width: 150,
                          height:150,
                          onPressed: () {Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const DiscussionForum()));},
                          borderRadius: BorderRadius.circular(20),
                          t: 'చర్చా వేదిక',
                          i:const Icon(
                            Icons.people,
                            size: 30.0,
                          ),
                          c1: Colors.orange[300],
                          c2:Colors.blue[300],
                        ),
                      ),
                  Padding(
                     padding: const EdgeInsets.all(8.0),
                      child: MyElevatedButton(
                        width: 150,
                        height:150,
                        onPressed: () {Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Govt()));},
                        borderRadius: BorderRadius.circular(20),
                        t: 'ప్రభుత్వ'+'\n'+'పథకాలు',
                        i:const Icon(
                          // <-- Icon
                          Icons.account_balance,
                          size: 30.0,
                        ),
                        c1: Colors.deepOrange[300],
                        c2:Colors.green[300],
                      ),
                  ),
                ],
              ),
            ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final String t;
  final Color? c1;
  final Color? c2;
  final Widget? i;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.t,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
    required this.c1,
    required this.c2,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    final gradient=LinearGradient(colors: [c1!, c2!]);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            i!,
            const SizedBox(
              height: 10,
            ),
            Text(t,
              style: const TextStyle(
              fontSize: 18,
              ),
            ),
          ]
        ),
      ),
    );
  }
}