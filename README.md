# rpgGame
몬스터 4마리를 쓰러뜨리면 승리하는 턴제 전투 게임입니다.

> 아이템과 스킬을 활용하여 점점 강해지는 몬스터를 상대하고,
전설의 포●몬 기라티나와의 배틀에서 승리해보세요.

## 실행 방법
1. 원하는 경로에 레포지토리를 포크합니다.
2. 터미널에 ``dart run`` 을 입력합니다.
3. 포●몬 마스터가 될 플레이어의 이름을 입력해주세요.
4. 게임이 끝나면 ``assets/txt/result.txt`` 에서 기록된 결과를 확인할 수 있습니다.

## 커스터마이징
좋아하는 괴물을 추가하고 내 캐릭터를 변경해보세요.
> ``assets/txt/monsters.txt`` 와 ``assets/txt/characters.txt`` 를 수정합니다. 해당 파일의 데이터는 ``csv`` 형식으로 구성되어 있습니다.

## 인게임 화면
입력 ``1``, ``2``, ``3``, ``4`` 에 따라 네 가지 전투 기능을 제공합니다.

![image](https://github.com/user-attachments/assets/25c471e2-8dd1-45ce-912e-5b63d5a9e24d)
![image](https://github.com/user-attachments/assets/96f1e47b-d748-4f42-9966-1ff611b0ae74)


``1``  기본 공격입니다. 운이 좋으면 급소를 노립니다. 하지만 상대편도 노린다는 걸 잊지 마세요.

``2``  방어 기능입니다. 힘 주고 누르면 덜 아프게 맞을 수도...

``3``  게임에서 한 번, 공격력을 2배로 강화하는 아이템을 사용합니다.

``4``  몬스터에게 지속 데미지를 부여합니다.
