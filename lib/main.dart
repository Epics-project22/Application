import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlogin/authentication_service.dart';
import 'package:newlogin/screens/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:newlogin/screens/home_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'newlogin',
    options: const FirebaseOptions(
      apiKey: "AIzaSyCbaQVInjxp4a6JlzxnJ5DBs23wn1HjWi4", // Your apiKey
      appId: "1:1086471110670:android:0573a523e50acf6744fc5f", // Your appId
      messagingSenderId: "1086471110670", // Your messagingSenderId
      projectId: "farming-app-17ca2", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_)=>AuthenticationService(
                FirebaseAuth.instance
              ),
          ),
          StreamProvider(
            create: (context)=>context.read<AuthenticationService>().authStateChanges, initialData: null,
          )
        ],
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationWrapper(),
      )
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return HomePage();
    }
    return SignInPage();
  }
}
