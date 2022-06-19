import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/commons/const.dart';
import 'package:newlogin/screens/discussion/contentDetail.dart';
import 'package:newlogin/screens/discussion/subViews/threadItem.dart';
import 'package:newlogin/screens/discussion/writePost.dart';

import 'commons/utils.dart';

class ThreadMain extends StatefulWidget{
  final MyProfileData myData;
  final ValueChanged<MyProfileData> updateMyData;
  const ThreadMain({Key? key, required this.myData,required this.updateMyData}) : super(key: key);
  @override State<StatefulWidget> createState() => _ThreadMain();
}

class _ThreadMain extends State<ThreadMain>{
  final bool _isLoading = false;

  void _writePost() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WritePost(myData: widget.myData,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('thread').orderBy('postTimeStamp',descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();
          return Stack(
            children: <Widget>[
              snapshot.data!.docs.isNotEmpty ?
              ListView(
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot data){
                  return ThreadItem(data: data,myData: widget.myData,updateMyDataToMain: widget.updateMyData,threadItemAction: _moveToContentDetail,isFromThread:true,commentCount: data['postCommentCount'],parentContext: context,);
                }).toList(),
              ) : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.error,color: Colors.grey[700],
                      size: 64,),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text('వ్యాఖ్యలు లేవు',
                        style: TextStyle(fontSize: 16,color: Colors.grey[700]),
                        textAlign: TextAlign.center,),
                    ),
                  ],
                )
              ),
              Utils.loadingCircle(_isLoading),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.teal[300],
        onPressed: _writePost,
        tooltip: 'వ్రాయండి',
        child: const Icon(Icons.create),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _moveToContentDetail(DocumentSnapshot data) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ContentDetail(postData: data,myData: widget.myData,updateMyData: widget.updateMyData,)));
  }
}