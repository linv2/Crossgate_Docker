------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--��ҵ����Lua�ű�-CSV�� For CGEX
--
--1���ṩͻ��100W���޵Ĵ�����ÿ�ռ�������Ϣ
--2���ṩ������񣨸��ݵȼ���������ȣ���ÿ�ռ��������Ϣ
--3������ʱ�䲻�黹��������������������δ��ɣ��������������ű�������
--
--by Ducky�Ώͻ�
--in 2013.12.25
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
local NpcName = "��ҵ����"					--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 777, 20, 21}		--Npc��ͼ����
local NpcImage = 106602						--Npcͼ��101022
local NpcDir = 6							--Npc����0Ϊ���ϣ�˳ʱ��ת��
local tbl_LuaNpcIndex = { }
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű��������á�����
------------------------------------------------------------------------------
--��ʹ�����ơ�
local VipLimit = 0						--VIP����
local LendingLvLimit = 50				--����ȼ�����
local DepositLvLimit = 10				--���ȼ�����
local LendingLv = {1,40,60,80,100,120}		--���ȼ����ִ������ޣ��ӵ͵��ߣ�
local LendingLvRates = {500,2000,3000,4000,5000,6000}		--ÿ���ɴ�����ӵ͵��ߣ�
local PlayerGoldMax = 10000000			--�������Ͻ������
local LendingMaxLimit = 1000000			--��������
local DepositMaxLimit = 20000000		--�������

--���������á�
local ClearingTime = 22				--����ʱ�䣨Сʱ��
local FreeTime = 3						--��Ϣ�������ޣ��죩
local DeadTime = 10					--�ͷ����ޣ��죩
local DepositLimit = 1					--����10�������޷����
local AutoOffset = 1					--��Ϣ�ں��Զ��ô���������
local LendingRates = 0.1				--��������
local DepositRates = 0.01				--�������
local CreateAccount = 1				--�Ƿ���Ҫ����
local CreateNeed = 20000			--���������ʽ�
local CreateDeposit = 15000			--�������ʼ�����
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�ϵͳ���á���������רҵ���������޸ģ�
------------------------------------------------------------------------------
--��ϵͳ������
local PlayerLending = 0
local PlayerDeposit = 0
local pathCGBusiBank = "./lua/CGBusiBank.csv"

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
����.����.���н��=54
����.����.ԭ��=2000
����.����.�˺�=2002
------------------------------------------------------------------------------

Delegate.RegInit("BusiBankNpc_Init");
function BusiBankNpc_Init()
	local BusiBankNpc = NL.CreateNpc(nil, "BusiBankNpc_Myinit");
	Char.SetData( BusiBankNpc, ����.����.����, NpcImage);
	Char.SetData( BusiBankNpc, ����.����.ԭ��, NpcImage);
	Char.SetData( BusiBankNpc, ����.����.��ͼ, NpcMapPos[2]);
	Char.SetData( BusiBankNpc, ����.����.X, NpcMapPos[3]);
	Char.SetData( BusiBankNpc, ����.����.Y, NpcMapPos[4]);
	Char.SetData( BusiBankNpc, ����.����.����, NpcDir);
	Char.SetData( BusiBankNpc, ����.����.ԭ��, NpcName);
	NLG.UpChar(BusiBankNpc)

	tbl_LuaNpcIndex["BusiBankNpc"] = BusiBankNpc
	
	Char.SetTalkedEvent(nil, "BusiBankNpc_Talked", BusiBankNpc)
	Char.SetWindowTalkedEvent(nil, "BusiBankNpc_WindowTalked", BusiBankNpc)
	Char.SetLoopEvent(nil,"BusiBankNpc_Loop",BusiBankNpc,60000)
	
	return true;
end

function BusiBankNpc_Myinit(index)
	return true
end

