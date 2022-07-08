import 'package:app/components/model/image_model.dart';
import 'package:app/components/model/user_model.dart';
import 'package:app/screen/photo_screen.dart';
import 'package:app/widgets/card/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ImageCard extends StatelessWidget {
  ImageModel model;
  ImageCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(PhotoScreen(model: model)),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Column(children: [
            CachedNetworkImage(
              imageUrl: '${model.urls?.small_s3}',
              fit: BoxFit.cover,
              height: 100,
              width: MediaQuery.of(context).size.width * .45,
              placeholder: (context, url) => Center(child: CircularProgressIndicator.adaptive()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.description == '' ? 'Назва' : model.description}'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.redAccent, size: 12),
                    Text(
                      '${model.likes}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
            UserCard(model: model.author as UserModel),
          ]),
        ));
  }
}
