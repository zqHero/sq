/*
 * create_by: zq_hero
 * Date:  2020/6/22  10:44
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/person_dao.dart';
import 'entity/person.dart';

//part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDataBase extends FloorDatabase {
  PersonDao get personDao;
}
