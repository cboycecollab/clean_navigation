import 'package:flutter/material.dart';
import 'detail_page.dart';

class Settings {
  final int count;

  Settings({this.count});
}

class NavigatorPage extends StatefulWidget {
  final Widget child;

  NavigatorPage({this.child});
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  TextEditingController _textEditingController;
  int _currentRoute = 0;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/details':
            return MaterialPageRoute(builder: (BuildContext context) {
              Map<String, int> args = settings.arguments;
              return DetailRoute(
                  textEditingController: _textEditingController,
                  index: args['index']);
            });
            break;
          default:
            return MaterialPageRoute(
                settings: settings,
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: widget.child,
                      centerTitle: true,
                    ),
                    body: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ListView(
                        children: List.generate(30, (index) {
                          return Card(
                            child: ListTile(
                              leading: FlutterLogo(),
                              title: Text('${index + 1} Item'),
                              enabled: true,
                              onTap: () {
                                if (_currentRoute != index) {
                                  _textEditingController =
                                      TextEditingController();
                                }
                                _currentRoute = index;
                                Navigator.of(context).pushNamed('/details',
                                    arguments: {'index': index});
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                });
        }
      },
    );
  }
}
