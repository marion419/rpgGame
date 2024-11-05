import 'dart:math';
import 'character.dart';

class Monster {
  String? name;
  int? hp;
  int? atk;
  int? def;

  Monster(String this.name, int this.hp, int atk, int characterDef){
    this.atk=max(Random().nextInt(atk+1), characterDef);
    def=0;
  }

  void attackCharacter(Character character){

  }

  void showStatus(){

  }
}