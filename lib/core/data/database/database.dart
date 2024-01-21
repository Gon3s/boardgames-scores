import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../features/player/data/dao/player_dao.dart';
import '../../../features/player/data/models/player.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Player])
abstract class AppDatabase extends FloorDatabase {
  PlayerDao get personDao;
}
