-----------------------------------------------------------------------------------
------����ƥ��-------

--�ű�����
����ѵǼǵص� =����ѵǼǵص� or {}	----��¼������ڵǼǵ������ص�
PrtJiLu = PrtJiLu or {}			--��������ʱָ��
ƥ������=ƥ������ or  {}
�����ʱ��¼ = �����ʱ��¼ or {}			--��������ʱָ��
���ƥ�䴴���� = ���ƥ�䴴���� or {}		--��¼ƥ���б�������ʽ{�ص�,�ȼ�,����,{��ң����..}}
PlayerTime ={}					----��ҽ���׼��״̬ = 0�Ǵ���׼�� >0�ǵȴ�״̬
WarpPlayerNum=WarpPlayerNum or {}				--����������¼{�ص�=����} >=5��ʼ
�����ƥ���б�= {}
��ʱ���ͼ�¼={}
local ����֮ʯid=123456
	--��ʽ ����|���Ƶȼ�|�շ�|����  ���ơ�������ƴ��͵��������ID ���������������0 ������Ƶ����������ڵ���IDǰ����� -��
local ���Ŵ��͵�ͼ��= {"����|10|100|0,1538,16,7|0",
		"����|10|300|0,100,589,47|96|�����ش���",
		"����|10|700|0,33000,290,436|0",
		"ѩɽ|30|800|0,402,83,193|102|������˹�崫��",
		"�׶�|40|800|0,15595,12,12|97|άŵ�Ǵ崫��",
		"ˮ��|50|1000|0,15542,17,24|97|άŵ�Ǵ崫��",
                "����ɽ|70|800|0,36003,11,2|0",
                "��ɽ|70|2000|0,48000,25,27|-16389|����Ʒָ֮��",
                "ɳ̲|90|2000|0,30002,404,94|163|��ŷ�ȴ���",}

-----------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
local NpcName = "����ٻ�����Ա"					--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 1000, 236, 83}		--Npc��ͼ����
local NpcImage = 106602					--Npcͼ��101022
local NpcDir = 4						--Npc����0Ϊ���ϣ�˳ʱ��ת��
Delegate.RegInit("EasyWarpNPC_Init");
function EasyWarpNPC_Init()

	local ����ƥ��NPC = CreateNpc("����ƥ��NPC")
	Char.SetData( ����ƥ��NPC, ����.����.����, NpcImage);
	Char.SetData( ����ƥ��NPC, ����.����.ԭ��, NpcImage);
	Char.SetData( ����ƥ��NPC, ����.����.��ͼ����, NpcMapPos[1]);
	Char.SetData( ����ƥ��NPC, ����.����.��ͼ, NpcMapPos[2]);
	Char.SetData( ����ƥ��NPC, ����.����.X, NpcMapPos[3]);
	Char.SetData( ����ƥ��NPC, ����.����.Y, NpcMapPos[4]);
	Char.SetData( ����ƥ��NPC, ����.����.����, NpcDir);
	Char.SetData( ����ƥ��NPC, ����.����.ԭ��, NpcName);
	NLG.UpChar(����ƥ��NPC)
	Char.SetTalkedEvent(nil, "EasyWarpNPC_Talked", ����ƥ��NPC)
	Char.SetWindowTalkedEvent(nil, "EasyWarpNPC_WindowTalked", ����ƥ��NPC)
	Char.SetLoopEvent(nil, "Warp_LoopEvent", ����ƥ��NPC,10);--30����һ���Ƿ�
	if #WarpPlayerNum==0 then
		WarpPlayerNum={}
		for i=1,#���Ŵ��͵�ͼ�� do
			WarpPlayerNum[i]={}
		end
	end
	return true;
end
function EasyWarpNPC_Talked( _MeIndex, _PlayerIndex, _Mode)
if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 1) == false) then--��������Ƿ�����ǰ
		return ;
	end 

	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2, 999,
			"5\n����������������������ƥ��������" ..
			"\n" ..
			"\n��ӭʹ��[ƥ������]ϵͳ��ϵͳ˵�����£�" ..
			"\n1����ҿ���ѡ�������ص㣬����������" ..
			"\n2�����������ᷢ��֪ͨ" ..
			"\n��������������   ���������С�" ..
			"\n��������������   ��������С�" ..
			"\n��������������   ����ѯ���ѡ�" ..
			"\n��������������   ��ȡ���Ǽǡ�" ..
			"\n");
		PrtJiLu[_PlayerIndex] = nil
	return ;
end

