------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���ٿ�쭣�����
--
--ָ��ʱ���Զ���ʼ�������ע��Ѻעʤ�����ý���
--
--by Ducky�Ώͻ�
--in 2013.12.4
-------------------------------------------------------------
--NPC����
local RaceNpcName = "�������Ա"			--NPC����
local RaceNpcImage = 106602				--NPCͼ��
local RaceNpcMapPos = {0,1000,243,83}		--NPC�ڷ�λ��
local RaceNpcMapDir = 4					--NPC�ڷŷ���
--�Զ���ʼ����(ע�⣺Ҫͬʱ�������µ�ʱ���������Ż��Զ���ʼ)
local RaceNpcAutoStartEnable = 1			--�����Ƿ��Զ���ʼ
local RaceNpcAutoStartTimeWeek = {0,1,2,3,4,5,6}	--�Զ���ʼ-���ڣ�0-���գ�1-��һ��2-�ܶ���3-������4-���ģ�5-���壬6-����
local RaceNpcAutoStartTimeHour = {20}		--�Զ���ʼ-Сʱ��0-23
local RaceNpcAutoStartTimeMin = {0}			--�Զ���ʼ-���ӣ�0-59
--����ͼ��
--����110574-110585
--��Ҷ����104339-104343
--�����104372-104376
--���Ѿ���104377-104381
local RaceHorseImage = {}
RaceHorseImage[1] = 107002
RaceHorseImage[2] = 120059
RaceHorseImage[3] = 107001
RaceHorseImage[4] = 120060
RaceHorseImage[5] = 107000
--������ʼλ��
local RaceHorsePos = {}
RaceHorsePos[1] = {0,1000,247,86}
RaceHorsePos[2] = {0,1000,247,87}
RaceHorsePos[3] = {0,1000,247,88}
RaceHorsePos[4] = {0,1000,247,89}
RaceHorsePos[5] = {0,1000,247,90}
--�����յ�λ��
local RaceHorseEnd = {}
RaceHorseEnd[1] = {0,1000,183,86}
RaceHorseEnd[2] = {0,1000,183,87}
RaceHorseEnd[3] = {0,1000,183,88}
RaceHorseEnd[4] = {0,1000,183,89}
RaceHorseEnd[5] = {0,1000,183,90}
--������ʼ����
local RaceHorseDir = {6, 6, 6, 6, 6}
--��������
local RaceHorseName = {}
RaceHorseName[1] = "�ٺź��˵�ͷ"
RaceHorseName[2] = "�ںŰ�����"
RaceHorseName[3] = "�ۺ�����Martell"
RaceHorseName[4] = "�ܺź�ɫ����"
RaceHorseName[5] = "�ݺŻƼ������"
-------------------------------------------------------------
--����Ի�����
local RaceHorseSay = 1			--�Ƿ�������Ի�
local RaceHorseColor = {6,0,3,7,4}	--�ֱ��Ӧ1-5�ŵ�������ɫ
local RaceHorseSaySet = {}
RaceHorseSaySet[1] = "�尡~~~~~��"
RaceHorseSaySet[2] = "���ǹھ�����"
RaceHorseSaySet[3] = "�����ߡ�����ɱ��"
RaceHorseSaySet[4] = "���һ�Ӱ���~"
RaceHorseSaySet[5] = "˲����"
RaceHorseSaySet[6] = "����̤��"
RaceHorseSaySet[7] = "���ȳ�~~~"
RaceHorseSaySet[8] = "��ͣ�������ˣ�����"
RaceHorseSaySet[9] = "С��������"
RaceHorseSaySet[10] = "Ӯ�˽���ǵ÷���һ��Ŷ��"
RaceHorseSaySet[11] = "����үү�����巢�ģ���һ��ҪӮ��"
RaceHorseSaySet[12] = "�ھ���Ҫ�����ˣ�"
RaceHorseSaySet[13] = "�����ܵù�����"
RaceHorseSaySet[14] = "���ܲ�~~~���ܣ�����"
RaceHorseSaySet[15] = "��˵�յ�����Ů������"
RaceHorseSaySet[16] = "�Ҳ�����󰡣������Ľ���û�����أ�"
RaceHorseSaySet[17] = "�ó���·������ô��û���ꡭ��"
RaceHorseSaySet[18] = "��֪���ж�����Ѻע���أ�"
-------------------------------------------------------------
--����ע���á�
local RaceHorseMode = 2				--ģʽ��1=��ң�2=���ߣ�
local RaceHorseGold = 5000			--������������ģʽʱ��Ч��
local RaceHorseItemID = 888888		--����ID������ģʽʱ��Ч��
local RaceHorseItemName = "Ģ��"	--�������ƣ�����ģʽʱ��Ч��
local RaceHorseItemNum = 5			--��������������ģʽʱ��Ч��
--����㽱����
local RaceRewardMode = 2			--ģʽ��1-��ң�2-���ߣ�3=������
local RaceRewardGold = 8000		--������������ģʽʱ��Ч��
local RaceRewardItemID = 888888		--����ID������ģʽʱ��Ч��
local RaceRewardItemName = "Ģ��"	--�������ƣ�����ģʽʱ��Ч��
local RaceRewardItemNum = 15		--��������������ģʽʱ��Ч��
local RaceRewardGoldPer = 1000		--�������/ÿ����ע�ߣ�����ģʽʱ��Ч��
-------------------------------------------------------------
--ϵͳ����
local RaceHorsePlayer = {}				--��Ҽ�¼
local RaceHorsePlayerWin = {}			--����Ҽ�¼
local RaceHorsePlayerNum = 0			--���������¼
local RaceHorsePlayerWinNum = 0			--�����������¼
--local RaceHorseCtrl = {}
local RaceHorseWalkCount = {0,0,0,0,0}
local RaceHorseStep = 0					--�������
local RaceHorseCount = 0				--�����ʱ
local RaceHorseWinNo = 0
local RaceHorseAction = {3,30,5,6}
local ���� = {}
����.���� = {}
����.����.����=1
����.����.ԭ��=2
����.����.��ͼ����=3
����.����.��ͼ=4
����.����.X=5
����.����.Y=6
����.����.����=7
����.����.�ȼ�=8
����.����.���=53
����.����.GM=144
����.����.ԭ��=2000
����.����.�˺�=2002
����.���� = {}
����.����.ID=0
����.����.����=3
����.����.˫��=5
����.����.�ѵ���=9
����.����.�ȼ�=11
����.����.�;�=65
����.����.����;�=13
����.����.δ������ = 2000
����.����.�Ѽ����� = 2001
����.����.��ӡ=2002
����.����.���ò���=2003
����.����.��ӡ���=2004
-------------------------------------------------------------
Delegate.RegInit("RaceHorse_Init");

