import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/commons/const.dart';
import 'package:newlogin/screens/discussion/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newlogin/screens/discussion/commons/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlogin/screens/discussion/threadMain.dart';
import 'package:newlogin/screens/home_page.dart';

class DiscussionForum extends StatelessWidget {
  const DiscussionForum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootWidget(),
    );
  }
}
class RootWidget extends StatelessWidget {
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
          return const MyHomePage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{
  late TabController _tabController;
  MyProfileData myData=MyProfileData(myName: '', myLikeList: [''], myLikeCommnetList: [''], myFCMToken: '');
  bool _isLoading = false;
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    _takeMyData();

  }

  Future<void> _takeMyData() async{
    setState(() {
      _isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    String? myName='';
    void inputData() {
      final User? user = auth.currentUser;
      myName = user?.email;
    }
    inputData();
    FirebaseFirestore.instance.collection('signup').where('mobile', isEqualTo: myName!.substring(0, myName!.indexOf('@'))).get().then((val){
      if(val.docs.isNotEmpty){
        myName = val.docs[0].data()['firstname']+' '+val.docs[0].data()['lastname'];
        //print(myName);
        setState(() {
          myData = MyProfileData(
            myName: myName!,
            myLikeList: prefs.getStringList('likeList'),
            myLikeCommnetList: prefs.getStringList('likeCommnetList'),
            myFCMToken: prefs.getString('FCMToken'),
          );
        });
      }
      else{
        print("Not Found");
      }
    });
    setState(() {
      _isLoading = false;
    });
  }

  void _handleTabSelection() => setState(() {});

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  void updateMyData(MyProfileData newMyData) {
    setState(() {
      myData = newMyData;
    });
  }

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
        title: const Text('చర్చా వేదిక'),
        backgroundColor: Colors.teal[300],

      ),
      body: Stack(
        children: <Widget>[
          TabBarView(
              controller: _tabController,
              children: [
                ThreadMain(myData: myData,updateMyData: updateMyData,),
                UserProfile(myData: myData,updateMyData: updateMyData,),
              ]
          ),
          Utils.loadingCircle(_isLoading),
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
            icon: Icon(Icons.people),
            label: 'చర్చ ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label:'నా ప్రశ్నలు',
          ),
        ],
      ),
    );
  }
}
