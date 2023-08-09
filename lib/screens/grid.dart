import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../model/data_class.dart';
import '../widgets/note_item.dart';

class GridBuilder extends StatelessWidget {
  // List<Widget> gridContent = [
  //   ContainerListItem(),
  //   ContainerListItem(),
  //   ContainerListItem(),
  //   ContainerListItem(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(
      builder: (context, data, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10.0,
          ),
          itemCount: data.userList.length,
          itemBuilder: (context, index) {
            return NoteBookItem(notes: data.userList[index]);
          }),
    );
  }
}
