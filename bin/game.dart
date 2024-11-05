// ignore_for_file: unnecessary_this
import 'dart:io';
import 'character.dart';
import 'monster.dart';
import 'dart:math';

class Game{
  Character? character;
  List<Monster> monsterList=[];
  int? monsterCount;

  Game(String name){
    monsterList=[];
    monsterCount=0;
    // File reading
    var characterFile = File('assets/txt/characters.txt');
    var monsterFile = File('assets/txt/monsters.txt');

    var characterContents = characterFile.readAsStringSync();
    var monsterContents = monsterFile.readAsStringSync();

    // character 생성
    List<String> characterOnceSplited=characterContents.split('\n');
    List<String> characterTable=characterOnceSplited[1].split(',');
    character=Character(name, int.parse(characterTable[0]), int.parse(characterTable[1]), int.parse(characterTable[2]));

    // monsterList<Monster> 생성
    List<String> monsterOnceSplited=monsterContents.split('\n');
    List<List<String>> monstertable=[];
    for(int i=1;i<monsterOnceSplited.length;i++){
      monstertable.add(monsterOnceSplited[i].split(','));
      var temp=Monster(monstertable[i-1][0], int.parse(monstertable[i-1][1]), int.parse(monstertable[i-1][2]));
      monsterList.add(temp);
    }
  }

  // 게임 시작
  void startGame(){
  }

  void printTest(){
    print(character!.name);
  }
  
  // 전투 진행
  void battle(){
  }
  // 몬스터 리스트에서 대결할 몬스터 랜덤 반환
  void getRandomMonster(){
  }
  
}