function RaceHorse_Myinit(Index)
	return true
end

function RaceHorse_Init()
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,����.����.����, RaceNpcImage);
	Char.SetData(NpcIndex,����.����.ԭ��, RaceNpcImage);
	--Char.SetData(NpcIndex,����.����.��ͼ����, RaceNpcMapPos[1]);
	Char.SetData(NpcIndex,����.����.��ͼ, RaceNpcMapPos[2]);
	Char.SetData(NpcIndex,����.����.X, RaceNpcMapPos[3]);
	Char.SetData(NpcIndex,����.����.Y, RaceNpcMapPos[4]);
	Char.SetData(NpcIndex,����.����.����, RaceNpcMapDir);
	Char.SetData(NpcIndex,����.����.ԭ��, RaceNpcName);
	tbl_LuaNpcIndex["RaceHorseNPC"]=NpcIndex
	NLG.UpChar(NpcIndex);
	Char.SetLoopEvent(nil, "RaceHorse_LoopEvent", NpcIndex, 100)
	Char.SetTalkedEvent(nil, "RaceHorse_TalkedEvent", NpcIndex)
	Char.SetWindowTalkedEvent(nil, "RaceHorse_WindowTalkEvent", NpcIndex);
	--Char.SetWalkOverEvent(nil, nil, NpcIndex)
	--Char.SetWalkPostEvent(nil, nil, NpcIndex)
	--Char.SetWalkPreEvent(nil, nil, NpcIndex)
--[[
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,����.����.����, RaceNpcImage);
	Char.SetData(NpcIndex,����.����.ԭ��, RaceNpcImage); 
	--Char.SetData(NpcIndex,����.����.��ͼ����, RaceNpcMapPos[1]);
	Char.SetData(NpcIndex,����.����.��ͼ, RaceNpcMapPos[2]);
	Char.SetData(NpcIndex,����.����.X, RaceNpcMapPos[3]);
	Char.SetData(NpcIndex,����.����.Y, RaceNpcMapPos[4]-6);
	Char.SetData(NpcIndex,����.����.����, RaceNpcMapDir);
	Char.SetData(NpcIndex,����.����.ԭ��, RaceNpcName);
	tbl_LuaNpcIndex["RaceHorseNPC2"]=NpcIndex
	NLG.UpChar(NpcIndex);
--]]
	for i = 1,5 do
		tbl_LuaNpcIndex["RaceHorse_" .. i]=RaceHorse_CreateHorse(RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4], RaceHorseDir[i], RaceHorseImage[i], RaceHorseName[i])
	end
	tbl_LuaNpcIndex["RaceHorse_End"]=RaceHorse_CreateHorse(RaceHorseEnd[3][1], RaceHorseEnd[3][2], RaceHorseEnd[3][3]+1, RaceHorseEnd[3][4], 0, 113217, " ")
