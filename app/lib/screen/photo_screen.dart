import 'package:app/components/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotoScreen extends StatefulWidget {
  ImageModel model;
  PhotoScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фотографія ' + '${widget.model.description}'),
        backgroundColor: Colors.black,
      ),
      body: new Image.network(
        "${widget.model.urls?.full ?? ''}",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
