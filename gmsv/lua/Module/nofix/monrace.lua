function MonsterRace_Init(mon_referee)

              Char.SetData(mon_referee, %对像_形象%,101005);
                Char.SetData(mon_referee, %对像_原形%,101005);
	        Char.SetData(mon_referee, %对像_地图类型%, 0);
                Char.SetData(mon_referee, %对像_地图%,25000);
                Char.SetData(mon_referee, %对像_X%,23);
                Char.SetData(mon_referee, %对像_Y%,18);
                Char.SetData(mon_referee, %对像_方向%,4);
                Char.SetData(mon_referee, %对像_原名%,"赛马赌博裁判");
        	if (Char.SetTalkedEvent(nil, "refereeTalked", mon_referee) < 0) then
		           print("refereeTalked 注册事件失败。");
		               return false;
	        end

return true;
end



--全局变量
mr_start = 0;--游戏是否开始
        
--Init函数,裁判NPC初始化的函数
--此函数会生成3个竞赛用的NPC
function Init()
        --生成3个竞赛用的NPC,并且设置好坐标等信息
if (mon_1 == nil) then
                mon_1 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_1,%对像_形象%,101800);
                Char.SetData(mon_1,%对像_原形%,101800);
	        Char.SetData(mon_1, %对像_地图类型%, 0);
                Char.SetData(mon_1,%对像_地图%,25000);
                Char.SetData(mon_1,%对像_X%,21);
                Char.SetData(mon_1,%对像_Y%,21);
                Char.SetData(mon_1,%对像_方向%,0);
                Char.SetData(mon_1,%对像_原名%,"哥布林");
                NLG.UpChar(mon_1);
end
if (mon_2 == nil) then
                mon_2 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_2,%对像_形象%,101240);
                Char.SetData(mon_2,%对像_原形%,101240);
	        Char.SetData(mon_2, %对像_地图类型%, 0);
                Char.SetData(mon_2,%对像_地图%,25000);
                Char.SetData(mon_2,%对像_X%,20);
                Char.SetData(mon_2,%对像_Y%,21);
                Char.SetData(mon_2,%对像_方向%,0);
                Char.SetData(mon_2,%对像_原名%,"小蝙蝠");
                NLG.UpChar(mon_2);
end
if (mon_3 == nil) then
                mon_3 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_3,%对像_形象%,101020);
                Char.SetData(mon_3,%对像_原形%,101020);
	        Char.SetData(mon_3, %对像_地图类型%, 0);
                Char.SetData(mon_3,%对像_地图%,25000);
                Char.SetData(mon_3,%对像_X%,19);
                Char.SetData(mon_3,%对像_Y%,21);
                Char.SetData(mon_3,%对像_方向%,0);
                Char.SetData(mon_3,%对像_原名%,"大地鼠");
                NLG.UpChar(mon_3);
end
        return true;
end

--竞赛NPC的初始化函数,因为无需要设置的,所以直接返回true既可
function Init_mon()
        return true;
end

--和裁判说话后触发的函数
function refereeTalked( _MeIndex, _PlayerIndex)
Init()  
        --这里判定游戏是否已经开始
        if (mr_start == 0) then
                --将竞速的NPC放回起点
                Char.SetData(mon_1,%对像_Y%,21);
                Char.SetData(mon_2,%对像_Y%,21);
                Char.SetData(mon_3,%对像_Y%,21);
                NLG.UpChar(mon_1);
                NLG.UpChar(mon_2);
                NLG.UpChar(mon_3);
                --取随机数来设置竞速npc的速度
                math.randomseed(os.time());
                speed= math.random(800,2000);
                --给竞速npc设置一个循环事件来执行前进的操作
                Char.SetLoopEvent(nil, "run", mon_1,speed);
                --设置第二个竞速NPC
                math.randomseed(os.time()+speed);
                speed= math.random(800,2000);
                Char.SetLoopEvent(nil, "run", mon_2,speed);
                --设置第三个竞速NPC
                math.randomseed(os.time()+speed);
                speed= math.random(800,2000);
                Char.SetLoopEvent(nil, "run", mon_3,speed);
                --公告比赛开始,比赛标识设置为1
                NLG.TalkToFloor(0,25000,"赛马比赛现在开始啦～！.咴咴～！",4,0,_MeIndex);
                mr_start = 1;
        end
      
end

--竞速NPC走路触发的函数
function run(_MeIndex)
        --判定比赛是否开始
        if (mr_start == 1) then
                --设置NPC动作为行走
                NLG.SetAction(_MeIndex,1);
                --NPC向前行走一步
                NLG.WalkMove(_MeIndex,0);
                --取一个新的随机数来设置下次的速度
                speed= math.random(800,2000);
                --判定是否到达了终点
                if (Char.GetData(_MeIndex,%对像_Y%)==13) then
                        --如果到达,设置比赛结束,公告获胜的竞速NPC
                        mr_start = 0;
                  NLG.SetAction(_MeIndex,6);
                                 NLG.UpChar(_MeIndex);
                   NLG.TalkToFloor(0,25000,"我获得了本次比赛的胜利哦!",0,0,_MeIndex);
                end
                --如果没到达终点,则更新循环事件的时间
                Char.SetLoopEvent(nil, "run", _MeIndex,speed);
        end
end



