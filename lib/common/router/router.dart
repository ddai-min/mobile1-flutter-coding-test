import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/common/view/root_tab.dart';
import 'package:mobile1_flutter_coding_test/conference/view/conference_chat_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RootTab.routeName,
      builder: (_, __) => const RootTab(),
      routes: [
        GoRoute(
          path: '/conference/chat',
          name: ConferenceChatScreen.routeName,
          builder: (_, __) => const ConferenceChatScreen(),
        ),
      ],
    ),
  ],
);
