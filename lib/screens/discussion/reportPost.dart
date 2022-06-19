import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'commons/const.dart';
import 'controllers/FBCloudStore.dart';

class ReportPost extends StatefulWidget {
  final String postUserName;
  final String postId;
  final String content;
  final String reporter;
  ReportPost({required this.postUserName,required this.postId,required this.content,required this.reporter});
  @override State<StatefulWidget> createState() => _ReportPost();
}

class _ReportPost extends State<ReportPost> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("వ్యాఖ్యను నివేదించండి",
        style:TextStyle(fontSize: 20,color: Colors.teal,fontWeight: FontWeight.bold),
      ),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("వ్యాఖ్య రచయిత: ${widget.postUserName}\n\nదయచేసి మీరు వారి వ్యాఖ్యను ఎందుకు నివేదించాలనుకుంటున్నారో ఎంచుకోండి\n"),
          _blockButton('అర్ధంలేని మరియు అవాంఛిత వ్యాఖ్య'),
          _blockButton('అనుచిత వ్యాఖ్య లేదా ఫోటో'),
          _blockButton('విషయంతో సంబంధం లేదు'),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary: Colors.teal[400],
        ),
          child: const Text("మూసివేయు"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _blockButton(String buttonText){
    return ElevatedButton(
      onPressed: () =>_reportUser(buttonText),
      style: ElevatedButton.styleFrom(
        primary: Colors.teal[400],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:12.0,bottom:12),
        child: SizedBox(
          width: double.infinity,
          child: Text(buttonText,
            style: const TextStyle(color: Colors.white,),
          ),
        ),
      ),
    );
  }

  void _reportUser(String reportReason) async{
    showToastMessage();
    await FBCloudStore.sendReportUserToFB(context,reportReason,widget.postUserName,widget.postId,widget.content,widget.reporter);
    Navigator.of(context).pop();
  }

  static void showToastMessage(){
    Fluttertoast.showToast(
        msg: reportMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}