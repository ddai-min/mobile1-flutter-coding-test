import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/common/layout/default_layout.dart';
import 'package:mobile1_flutter_coding_test/room/view/room_list_screen.dart';
import 'package:mobile1_flutter_coding_test/user/view/user_list_screen.dart';

class RootTab extends StatefulWidget {
  static String get routeName => '/';

  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = index == 0 ? '사용자' : '회의';

    return DefaultLayout(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UserListScreen(),
          RoomListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '사용자',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: '회의',
          ),
        ],
      ),
    );
  }

  void tabListener() {
    setState(() {
      index = _tabController.index;
    });
  }
}