end

function RaceHorse_CreateHorse(MapType, MapID, PosX, PosY, Dir, Image, Name)
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,����.����.����, Image);
	Char.SetData(NpcIndex,����.����.ԭ��, Image);
	--Char.SetData(NpcIndex,����.����.��ͼ����, MapType);
	Char.SetData(NpcIndex,����.����.��ͼ, MapID);
	Char.SetData(NpcIndex,����.����.X, PosX);
	Char.SetData(NpcIndex,����.����.Y, PosY);
	Char.SetData(NpcIndex,����.����.����, Dir);
	Char.SetData(NpcIndex,����.����.ԭ��, Name);
	NLG.UpChar(NpcIndex);
	--Char.SetLoopEvent(nil, nil, NpcIndex, 1000)
	Char.SetTalkedEvent(nil, "RaceHorseSub_TalkedEvent", NpcIndex)
	Char.SetWindowTalkedEvent(nil, "RaceHorseSub_WindowTalkEvent", NpcIndex);
	return NpcIndex
end




function RaceHorse_LoopEvent( _MeIndex )
	if RaceHorseStep==0 then
		--û������ֱ�ӻ�����ȥ��
		if RaceNpcAutoStartEnable==1 then
			RaceHorseCount = RaceHorseCount + 1
			if math.fmod(RaceHorseCount,200)==0 then
				local rt = RaceHorseSub_CheckAutoTime(os.time())
				--print("\n rt=" .. tostring(rt) .. " | " .. os.date())
				if rt==true then
					RaceHorseSub_AutoStart()
				end
			end
		end
		return
	end
	RaceHorseCount = RaceHorseCount + 1

	local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
	local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)

	if RaceHorseStep==1 and RaceHorseCount>=600 then
		local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
		local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)
		NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] ��˵Ա��������ʼ������")
		RaceHorseStep=2
		RaceHorseCount=0
	elseif RaceHorseStep==1 then
		if math.fmod(RaceHorseCount,100)==0 and (600-RaceHorseCount)>=51 then
			for i = 1,5 do
				local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
				NLG.SetAction(HorseIndex, 6)
			end
			local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
			local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)
			NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] ��˵Ա�������" .. math.floor((600-RaceHorseCount)/10) .. "���ʼ�ˣ�")
		elseif (600-RaceHorseCount)<51 and math.fmod(RaceHorseCount,10)==0 then
			local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
			local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)
			NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] ��˵Ա������Ԥ������..." .. (600-RaceHorseCount)/10 .. "...")
		end
	elseif RaceHorseStep==2 then
		for i = 1,5 do
			local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
			--���յ�
			if RaceHorse_getDistancePos(HorseIndex, RaceHorseEnd[i][3], RaceHorseEnd[i][4])==0 then
				RaceHorseWinNo = i
				RaceHorseStep = 3
				RaceHorseCount = 0
				for o = 1,5 do
					local tHorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. o]
					NLG.SetAction(tHorseIndex, 10)
				end
				NLG.SetAction(tbl_LuaNpcIndex["RaceHorse_" .. RaceHorseWinNo], 6)
				RaceHorsePlayerWinNum = 0
				print("\n---------------------�г���ע����嵥��")
				for k,v in pairs(RaceHorsePlayer) do
					print(k .. "=" .. v)
					if v==RaceHorseWinNo then
						--print("\n�н���ң�" .. Char.GetData(v, ����.����.ԭ��))
						RaceHorsePlayerWinNum=RaceHorsePlayerWinNum+1
						RaceHorsePlayerWin[k] = true
					end
				end
				RaceHorsePlayer = {}
				NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] ��˵Ա����" .. RaceHorseName[RaceHorseWinNo] .. "����Ѹ�ײ����ڶ����ٶȳ���ˣ���Ϊ��һ�ֵĹھ�������")
				NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] ��˵Ա����Ѻע�ˡ�" .. RaceHorseName[RaceHorseWinNo] .. "������ң������������콱�����ڵ���Ȩ����")
				return
			--δ���յ�
			else
				local RND = NLG.Rand(5,10)
				NLG.SetAction(HorseIndex, 3)
				if RND==5 then
					RaceHorseWalkCount[i] = RaceHorseWalkCount[i] + 1
					NLG.WalkMove(HorseIndex, 6)
					local SRND = NLG.Rand(1,100)
					if RaceHorseSaySet[SRND]~=nil then
						RaceHorse_EasySay(HorseIndex, RaceHorseSaySet[SRND], 5, RaceHorseColor[i], 2)
					end
				end
			end
		end
	elseif RaceHorseStep==3 then
		
		if RaceHorseCount>30 then
			for i = 1,5 do
				local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
				Char.Warp(HorseIndex, RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4])
			end
			RaceHorseStep = 0
			RaceHorseCount = 0
		elseif math.fmod(RaceHorseCount,100)==0 or RaceHorseCount<5 then
			for o = 1,5 do
				local tHorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. o]
				NLG.SetAction(tHorseIndex, 10)
			end
			NLG.SetAction(tbl_LuaNpcIndex["RaceHorse_" .. RaceHorseWinNo], 6)
		end
	end
	
	return
