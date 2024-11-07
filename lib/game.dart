// ignore_for_file: unnecessary_this
import 'dart:io';
import 'character.dart';
import 'monster.dart';
import 'dart:math';

class Game {
  Character character=Character('name', 0, 0, 0);
  List<Monster> monsterList=[]; // 몬스터 목록
  int monsterCount=4;           // 처치해야 할 몬스터 수
  bool item=true;               // 아이템이 존재할 시 true
  String name;                  // 사용자로부터 입력받을 캐릭터 이름
  int monsterDefUp=0;           // 몬스터의 방어력이 증가하는 3턴을 세는 변수
  int dot=0;                    // 도트 데미지 턴 수를 세는 변수

  Game(this.name) {
    var characterFile = File('assets/txt/characters.txt');
    var monsterFile = File('assets/txt/monsters.txt');

    var characterContents = characterFile.readAsStringSync();
    var monsterContents = monsterFile.readAsStringSync();

    // character 생성
    List<String> characterOnceSplited=characterContents.split('\n');
    List<String> characterTable=characterOnceSplited[1].split(',');
    character=Character(name, int.parse(characterTable[0]), int.parse(characterTable[1]), int.parse(characterTable[2]));

    //monsterList<Monster> 생성
    List<String> monsterOnceSplited=monsterContents.split('\n');
    List<List<String>> monstertable=[];
    for(int i=1;i<monsterOnceSplited.length;i++){
      monstertable.add(monsterOnceSplited[i].split(','));
      var temp=Monster(monstertable[i-1][0], int.parse(monstertable[i-1][1]), int.parse(monstertable[i-1][2]), character.def);
      monsterList.add(temp);
    }
  }

  // Future<String> readFile (String direction) async {
  //   var loadFile;
  //   await Future.delayed(Duration(), () {loadFile = File(direction);});
  //   String contents='';
  //   await Future.delayed(Duration(), () {contents = loadFile.readAsStringSync();});
  //   return contents;
  // }

  // void setMonsterList() async {
  //   readFile('assets/txt/monsters.txt').then(()){
  //     print(value);
  //   });
  //   print('x');
  //   List<String> monsterOnceSplited=readFile('assets/txt/monsters.txt').toString().split('\n');
  //   //print('${monsterOnceSplited}');
  //   List<List<String>> monstertable=[];
  //   for(int i=1;i<monsterOnceSplited.length;i++){
  //     monstertable.add(monsterOnceSplited[i].split(','));
  //     var temp=Monster(monstertable[i-1][0], int.parse(monstertable[i-1][1]), int.parse(monstertable[i-1][2]), character.def);
  //     monsterList.add(temp);
  //   }
  // }

  // void setCharacterList() async {
  //   List<String> characterOnceSplited=readFile('assets/txt/characters.txt').toString().split('\n');
  //   List<String> characterTable=characterOnceSplited[1].split(',');
  //   character=Character(name, int.parse(characterTable[0]), int.parse(characterTable[1]), int.parse(characterTable[2]));
  // }

  // 게임 시작
  void startGame(){
    print('게임을 시작합니다!');
    getBonusHp();
    character.showStatus();

    bool keepGame=true;

    while(keepGame){
      battle();
      if(monsterCount==0){
        print('축하합니다! 모든 몬스터를 물리쳤습니다.');
        keepGame=false;
      }
      else if(character.hp<=0){
        print('플레이어가 쓰러졌습니다.');
        keepGame=false;
      }
      else{
        bool chooseNext=true;
        while(chooseNext){
          print('다음 몬스터와 싸우시겠습니까? [y/n]');
          switch(stdin.readLineSync()){
            case 'y':
              monsterDefUp=0;
              chooseNext=false;
            case 'n':
              keepGame=false;
              chooseNext=false;
              break;
            default :
              print('입력값이 잘못되었습니다.');
          }
        }
      }
    }
    // 승패 결과 산출
    String fightResult='승리';
    if(character.hp<=0&&monsterCount!=0){
      fightResult='패배';
    }
    else if(character.hp<=0&&monsterCount==0){
      fightResult='무승부';
    }

    print('결과는 $fightResult입니다.');

    bool resultSave=true;
    while(resultSave){
      print('결과를 저장하시겠습니까? [y/n]');
      String cmd=stdin.readLineSync().toString();
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
        default :
          print('입력이 잘못되었습니다.');
      }
    }
  }

  void printTest(){
    print(character.name);
  }

  void getBonusHp(){
    if(Random().nextInt(10)<3){
      character.hp+=10;
      print('보너스 체력을 얻었습니다! 현재 체력: ${character.hp}');
    }
  }

  void dotAtack(Monster monster){
    if(dot>0){
      character.dotSkill(monster);
      dot--;
    }
  }

  // 전투 진행
  void battle(){
    print('--------------------------------------------------------------');
    // 몬스터 뽑기
    Monster monster=getRandomMonster();
    print('새로운 몬스터가 나타났습니다!');
    monster.showStatus();

    // 전투 턴 반복
    while(character.hp>0&&monster.hp>0){
      // 플레이어의 턴
      bool thisTurn=true;

      // 행동 선택
      print('|--------${character.name}의 턴 --------|\n\n행동을 선택하세요 (1: 공격, 2: 방어, 3: 아이템 사용, 4: 스킬 사용) : ');

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
            dotAtack(monster);
            thisTurn=false;
            break;
          case 2:
            character.defend();
            dotAtack(monster);
            thisTurn=false;
            break;
          case 3:
            if(item) {character.attackWithItem(monster, item); item=false; dotAtack(monster); thisTurn=false;}
            else {print('아이템이 없습니다.'); break;}
          case 4:
           dot=3;
           dotAtack(monster);
           thisTurn=false;
          default:
            print('입력값이 잘못되었습니다.');
        }
      }

      // 몬스터의 턴
      print('\n|--------${monster.name}의 턴--------|\n');
      monster.attackCharacter(character);
      // 몬스터 방어력 증가 이벤트
      if(monsterDefUp!=2){monsterDefUp++;}
      else{monster.defUp(); monsterDefUp-=2;}

      // 현재 상태 출력 후 이번 턴 종료
      character.showStatus();
      monster.showStatus();
    }

    // 캐릭터가 쓰러진 경우
    if(character.hp<=0){
      print('${character.name}이(가) 쓰러졌습니다!');
    }

    // 몬스터를 물리친 경우
    if(monster.hp<=0){
      print('${monster.name}을(를) 물리쳤습니다!');
      monsterCount-=1;
    }
    print('--------------------------------------------------------------');
  }
  // 몬스터 리스트에서 대결할 몬스터 랜덤 반환
  Monster getRandomMonster(){
    int monsterNum=Random().nextInt(monsterList.length);
    Monster monsterPicked=monsterList[monsterNum];
    monsterList.removeAt(monsterNum);
    return monsterPicked;
  }
  
}