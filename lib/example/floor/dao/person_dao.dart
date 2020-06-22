/*
 * create_by: zq_hero
 * Date:  2020/6/22  11:56
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */ // dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:sq/example/floor/entity/Person.dart';

@dao
abstract class PersonDao {

  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person> findPersonById(int id);

//  @insert
//  Future<void> insertPerson(Person person);
}