end

function RaceHorse_TalkedEvent( _MeIndex, _PlayerIndex, _Mode)

	if NLG.CheckInFront(_PlayerIndex, _MeIndex, 3) == false then
		return ;
	end

	local PriceMSG = RaceHorseGold .. "G"
	if RaceHorseMode==2 then
		PriceMSG = "[" .. RaceHorseItemName .. "]" .. RaceHorseItemNum .. "��"
	end

	local RewardMSG = "[" .. RaceRewardGold .. "]G"
	if RaceRewardMode==2 then
		RewardMSG = "[" .. RaceRewardItemName .. "]" .. RaceRewardItemNum .. "��"
	end
	if RaceRewardMode==3 then
		if RaceHorsePlayer[getTabKey(_PlayerIndex)]==nil then
			RewardMSG = RaceRewardGoldPer .. "G��" .. RaceHorsePlayerNum+1 .. "�ˣ�����[" .. RaceRewardGoldPer*(RaceHorsePlayerNum+1) .. "]G�����л���ƽ�֣�"
		else
			RewardMSG = RaceRewardGoldPer .. "G��" .. RaceHorsePlayerNum+1 .. "�ˣ�����[" .. RaceRewardGoldPer*(RaceHorsePlayerNum) .. "]G�����л���ƽ�֣�"
		end
	end

	local buf = "7\n��������������������" .. RaceNpcName .. "��"
	buf = buf .. "\nϵͳ˵�����£�"
	buf = buf .. "\n1��ÿ������8�㣨��GM��ʱ��������ʼ����"
	buf = buf .. "\n2��ÿ�λ��� " .. PriceMSG .. " Ѻעһ������"
	buf = buf .. "\n3�����ʼ���������Ŵ�������������"
	buf = buf .. "\n4����ע���������ȵ����ص㣬�ɻ�ã�"
	buf = buf .. "\n ��" .. RewardMSG
	buf = buf .. "\n������������������������ʼ����GMר�ã�"
	buf = buf .. "\n��������������������Ͷע������"
	buf = buf .. "\n����������������������ȡ������"

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 0, 0, buf);

	return ;
end

