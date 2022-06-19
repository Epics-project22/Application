import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:newlogin/screens/discussion/controllers/FBStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'commons/const.dart';
import 'commons/utils.dart';
import 'controllers/FBCloudStore.dart';
import 'controllers/FBStorage.dart';

class WritePost extends StatefulWidget{
  final MyProfileData myData;
  const WritePost({Key? key, required this.myData}) : super(key: key);
  @override State<StatefulWidget> createState() => _WritePost();
}

class _WritePost extends State<WritePost>{

  TextEditingController writingTextController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  FocusNode writingTextFocus = FocusNode();
  bool _isLoading = false;
  File? _postImageFile;
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.teal[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows:false,
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: writingTextFocus,
          toolbarButtons: [
                (node) {
              return GestureDetector(
                onTap: () {
                  print('ఫోటోను ఎంచుకోండి');
                  _getImageAndCrop();
                },
                child: Container(
                  color: Colors.teal[200],
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.add_photo_alternate,size:28),
                      Text(
                        "ఫోటోను జోడించండి",
                        style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ],
        ),
      ],
    );
  }

  void _postToFB() async {
    setState(() {
      _isLoading = true;
    });
    String postID = Utils.getRandomString(8) + Random().nextInt(500).toString();
    String? postImageURL;
    postImageURL = await FBStorage.uploadPostImages(postID: postID, postImageFile: _postImageFile);
    print(postImageURL);
    FBCloudStore.sendPostInFirebase(postID,writingTextController.text,widget.myData,postImageURL ?? 'NONE');
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('వ్యాఖ్య వ్రాయండి'),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),
      body: Stack(
        children: <Widget>[
          KeyboardActions(
            config: _buildConfig(context),
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: size.width,
                    height: size.height - MediaQuery.of(context).viewInsets.bottom - 80,
                    child: Padding(
                      padding: const EdgeInsets.only(top:20,right:14.0,left:10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(child: Text(widget.myData.myName,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                              Container(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(const Color(0xFF525893))),
                                    onPressed: () => _postToFB(),
                                    child: const Text('వ్యాఖ్యానించండి',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                                ),
                              )
                            ],
                          ),
                          const Divider(height: 1,color: Colors.black,),
                          TextFormField(
                            autofocus: true,
                            focusNode: writingTextFocus,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ఏదైనా రాయండి...',
                              hintMaxLines: 4,
                            ),
                            controller: writingTextController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                          _postImageFile != null ? Image.file(_postImageFile!,fit: BoxFit.fill,) :
                          Container(),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          Utils.loadingCircle(_isLoading),
        ],
      ),
    );
  }

  Future<void> _getImageAndCrop() async {
    final ImagePicker _picker = ImagePicker();
    XFile? imageFileFromGallery = await _picker.pickImage(source: ImageSource.gallery);
    File img=File(imageFileFromGallery!.path);
    setState(() {
      print('అవును');
      _postImageFile = img;
    });
  }
}