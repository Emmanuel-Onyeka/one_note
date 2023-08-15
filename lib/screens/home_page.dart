import 'package:flutter/material.dart';
import 'package:one_note_clone/model/data_class.dart';
import 'package:provider/provider.dart';
import './grid.dart';
import './user_info.dart';
import '../constants.dart';
import '../widgets/text_card.dart';
import 'notebook_view.dart';
import 'filter.dart';
import './search.dart';
import '../widgets/list_mode.dart';
import 'note_details_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 0);

  // Navigates to the home or Notebook page based on its value
  bool isHome = true;
  bool isList = true;
  bool _is_init = true;

  @override
  void didChangeDependencies() {
    if (_is_init) {
      Provider.of<DataClass>(context, listen: false).setNote();
      _is_init = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color bookControllerColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'OneNote',
        ),
        leading: Container(
          margin: const EdgeInsets.only(
            left: 10.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserInfo()));
            },
            child: const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Text(
                'AE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 45.0,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            onPressed: () {
              //Todo: Navigate to search screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            icon: const Icon(
              Icons.search,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color(0xff1e1e1d),
            height: 80.0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isHome = true;
                            controller.animateToPage(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          });
                        },
                        child: BuildText(
                          label: 'Home',
                          colour: isHome ? bookControllerColor : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isHome = false;
                            controller.animateToPage(
                              1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: BuildText(
                          label: 'Notebooks',
                          colour: !isHome ? bookControllerColor : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => FilterModalView());
                  },
                  icon: const Icon(
                    Icons.tune,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isList = !isList;
                    });
                  },
                  icon: const Icon(
                    Icons.dashboard,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  if (index == 0) {
                    isHome = true;
                  } else {
                    isHome = false;
                  }
                });
              },
              children: [
                //Home
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: isList ? ListMode() : GridBuilder(),
                ),
                //Notebook
                const NoteBookView(),
              ],
            ),
          ),
          Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
            ),
            //Navigation Bar
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NoteDetailScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  'Notes',
                  style: kNormalTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.brush,
                  size: 25,
                ),
                const SizedBox(width: 15),
                const Icon(
                  Icons.photo_camera,
                  size: 25,
                ),
                const SizedBox(width: 15),
                const Icon(
                  Icons.mic,
                  size: 25,
                ),
                const SizedBox(width: 15),
                const Icon(
                  Icons.more_vert,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