function EasyWarpNPC_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
		local tName= Char.GetData(_PlayerIndex,%����_ԭ��%)
		local tLevel= Char.GetData(_PlayerIndex,%����_�ȼ�%)
		local CdKey= Char.GetData(_PlayerIndex,2002)
	if _Select == 2 and _Seqno~=999 then ---���������˳�
	NLG.ShowWindowTalked(_PlayerIndex,
			_MeIndex, 2, 2, 999,
			"5\n������������������������ƥ��������" ..
			"\n" ..
			"\n��ӭʹ��[ƥ������]ϵͳ��ϵͳ˵�����£�" ..
			"\n1����ҿ���ѡ�������ص㣬����������" ..
			"\n2�����������ᷢ��֪ͨ" ..
			"\n��������������   ���������С�" ..
			"\n��������������   ��������С�" ..
			"\n��������������   ����ѯ���ѡ�" ..
			"\n��������������   ��ȡ���Ǽǡ�" ..
			"\n");
			PrtJiLu[_PlayerIndex] = nil
		return ;
	end
	-----����
	if _Seqno == 999 then
		if _Data == "1" then--��������
			if ����ѵǼǵص�[_PlayerIndex]==nil then
			PrtJiLu[_PlayerIndex] = 0
			�����ʱ��¼[_PlayerIndex]=1
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 34, PrtJiLu[_PlayerIndex],�������鴰��(_PlayerIndex,PrtJiLu[_PlayerIndex],���Ŵ��͵�ͼ��));
			---�鿴�����б�
			else
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ǰ�Ѿ��Ǽǹ�������ƥ�����Ҫ���µ�¼��ȡ���Ǽ�")
			end
			return ;
		end
		if _Data == "2" then
			--�鿴���ж���
			PrtJiLu[_PlayerIndex] = 0
			if #���ƥ�䴴����==nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,String.Centering("\n\n\n\n��ǰû�еǼǴ��ͼ�¼����"));
				return ;
			end
			�����ƥ���б�[_PlayerIndex]={}
			for k,v in pairs(���ƥ�䴴����) do
				table.insert(�����ƥ���б�[_PlayerIndex],{k,v})
			end
			local tselect =34
			if #�����ƥ���б�[_PlayerIndex] < 6 then
				tselect=2
			end
			�����ʱ��¼[_PlayerIndex]=2
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],�鿴���鴰��(_PlayerIndex,PrtJiLu[_PlayerIndex]));
			return ;
		end
		if _Data == "3" then
			--��ʾƥ�����
			if ����ѵǼǵص�[_PlayerIndex]~=nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2,888,��ȡƥ���������(_PlayerIndex));
			else
				�����ʱ��¼[_PlayerIndex]=2
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n��û�����ļ�¼��Ϣ����");
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�㲢û�м�¼��Ϣ")
			end
			return ;
		end
		if _Data == "4" then 
			---�����˼�¼
			if ����ѵǼǵص�[_PlayerIndex]==nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,String.Centering("\n\n\n\n�㲢û�м�¼��ַ����"));
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�㲢û�м�¼��Ϣ")
			else
				DelWarpPlayer(_PlayerIndex)
				return ;
			end
		end
	end

	
	if tonumber(_Seqno) ==888 and  tonumber(_Data)==1 then----------����ϵͳ�㲥
		if GetGold(_PlayerIndex)> 500 then
			local �ӳ�CdKey=����ѵǼǵص�[_PlayerIndex]
			local �ص�=���ƥ�䴴����[�ӳ�CdKey][1]
			local Warp = Split(���Ŵ��͵�ͼ��[�ص�],"|");
			local �����շ� = tonumber(Warp[3]);
			local Ҫ��ȼ�= ���ƥ�䴴����[�ӳ�CdKey][2]
			local ����=���ƥ�䴴����[�ӳ�CdKey][3]
			local ��������=#ƥ������[�ӳ�CdKey]
			local ��ͼ���� =Warp[1]
			Char.AddGold(_PlayerIndex,-500); 
