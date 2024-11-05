import 'dart:math';

import 'character.dart';

class Monster {
  String? name;
  int? hp;
  int? atk;
  int? def;

  Monster(String this.name, int this.hp, int atk){
    this.atk=Random().nextInt(atk+1);
    def=0;
  }

  void attackCharacter(Character character){

  }

  void showStatus(){

  }
}