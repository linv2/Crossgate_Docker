------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���＼��ѧϰ���� For Gp
--
--��ӦItemset���ã�˫����Ʒ����ΪĿ�����ѧϰָ������
--
--
--Itemset��Ӧ����˵��
--��Ʒ���ԣ�LUA_usePetTech
--�������0-���г��1-�ض������嵥A��2-�ض������嵥B��3-��Ұ����4-����
--�Ӳ���һ��TechID������Ϊ0
--�Ӳ�������ǰ��TechID����ǰ�ü���д0
--
--in 2014.8.2
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
local NpcName = "���＼��ѧϰ"		--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 999, 14, 16}			--Npc��ͼ����
local NpcImage = 101022						--Npcͼ��101022
local NpcDir = 6							--Npc����0Ϊ���ϣ�˳ʱ��ת��
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�ϵͳ���á���������רҵ���������޸ģ�
------------------------------------------------------------------------------
PetTechNpc = 0;
--��������嵥���������Ϊ1ʱ��Ч��
local SPetListA = {911,912,913,914}

--��������嵥���������Ϊ2ʱ��Ч��
local SPetListB = {11,12,13,14}

--������ߵȼ����ã��������Ϊ4ʱ��Ч��
local PetMaxLevel = 150

--Ԥ���滻�õ�ǰ�ü���ID
local NorPreTechID = 15002

--ϵͳ����������𶯣�����
local SelectItemSlot = {}
local SelectPetSlot = {}
------------------------------------------------------------------------------

function PetTechNpc_Func(index)

	return 1;
end

Delegate.RegInit("PetTechNpc_Init");
function PetTechNpc_Init()
	PetTechNpc = NL.CreateNpc(nil, "PetTechNpc_Func");
	Char.SetData( PetTechNpc, %����_����%, NpcImage);
	Char.SetData( PetTechNpc, %����_ԭ��%, NpcImage);
	Char.SetData( PetTechNpc, %����_��ͼ%, NpcMapPos[2]);
	Char.SetData( PetTechNpc, %����_X%, NpcMapPos[3]);
	Char.SetData( PetTechNpc, %����_Y%, NpcMapPos[4]);
	Char.SetData( PetTechNpc, %����_����%, NpcDir);
	Char.SetData( PetTechNpc, %����_ԭ��%, NpcName);
	NLG.UpChar(PetTechNpc)
--	InstallNpcIndex(MateChageNpc);
	tbl_LuaNpcIndex = tbl_LuaNpcIndex or {}
	tbl_LuaNpcIndex["PetTechNpc"] = PetTechNpc
	
	Char.SetTalkedEvent(nil, "PetTechNpc_Talked", PetTechNpc)
	Char.SetWindowTalkedEvent(nil, "PetTechNpc_WindowTalked", PetTechNpc)
	
	--return true;
end

function PetTechNpc_Talked( _MeIndex, _PlayerIndex, _Mode)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 2)==false and _Mode~=1) then
		return ;
	end

	local tPetListMsg = ""
	for Pos = 0,4 do
		local tPetIndex = Char.GetPet(_PlayerIndex, Pos)
		if tPetIndex>=0 then
			local tPetName = Char.GetData(tPetIndex, %����_ԭ��%)
			local tPetLv = Char.GetData(tPetIndex, %����_�ȼ�%)
			tPetListMsg = tPetListMsg .. "����" .. tPetName .. " Lv." .. tPetLv .. "\n"
		else
			tPetListMsg = tPetListMsg .. "\n"
		end
	end
	
	--Get Item Data
	local tItemSlot = SelectItemSlot[_PlayerIndex]
	local tItemIndex = Char.GetItemIndex(_PlayerIndex, tItemSlot)
	if tItemIndex<0 then
		return 0
	end
	local tItemName = Item.GetData(tItemIndex,%����_�Ѽ���%)
	local tTechType = Item.GetData(tItemIndex,%����_��������%)
	local tTechID = Item.GetData(tItemIndex, %����_�Ӳ�һ%)
	local tPreTechID = Item.GetData(tItemIndex, %����_�Ӳζ�%)

	local tInfo = ""
	if tTechType==0 then tInfo = "ѧϰ�������������" end
	if tTechType==1 then tInfo = "ѧϰ�������ض�����" end
	if tTechType==2 then tInfo = "ѧϰ������δ֪" end
	if tTechType==3 then tInfo = "ѧϰ��������Ұ��" end
	if tTechType==4 then tInfo = "ѧϰ����������" end
	if tPreTechID>0 then tInfo = tInfo .. "����ϰ��ǰ�ü���" end

	local TalkMsg = "4\n������������������" .. NpcName .. "��" ..
					"\n" ..
					"\n" .. tInfo ..
					"\n��ѡ��Ҫѧϰ�˼��ܵĳ��" ..
					"\n" .. tPetListMsg

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 10, TalkMsg);
	return 1;
end

function PetTechNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	--print("\n_MeIndex=" .. _MeIndex .. ", _PlayerIndex=" .. _PlayerIndex .. ", _Seqno=" .. _Seqno .. ", _Select=" .. _Select .. ", _Data=" .. _Data)
	
	--ȡ����ť
	if _Select==2 or _Seqno==99999 then
		return
	end

	if _Seqno==10 then
		--Get Session
		SelectPetSlot[_PlayerIndex] = _Data-1
		local tItemSlot = SelectItemSlot[_PlayerIndex]
		local tPetSlot = SelectPetSlot[_PlayerIndex]
		--Get Pet Data
		local tPetIndex = Char.GetPet(_PlayerIndex, tPetSlot)
		if tPetIndex<0 then
			return 0
		end
		local tPetName = Char.GetData(tPetIndex, %����_ԭ��%)
		local tPetID = Char.GetData(tPetIndex, 68)
		local tPetLv = Char.GetData(tPetIndex, %����_�ȼ�%)
		
		local tPetGetLv =Char.GetData(tPetIndex,52);
		local tPetTechSlotMax = Char.GetData(tPetIndex, %����_������%)
		--Get Item Data
		local tItemIndex = Char.GetItemIndex(_PlayerIndex, tItemSlot)
		if tItemIndex<0 then
			return 0
		end
		local tItemName = Item.GetData(tItemIndex,%����_�Ѽ���%)
		local tItemID = Item.GetData(tItemIndex, %����_ID%)
		local tTechType = Item.GetData(tItemIndex, %����_��������%)
		local tTechID = Item.GetData(tItemIndex, %����_�Ӳ�һ%)
		local tPreTechID = Item.GetData(tItemIndex, %����_�Ӳζ�%)
		
		--Check Type
		if tTechType==1 then
			if PetTechNpc_CheckInTable(SPetListA, tPetID)~=true then
				NLG.SystemMessage(_PlayerIndex, "[����] ��ѡ��ĳ��ﲻ��������ѧϰ�������ض�����")
				return 0
			end
		elseif tTechType==2 then
			if PetTechNpc_CheckInTable(SPetListB, tPetID)~=true then
				NLG.SystemMessage(_PlayerIndex, "[����] ��ѡ��ĳ��ﲻ��������ѧϰ�������ض�����")
				return 0
			end
		elseif tTechType==3 then
			if tPetGetLv>1 then
				NLG.SystemMessage(_PlayerIndex, "[����] ��ѡ��ĳ��ﲻ��������ѧϰ��������Ұ��")
				return 0
			end
		elseif tTechType==4 then
			if tPetLv<PetMaxLevel then
				NLG.SystemMessage(_PlayerIndex, "[����] ��ѡ��ĳ��ﲻ��������ѧϰ����������")
				return 0
			end
		end
		--Check NorPreTechID

		--Check PreTech

		if tPreTechID>0 and tPreTechID~=NorPreTechID then
			if PetTechNpc_GetTechPos(tPetIndex, tPreTechID)<0 then
				NLG.SystemMessage(_PlayerIndex, "[����] ��ѡ��ĳ��ﲻ��������ѧϰ������ǰ�ü���")
				return 0
			end
		end
		--Check Slot

		--Del PreTech
		if tPreTechID>0 then
			local tPreTechPos = PetTechNpc_GetTechPos(tPetIndex, tPreTechID)
			Pet.DelSkill(tPetIndex, tPreTechPos)
		end
		--Add Tech
		local rt = Pet.AddSkill(tPetIndex, tTechID)
		if rt~=1 then
			NLG.SystemMessage(_PlayerIndex, "[����] δ֪ԭ�����,������＼��������")
			return 0
		end
		--Del Item
		Char.DelItem(_PlayerIndex, tItemID, 1)
		--Up Pet
		Pet.UpPet(_PlayerIndex, tPetIndex)
		NLG.SystemMessage(_PlayerIndex, "��ĳ���" .. tPetName .. "ѧ�����¼��ܡ�")
		return 1
	end
end

--ʹ�õ���

	NL.RegItemString(nil,"ADDitemMy","LUA_usePetTech");

--Delegate.RegItemUseEvent("ADDitemMy");
function ADDitemMy(CharIndex,PetIndex,itemslot)
	local ItemIndex = Char.GetItemIndex(CharIndex,itemslot);
	if(Item.GetData(ItemIndex,2007) == "LUA_usePetTech")then
		PetTechNpc_ItemUse(CharIndex,0,itemslot);
		return 1;
	end
	return 0;
end

function PetTechNpc_ItemUse(_PlayerIndex, _ToPlayerIndex, _Slot)
	SelectItemSlot[_PlayerIndex] = _Slot
	PetTechNpc_Talked( tbl_LuaNpcIndex["PetTechNpc"], _PlayerIndex, 1)
	return 1
end

function PetTechNpc_CheckInTable(_Tab, _Var)
	for k,v in pairs(_Tab) do
		if v==_Var then
			return true
		end
	end
	return false
end

function PetTechNpc_GetTechPos(_PetIndex, _TechID)
	local tPetTechSlotMax = Char.GetData(_PetIndex, %����_������%)
	for SkillPos = 0, tPetTechSlotMax do
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