--		local money = Char.GetData(_PlayerIndex,%����_���%);
--			Char.SetData(_PlayerIndex,%����_���%,money-500);
--			NLG.UpChar(player);			
			local EventName="�� "
				if tonumber(Warp[5])~=0 then
					 EventName=Warp[6]
				 end
			NLG.SystemMessage(-1,"[ƥ��] ��ҡ�"..tName.."."..tLevel.."����������ļ"..Ҫ��ȼ�.."�����϶���ǰ��"..��ͼ����.."����Ҫ������"..��������.."/"..����)
			NLG.SystemMessage(-1,"[ƥ��] ǰ��Ҫ��"..EventName)
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ]ħ�Ҳ���500�޷������㲥")
		end
		return ;
	end
	if tonumber(_Seqno) ==888 and  tonumber(_Data)==2 then----------����ϵͳ�㲥
			if ƥ������[CdKey]~=nil and  ��ʱ���ͼ�¼[CdKey]==nil and #ƥ������[CdKey]>1 then
				for i=1,#ƥ������[CdKey] do		----ɾ������1-5�����
					NLG.ShowWindowTalked(ƥ������[CdKey][i],_MeIndex, 0, 0,997,ȷ��ƥ���������(_PlayerIndex).."\n��������򷢳� 2  \n��ʮ����û����ȡ����¼");
					NLG.SystemMessage(ƥ������[CdKey][i],"[����ƥ��] �ӳ��Ѿ�Ҫ�󿪳���ȷ�������� 2 ")
					--������ʱ����¼		
				end
				PlayerTime[CdKey]=Num(os.time())
				��ʱ���ͼ�¼[CdKey]={}
			else
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\nֻ�жӳ����ܿ����������棡�����鲻��С��2��");
			end
		return
	end
	if tonumber(_Seqno) ==PrtJiLu[_PlayerIndex] and  tonumber(_Data)<0 then
		local tselect =50
		if _Select == 16 then ---������һ����ť
			PrtJiLu[_PlayerIndex] = tonumber(PrtJiLu[_PlayerIndex])-1
			if PrtJiLu[_PlayerIndex]==0 then--��һҳ
				tselect =34
			end
		elseif _Select == 32 then ---������һ����ť
			PrtJiLu[_PlayerIndex] =  tonumber(PrtJiLu[_PlayerIndex])+1
			if �����ʱ��¼[_PlayerIndex]==1 then
				local Max_Seqno=math.floor(#���Ŵ��͵�ͼ��/6)
				if PrtJiLu[_PlayerIndex] >= Max_Seqno or PrtJiLu[_PlayerIndex]*6==#���Ŵ��͵�ͼ�� then
					tselect =18
				end
			else
				local Max_Seqno=math.floor(#���ƥ�䴴����/6)
				if PrtJiLu[_PlayerIndex] >= Max_Seqno or PrtJiLu[_PlayerIndex]*6==#���ƥ�䴴���� then
					tselect =18
				end
			end
		end
		if �����ʱ��¼[_PlayerIndex]==1 then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],�������鴰��(_PlayerIndex,PrtJiLu[_PlayerIndex],���Ŵ��͵�ͼ��));
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],�鿴���鴰��(_PlayerIndex,PrtJiLu[_PlayerIndex]));
		end
		return ;
	end
	------------------------------------------
	if �����ʱ��¼[_PlayerIndex]==3 and tonumber(_Seqno) ==899 then
		local ToNumber= PrtJiLu[_PlayerIndex]
		local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
		local ��ͼ���� =Warp[1]
		local Ҫ��ȼ� = tonumber(Warp[2]);
		if tonumber(_Data)== nil  then
			_Data=Ҫ��ȼ�
		end	
		if tonumber(_Data)< Ҫ��ȼ�  or tonumber(_Data) >150 then
			_Data=Ҫ��ȼ�
		end	
		�����ʱ��¼[_PlayerIndex] =tonumber(_Data)
		NLG.ShowWindowTalked(_PlayerIndex,
																				_MeIndex, 1, 3, 898, "\n���������������������������Ǽǡ� " ..
																				"\n" ..
																				"\n��ǰѡ�������㣺" ..��ͼ����..
																				"\n" ..
																				"\n�������������������" ..
																				"\n(���Ϊ2���ֵΪ5��Ĭ��Ϊ5)");
		return ;
	end
	if tonumber(_Seqno) ==898 then
		if tonumber(_Data)== nil  then
			_Data=5
		end	
		if tonumber(_Data)< 2  or tonumber(_Data) >5 then
			_Data=5
		end	
		local ToNumber= PrtJiLu[_PlayerIndex]
		local Ҫ��ȼ�= �����ʱ��¼[_PlayerIndex]
		local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
		local ��ͼ���� =Warp[1]
		local �����շ� = tonumber(Warp[3]);
		local EventName="�� "
		if  tonumber(Warp[5])~=0 then
			 EventName=Warp[6]
		 end
		if �ж������Ǽ�����(_PlayerIndex,�����ʱ��¼[_PlayerIndex],ToNumber) == 0 then
     Char.AddGold(_PlayerIndex,-�����շ�); 
		--local money = Char.GetData(_PlayerIndex,%����_���%);
			--Char.SetData(_PlayerIndex,%����_���%,money-�����շ�);
			--NLG.UpChar(player);	
				---������ʽ{�ص�,�ȼ�,����,{��ң����..}}
				ƥ������[CdKey]={_PlayerIndex}
				���ƥ�䴴����[CdKey]={ToNumber,�����ʱ��¼[_PlayerIndex],tonumber(_Data)}
				--table.insert(���ƥ�䴴����, {ToNumber,�����ʱ��¼[_PlayerIndex],tonumber(_Data),{_PlayerIndex}})
				����ѵǼǵص�[_PlayerIndex]=CdKey
				NLG.SystemMessage(-1,"[ƥ��������ʾ] ��ҡ�"..tName.."."..tLevel.."����������ļ"..Ҫ��ȼ�.."�����϶���ǰ��"..��ͼ����.."������ǰ��Ҫ��"..EventName)
		end
		return ;
	end
	if _Seqno ~=999 and _Seqno < 100 and tonumber(_Data)>0 then --����ƥ������
		if ����ѵǼǵص�[_PlayerIndex]~= nil then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n����ǰ�Ѿ���¼���Ǽǵ㣬�������µǼ�����ȡ���Ǽǵ㣡��");
			return
		end	
		if �����ʱ��¼[_PlayerIndex]==1 then
			local ToNumber=PrtJiLu[_PlayerIndex]*6+tonumber(_Data)
			local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
			local ��ͼ���� =Warp[1]
			local Ҫ��ȼ� = tonumber(Warp[2]);
			local �����շ� = tonumber(Warp[3]);
			local Map = Split(Warp[4],",");
			local MapID =Map[2]
			local MapX =Map[3]
			local MapY =Map[4]
			local Event =tonumber(Warp[5])
			local EventName=Warp[6]
			NLG.ShowWindowTalked(_PlayerIndex,
																				  _MeIndex, 1, 3, 899, "\n���������������������������Ǽǡ� " ..
																				"\n" ..
																				"\nĿǰ�����㣺" ..��ͼ����..
																				"\n" ..
																				"\n����������ȼ���" ..
																				"\n(���Ϊ"..Ҫ��ȼ�.."���ֵΪ150)");
			�����ʱ��¼[_PlayerIndex]=3
			 PrtJiLu[_PlayerIndex]=tonumber(ToNumber)
			return
		end	
		if �����ʱ��¼[_PlayerIndex]==2 then
			if ����ѵǼǵص�[_PlayerIndex]~=nil then
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ǰ�Ѿ��Ǽǹ�������ƥ���")
				return ;
			end
			local ToNumber=�����ƥ���б�[_PlayerIndex][PrtJiLu[_PlayerIndex]*6+tonumber(_Data)]
			local �Ǽǵص�=ToNumber[2][1]
			local Warp = Split(���Ŵ��͵�ͼ��[�Ǽǵص�],"|");
			local ��ͼ���� =Warp[1]
			local Ҫ��ȼ� = tonumber(Warp[2]);
			local �����շ� = tonumber(Warp[3]);
			local Level=ToNumber[2][2]
			local ����=ToNumber[2][3]
			local �ӳ�CdKey=ToNumber[1]
			if �ж������Ǽ�����(_PlayerIndex,Level,�Ǽǵص�) == 0 then
				if ��ʱ���ͼ�¼[�ӳ�CdKey]~=nil then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n ��������Ŀǰ���ڴ��������Ժ򣡣�");
					return
				end
				if ���� ==#ƥ������[�ӳ�CdKey] then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n ��������Ŀǰ���ڴ��������Ժ򣡣�");
					return
				end
				����ѵǼǵص�[_PlayerIndex]=�ӳ�CdKey
				Char.AddGold(_PlayerIndex,-�����շ�); 
