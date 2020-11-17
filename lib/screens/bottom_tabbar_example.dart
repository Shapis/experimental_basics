import 'package:experimental_basics/screens/add_value_screen.dart';
import 'package:experimental_basics/screens/single_input_tab.dart';
import 'package:flutter/material.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static final _kTabPages = <Widget>[
    SingleInputTab(),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    //Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Uma Variavel'),
    Tab(icon: Icon(Icons.alarm), text: 'Duas Variaveis'),
    //Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          switch (_tabController.index) {
            case 0:
              {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddValueScreen(tabIndex: _tabController.index),
                    ),
                  ),
                );
                print('single entries tab!');
              }
              break;
            case 1:
              {
                print('multi entries tab!');
              }
              break;
            case 2:
              {
                print('tab 3 entries tab!');
              }
              break;
            default:
          }
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