function RaceHorse_WindowTalkEvent(_MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	--����ҳ��
	if _Seqno==0 and tonumber(_Data)==1 then
		--������ʼ��
		if (Char.GetData(_PlayerIndex,%����_GM%)~=1) then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ] �㲻��GM���޷�ʹ�ô˹���")
			return
		end
		RaceHorseSub_AutoStart()
	elseif _Seqno==0 and tonumber(_Data)==2 then
		--��Ͷע������
		local HorseList = ""
		for i = 1,5 do
			HorseList = HorseList .. "\n�����������U����" .. strFormat(RaceHorseName[i],20,1) .. "�U"
		end
		
		local buf = "3\n��������������������" .. RaceNpcName .. "��"
		buf = buf .. "\n��ѡ��Ҫ��ע������"
		buf = buf .. "\n�����������X�T�T�T�T�T�T�T�T�T�T�T�T�["
		buf = buf .. HorseList
		buf = buf .. "\n�����������^�T�T�T�T�T�T�T�T�T�T�T�T�a"
		buf = buf .. "\n�����������������������˳���"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 0, 1, buf);
	elseif _Seqno==0 and tonumber(_Data)==3 then
		--����ȡ������
		--�ж��Ƿ�����ע
		if RaceHorsePlayerWin[getTabKey(_PlayerIndex)]~=true then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ��û�л񽱣�")
			return
		end
		--��ȡ
		if RaceRewardMode==1 then
			local tPlayerGold = Char.GetData(_PlayerIndex, ����.����.���)
			if (tPlayerGold+RaceRewardGold)>1000000 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] �����ϵ�Ǯ̫���ˣ�����һ�������ɣ�")
				return
			else
				Char.SetData(_PlayerIndex, ����.����.���, Char.GetData(_PlayerIndex, ����.����.���) + RaceRewardGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ����ȡ��" .. RaceRewardGold .. "G")
				RaceHorsePlayerWin[getTabKey(_PlayerIndex)] = nil
				NLG.UpChar(_PlayerIndex)
				return
			end
		elseif RaceRewardMode==2 then
			if Char.ItemSlot(_PlayerIndex)>=20 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] �����ϵĵ���̫���ˣ�����һ�������ɣ�")
				return
			else
				Char.GiveItem(_PlayerIndex, RaceRewardItemID, RaceRewardItemNum)
				RaceHorsePlayerWin[getTabKey(_PlayerIndex)] = nil
				return
			end
		elseif RaceRewardMode==3 then
			local TotalGold = RaceRewardGoldPer*RaceHorsePlayerNum
			local PerGold = math.floor(TotalGold/RaceHorsePlayerWinNum)
			local tPlayerGold = Char.GetData(_PlayerIndex, ����.����.���)
			if (tPlayerGold+PerGold)>1000000 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] �����ϵ�Ǯ̫���ˣ�����һ�������ɣ�")
				return
			else
				Char.SetData(_PlayerIndex, ����.����.���, Char.GetData(_PlayerIndex, ����.����.���) + PerGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ���ڱ������н���" .. TotalGold .. "G����" .. RaceHorsePlayerWinNum .. "���У�����ȡ��" .. PerGold .. "G����")
				NLG.UpChar(_PlayerIndex)
				return
			end
		end
	end

	if _Seqno==1 then
		local SelectPos = tonumber(_Data)
		if SelectPos>5 then
			return
		end
		--�ж��Ƿ�����ע
		if RaceHorsePlayer[getTabKey(_PlayerIndex)]~=nil then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ������ע��" .. RaceHorseName[RaceHorsePlayer[getTabKey(_PlayerIndex)]] .. "�������ظ���ע��")
			return
		end
		--�жϱ����Ƿ�ʼ
		if RaceHorseStep~=0 then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] �����ѿ�ʼ���޷���ע��")
			return
		end
		--�ж��Ƿ�Ǯ
		if RaceHorseMode==1 then
			local tPlayerGold = Char.GetData(_PlayerIndex, ����.����.���)
			if tPlayerGold<RaceHorseGold then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ��" .. RaceHorseGold .. "G��û�У���һ��ȥ�����Ŵ�ү�����⣡")
				return
			else
				Char.SetData(_PlayerIndex, ����.����.���, Char.GetData(_PlayerIndex, ����.����.���) - RaceHorseGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] �㻨����" .. RaceHorseGold .. "G")
				NLG.UpChar(_PlayerIndex)
			end
		elseif RaceHorseMode==2 then
			local tItemNum = Char.ItemNum(_PlayerIndex, RaceHorseItemID)
			if tItemNum<RaceHorseItemNum then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ��" .. RaceHorseItemNum .. "��" .. RaceHorseItemName .. "��û�У���һ��ȥ�����Ŵ�ү�����⣡")
				return
			else
				Char.DelItem(_PlayerIndex, RaceHorseItemID, RaceHorseItemNum)
			end
		end
		RaceHorsePlayer[getTabKey(_PlayerIndex)] = SelectPos
		RaceHorsePlayerNum = RaceHorsePlayerNum + 1
		NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] ��ɹ���ע��" .. RaceHorseName[SelectPos] .. "��ף����ˣ�")
	end
	return
end