function BusiBankNpc_Loop(_MeIndex)
		local ATime = os.time();
		local ATimeH = os.date("%H",ATime);
		local ATimeM = os.date("%M",ATime);
		local ATimeS = os.date("%S",ATime);
		local ATimeS1 = tonumber(ATimeS);
		local ATimeM1 = tonumber(ATimeM);
		local ATimeH1 = tonumber(ATimeH);
		if ((ATimeH ~= nil and (ATimeH1 == tonumber(ClearingTime) or ATimeH1 == ClearingTime)) and (ATimeM ~= nil and (ATimeM1 == 00 or ATimeM1 == "00"))) then	
			local sTotalD = 0
			local sTotalL = 0
			local TM_BusiBankTab = EasyFile(pathCGBusiBank,'r')
			for i = 2,table.getn(TM_BusiBankTab) do
				--��������Ϣ
				EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],3,math.floor(tonumber(TM_BusiBankTab[i][3])*(DepositRates+1)))
				if (tonumber(TM_BusiBankTab[i][4])>0) then 
					--���Ӵ�������
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],5,math.floor(tonumber(TM_BusiBankTab[i][5])+1)) 
				else
					--������������
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],5,0) 
				end

				if (tonumber(TM_BusiBankTab[i][5])>30) then
					--BadUser('a',TM_BusiBankTab[i][1],TM_BusiBankTab[i][2])
				elseif (tonumber(TM_BusiBankTab[i][5])>10) then
					--BadUser('a',TM_BusiBankTab[i][1],TM_BusiBankTab[i][2])
				elseif (tonumber(TM_BusiBankTab[i][5])>3) then
					--���������Ϣ
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],4,math.floor(tonumber(TM_BusiBankTab[i][4])*(LendingRates+1)))
				end
				local sTalk = "[��ҵ����][" .. TM_BusiBankTab[i][1] .. "]" .. TM_BusiBankTab[i][2] .. "����� " .. math.floor(tonumber(TM_BusiBankTab[i][3])) .. " G�������Ϣ " .. math.floor(tonumber(TM_BusiBankTab[i][3])*(DepositRates+1)) .. " G������ " .. math.floor(tonumber(TM_BusiBankTab[i][4])) .. " G��������Ϣ " .. math.floor(tonumber(TM_BusiBankTab[i][4])*(LendingRates+1)) .. " G��"
				Log(sTalk)
				sTotalD = sTotalD + math.floor(tonumber(TM_BusiBankTab[i][3]))
				sTotalL = sTotalL + math.floor(tonumber(TM_BusiBankTab[i][4]))
			end
			MSG("[��ҵ����]���н�����ϣ����д�������Ϣ���Ѽ���������˻��С���ֹ����ʱ�������й��пͻ� " .. table.getn(TM_BusiBankTab)-1 .. " �������д�� " .. sTotalD .. " G�����ų����� " .. sTotalL .." G��")
			Log("[��ҵ����]���н�����ϣ����д�������Ϣ���Ѽ���������˻��С���ֹ����ʱ�������й��пͻ� " .. table.getn(TM_BusiBankTab)-1 .. " �������д�� " .. sTotalD .. " G�����ų����� " .. sTotalL .." G��")
		end
	
	return true;
end

function BusiBankNpc_Talked( _MeIndex, _PlayerIndex)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 2) == false) then
		return ;
	end 

	local i;
	i = Char.GetData(_PlayerIndex, 7);
	if i >= 4 then 
		i = i - 4;
	else
		i = i + 4;		
	end
	Char.SetData(_MeIndex, 7,i);
	NLG.UpChar( _MeIndex);
	
	local GM_Talk = ""
	local Create_Talk = ""
	if (Char.GetData(_PlayerIndex,144)==1) then GM_Talk = "�����������������������鿴�嵥��" end
	if (CreateAccount==1) then Create_Talk = "�״ο�������ȡ" .. CreateNeed .. "G�ֽ�����" .. CreateNeed-CreateDeposit .. "GΪ�����ѣ�����" .. CreateDeposit .. "G��������˻���" end
	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 0, 1,
			"7\n�����������������������ҵ���С��"..
			"\n"..
			"\n��ϵͳ˵������ϵͳ֧�ִ�ȡ�����������ܣ�" .. 
			"ÿ��" .. ClearingTime .. "����㣬���" .. DepositRates .. "���ʣ�����" .. LendingRates .. "���ʡ�" ..
			"��Ϣ����Ϊ" .. FreeTime .. "�죬����" .. DeadTime .. "����δ���壬�����������" ..	
			"" .. Create_Talk ..
			"\n".. GM_Talk ..
			"\n��������������������������ϵͳ��"..
			"\n�������������������������˳�����");

	return ;
