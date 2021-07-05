import 'dart:io';
import 'package:flutter_contact_list/pic/assets.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';


class AvatarPicker extends StatefulWidget {
  final int index;
  const AvatarPicker({Key? key, required this.index}) : super(key: key);

  @override
  _AvatarPickerState createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File ? _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    String? path = ContactsRepository.getContactAvatar(widget.index);
    if (path!= null && path!="")
      _image = File(path);
    super.initState();
  }
  _imgFromCamera() async {
    final image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50);
    if (image == null) return;

    PaintingBinding.instance!.imageCache!.clear();
    imageCache!.clearLiveImages();
    Directory tempDir = await getApplicationDocumentsDirectory();
    final String path = tempDir.path;
    final File imageFile = File(image.path);

    final File newImage = await imageFile.copy('$path/contactAvatar${widget.index}.png');
    ContactsRepository.setContactAvatar(widget.index, newImage.path);
    this.setState(() {
      _image = newImage;
      print(newImage.path);
    });
    Navigator.of(context).pop();
  }

  _imgFromGallery() async {
    final image = await _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (image == null) return;

    PaintingBinding.instance!.imageCache!.clear();
    imageCache!.clearLiveImages();
    Directory tempDir = await getApplicationDocumentsDirectory();
    final String path = tempDir.path;
    final File imageFile = File(image.path);
    final File newImage = await imageFile.copy('$path/contactAvatar${widget.index}.png');
    ContactsRepository.setContactAvatar(widget.index, newImage.path);
    this.setState(() {
      _image = newImage;
      print(newImage.path);
    });
    Navigator.of(context).pop();
  }

  void _showPicker (context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext){
          return SafeArea(
              child: Container(
                child: Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text("Gallery"),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AvatarPicker(index: widget.index)));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text("Camera"),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AvatarPicker(index: widget.index)));
                      },
                    )
                  ],
                ),
              )
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                child: _image != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        _image!,
                        width: 190,
                        height: 190,
                        fit: BoxFit.fill,
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100)),
                      width: 190,
                      height: 190,
                      child: Image.asset(
                        Assets.placeholder,
                        fit: BoxFit.contain,
                        height: 150,
                      )
                  ),
                ),
              ),
            );
  }
}
