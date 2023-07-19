import 'package:flutter/material.dart';

class ScaffoldPlaces extends StatelessWidget {
  const ScaffoldPlaces(
      {Key? key, required this.body, this.floatingActionButton, this.appBar})
      : super(key: key);
  final Widget body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SafeArea(
            child: Scaffold(
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          body: body,
        )));
  }
}
