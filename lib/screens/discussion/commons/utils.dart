import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/controllers/FBCloudStore.dart';
import 'package:newlogin/screens/discussion//controllers/localTempDB.dart';
import 'const.dart';

class Utils{
  static Widget loadingCircle(bool isLoading) {
    return isLoading ? Positioned(
      child: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        color: Colors.white.withOpacity(0.7),
      ),
    ) : Container();
  }

  static Widget cacheNetworkImageWithEvent(context,String imageURL,double width, double height){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child:
        CachedNetworkImage(
          imageUrl: imageURL,
          placeholder: (context, url) => Container(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: SizedBox(
                width: width,
                height: height,
                child: const Center(child: CircularProgressIndicator())),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 500,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Future<MyProfileData> updateLikeCount(DocumentSnapshot data, bool isLikePost,MyProfileData myProfileData,ValueChanged<MyProfileData> updateMyData, bool isThread) async {
    List<String>? newLikeList = await LocalTempDB.saveLikeList(data[isThread ? 'postID' : 'commentID'],myProfileData.myLikeList,isLikePost,isThread ?'likeList':'likeCommnetList');
    MyProfileData myNewProfileData = MyProfileData(
        myName: myProfileData.myName,
        myLikeList: isThread ? newLikeList : myProfileData.myLikeList,
        myLikeCommnetList: isThread ? myProfileData.myLikeCommnetList : newLikeList,
        myFCMToken: '',
    );
    updateMyData(myNewProfileData);
    isThread ? await FBCloudStore.updatePostLikeCount(data,isLikePost,myProfileData) : await FBCloudStore.updateCommentLikeCount(data,isLikePost,myProfileData);
    if (isThread) {
      await FBCloudStore.likeToPost(data['postID'], myProfileData,isLikePost);
    }
    return myNewProfileData;
  }

  static List<DocumentSnapshot> sortDocumentsByComment(List<DocumentSnapshot> data){
    List<DocumentSnapshot> _originalData = data;
    Map<String,List<DocumentSnapshot>> commentDocuments = <String,List<DocumentSnapshot>>{};
    List<int> replyCommentIndex = <int>[];
    for(int i = 0; i < _originalData.length; i++){
      for(int j = 0; j < _originalData.length; j++){
        if (_originalData[i]['commentID'] == _originalData[j]['toCommentID']){
          List<DocumentSnapshot>? savedCommentData;
          if (commentDocuments[_originalData[i]['commentID']] != null && commentDocuments[_originalData[i]['commentID']]!.isNotEmpty) {
            savedCommentData = commentDocuments[_originalData[i]['commentID']];
          }else {
            savedCommentData = <DocumentSnapshot>[];
          }
          savedCommentData?.add(_originalData[j]);
          commentDocuments[_originalData[i]['commentID']] = savedCommentData!;
          replyCommentIndex.add(j);
        }
      }
    }

    replyCommentIndex.sort((a,b){
      return b.compareTo(a);
    });

    // remove comment
    if(replyCommentIndex.isNotEmpty){
      for(int i = 0; i < replyCommentIndex.length; i++){
        _originalData.removeAt(replyCommentIndex[i]);
      }
    }

    // Add list to comment
    for(int i = 0; i < _originalData.length; i++){
      if (commentDocuments[_originalData[i]['commentID']] != null){
        _originalData.insertAll(i+1,commentDocuments[_originalData[i]['commentID']]!.toList());
      }
    }
    return _originalData;
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      if (diff.inHours > 0) {
        time = diff.inHours.toString() + 'h';
      }else if (diff.inMinutes > 0) {
        time = diff.inMinutes.toString() + 'm';
      }else if (diff.inSeconds > 0) {
        time = 'now';
      }else if (diff.inMilliseconds > 0) {
        time = 'now';
      }else if (diff.inMicroseconds > 0) {
        time = 'now';
      }else {
        time = 'now';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      time = diff.inDays.toString() + 'd';
    } else if (diff.inDays > 6){
      time = (diff.inDays / 7).floor().toString() + 'w';
    }else if (diff.inDays > 29) {
      time = (diff.inDays / 30).floor().toString() + 'm';
    }else if (diff.inDays > 365){
      time = '${date.month} ${date.day}, ${date.year}';
    }
    return time;
  }

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
}


