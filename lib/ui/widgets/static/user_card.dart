import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({
    Key key,
    @required this.user,
    this.onClick,
  }) : super(key: key);

  //adding a feature to the widget as void call back for the navigation.
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                const Radius.circular(8),
              ),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ]),
          child: Row(
            children: [
              //for
              Flexible(
                flex: 1,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        user.firstName + " " + user.lastName,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        user.email,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
