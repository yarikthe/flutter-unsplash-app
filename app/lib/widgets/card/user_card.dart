import 'package:app/components/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserCard extends StatelessWidget {
  UserModel model;
  UserCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 8, top: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('${model.profileImage?.small}')),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    '${model.name!.length > 12 ? '${model.name}'.substring(0, 11) + '...' : model.name}',
                    style: Theme.of(context).textTheme.caption),
                Text(
                    '@${model.instagram!.length > 12 ? '${model.instagram}'.substring(0, 11) + '...' : model.instagram}',
                    style: Theme.of(context).textTheme.caption),
              ],
            )
          ],
        ));
  }
}
