function InitDiceman_init(diceman)

              Char.SetData(diceman, %����_����%,110308);
                Char.SetData(diceman, %����_ԭ��%,110308);
	        Char.SetData(diceman, %����_��ͼ����%, 0);
                Char.SetData(diceman, %����_��ͼ%,25000);
                Char.SetData(diceman, %����_X%,15);
                Char.SetData(diceman, %����_Y%,18);
                Char.SetData(diceman, %����_����%,5);
                Char.SetData(diceman, %����_ԭ��%,"���ӶĲ�����");
        	if (Char.SetTalkedEvent(nil,"rollDice",diceman) < 0) then
		           print("rollDice ע���¼�ʧ�ܡ�");
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
                Char.SetData(dice1,%����_����%,26517);
                Char.SetData(dice1,%����_ԭ��%,26517);
                Char.SetData(dice1,%����_X%,16);
                Char.SetData(dice1,%����_Y%,18);
                Char.SetData(dice1,%����_��ͼ%,25000);
                Char.SetData(dice1,%����_����%,0);
                Char.SetData(dice1,%����_ԭ��%,"����");
        end
        if (dice2 == nil) then
                dice2 = NL.CreateNpc(nil, "InitDice");
                Char.SetData(dice2,%����_����%,26517);
                Char.SetData(dice2,%����_ԭ��%,26517);
                Char.SetData(dice2,%����_X%,16);
                Char.SetData(dice2,%����_Y%,17);
                Char.SetData(dice2,%����_��ͼ%,25000);
                Char.SetData(dice2,%����_����%,0);
                Char.SetData(dice2,%����_ԭ��%,"����");
        end
        if (dice3 == nil) then
                dice3 = NL.CreateNpc(nil, "InitDice");
                Char.SetData(dice3,%����_����%,26517);
                Char.SetData(dice3,%����_ԭ��%,26517);
                Char.SetData(dice3,%����_X%,15);
                Char.SetData(dice3,%����_Y%,17);
                Char.SetData(dice3,%����_��ͼ%,25000);
                Char.SetData(dice3,%����_����%,0);
                Char.SetData(dice3,%����_ԭ��%,"����");
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
                Char.SetData(dice1,%����_����%,a);
                Char.SetData(dice1,%����_ԭ��%,a);
                dice1num = roll+1;
                roll = math.random(0,5);
                a = 26517 + roll;
                Char.SetData(dice2,%����_����%,a);
                Char.SetData(dice2,%����_ԭ��%,a);
                dice2num = roll+1;
                roll = math.random(0,5);
                a = 26517 + roll;
                Char.SetData(dice3,%����_����%,a);
                Char.SetData(dice3,%����_ԭ��%,a);
                dice3num = roll+1;
                NLG.UpChar(dice1);
                NLG.UpChar(dice2);
                NLG.UpChar(dice3);		
		dice123num=dice1num+dice2num+dice3num
		if (dice123num < 11) then
		   dice12345num="С"
		 end
		 if (dice123num > 10) then
		   dice12345num="��"
		end
		if (dice1num == dice2num  and dice1num == dice3num) then
		dice12345num="����һ��"
		end

                buf = "�������ӵĽ���ǣ�"..dice1num.."�ݣ�"..dice2num.."�ݣ�"..dice3num.."��,һ����"..dice123num.."�ݵ㣬����"..dice12345num.."��";
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
        Char.SetData(_MeIndex,%����_����%,a);
        Char.SetData(_MeIndex,%����_ԭ��%,a);
        if (_MeIndex == dice1) then
                dice1change = dice1change + 1;
                if (dice1change ==4) then
                        Char.SetData(_MeIndex,%����_ԭ��%,110108);
                        Char.SetData(_MeIndex,%����_����%,110108);
                end
                if (dice1change ==5) then
                        Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                end
        end
        if (_MeIndex == dice2) then
                dice2change = dice2change + 1;
                if (dice2change ==4) then
                        Char.SetData(_MeIndex,%����_ԭ��%,110108);
                        Char.SetData(_MeIndex,%����_����%,110108);
                end
                if (dice2change ==5) then
                        Char.SetLoopEvent(nil, "Dicenil", _MeIndex, 120000);
                end
        end
        if (_MeIndex == dice3) then
                dice3change = dice3change + 1;
                if (dice3change ==4) then
                        Char.SetData(_MeIndex,%����_ԭ��%,110108);
                        Char.SetData(_MeIndex,%����_����%,110108);
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