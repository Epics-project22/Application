import 'package:flutter/material.dart';
import 'package:newlogin/screens/home_page.dart';
import 'package:newlogin/screens/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  static String email='';
  String pwd='';
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
        title: const Text("APCNF"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
    ),
    child: Container(
        padding:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                //border: Border.all(color: Colors.green, width: 2.0)
              ),
                height: 170,
                width: 170,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Image(
                    image: AssetImage('images/logo.jpg'),
                  ),
                )
            ),


            Text(
                "",
                style: TextStyle(
                    fontSize: 14.0,
                    height: 4.0 //You can set your custom height here
                )
            ),

            TextField(
              onChanged: (value) {
                email=value;
              },
              maxLength: 10,
              keyboardType: TextInputType.number,
              //controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ఫోను నంబరు",
                fillColor: Colors.white,
                filled: true,
                counterText: "",
              ),
            ),
            const SizedBox(
                height: 18.0
            ),
            TextField(
              onChanged: (value) {
                pwd=value;
              },
              maxLength: 4,
              keyboardType: TextInputType.number,
              //controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "4 అంకెల పిన్", fillColor: Colors.white,
                filled: true,
                counterText: "",
              ),
            ),
            const SizedBox(
                height: 18.0
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[400],
                  ),
                  onPressed: () async {
                    if (email.length != 10) {
                      showToastMessage('దయచేసి చెల్లుబాటు అయ్యే 10 అంకెల ఫోన్ నంబర్‌ను నమోదు చేయండి');
                    }
                    else if (pwd.length != 4) {
                      showToastMessage('దయచేసి 4 అంకెల పిన్‌ను నమోదు చేయండి');
                    }
                    else {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email + '@gmail.com', password: pwd+'00');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage()));
                        showToastMessage('విజయవంతంగా సైన్ ఇన్ చేసారు');
                      } catch (e) {
                          showToastMessage(e.toString());
                      }
                    }
                  },
                  child: const Text("సైన్ ఇన్"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[400],
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                  child: const Text("నమోదు"),
                )
              ],),
          ],
        ),
      ),
    )
    )
    );
  }
}