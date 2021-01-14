import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {

  int badgeNumber;
  Widget iconImage;
  String labelText;
  VoidCallback onPressed;

  NavigationButton({this.badgeNumber, this.iconImage, this.labelText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: badgeNumber > 0,
      position: BadgePosition.topEnd(top: -5, end: -1),
      badgeContent: Text(badgeNumber.toString(), style: TextStyle(color: Colors.white),),
      child: Container(
            child: MaterialButton(
              onPressed: () => onPressed(),
              height: 64,
              minWidth: 64,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: iconImage,
                  ),
                  Text(labelText ?? '', style: TextStyle(fontSize: 10),)
                ],
              ),
            ),
          ),
    );
  }
}
