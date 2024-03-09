import 'package:flutter/material.dart';
import 'package:untitled/src/features/app/Hub/HubView.dart';
import 'package:untitled/src/helpers/responsive.dart';

class Main extends StatefulWidget {
  static const String routeName = '/';
  final int? newIndex;
  Widget? injectChild;

  Main({Key? key, required this.newIndex, this.injectChild}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
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
      backgroundColor: Colors.white,
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomNavigationBar(
              items: _navBarItems,
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
