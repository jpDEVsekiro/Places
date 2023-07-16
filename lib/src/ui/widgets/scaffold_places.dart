import 'package:flutter/material.dart';

class ScaffoldPlaces extends StatelessWidget {
  const ScaffoldPlaces(
      {Key? key, required this.body, this.floatingActionButton})
      : super(key: key);
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SafeArea(
            child: Scaffold(
          floatingActionButton: floatingActionButton,
          body: body,
        )));
  }
}