--		local money = Char.GetData(_PlayerIndex,%����_���%);
--			Char.SetData(_PlayerIndex,%����_���%,money-�����շ�);
--			NLG.UpChar(player);	
				---������ʽ{�ص�,�ȼ�,����,{��ң����..}}
				table.insert(ƥ������[�ӳ�CdKey], _PlayerIndex)
			end
			if ���� ==#ƥ������[�ӳ�CdKey] then
				for i=1,#ƥ������[�ӳ�CdKey] do		----ɾ������1-5�����
					NLG.ShowWindowTalked(ƥ������[�ӳ�CdKey][i],_MeIndex, 0, 0,997,ȷ��ƥ���������(_PlayerIndex).."\n��������򷢳� 2  \n��ʮ����û����ȡ����¼");
					NLG.SystemMessage(ƥ������[�ӳ�CdKey][i],"[ƥ��] �ۻ�����"..���� .."����ҡ�"..tName.."."..tLevel.."�����Ѿ��Ǽ�"..Ҫ��ȼ�.."�����϶���ǰ��"..��ͼ����.."������ȷ�������� 2 ")
					--������ʱ����¼		
				end
				PlayerTime[�ӳ�CdKey]=Num(os.time())
				��ʱ���ͼ�¼[�ӳ�CdKey]={}
			else
				for i=1,#ƥ������[�ӳ�CdKey] do
					NLG.SystemMessage(ƥ������[�ӳ�CdKey][i],"[ƥ��] ��ҡ�"..tName.."."..tLevel.."�����Ѿ��Ǽ����Ǽǵ㣬Ŀǰ��Ա"..#ƥ������[�ӳ�CdKey])
				end
			end
		end
	end
end
function �ж������Ǽ�����(_PlayerIndex,Level,ToNumber)
		local _MeIndex=IntNpc["����ƥ��NPC"]
		local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
		local ��ͼ���� =Warp[1]
		local Ҫ��ȼ� =Level
		local �����շ� = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Event =tonumber(Warp[5])
		local EventName=Warp[6]
		local tName= Char.GetData(_PlayerIndex,%����_ԭ��%)
		local tLevel= Char.GetData(_PlayerIndex,%����_�ȼ�%)
		if  Event~=0 then 
			if Event> 0 then
				if Char.NowEvent(_PlayerIndex,Event) ~= 1 then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n���޷�ʹ�������㣬������"..EventName.."����");
					--NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���޿���"..��ͼ����.."�����޷�,ֱ�Ӵ��͡�");
					return -1
				end	
			else
				if Char.ItemNum(_PlayerIndex,Event*-1) < 1 then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n���޷�ʹ�������㣬������ӵ�е��ߣ�"..EventName.."����");
					--NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���޿���"..��ͼ����.."�����޷�,ֱ�Ӵ��͡�");
					return -1
				end
			end	
		end
		if (Char.GetData(_PlayerIndex,%����_���%)<�����շ�) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n  �����ϵ�ħ�Ҳ������շ�"..�����շ�.."G����");
			--NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���ħ�Ҳ������޷�ʹ�ô������ص�,�����շ�"..�����շ�)
			return -1
		elseif (Char.GetData(_PlayerIndex,%����_�ȼ�%)<Level) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n ��ĵȼ��������޷�ʹ�ô������ص㣬������Ҫ"..Ҫ��ȼ�.."������");
			--NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ��ĵȼ��������޷�ʹ�ô������ص㣬������Ҫ"..Ҫ��ȼ�.."��")
			return -1
		end
		return 0
end
function �������鴰��(_PlayerIndex,_Seqno,Tabtpy)
		local Max_Seqno=getIntPart(#Tabtpy/6) --����󴰿�
		local Num=6
		if _Seqno == Max_Seqno then
			Num=#Tabtpy - Max_Seqno*6
		end

		local buf = "3\n����������������ѡ�������ص��" ..
		"\n"..string.format("%12.12s","�ص�") .. string.format("%8.8s","�ȼ�") .. string.format("%8.8s","�շ�")..string.format("%8.8s","Ҫ��").."\n"..
		"-------------------------------------------\n"
		for i = _Seqno*6+1,_Seqno*6+Num do
			local Warp = Split(Tabtpy[i],"|");
			local ��ͼ���� =Warp[1]
			local Ҫ��ȼ� = tonumber(Warp[2]);
			local �����շ� = tonumber(Warp[3]);
			local ����Ҫ�� = Warp[6] or "��"
			local ���="%8.8s"
			if ����Ҫ�� ~= "��" then
				���="%15.15s"
			end
			local Map = Split(Warp[4],",");
			local MapID =Map[2]
			local MapX =Map[3]
			local MapY =Map[4]
			buf = buf .. string.format("%12.12s",��ͼ����) .. string.format("%8.8s",Ҫ��ȼ�) .. string.format("%8.8s",�����շ�)..string.format(���,����Ҫ��).."\n"
		end
	return buf
end
function �鿴���鴰��(_PlayerIndex,_Seqno)
		--������ʽ{�ص�,�ȼ�,����,{��ң����..}}
		local Max_Seqno=getIntPart(#�����ƥ���б�[_PlayerIndex]/6) --����󴰿�
		local Num=6
		if _Seqno == Max_Seqno then
			Num=#�����ƥ���б�[_PlayerIndex]- Max_Seqno*6
		end
		local buf = "3\n��������������ѡ����������ص��" ..
		"\n".. string.format("%8.8s","�ӳ�����")..string.format("%12.12s","�ص�") .. string.format("%8.8s","�ȼ�") .. string.format("%8.8s","�շ�")..string.format("%8.8s","����").."\n"..
		"-------------------------------------------\n"
		for i = _Seqno*6+1,_Seqno*6+Num do
			local �ص�=�����ƥ���б�[_PlayerIndex][i][2][1]
			local Warp = Split(���Ŵ��͵�ͼ��[�ص�],"|");
			local ��ͼ���� =Warp[1]
			local Ҫ��ȼ� = tonumber(�����ƥ���б�[_PlayerIndex][i][2][2]);
			local �����շ� = tonumber(Warp[3]);
			local �Ǽ�����= 0
			if ƥ������[�����ƥ���б�[_PlayerIndex][i][1]]~=nil then
				�Ǽ����� = #ƥ������[�����ƥ���б�[_PlayerIndex][i][1]]
			end
			if �����ƥ���б�[_PlayerIndex]~=nil then	
				if Players[�����ƥ���б�[_PlayerIndex][i][1]]~=nil then
				local �ӳ�����=Char.GetData(Players[�����ƥ���б�[_PlayerIndex][i][1]].Index,%����_ԭ��%)
				local ����=�Ǽ�����.."/"..tonumber(�����ƥ���б�[_PlayerIndex][i][2][3])
				buf = buf .. string.format("%8.8s",�ӳ�����)..string.format("%12.12s",��ͼ����) .. string.format("%8.8s",Ҫ��ȼ�) .. string.format("%8.8s",�����շ�)..string.format("%8.8s",����).."\n"
				end
			end
		end
	return buf
end

Delegate.RegDelTalkEvent("����ƥ������");
function ����ƥ������( _PlayerIndex, _msg, _color, _range, _size)
	local Name = Char.GetData(_PlayerIndex,%����_ԭ��%)	
--	TalkMsg = string.sub(_msg,3)
--	TalkMsg = string.gsub(TalkMsg,"]","")
	if  _msg=="/ƥ������" or _msg=="/7" then	
	NLG.ShowWindowTalked(_PlayerIndex,IntNpc["����ƥ��NPC"], 2, 2, 999,
			"5\n������������������������ƥ��������" ..
			"\n" ..
			"\n��ӭʹ��[ƥ������]ϵͳ��ϵͳ˵�����£�" ..
			"\n1����ҿ���ѡ�������ص㣬����������" ..
			"\n2�����������ᷢ��֪ͨ" ..
			"\n��������������   ���������С�" ..
			"\n��������������   ��������С�" ..
			"\n��������������   ����ѯ���ѡ�" ..
			"\n��������������   ��ȡ���Ǽǡ�" ..
			"\n");
	end
	if  string.sub(_msg,3)=="2" then	
		local �ӳ�CdKey=����ѵǼǵص�[_PlayerIndex]
		if PlayerTime[�ӳ�CdKey]~=nil then
			table.insert(��ʱ���ͼ�¼[�ӳ�CdKey],_PlayerIndex)
		--�ȴ��������ȷ��
			local ��Ҽ�¼=���ƥ�䴴����[�ӳ�CdKey]
			local ���͵ص�=��Ҽ�¼[1]
			local ��������=��Ҽ�¼[3]
			if #��ʱ���ͼ�¼[�ӳ�CdKey] ==�������� or #��ʱ���ͼ�¼[�ӳ�CdKey] == #ƥ������[�ӳ�CdKey] then
				for i=1,#ƥ������[�ӳ�CdKey] do
					TWarpPlayer(ƥ������[�ӳ�CdKey][i])

					NLG.SystemMessage(ƥ������[�ӳ�CdKey][i],"[ϵͳ]�Ѵ�������¼�����ص㡣")
				end
				
				PlayerTime[�ӳ�CdKey]=nil
				��ʱ���ͼ�¼[�ӳ�CdKey]=nil
				���ƥ�䴴����[�ӳ�CdKey]=nil
				ƥ������[�ӳ�CdKey]=nil
			else
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ȷ��,�ȴ��������ȷ��")
			end
		end
	end
	if  TalkMsg =="/�����ڴ�" then
		PrtJiLu = {}		--��������ʱָ��
		ƥ������= {}
		�����ʱ��¼ =  {}			--��������ʱָ��
		���ƥ�䴴���� = {}		--��¼ƥ���б�������ʽ{�ص�,�ȼ�,����,{��ң����..}}
		PlayerTime ={}					----��ҽ���׼��״̬ = 0�Ǵ���׼�� >0�ǵȴ�״̬
		WarpPlayerNum=WarpPlayerNum or {}				--����������¼{�ص�=����} >=5��ʼ
		�����ƥ���б�= {}
		��ʱ���ͼ�¼={}
	end
end
function ȷ��ƥ���������(_PlayerIndex)
		local  CdKey=����ѵǼǵص�[_PlayerIndex]
		local ��Ҽ�¼=���ƥ�䴴����[CdKey]
		---������ʽ{�ص�,�ȼ�,����}
		local Ŀǰƥ������=ƥ������[CdKey]
		local ToNumber=��Ҽ�¼[1]
		local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
		local WName =Warp[1]
		local Ҫ��ȼ� = tonumber(Warp[2]);
		local �����շ� = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Msg =" ����������������ƥ��������" ..
		"\\n��ǰ�Ǽ��������ǣ���"..WName.."��\\nҪ�������ǣ�"..��Ҽ�¼[3]..
		"\\n".. string.format("%10.10s","����") .. string.format("%15.15s","ְҵ")..string.format("%8.8s","�ȼ�").."\\n"
		for i=1,#Ŀǰƥ������ do	
			local tName= Char.GetData(Ŀǰƥ������[i],%����_ԭ��%)
			local tJob=GetJobName(Char.GetData(Ŀǰƥ������[i],%����_ְ��ID%))
			local tLevel= Char.GetData(Ŀǰƥ������[i],%����_�ȼ�%)
			Msg=Msg..string.format("%10.10s",tName) .. string.format("%15.15s",tJob)..string.format("%8.8s",tLevel).."\\n"
		end
	return Msg
end
function ��ȡƥ���������(_PlayerIndex)
		local  CdKey=����ѵǼǵص�[_PlayerIndex]
		local ��Ҽ�¼=���ƥ�䴴����[CdKey]
		---������ʽ{�ص�,�ȼ�,����}
		local Ŀǰƥ������=ƥ������[CdKey]
		local ToNumber=��Ҽ�¼[1]
		local Warp = Split(���Ŵ��͵�ͼ��[ToNumber],"|");
		local WName =Warp[1]
		local Ҫ��ȼ� = tonumber(Warp[2]);
		local �����շ� = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Num=3+tonumber(#Ŀǰƥ������)
		local Msg =Num.."\\n����������������������ƥ��������" ..
		"\\n��ǰ�Ǽ���������["..WName.."] Ҫ��["..��Ҽ�¼[3].."]��"..
		"\\n".. string.format("%14.14s","����") .. string.format("%15.15s","ְҵ")..string.format("%8.8s","�ȼ�").."\\n"
		for i=1,#Ŀǰƥ������ do	
			local tName= Char.GetData(Ŀǰƥ������[i],%����_ԭ��%)
			local tJob=GetJobName(Char.GetData(Ŀǰƥ������[i],%����_ְ��ID%))
			local tLevel= Char.GetData(Ŀǰƥ������[i],%����_�ȼ�%)
			Msg=Msg..string.format("%14.14s",tName) .. string.format("%15.15s",tJob)..string.format("%8.8s",tLevel).."\\n"
		end
		Msg=Msg.."���·����㲥(500ħ��/��)".."\\nǿ�п���֪ͨ���ѿ���"
	return Msg
end

function Warp_LoopEvent(_MeIndex) ----ѭ���¼�
	for k,v in pairs(PlayerTime) do
		if Num(os.time())-v>=30 then 
			local �ӳ�CdKey=k
			local ��Ҽ�¼=���ƥ�䴴����[�ӳ�CdKey]
			local ��������=��Ҽ�¼[3]
			local Ŀǰƥ������=#ƥ������[�ӳ�CdKey]
			local ���͵ص�=��Ҽ�¼[1]
			for i=1,#ƥ������[�ӳ�CdKey] do
				local �жϼ�¼=0
				for b=1,#��ʱ���ͼ�¼[�ӳ�CdKey] do
					if ����ѵǼǵص�[ƥ������[�ӳ�CdKey][i]]~= nil then
						if ƥ������[�ӳ�CdKey][i]==��ʱ���ͼ�¼[�ӳ�CdKey][b] then
							NLG.SystemMessage(ƥ������[�ӳ�CdKey][i],"[ϵͳ]��Ķ��Ѳ�����ʱ��������Ҫ������ɣ���ȴ�������ұ�����")
							�жϼ�¼=1
							break
						end
					end
				end
				if �жϼ�¼==0 then
					if ����ѵǼǵص�[ƥ������[�ӳ�CdKey][i]]~= nil then
						NLG.SystemMessage(ƥ������[�ӳ�CdKey][i],"[ϵͳ]�������ʱ����Ϊ����ƥ�����񣬶�����Ҫ�������,����Ҫ���µǼǡ�")
						DelWarpPlayer(ƥ������[�ӳ�CdKey][i])
					end
				end
			end
			��ʱ���ͼ�¼[�ӳ�CdKey]=nil
			PlayerTime[�ӳ�CdKey]=nil
		end
	end
end

Delegate.RegDelLogoutEvent("WarpOutEvent"); --�ǳ������¼�
function WarpOutEvent(_PlayerIndex)
	if ����ѵǼǵص�[_PlayerIndex]~= nil then
		DelWarpPlayer(_PlayerIndex)
	end
end
function DelWarpPlayer(_PlayerIndex)---������ҵ�½��Ϣ
	local �ӳ�CdKey=����ѵǼǵص�[_PlayerIndex]
	����ѵǼǵص�[_PlayerIndex]=nil
	local CdKey = Char.GetData(_PlayerIndex,2002)
	local ���� = Char.GetData(_PlayerIndex,%����_ԭ��%)
	local �ص�=���ƥ�䴴����[�ӳ�CdKey][1]
	local Warp = Split(���Ŵ��͵�ͼ��[�ص�],"|");
	local �����շ� = tonumber(Warp[3]);
	Char.AddGold(_PlayerIndex,�����շ�*0.8); 
	if CdKey~=�ӳ�CdKey then
		local ��Ҽ�¼=���ƥ�䴴����[�ӳ�CdKey]
		---������ʽ{�ص�,�ȼ�,����}
		for k,v in pairs(ƥ������[�ӳ�CdKey]) do
			NLG.SystemMessage(v,"[ϵͳ]"..����.."ȡ���Ǽǣ��뿪����")
			if v==_PlayerIndex then
				table.remove(ƥ������[�ӳ�CdKey],k)
			end
		end
	else
		if #ƥ������[CdKey] ==1 then
			ƥ������[CdKey] =nil
			���ƥ�䴴����[CdKey]=nil
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ]ȡ���Ǽǳɹ�")
			return ;
		end
		local �¼�¼��={}
		for k,v in pairs(ƥ������[�ӳ�CdKey]) do
			if v~=_PlayerIndex then
				table.insert(�¼�¼��,v)
			end
		end
		local NewCdKey=Char.GetData(�¼�¼��[1],2002	)
		NLG.SystemMessage(�¼�¼��[1],"[ϵͳ]���Ѿ���öӳ����")
		ƥ������[NewCdKey]=�¼�¼��
		���ƥ�䴴����[NewCdKey]={���ƥ�䴴����[CdKey][1],���ƥ�䴴����[CdKey][2],���ƥ�䴴����[CdKey][3]}
		���ƥ�䴴����[CdKey]=nil
		for k,v in pairs(����ѵǼǵص�) do
			if v==CdKey then
				����ѵǼǵص�[k]=NewCdKey
			end
		end
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�Ѿ�ȡ����¼��Ϣ���Ҷӳ�ת������")
	end		
end
function CWarpPlayer(_PlayerIndex)---���������㣬����ֵ�Ǵ��ͷ���
	local ret =0
	if ����ѵǼǵص�[_PlayerIndex]~=nil then
		DelWarpPlayer(_PlayerIndex)
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���������Ǽ�����������ͷ��÷���")
	else
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���������Ǽ�����ʧ��")
	end
	return ret
end
function TWarpPlayer(_PlayerIndex)---���������㣬����
		local �ӳ�CdKey=����ѵǼǵص�[_PlayerIndex]
		local CdKey = Char.GetData(_PlayerIndex,2002	)
		local ���� = Char.GetData(_PlayerIndex,%����_ԭ��%)
		local �ص�=���ƥ�䴴����[�ӳ�CdKey][1]
		local Warp = Split(���Ŵ��͵�ͼ��[�ص�],"|");
		local WName =Warp[1]
		local Ҫ��ȼ� = tonumber(Warp[2]);
		local �����շ� = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
	----------------------------���Ͳ���������Ҽ�¼
		NLG.DischargeParty(_PlayerIndex)
		NLG.Warp(_PlayerIndex,0,MapID,MapX,MapY);
		if CdKey~=�ӳ�CdKey then
			Char.JoinParty(_PlayerIndex,Players[�ӳ�CdKey].Index)
		end
		����ѵǼǵص�[_PlayerIndex]=nil
	return
end

function GetJobName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="����"
	JobTypeName[10]="��ʿ"
	JobTypeName[20]="ս����ʿ"
	JobTypeName[30]="��ʿ"
	JobTypeName[40]="������"
	JobTypeName[50]="ʿ��"
	JobTypeName[60]="����ʿ"
	JobTypeName[70]="ħ��ʦ"
	JobTypeName[80]="����ʦ"
	JobTypeName[90]="�����ʦ"
	JobTypeName[100]="����ʦ"
	JobTypeName[110]="ѱ��ʦ"
	JobTypeName[120]="����"
	JobTypeName[130]="��ʦ"
	JobTypeName[140]="��ʿ"
	JobTypeName[150]="����"
	JobTypeName[160]="����"
	JobTypeName[200]="����������"
	JobTypeName[210]="��ս����"
	JobTypeName[220]="ǹְ��"
	JobTypeName[230]="Զ������"
	JobTypeName[240]="��ְ��"
	JobTypeName[250]="����ְ��"
	JobTypeName[260]="С��ְ��"
	JobTypeName[270]="��װ����"
	JobTypeName[280]="��װ����"
	JobTypeName[290]="��ְ��"
	JobTypeName[300]="��ְ��"
	JobTypeName[310]="��ְ��"
	JobTypeName[320]="ѥְ��"
	JobTypeName[330]="Ьְ��"
	JobTypeName[340]="��ְ��"
	JobTypeName[350]="��ҩʦ"
	JobTypeName[360]="ҩ��ʦ"
	JobTypeName[370]="��������ʦ"
	JobTypeName[380]="��������ʦ"
	JobTypeName[390]="����ʦ"
	JobTypeName[400]="�Ϥ���"
	JobTypeName[410]="̽��"
	JobTypeName[420]="����"
	JobTypeName[430]="��ʿ"
	JobTypeName[440]="ҽ��"
	JobTypeName[450]="�ɼ�����"
	JobTypeName[460]="����"
	JobTypeName[470]="��"
	JobTypeName[480]="��"
	JobTypeName[1000]="����ʦ"
	JobTypeName[1010]="��֯��"
	JobTypeName[170]="ʥ��ʿ"
	JobTypeName[180]="Ӱ�̿�"
	JobTypeName[190]="ħ��ʿ"
	JobTypeName[720]="��װ�������"
	JobTypeName[710]="��װ�������"
	JobTypeName[730]="��װ�������"
	JobTypeName[740]="ȭ������"
	if _TypeNo==0 then _TypeNo=1 end
	if JobTypeName[_TypeNo] == nil then
		JobTypeName[_TypeNo] = "δְ֪ҵ"
	end
	return JobTypeName[_TypeNo]
end