function RaceHorseSub_TalkedEvent( _MeIndex, _PlayerIndex, _Mode)
	local SelectHorse = 0
	for i = 1,5 do
		if tbl_LuaNpcIndex["RaceHorse_" .. i]==_MeIndex then
			SelectHorse=i
		end
	end
	--��Ͷע������
	local HorseList = ""
	for i = 1,5 do
		if SelectHorse==i then
			HorseList = HorseList .. "\n�����������U���" .. strFormat(RaceHorseName[i],20,1) .. "�U"
		else
			HorseList = HorseList .. "\n�����������U����" .. strFormat(RaceHorseName[i],20,1) .. "�U"
		end
	end
	
	local buf = "3\n��������������������" .. RaceNpcName .. "��"
	buf = buf .. "\n��ѡ��Ҫ��ע������"
	buf = buf .. "\n�����������X�T�T�T�T�T�T�T�T�T�T�T�T�["
	buf = buf .. HorseList
	buf = buf .. "\n�����������^�T�T�T�T�T�T�T�T�T�T�T�T�a"
	buf = buf .. "\n�����������������������˳���"
	
	NLG.ShowWindowTalked(_PlayerIndex, tbl_LuaNpcIndex["RaceHorseNPC"], 2, 0, 1, buf);
	return
end

function RaceHorseSub_AutoStart()
		RaceHorseStep = 1
		RaceHorseCount = 450
		RaceHorseWinNo = 0
		RaceHorseWalkCount = {0,0,0,0,0}
		--RaceHorsePlayer = {}
		RaceHorsePlayerWin = {}
		RaceHorsePlayerNum = 0
		RaceHorsePlayerWinNum = 0
		for i = 1,5 do
			local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
			Char.Warp(HorseIndex, RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4])
		end
end

function RaceHorseSub_WindowTalkEvent(_MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	return
end

function RaceHorse_getFrontPos(x, y, dir)
	if dir>=1 and dir<=3 then
		x=x+1
	end
	if dir>=3 and dir<=5 then
		y=y+1
	end
	if dir>=5 and dir<=7 then
		x=x-1
	end
	if dir>=7 or dir<=1 then
		y=y-1
	end
	return {x, y}
end

function RaceHorse_getTurnDir(_Dir, _Turn)
	return math.fmod((_Dir+_Turn),8)
end

function RaceHorse_EasySay(_MeIndex, _Msg, _Range, _Color, _Size)
	local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
	local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)
	local Target = NLG.GetMapPlayer(MeMapType, MeMapID)
	if type(Target)~="table" then
		return
	end
	for Key, TargetIndex in pairs(Target) do
		if RaceHorse_getDistance(_MeIndex, TargetIndex)<=_Range then
			NLG.TalkToCli(TargetIndex, _MeIndex, _Msg, _Color, _Size)
		end
	end
end

function RaceHorse_getDistance(_MeIndex, _ToIndex)
	local MeMapType = Char.GetData(_MeIndex, ����.����.��ͼ����)
	local MeMapID = Char.GetData(_MeIndex, ����.����.��ͼ)
	local MePosX = Char.GetData(_MeIndex, ����.����.X)
	local MePosY = Char.GetData(_MeIndex, ����.����.Y)
	local ToMapType = Char.GetData(_ToIndex, ����.����.��ͼ����)
	local ToMapID = Char.GetData(_ToIndex, ����.����.��ͼ)
	local ToPosX = Char.GetData(_ToIndex, ����.����.X)
	local ToPosY = Char.GetData(_ToIndex, ����.����.Y)
	if MeMapType~=ToMapType or MeMapID~=ToMapID then
		return -1
	end
	return math.abs(math.floor(math.sqrt((MePosX-ToPosX)*(MePosX-ToPosX)+(MePosY-ToPosY)*(MePosY-ToPosY))));
end

function RaceHorse_getDistancePos(_MeIndex, ToPosX, ToPosY)
	local MePosX = Char.GetData(_MeIndex, ����.����.X)
	local MePosY = Char.GetData(_MeIndex, ����.����.Y)
	return math.abs(math.floor(math.sqrt((MePosX-ToPosX)*(MePosX-ToPosX)+(MePosY-ToPosY)*(MePosY-ToPosY))))
end


function RaceHorseSub_CheckAutoTime(_Time)
	_Time = _Time or os.time()
	local tWeek = tonumber(os.date("%w", _Time))
	local tHour = tonumber(os.date("%H", _Time))
	local tMin = tonumber(os.date("%M", _Time))
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeWeek do
		if tWeek==RaceNpcAutoStartTimeWeek[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeHour do
		if tHour==RaceNpcAutoStartTimeHour[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeMin do
		if tMin==RaceNpcAutoStartTimeMin[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	return true
end
