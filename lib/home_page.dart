import 'package:flutter/material.dart';
import 'navigation_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _pageIndex,
          children: [
            NavigatorPage(
              child: Text('Home'),
            ),
            NavigatorPage(
              child: Text('Business'),
            ),
            NavigatorPage(
              child: Text('Technology'),
            ),
            NavigatorPage(
              child: Text('Education'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(
              icon: Icon(Icons.computer), label: 'Technology'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Education'),
        ],
        currentIndex: _pageIndex,
        onTap: (int index) {
          print(index);
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
