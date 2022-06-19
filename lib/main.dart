// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RubyApp());
}

//Scaffold its properties
const page1 = "Home";
const page2 = "Setting";
const page3 = "Contact";

class RubyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Get Started',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = Page1();
    _page2 = Page2();
    _page3 = Page3(changePage: _changeTab);
    _pages = [_page1, _page2, _page3];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
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
            child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              _navigationItemListTitle(page2, 2),
              _navigationItemListTitle(page1, 1),
              _navigationItemListTitle(page3, 3),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: Icon(Icons.home),
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
          selectedItemColor: Colors.orange,
          onTap: (index) {
            _changeTab(index);
          },
        ),
        body: _currentPage,
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class ShowDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.home),
        )
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page1 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page2 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page3 extends StatelessWidget {
  Page3({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(0),
            child: const Text('Switch to Home Page'),
          )
        ],
      ),
    );
  }
}
