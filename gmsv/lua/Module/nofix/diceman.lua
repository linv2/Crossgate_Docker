function InitDiceman_init(diceman)

              Char.SetData(diceman, %对像_形象%,110308);
                Char.SetData(diceman, %对像_原形%,110308);
	        Char.SetData(diceman, %对像_地图类型%, 0);
                Char.SetData(diceman, %对像_地图%,25000);
                Char.SetData(diceman, %对像_X%,15);
                Char.SetData(diceman, %对像_Y%,18);
                Char.SetData(diceman, %对像_方向%,5);
                Char.SetData(diceman, %对像_原名%,"骰子赌博裁判");
        	if (Char.SetTalkedEvent(nil,"rollDice",diceman) < 0) then
		           print("rollDice 注册事件失败。");
		               return false;
	        end

return true;
end




dicestart = 0;
dice1change = 0;
dice2change = 0;
dice3change = 0;

function init()
        if (dice1 == nil) then
                dice1 = NL.CreateNpc(nil, "InitDice");
                Char.SetData(dice1,%对像_形象%,26517);
                Char.SetData(dice1,%对像_原形%,26517);
                Char.SetData(dice1,%对像_X%,16);
                Char.SetData(dice1,%对像_Y%,18);
                Char.SetData(dice1,%对像_地图%,25000);
                Char.SetData(dice1,%对像_方向%,0);
                Char.SetData(dice1,%对像_原名%,"骰子");
        end
        if (dice2 == nil) then
                dice2 = NL.CreateNpc(nil, "InitDice");
                Char.SetData(dice2,%对像_形象%,26517);
                Char.SetData(dice2,%对像_原形%,26517);
                Char.SetData(dice2,%对像_X%,16);
                Char.SetData(dice2,%对像_Y%,17);
                Char.SetData(dice2,%对像_地图%,25000);
                Char.SetData(dice2,%对像_方向%,0);
                Char.SetData(dice2,%对像_原名%,"骰子");
        end
        if (dice3 == nil) then
                dice3 = NL.CreateNpc(nil, "InitDice");
                Char.SetData(dice3,%对像_形象%,26517);
                Char.SetData(dice3,%对像_原形%,26517);
                Char.SetData(dice3,%对像_X%,15);
                Char.SetData(dice3,%对像_Y%,17);
                Char.SetData(dice3,%对像_地图%,25000);
                Char.SetData(dice3,%对像_方向%,0);
                Char.SetData(dice3,%对像_原名%,"骰子");
        end
        NLG.UpChar(dice1);
        NLG.UpChar(dice2);
        NLG.UpChar(dice3);
        return true;
end

function InitDice()
        return true;
end

function rollDiceLoop(_MeIndex)
        if (dice1change>=5 and dice2change >=5 and dice3change>=5 ) then
                math.randomseed(os.time());
                roll = math.random(0,5);
                a = 26517 + roll;
                Char.SetData(dice1,%对像_形象%,a);
                Char.SetData(dice1,%对像_原形%,a);
                dice1num = roll+1;
                roll = math.random(0,5);
                a = 26517 + roll;
                Char.SetData(dice2,%对像_形象%,a);
                Char.SetData(dice2,%对像_原形%,a);
                dice2num = roll+1;
                roll = math.random(0,5);
                a = 26517 + roll;
                Char.SetData(dice3,%对像_形象%,a);
                Char.SetData(dice3,%对像_原形%,a);
                dice3num = roll+1;
                NLG.UpChar(dice1);
                NLG.UpChar(dice2);
                NLG.UpChar(dice3);		
		dice123num=dice1num+dice2num+dice3num
		if (dice123num < 11) then
		   dice12345num="小"
		 end
		 if (dice123num > 10) then
		   dice12345num="大"
		end
		if (dice1num == dice2num  and dice1num == dice3num) then
		dice12345num="三个一样"
		end

                buf = "本次骰子的结果是［"..dice1num.."］［"..dice2num.."］［"..dice3num.."］,一共［"..dice123num.."］点，开［"..dice12345num.."］";
                NLG.TalkToFloor(0,25000,buf,4,0);
                Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                dicestart = 0;
        end

end

function rollDice(_MeIndex,_PlayerIndex)
init()
        if (dicestart == 0) then
                dice1change = 0;
                dice2change = 0;
                dice3change = 0;
                Char.SetLoopEvent(nil, "rollDiceLoop", _MeIndex, 500);
                Char.SetLoopEvent(nil, "DiceAnimation", dice1, 1000);
                Char.SetLoopEvent(nil, "DiceAnimation", dice2, 1000);
                Char.SetLoopEvent(nil, "DiceAnimation", dice3, 1000);
        end
end

function DiceAnimation(_MeIndex)
        roll = math.random(0,5);
        a = 26517 + roll;
        Char.SetData(_MeIndex,%对像_形象%,a);
        Char.SetData(_MeIndex,%对像_原形%,a);
        if (_MeIndex == dice1) then
                dice1change = dice1change + 1;
                if (dice1change ==4) then
                        Char.SetData(_MeIndex,%对像_原形%,110108);
                        Char.SetData(_MeIndex,%对像_形象%,110108);
                end
                if (dice1change ==5) then
                        Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                end
        end
        if (_MeIndex == dice2) then
                dice2change = dice2change + 1;
                if (dice2change ==4) then
                        Char.SetData(_MeIndex,%对像_原形%,110108);
                        Char.SetData(_MeIndex,%对像_形象%,110108);
                end
                if (dice2change ==5) then
                        Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                end
        end
        if (_MeIndex == dice3) then
                dice3change = dice3change + 1;
                if (dice3change ==4) then
                        Char.SetData(_MeIndex,%对像_原形%,110108);
                        Char.SetData(_MeIndex,%对像_形象%,110108);
                end
                if (dice3change ==5) then
                        Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                end
        end
        NLG.UpChar(_MeIndex);
end

function Dicenil(_MeIndex)
        return;
end