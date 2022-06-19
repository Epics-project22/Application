import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/contentDetail.dart';
import 'package:newlogin/screens/discussion/subViews/threadItem.dart';
import 'commons/const.dart';
import 'commons/utils.dart';

class UserProfile extends StatefulWidget {
  final MyProfileData myData;
  final ValueChanged<MyProfileData> updateMyData;
  const UserProfile(
      {Key? key, required this.myData, required this.updateMyData})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  late String _myName;
  @override
  void initState() {
    super.initState();
    _myName = widget.myData.myName;
    print(_myName);

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const bool _isLoading = false;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('thread')
              .where('userName', isEqualTo: _myName)
              .orderBy('postTimeStamp',descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {return const LinearProgressIndicator();};
            return Stack(
              children: <Widget>[
                snapshot.data!.docs.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        children:
                            snapshot.data!.docs.map((DocumentSnapshot data) {
                          return ThreadItem(
                            data: data,
                            myData: widget.myData,
                            updateMyDataToMain: widget.updateMyData,
                            threadItemAction: _moveToContentDetail,
                            isFromThread: true,
                            commentCount: data['postCommentCount'],
                            parentContext: context,
                          );
                        }).toList(),
                      )
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.grey[700],
                            size: 64,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'వ్యాఖ్యలు లేవు',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                Utils.loadingCircle(_isLoading),
              ],
            );
          }),
    );
  }

  void _moveToContentDetail(DocumentSnapshot data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContentDetail(
                  postData: data,
                  myData: widget.myData,
                  updateMyData: widget.updateMyData,
                )
        )
    );
  }
}
