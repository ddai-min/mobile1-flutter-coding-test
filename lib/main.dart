import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile1_flutter_coding_test/common/router/router.dart';
import 'package:path_provider/path_provider.dart';

final box = Hive.box();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  Hive.defaultDirectory = dir.path;

  runApp(
    MaterialApp.router(
      routerConfig: router,
    ),
  );
}
