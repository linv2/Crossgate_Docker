function MonsterRace_Init(mon_referee)

              Char.SetData(mon_referee, %����_����%,101005);
                Char.SetData(mon_referee, %����_ԭ��%,101005);
	        Char.SetData(mon_referee, %����_��ͼ����%, 0);
                Char.SetData(mon_referee, %����_��ͼ%,25000);
                Char.SetData(mon_referee, %����_X%,23);
                Char.SetData(mon_referee, %����_Y%,18);
                Char.SetData(mon_referee, %����_����%,4);
                Char.SetData(mon_referee, %����_ԭ��%,"����Ĳ�����");
        	if (Char.SetTalkedEvent(nil, "refereeTalked", mon_referee) < 0) then
		           print("refereeTalked ע���¼�ʧ�ܡ�");
		               return false;
	        end

return true;
end



--ȫ�ֱ���
mr_start = 0;--��Ϸ�Ƿ�ʼ
        
--Init����,����NPC��ʼ���ĺ���
--�˺���������3�������õ�NPC
function Init()
        --����3�������õ�NPC,�������ú��������Ϣ
if (mon_1 == nil) then
                mon_1 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_1,%����_����%,101800);
                Char.SetData(mon_1,%����_ԭ��%,101800);
	        Char.SetData(mon_1, %����_��ͼ����%, 0);
                Char.SetData(mon_1,%����_��ͼ%,25000);
                Char.SetData(mon_1,%����_X%,21);
                Char.SetData(mon_1,%����_Y%,21);
                Char.SetData(mon_1,%����_����%,0);
                Char.SetData(mon_1,%����_ԭ��%,"�粼��");
                NLG.UpChar(mon_1);
end
if (mon_2 == nil) then
                mon_2 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_2,%����_����%,101240);
                Char.SetData(mon_2,%����_ԭ��%,101240);
	        Char.SetData(mon_2, %����_��ͼ����%, 0);
                Char.SetData(mon_2,%����_��ͼ%,25000);
                Char.SetData(mon_2,%����_X%,20);
                Char.SetData(mon_2,%����_Y%,21);
                Char.SetData(mon_2,%����_����%,0);
                Char.SetData(mon_2,%����_ԭ��%,"С����");
                NLG.UpChar(mon_2);
end
if (mon_3 == nil) then
                mon_3 = NL.CreateNpc(nil, "Init_mon");
                Char.SetData(mon_3,%����_����%,101020);
                Char.SetData(mon_3,%����_ԭ��%,101020);
	        Char.SetData(mon_3, %����_��ͼ����%, 0);
                Char.SetData(mon_3,%����_��ͼ%,25000);
                Char.SetData(mon_3,%����_X%,19);
                Char.SetData(mon_3,%����_Y%,21);
                Char.SetData(mon_3,%����_����%,0);
                Char.SetData(mon_3,%����_ԭ��%,"�����");
                NLG.UpChar(mon_3);
end
        return true;
end

--����NPC�ĳ�ʼ������,��Ϊ����Ҫ���õ�,����ֱ�ӷ���true�ȿ�
function Init_mon()
        return true;
end

--�Ͳ���˵���󴥷��ĺ���
function refereeTalked( _MeIndex, _PlayerIndex)
Init()  
        --�����ж���Ϸ�Ƿ��Ѿ���ʼ
        if (mr_start == 0) then
                --�����ٵ�NPC�Ż����
                Char.SetData(mon_1,%����_Y%,21);
                Char.SetData(mon_2,%����_Y%,21);
                Char.SetData(mon_3,%����_Y%,21);
                NLG.UpChar(mon_1);
                NLG.UpChar(mon_2);
                NLG.UpChar(mon_3);
                --ȡ����������þ���npc���ٶ�
                math.randomseed(os.time());
                speed= math.random(800,2000);
                --������npc����һ��ѭ���¼���ִ��ǰ���Ĳ���
                Char.SetLoopEvent(nil, "run", mon_1,speed);
                --���õڶ�������NPC
                math.randomseed(os.time()+speed);
                speed= math.random(800,2000);
                Char.SetLoopEvent(nil, "run", mon_2,speed);
                --���õ���������NPC
                math.randomseed(os.time()+speed);
                speed= math.random(800,2000);
                Char.SetLoopEvent(nil, "run", mon_3,speed);
                --���������ʼ,������ʶ����Ϊ1
                NLG.TalkToFloor(0,25000,"����������ڿ�ʼ������.���ԡ���",4,0,_MeIndex);
                mr_start = 1;
        end
      
end

--����NPC��·�����ĺ���
function run(_MeIndex)
        --�ж������Ƿ�ʼ
        if (mr_start == 1) then
                --����NPC����Ϊ����
                NLG.SetAction(_MeIndex,1);
                --NPC��ǰ����һ��
                NLG.WalkMove(_MeIndex,0);
                --ȡһ���µ�������������´ε��ٶ�
                speed= math.random(800,2000);
                --�ж��Ƿ񵽴����յ�
                if (Char.GetData(_MeIndex,%����_Y%)==13) then
                        --�������,���ñ�������,�����ʤ�ľ���NPC
                        mr_start = 0;
                  NLG.SetAction(_MeIndex,6);
                                 NLG.UpChar(_MeIndex);
                   NLG.TalkToFloor(0,25000,"�һ���˱��α�����ʤ��Ŷ!",0,0,_MeIndex);
                end
                --���û�����յ�,�����ѭ���¼���ʱ��
                Char.SetLoopEvent(nil, "run", _MeIndex,speed);
        end
end



