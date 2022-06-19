import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newlogin/screens/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          print('something went wrong');
        }
        if(snapshot.connectionState==ConnectionState.done){
          return Signup();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class Signup extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
  CollectionReference signedup = FirebaseFirestore.instance.collection('signup');
  String fname = '';
  String lname = '';
  String mobile = '';
  String village = '';
  String district = '';
  String pwd='';
  String repwd='';
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
        title: const Text("నమోదు"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  fname = value;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "మీ పేరు",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  lname = value;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ఇంటి పేరు",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  mobile = value;
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ఫోను నంబరు",
                  counterText: "",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  village = value;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ప్రాంతం",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
               TextField(
                onChanged: (value) {
                  district = value;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "జిల్లా",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                onChanged: (value) {
                  pwd=value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "4 అంకెల పిన్ను సెట్ చేయండి",
                  counterText: "",
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                onChanged: (value) {
                  repwd=value;
                },
                maxLength: 4,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "4 అంకెల పిన్ను మళ్లీ నమోదు చేయండి ",
                  counterText: "",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal[400],
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 03.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () async {
                    print("pressed");
                     if(pwd==repwd){
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                        email: mobile+'@gmail.com', password: pwd+'00');
                        showToastMessage("నమోదు విజయవంతమైంది");
                        await signedup.add({
                          'firstname': fname,
                          'lastname': lname,
                          'mobile': mobile,
                          'village': village,
                          'district': district,
                        }).then((value) => print('added'));
                        Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
                      } catch (e) {
                          showToastMessage("దయచేసి కనీసం 4 అక్షరాల పాస్‌వర్డ్‌ను నమోదు చేయండి");
                          print(e);
                    }
                  }
                  else{showToastMessage("మళ్లీ నమోదు చేసిన పాస్‌వర్డ్ సరిపోలలేదు");}
                },
                  child: const Text(
                    "నమోదు చేయండి",
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





// import 'package:flutter/material.dart';
//
// class SignupScreen extends StatelessWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Register"),
//         centerTitle: true,
//         backgroundColor: Colors.teal[400],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//               children: [
//                 const TextField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "First Name",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Last Name",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Phone Number",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Village",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Mandal",
//                   ),
//                 ),
//
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "District",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   obscureText: true,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "create a password",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 18.0,
//                 ),
//
//                 const TextField(
//                   obscureText: true,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Re-enter password ",
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//
//                 SizedBox(
//                   width: double.infinity,
//                   child: RawMaterialButton(
//                     fillColor: Colors.teal[400],
//                     elevation: 0.0,
//                     padding: const EdgeInsets.symmetric(vertical: 03.0),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//                     onPressed: () {},
//                     child: const Text("SIGN UP",
//                       style: TextStyle(
//                         color:Colors.white,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//         ),
//       ),
//       );
//   }
// }
