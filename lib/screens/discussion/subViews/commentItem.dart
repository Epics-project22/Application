import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/commons/const.dart';
import 'package:newlogin/screens/discussion/commons/utils.dart';

class CommentItem extends StatefulWidget{
  final DocumentSnapshot data;
  final MyProfileData myData;
  final Size size;
  final ValueChanged<MyProfileData> updateMyDataToMain;
  final ValueChanged<List<String>> replyComment;
  const CommentItem({Key? key, required this.data,required this.size,required this.myData,required this.updateMyDataToMain,required this.replyComment}) : super(key: key);
  @override State<StatefulWidget> createState() => _CommentItem();
}

class _CommentItem extends State<CommentItem>{
  late MyProfileData _currentMyData;
  @override
  void initState() {
    super.initState();
    _currentMyData = widget.myData;

  }

  void _updateLikeCount(bool isLikePost) async{
    MyProfileData _newProfileData = await Utils.updateLikeCount(widget.data,isLikePost,widget.myData,widget.updateMyDataToMain,false);
    setState(() {
      _currentMyData = _newProfileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.data['toCommentID'] == null ? const EdgeInsets.all(8.0) : const EdgeInsets.fromLTRB(34.0,8.0,8.0,8.0),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(6.0,2.0,10.0,2.0),
                child: SizedBox(
                    width: widget.data['toCommentID'] == null ? 48 : 40,
                    height: widget.data['toCommentID'] == null ? 48 : 40,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(widget.data['userName'],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:4.0),
                            child: widget.data['toCommentID'] == null ? Text(widget.data['commentContent'],maxLines: null,) :
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: widget.data['toUserID'], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800])),
                                  TextSpan(text: widget.data['commentContent'], style: const TextStyle(color:Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: widget.size.width- (widget.data['toCommentID'] == null ? 90 : 110),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(
                          Radius.circular(15.0)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,top: 4.0),
                    child: SizedBox(
                      width: widget.size.width * 0.38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(Utils.readTimestamp(widget.data['commentTimeStamp'])),
                          GestureDetector(
                              onTap: () => _updateLikeCount(_currentMyData.myLikeCommnetList != null && _currentMyData.myLikeCommnetList!.contains(widget.data['commentID']) ? true : false),
                              child: Text('Like',
                                  style:TextStyle(fontWeight: FontWeight.bold,color:_currentMyData.myLikeCommnetList != null && _currentMyData.myLikeCommnetList!.contains(widget.data['commentID']) ? Colors.blue[900] : Colors.grey[700]))
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          widget.data['commentLikeCount'] > 0 ? Positioned(
            bottom: 10,
            right:0,
            child: Card(
                elevation:2.0,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.thumb_up,size: 14,color: Colors.blue[900],),
                      Text('${widget.data['commentLikeCount']}',style:const TextStyle(fontSize: 14)),
                    ],
                  ),
                )
            ),
          ) : Container(),
        ],
      ),
    );
  }
}