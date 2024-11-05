// ignore_for_file: unnecessary_this
import 'dart:io';
import 'character.dart';
import 'monster.dart';
import 'dart:math';

class Game{
  Character character=Character('name', 0, 0, 0);
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
      var temp=Monster(monstertable[i-1][0], int.parse(monstertable[i-1][1]), int.parse(monstertable[i-1][2]), character.def);
      monsterList.add(temp);
    }
  }

  // 게임 시작
  void startGame(){
    print('게임을 시작합니다!');
    bool keepGame=true;
    while(keepGame){
      battle();
      if(monsterList.isEmpty){
        print('축하합니다! 모든 몬스터를 물리쳤습니다.');
        keepGame=false;
      }
      else{
        print('다음 몬스터와 싸우시겠습니까? [y/n]');
        switch(stdin.readLineSync()){
          case 'n':
            keepGame=false;
            break;
        }
      }
    }
    // 승패 결과 산출
    String fightResult='승리';
    if(character.hp==0&&monsterList.isNotEmpty){
      fightResult='패배';
    }
    else if(character.hp==0&&monsterList.isEmpty){
      fightResult='무승부';
    }

    bool resultSave=true;
    while(resultSave){
      print('결과를 저장하시겠습니까? [y/n]');
      String cmd;
      try{
        cmd=stdin.readLineSync().toString();}
        catch(e){
          print('입력이 잘못되었습니다.');
          continue;
        }
      switch(cmd){
        case 'y':
        var resultFile = File('assets/txt/result.txt');
          String contents='이름: ${character.name}, 남은 체력: ${character.hp}, 결과: $fightResult/n';
          resultFile.writeAsStringSync(contents);
          print('결과를 저장하였습니다.');
          resultSave=false;
          break;
        case 'n':
          print('결과를 저장하지 않습니다.');
          resultSave=false;
          break;
      }
    }
  }

  void printTest(){
    print(character.name);
  }
  
  // 전투 진행
  void battle(){
    Monster monster=getRandomMonster();
    print('새로운 몬스터가 나타났습니다!');
    monster.showStatus();
    while(character.hp>0&&monster.hp>0){
      print('${character.name}의 턴\n행동을 선택하세요 (1: 공격, 2: 방어): ');
      bool thisTurn=true;
      while(thisTurn){
        int command;
        try{command=int.parse(stdin.readLineSync().toString());
        }
        catch(e){
          print("입력값이 잘못되었습니다.");
          continue;
        }
        switch(command){
          case 1:
            character.attackMonster(monster);
            thisTurn=false;
            break;
          case 2:
            character.defend();
            thisTurn=false;
            break;
          default:
            print('잘못된 입력입니다.');
        }
      }
      print('${monster.name}의 턴\n');
      monster.attackCharacter(character);
      character.showStatus();
      monster.showStatus();
    }
    if(character.hp<=0){
      print('${character.name}이(가) 쓰러졌습니다!');
    }
    if(monster.hp<=0){
      print('${monster.name}을(를) 물리쳤습니다!');
    }
    print('\n');
  }
  // 몬스터 리스트에서 대결할 몬스터 랜덤 반환
  Monster getRandomMonster(){
    int monsterNum=Random().nextInt(monsterList.length);
    Monster monsterPicked=monsterList[monsterNum];
    monsterList.removeAt(monsterNum);
    return monsterPicked;
  }
  
}