end


function BusiBankNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	local TM_BusiBankTab = EasyFile(pathCGBusiBank,'r')
	local TM_TabIndex = EasyTable(TM_BusiBankTab,'c',2,Char.GetData(_PlayerIndex,����.����.ԭ��))

	if (Char.GetData(_PlayerIndex,144)==1) then
		--NLG.TalkToCli(_PlayerIndex, "Start", 4, 0, -1)
		--NLG.TalkToCli(_PlayerIndex, EasyTable(EasyFile(pathCGBusiBank, 'r'), 'r', 1), 4 , 0 , -1)
	end

	if (TM_TabIndex==-1 and CreateAccount==1) then
		--�ֶ�����
		if (Char.GetData(_PlayerIndex,����.����.���)<CreateNeed) then
			NLG.TalkToCli(_PlayerIndex,"����ֽ���[" .. CreateNeed .. "]G���޷�������",0,0,-1)
			return false;
		else
			Char.SetData(_PlayerIndex,����.����.���,Char.GetData(_PlayerIndex,����.����.���)-CreateNeed)
			local TM_Data = {0,0,CreateDeposit,0,0}
			TM_Data[1] = Char.GetData(_PlayerIndex,����.����.�˺�)
			TM_Data[2] = Char.GetData(_PlayerIndex,����.����.ԭ��)
			EasyFile(pathCGBusiBank,'a',TM_Data)
			NLG.UpChar(_PlayerIndex);
			NLG.TalkToCli(_PlayerIndex,_MeIndex,"�����ɹ�������ȡ[" .. CreateNeed .. "]G�ֽ�����[" .. CreateNeed-CreateDeposit .. "]GΪ�����ѣ�����[" .. CreateDeposit .. "]G�Ѵ�������˻��С�" ,4,0)
			Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. ":�����ɹ���")
		end
	elseif (TM_TabIndex==-1) then
		--�Զ�����
			local TM_Data = {0,0,0,0,0}
			TM_Data[1] = Char.GetData(_PlayerIndex,����.����.�˺�)
			TM_Data[2] = Char.GetData(_PlayerIndex,����.����.ԭ��)
			EasyFile(pathCGBusiBank,'a',TM_Data)
			NLG.UpChar(_PlayerIndex);
			NLG.TalkToCli(_PlayerIndex,_MeIndex,"�����ɹ���",4,0)
			Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. ":�����ɹ���")
	end

	--if (Char.GetData(_PlayerIndex,144)==1) then	NLG.TalkToCli(_PlayerIndex, "Seqno[" ..  type(_Seqno) .. "]:" .. _Seqno .. "," .. "Select[" .. type(_Select) .. "]:" .. _Select .. "," .. "Data[" ..  type(_Data) .. "]:" .. _Data,4,0,-1) end
	
	if ((_Seqno==1 and _Data=='1') or (_Select == 32 and _Seqno>=99 and _Seqno<200)) then
		local TM_Tab = EasyFile(pathCGBusiBank,'r')
		local NumPage = 8
		local CurrPage = _Seqno-100+1
		if (_Seqno==1) then CurrPage = _Seqno end
		local MaxPage = math.ceil(table.getn(TM_Tab)/NumPage)
		local TM_Taba = EasyTable(TM_Tab,'Page',CurrPage,NumPage)
		local TalkMSG = ""
		local TalkButton = 50
		for i = 1,NumPage do
			if (TM_Taba[i]~=nil) then
				--local  t = TM_Taba[i][1] .. "," .. TM_Taba[i][2] .. "," .. TM_Taba[i][3] .. "," .. TM_Taba[i][4] .. "," .. TM_Taba[i][5]
				local  t = string.format("%9.9s",TM_Taba[i][1]) .. string.format("%12.12s",TM_Taba[i][2]) .. string.format("%11.10s",TM_Taba[i][3]) .. string.format("%11.10s",TM_Taba[i][4]) .. string.format("%3.2s",TM_Taba[i][5])
				TalkMSG = TalkMSG .. t
			end
		end
		if CurrPage == MaxPage then TalkButton=18 end
		if CurrPage == 1 then TalkButton=34 end
		if MaxPage == 1 then TalkButton=2 end
		NLG.ShowWindowTalked(_PlayerIndex ,_MeIndex, 2, TalkButton, CurrPage+100,"1\n�����������������嵥��  (��" .. CurrPage .. "ҳ����" .. MaxPage .. "ҳ)\n".. TalkMSG);
	elseif (_Select == 16 and _Seqno>=99 and _Seqno<200) then
		local TM_Tab = EasyFile(pathCGBusiBank,'r')
		local NumPage = 8
		local CurrPage = _Seqno-100-1
		local MaxPage = math.ceil(table.getn(TM_Tab)/NumPage)
		local TM_Taba = EasyTable(TM_Tab,'Page',CurrPage,NumPage)
		local TalkMSG = ""
		local TalkButton = 50
		for i = 1,NumPage do
			if (TM_Taba[i]~=nil) then
				--local  t = TM_Taba[i][1] .. "," .. TM_Taba[i][2] .. "," .. TM_Taba[i][3] .. "," .. TM_Taba[i][4] .. "," .. TM_Taba[i][5]
				local  t = string.format("%9.9s",TM_Taba[i][1]) .. string.format("%12.12s",TM_Taba[i][2]) .. string.format("%11.10s",TM_Taba[i][3]) .. string.format("%11.10s",TM_Taba[i][4]) .. string.format("%3.2s",TM_Taba[i][5])
				TalkMSG = TalkMSG .. t
			end
		end
		if CurrPage == MaxPage then TalkButton=18 end
		if CurrPage == 1 then TalkButton=34 end
		if MaxPage == 1 then TalkButton=2 end
		NLG.ShowWindowTalked(_PlayerIndex ,_MeIndex, 2, TalkButton, CurrPage+100,"1\n�����������������嵥��  (��" .. CurrPage .. "ҳ����" .. MaxPage .. "ҳ)\n".. TalkMSG);
	end
	
	PlayerDeposit = tonumber(TM_BusiBankTab[TM_TabIndex][3])
	PlayerLending = tonumber(TM_BusiBankTab[TM_TabIndex][4])
	local tGold = tonumber(Char.GetData(_PlayerIndex,����.����.���))
	local tBank = tonumber(Char.GetData(_PlayerIndex,����.����.���н��))
	local tDay = tonumber(TM_BusiBankTab[TM_TabIndex][5])

	if (_Seqno==1 and _Data=='2') then
		--������ϵͳ��
		NLG.ShowWindowTalked(_PlayerIndex,		_MeIndex, 2, 0, 2,
		"5\n�����������������������ҵ���С��"..
		"\n�����˻���Ϣ��" ..
		"\n�����������ֽ�[" .. tGold .. "]G,ħ�����д��[" .. tBank .. "]G��" ..
		"����ҵ�����Ѵ��[" .. PlayerDeposit .. "]G," ..
		"����ҵ�����Ѵ���[" .. PlayerLending .. "]G,��������[".. tDay .. "]�졣" ..
		"\n������������������������Ҫ��"..
		"\n������������������������ȡ��"..
		"\n������������������������Ҫ���"..
		"\n�����������������������������"..
		"\n�������������������������˳�����");
	else
		--�����˳�����

	end
	
	if (_Seqno==2 and _Data=='1') then
		--����Ҫ��
		local tMax = tGold
		if ((DepositMaxLimit-PlayerDeposit)<tMax) then tMax=DepositMaxLimit-PlayerDeposit end
		if (tMax<0) then tMax=0 end
		--NLG.TalkToCli(_PlayerIndex,DepositLimit .. "," .. tDay .. "," .. PlayerLending,0,0,-1)
		if (DepositLimit==1 and tDay>3 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 1, 999, "\n���������������������������Ϣ�� " ..
																				"\n" ..
																				"\n��ҵ����ͨ�棺" ..
																				"\n" ..
																				"\n����δ��������޷�ʹ�ô��ܣ�",
																				  _MeIndex);
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 1, 3, 11, "\n���������������������������Ϣ�� " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n��������Ҫ���Ľ�" ..
																				"\n(���ֵΪ" .. tMax .. ")");
		end
	elseif (_Seqno==2 and _Data=='2') then
		--����ȡ��
		local tMax = PlayerDeposit
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (DepositLimit==1 and tDay>3 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n����������������������ȡ����Ϣ�� " ..
																				"\n" ..
																				"\n��ҵ����ͨ�棺" ..
																				"\n" ..
																				"\n����δ��������޷�ʹ��ȡ��ܣ�");
		else
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 12, "\n����������������������ȡ����Ϣ�� " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n��������Ҫȡ��Ľ�" ..
																				"\n(���ֵΪ" .. tMax .. ")");
		end
	elseif (_Seqno==2 and _Data=='3') then
		--����Ҫ���
		local tMax = LendingMaxLimit - PlayerLending
		local ttMax = 0
		local tLv = Char.GetData(_PlayerIndex,����.����.�ȼ�)
		for i = 1,table.getn(LendingLv) do
			if (tLv>=LendingLv[i]) then tMax = LendingLvRates[i]*tLv-PlayerLending end
		end
		ttMax = tMax
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tLv<LendingLvLimit) then tMax = 0 end
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 13, "\n����������������������������Ϣ�� " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n��������Ҫ����Ľ�" ..
																				"\n(��Ĵ����ܶ�����Ϊ" .. ttMax .. "����ǰ�ɴ������ֵΪ" .. tMax .. ")");
	elseif (_Seqno==2 and _Data=='4') then
		--���������
		local tMax = PlayerLending
		if (PlayerLending>tGold) then tMax=tGold end
		if (tMax<0) then tMax=0 end
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 14, "\n����������������������������Ϣ�� " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n��������Ҫ�����Ľ�" ..
																				"\n(���ֵΪ" .. tMax .. ")");
	else
		--�����˳�����
		
	end
	
	--EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],3,tonumber(TM_BusiBankTab[i][3])*(DepositRates+1))
	--PlayerDeposit = tonumber(TM_BusiBankTab[TM_TabIndex][3])
	--PlayerLending = tonumber(TM_BusiBankTab[TM_TabIndex][4])
	--local tGold = tonumber(Char.GetData(_PlayerIndex,����.����.���))
	--local tBank = tonumber(Char.GetData(_PlayerIndex,����.����.���н��))
	--local tDay = tonumber(TM_BusiBankTab[TM_TabIndex][5])
	
	if (_Seqno==11 and _Select==1 and tonumber(_Data)>0) then
		--����Ҫ��
		local tMax = tGold
		if ((DepositMaxLimit-PlayerDeposit)<tMax) then tMax=DepositMaxLimit-PlayerDeposit end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (DepositLimit==1 and tDay>10 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n���������������������������Ϣ�� " ..
														"\n" ..
														"\n��ҵ����ͨ�棺" ..
														"\n" ..
														"\n����δ��������޷�ʹ�ô��ܣ�");
		else
			Char.SetData(_PlayerIndex,����.����.���,Char.GetData(_PlayerIndex,����.����.���)-tMax)
			EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],3,tonumber(TM_BusiBankTab[TM_TabIndex][3])+tMax)
			NLG.UpChar(_PlayerIndex);
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n���������������������������Ϣ�� " ..
														"\n" ..
														"\n��ҵ����ͨ�棺" ..
														"\n" ..
														"\n�������ѳɹ�����[" .. tMax .. "]G�������˻���");
			Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. "���ѳɹ�����[" .. tMax .. "]G�������˻���")
		end
	elseif (_Seqno==12 and _Select==1 and tonumber(_Data)>0) then
		--����ȡ��
		local tMax = PlayerDeposit
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (DepositLimit==1 and tDay>10 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n����������������������ȡ����Ϣ�� " ..
														"\n" ..
														"\n��ҵ����ͨ�棺" ..
														"\n" ..
														"\n����δ��������޷�ʹ��ȡ��ܣ�");
		else
			Char.SetData(_PlayerIndex,����.����.���,Char.GetData(_PlayerIndex,����.����.���)+tMax)
			EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],3,tonumber(TM_BusiBankTab[TM_TabIndex][3])-tMax)
			NLG.UpChar(_PlayerIndex);
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n����������������������ȡ����Ϣ�� " ..
														"\n" ..
														"\n��ҵ����ͨ�棺" ..
														"\n" ..
														"\n�������ѳɹ��Ӹ����˻�ȡ��[" .. tMax .. "]G�ֽ�");
			Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. "���ѳɹ��Ӹ����˻�ȡ��[" .. tMax .. "]G�ֽ�")
		end
	elseif (_Seqno==13 and _Select==1 and tonumber(_Data)>0) then
		--����Ҫ���
		local tMax = LendingMaxLimit - PlayerLending
		local tLv = Char.GetData(_PlayerIndex,����.����.�ȼ�)
		for i = 1,table.getn(LendingLv) do
			if (tLv>=LendingLv[i]) then tMax = LendingLvRates[i]*tLv-PlayerLending end
		end
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (tLv<LendingLvLimit) then tMax = 0 end
		Char.SetData(_PlayerIndex,����.����.���,Char.GetData(_PlayerIndex,����.����.���)+tMax)
		EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],4,tonumber(TM_BusiBankTab[TM_TabIndex][4])+tMax)
		NLG.UpChar(_PlayerIndex);
		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n����������������������������Ϣ�� " ..
													"\n" ..
													"\n��ҵ����ͨ�棺" ..
													"\n" ..
													"\n�������ѳɹ�����ҵ���н����[" .. tMax .. "]G�ֽ�");
		Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. "���ѳɹ�����ҵ���н����[" .. tMax .. "]G�ֽ�")
	elseif (_Seqno==14 and _Select==1 and tonumber(_Data)>0) then
		--���������
		local tMax = PlayerLending
		if (PlayerLending>tGold) then tMax=tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		Char.SetData(_PlayerIndex,����.����.���,Char.GetData(_PlayerIndex,����.����.���)-tMax)
		EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],4,tonumber(TM_BusiBankTab[TM_TabIndex][4])-tMax)
		NLG.UpChar(_PlayerIndex);
		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n����������������������������Ϣ�� " ..
													"\n" ..
													"\n��ҵ����ͨ�棺" ..
													"\n" ..
													"\n�������ѳɹ�����ҵ���н���[" .. tMax .. "]G���");
		Log("[��ҵ����][" .. Char.GetData(_PlayerIndex,����.����.�˺�) .. "]" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. "���ѳɹ�����ҵ���н���[" .. tMax .. "]G���")
	else
		--�����˳�����
	end

