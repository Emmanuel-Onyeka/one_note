import 'package:flutter/material.dart';
import 'package:one_note_clone/widgets/containerView.dart';

class MyGridBuilder extends StatelessWidget {
  List<Widget> gridContent = [
    ContainerView(),
    ContainerView(),
    ContainerView(),
    ContainerView(),
  ];

//TODO: Remove the extra space in the containerView
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ContainerView();
        });
  }
}
