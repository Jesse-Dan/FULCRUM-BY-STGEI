import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:go_navigator/go/go_args.dart';
import 'package:untitled/src/features/app/Hub/HubView.dart';
import 'package:untitled/src/helpers/responsive.dart';
import 'package:untitled/src/styles/Colors.dart';

import '../Exam/component/ExamStages/SubmittedView.dart';

class MainView extends StatefulWidget {
  static const String routeName = '/MainView';
  final int? newIndex;
  Widget? injectChild;

  MainView({Key? key, required this.newIndex, this.injectChild}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.hub_outlined),
      activeIcon: Icon(Icons.hub_sharp),
      label: 'Hub',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined),
      activeIcon: Icon(Icons.library_books_sharp),
      label: 'Study Past Questions',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.route_outlined),
      activeIcon: Icon(Icons.route_sharp),
      label: 'Syllabus',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history_edu_outlined),
      activeIcon: Icon(Icons.history_edu_sharp),
      label: 'Exam Novels',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history_outlined),
      activeIcon: Icon(Icons.history_sharp),
      label: 'Exam History',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_outline_outlined),
      activeIcon: Icon(Icons.bookmark_sharp),
      label: 'Question Bookmarks',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.real_estate_agent_outlined),
      activeIcon: Icon(Icons.real_estate_agent_sharp),
      label: 'Become a Partner',
    ),
  ];

  final _navBarScreens = [
    const HubView(),
    const HubView(),
    const HubView(),
    const HubView(),
    const HubView(),
    const HubView(),
    const HubView(),
    const HubView(),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.newIndex != null) {
      setState(() {
        _selectedIndex = (widget.newIndex ?? 0);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        Go(context).to(
            routeName: MainView.routeName,
            args: GoArgs(args: [
              {'injectChild': const SubmittedView()}
            ]));
      }),
      backgroundColor: Colors.white,
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomNavigationBar(
              fixedColor: AppColors.kOtherPurple,
              unselectedItemColor: Colors.white,
              items: _navBarItems.sublist(0,5),
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  widget.injectChild = null;
                  _selectedIndex = index;
                });
              })
          : null,
      body: Row(
        children: <Widget>[
          if (!Responsive.isMobile(context))
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  widget.injectChild = null;
                  _selectedIndex = index;
                });
              },
              extended: Responsive.isDesktop(context),
              destinations: _navBarItems
                  .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      selectedIcon: item.activeIcon,
                      label: Text(
                        item.label!,
                      )))
                  .toList(),
            ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Align(
                alignment: Alignment.topLeft,
                child: widget.injectChild ?? _navBarScreens[_selectedIndex]),
          )
        ],
      ),
    );
  }
}
