import 'package:flutter/material.dart';
import 'package:dsc_projects/pages/AddWork/addWork.dart';
import 'package:dsc_projects/pages/Dashboard/dashboard.dart';
import 'package:dsc_projects/pages/Home/home.dart';
import 'package:dsc_projects/pages/Search/search.dart';

GlobalKey pageKey = GlobalKey();
enum pages { HomePage, Search, AddWork, Dashboard }
var currentPage = pages.HomePage;

Map<dynamic, Widget> getPage = {
  pages.AddWork: AddWork(),
  pages.Dashboard: Dashboard(),
  pages.HomePage: HomePage(),
  pages.Search: Search()
};

class MainPageWithAppBar extends StatefulWidget {
  MainPageWithAppBar() : super(key: pageKey);
  @override
  _MainPageWithAppBarState createState() => _MainPageWithAppBarState();
}

class _MainPageWithAppBarState extends State<MainPageWithAppBar> {
  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    title: SizedBox(
        height: 35.0,
        child: Text(
          'DSC BVP Pune',
          style: TextStyle(color: Colors.black),
        )
        // Image.asset("assets/images/insta_logo.png")
        ),
    actions: <Widget>[],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: getPage[currentPage],
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    pageKey.currentState.setState(() {
                      currentPage = pages.HomePage;
                    });
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    pageKey.currentState.setState(() {
                      currentPage = pages.Search;
                    });
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box,
                  ),
                  onPressed: () {
                    pageKey.currentState.setState(() {
                      currentPage = pages.AddWork;
                    });
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  onPressed: () {
                    pageKey.currentState.setState(() {
                      currentPage = pages.Dashboard;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