return ;
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, List, Page
function EasyTable(strTable, intMode, intSub, intValue, intEditSub, intEditValue)
	if (strTable==nil) then return -1 end
	if (string.lower(intMode)=='read' or string.lower(intMode)=='r' or intMode=='��ȡ') then
		local TM_buff = ''
		local TM_link = ''
		if (intSub==1) then TM_buff = TM_buff .. "{" end
		--[[
		for i=1,table.getn(strTable) do
			if (type(strTable[i])=='table') then
				TM_buff = TM_buff .. EasyTable(strTable[i],'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. strTable[i]
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		--]]
		for k,v in pairs(strTable) do
			if (type(v)=='table') then
				TM_buff = TM_buff .. EasyTable(v,'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. v
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		if (intSub==1) then 
			TM_buff = TM_buff .. "}"
		elseif (intValue=='Sub') then 
			TM_buff = TM_buff .. "\n"
		end
		return TM_buff
	elseif (string.lower(intMode)=='list' or string.lower(intMode)=='l' or intMode=='�б�') then
		--EasyTable(sTable, "List", "Table")
		local TM = ""
		local sTitle = intSub
		if (sTitle=="" or sTitle==nil) then sTitle="Table" end
		for Key,Value in pairs(strTable) do
			if intValue=="" or intValue=="." or intValue==nil then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "." .. Key, intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "." .. Key .. "\n"
				else
					TM =  TM .. sTitle .. "." .. Key .. "=" .. Value .. "\n"
				end
			elseif intValue=="[" or intValue=="]" or intValue=="[]" or intValue==1 then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "[" .. Key .. "]", intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "\n"
				else
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "=" .. Value .. "\n"
				end
			end
		end
		return TM
	elseif (string.lower(intMode)=='check' or string.lower(intMode)=='c' or intMode=='��ѯ') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return i;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='sort' or string.lower(intMode)=='s' or intMode=='����') then
		if (intValue==1) then
			table.sort(strTable,function (a, b) return (a[intSub] > b[intSub]) end);
		else
			table.sort(strTable,function (a, b) return (a[intSub] < b[intSub]) end);
		end
		return 1;
	elseif (string.lower(intMode)=='get' or string.lower(intMode)=='g' or intMode=='��ȡ') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return strTable[i][intEditSub];
			end
		end
		return -1;
	elseif (string.lower(intMode)=='edit' or string.lower(intMode)=='e' or intMode=='�޸�') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				strTable[i][intEditSub]=intEditValue;
				return 1;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='add' or string.lower(intMode)=='a' or intMode=='���') then
		--[[
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return -1;
			end
		end
		--]]
		if (type(intSub)=='table') then
			table.insert(strTable,intSub);
		else
			local TM_Table = {};
			for i = 1,tonumber(intSub) do
				table.insert(TM_Table,-1);
			end
			TM_Table[1]=intValue;
			table.insert(strTable,TM_Table);
		end
		return table.getn(strTable);
	elseif (string.lower(intMode)=='del' or string.lower(intMode)=='d' or intMode=='ɾ��') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return table.remove(strTable,i);
			end
		end
		return -1;
	elseif (string.lower(intMode)=='page' or string.lower(intMode)=='p' or intMode=='��ҳ') then
		--EasyTable(strTable, 'Page', [�ڼ�ҳ=1], [ÿҳ����=6])
		if (type(intSub)~='number' or intSub<=0) then intSub=1 end
		if (type(intValue)~='number' or intValue<=0) then intValue=6 end
		local TM_Table = {}
		local tStartPage = ((intSub-1)*intValue)+1
		local tEndPage = tStartPage + intValue - 1
		if (tEndPage>table.getn(strTable)) then tEndPage=table.getn(strTable) end
		for i = tStartPage,tEndPage do
			EasyTable(TM_Table,'a',strTable[i])
		end
		return TM_Table;
	end
	return;
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, Clear
function EasyFile(strFile, strMode, intSub, intValue, intEditSub, intEditValue)
	if (strFile=="" or strFile==nil) then return "File Error" end
	local tabFile={}
	local tmpFile=""
	if (string.lower(strMode)=='read' or string.lower(strMode)=='r' or strMode=='��ȡ') then
		local mfile = io.open(strFile,"r")
		for line in mfile:lines() do
			if (intSub=="" or intSub==nil) then
				EasyTable(tabFile,'Add',Split(line,","))
			elseif (intSub>0) then
				tabFile=Split(line,",")
				if (tabFile[intSub]==intValue) then break end
			elseif (string.lower(intSub)=="txt") then
				tmpFile = tmpFile .. line .. "\n"
			end
		end
		mfile:close()
		if (intSub=="" or intSub==nil or intSub>0) then
			return tabFile
		elseif (string.lower(intSub)=="txt") then
			return tmpFile
		end
	elseif (string.lower(strMode)=='sort' or string.lower(strMode)=='s' or strMode=='����') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'sort',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='edit' or string.lower(strMode)=='e' or strMode=='�޸�') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'edit',intSub,intValue,intEditSub,intEditValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='del' or string.lower(strMode)=='d' or strMode=='ɾ��') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'del',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='check' or string.lower(strMode)=='c' or strMode=='��ѯ') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'check',intSub,intValue)
	elseif (string.lower(strMode)=='get' or string.lower(strMode)=='g' or strMode=='��ȡ') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'get',intSub,intValue)
	elseif (string.lower(strMode)=='write' or string.lower(strMode)=='w' or strMode=='д��') then
		local mfile = io.open(strFile,"w")
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='add' or string.lower(strMode)=='a' or strMode=='׷��') then
		local mfile = io.open(strFile,"a")
		if (type(intSub)=='table') then intSub=EasyTable(intSub,'r',nil,'Sub') end
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='clear' or string.lower(strMode)=='cl' or strMode=='���') then
		local mfile = io.open(strFile,"w")
		mfile:write("")
		mfile:close()
		return "Success"
	end
end

function Log(strTxt,_Mode)
	local LogFile = "./lua/lua,log"
	local file = io.open(LogFile,"a")
	if _Mode==1 then
		file:write(strTxt,"\r\n")
	else
		file:write(os.date("%Y��%m��%d��%X��"),strTxt,"\r\n")
	end
	file:close()
end
function table.getn(x) 
local ret=0; 
for i in pairs(x) do 
ret=ret+1 
end 
return ret 
end