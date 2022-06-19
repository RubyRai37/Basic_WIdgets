// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RubyApp());
}

//Scaffold its properties
const page1 = "Home";
const page2 = "Categories";
const page3 = "Add Item";
const page4 = "About Us";
const page5 = "Share with friend";
const page6 = "Rate and Review";
const page7 = "Privacy and Policy";
const page8 = "Setting";
const page9 = "Contact";

class RubyApp extends StatelessWidget {
  const RubyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column and Row',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}

class RubyRowColumn extends StatelessWidget {
  const RubyRowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _drawerPages;
  late List<Widget> _bottomNavigationPages;
  late Widget _page1,
      _page2,
      _page3,
      _page4,
      _page5,
      _page6,
      _page7,
      _page8,
      _page9;
  late int _currentDrawerSelectedPage, _currentButtonNavigationSelectedPage;
  late bool _checkBottomPage;
  late Widget _currentlySelectedPageName;

  @override
  void initState() {
    super.initState();
    _page1 = HomePage();
    _page2 = CategoryPage();
    _page3 = AddItemPage();
    _page4 = AboutUsPage();
    _page5 = SharePage();
    _page6 = RateReviewPage();
    _page7 = PrivacyPolicyPage();
    _page8 = SettingPage();
    _page9 = ContactPage(changePage: _changePage);
    _drawerPages = [_page1, _page2, _page3, _page4, _page5, _page6, _page7];
    _bottomNavigationPages = [_page1, _page8, _page9];
    _currentDrawerSelectedPage = 0;
    _currentButtonNavigationSelectedPage = 0;
    _currentlySelectedPageName = _page1;
    _checkBottomPage = false;
  }

  void _changePage(int pageNum) {
    setState(() {
      _currentDrawerSelectedPage = pageNum;
      _currentlySelectedPageName = _drawerPages[pageNum];
    });
  }

  void _changeBottomNavigationPage(int pageNum) {
    setState(() {
      _currentButtonNavigationSelectedPage = pageNum;
      _currentlySelectedPageName = _bottomNavigationPages[pageNum];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Get Started")),
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Ruby Rai'),
                accountEmail: Text('rubytorubs@gmail.com'),
                currentAccountPicture: Image(
                  image: AssetImage("Images/img.png"),
                ),
                decoration: BoxDecoration(color: Colors.orange),
              ),
              Column(
                children: [
                  _navigationItemListTitle(Icons.home, page1, 0, true),
                  _navigationItemListTitle(Icons.dashboard, page2, 1, false),
                  _navigationItemListTitle(
                      Icons.add_to_photos, page3, 2, false),
                  _navigationItemListTitle(Icons.info, page4, 3, false),
                  _navigationItemListTitle(Icons.share, page5, 4, false),
                  _navigationItemListTitle(Icons.rate_review, page6, 5, false),
                  _navigationItemListTitle(Icons.flag, page7, 6, false),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentButtonNavigationSelectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone),
                label: "Contact",
                backgroundColor: Colors.orange)
          ],
          selectedItemColor: Colors.red,
          onTap: (clickedPageIndexNum) {
            _changeBottomNavigationPage(clickedPageIndexNum);
          },
        ),
        body: _currentlySelectedPageName,
      ),
    );
  }

  Widget _navigationItemListTitle(
      IconData givenIcon, String title, int index, bool checkHomePage) {
    return ListTile(
      leading: Icon(givenIcon),
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 18.0),
      ),
      onTap: () {
        print(index);
        Navigator.pop(context);
        _changePage(index);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page1 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page8 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page2 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page4 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page7 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class RateReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page6 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page5 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class ContactPage extends StatelessWidget {
  ContactPage({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$page9 Page', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(8),
            child: const Text('Switch to Setting Page'),
          )
        ],
      ),
    );
  }
}
