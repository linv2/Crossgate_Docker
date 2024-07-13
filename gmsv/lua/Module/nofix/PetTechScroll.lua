------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--宠物技能学习卷轴 For Gp
--
--对应Itemset设置，双击物品可以为目标宠物学习指定技能
--
--
--Itemset对应参数说明
--物品特性：LUA_usePetTech
--特殊类别：0-所有宠物，1-特定宠物清单A，2-特定宠物清单B，3-非野生，4-满级
--子参数一：TechID，不可为0
--子参数二：前置TechID，无前置技能写0
--
--in 2014.8.2
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
local NpcName = "宠物技能学习"		--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 999, 14, 16}			--Npc地图坐标
local NpcImage = 101022						--Npc图档101022
local NpcDir = 6							--Npc方向（0为左上，顺时针转）
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
PetTechNpc = 0;
--特殊宠物清单（特殊类别为1时有效）
local SPetListA = {911,912,913,914}

--特殊宠物清单（特殊类别为2时有效）
local SPetListB = {11,12,13,14}

--宠物最高等级设置（特殊类别为4时有效）
local PetMaxLevel = 150

--预留替换用的前置技能ID
local NorPreTechID = 15002

--系统缓存变量（勿动！！）
local SelectItemSlot = {}
local SelectPetSlot = {}
------------------------------------------------------------------------------

function PetTechNpc_Func(index)

	return 1;
end

Delegate.RegInit("PetTechNpc_Init");
function PetTechNpc_Init()
	PetTechNpc = NL.CreateNpc(nil, "PetTechNpc_Func");
	Char.SetData( PetTechNpc, %对象_形象%, NpcImage);
	Char.SetData( PetTechNpc, %对象_原形%, NpcImage);
	Char.SetData( PetTechNpc, %对象_地图%, NpcMapPos[2]);
	Char.SetData( PetTechNpc, %对象_X%, NpcMapPos[3]);
	Char.SetData( PetTechNpc, %对象_Y%, NpcMapPos[4]);
	Char.SetData( PetTechNpc, %对象_方向%, NpcDir);
	Char.SetData( PetTechNpc, %对象_原名%, NpcName);
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
			local tPetName = Char.GetData(tPetIndex, %对象_原名%)
			local tPetLv = Char.GetData(tPetIndex, %对象_等级%)
			tPetListMsg = tPetListMsg .. "　　" .. tPetName .. " Lv." .. tPetLv .. "\n"
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
	local tItemName = Item.GetData(tItemIndex,%道具_已鉴定%)
	local tTechType = Item.GetData(tItemIndex,%道具_特殊类型%)
	local tTechID = Item.GetData(tItemIndex, %道具_子参一%)
	local tPreTechID = Item.GetData(tItemIndex, %道具_子参二%)

	local tInfo = ""
	if tTechType==0 then tInfo = "学习条件：任意宠物" end
	if tTechType==1 then tInfo = "学习条件：特定宠物" end
	if tTechType==2 then tInfo = "学习条件：未知" end
	if tTechType==3 then tInfo = "学习条件：非野生" end
	if tTechType==4 then tInfo = "学习条件：满级" end
	if tPreTechID>0 then tInfo = tInfo .. "，已习得前置技能" end

	local TalkMsg = "4\n　　　　　　　　◆" .. NpcName .. "◆" ..
					"\n" ..
					"\n" .. tInfo ..
					"\n请选择要学习此技能的宠物：" ..
					"\n" .. tPetListMsg

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 10, TalkMsg);
	return 1;
end

function PetTechNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	--print("\n_MeIndex=" .. _MeIndex .. ", _PlayerIndex=" .. _PlayerIndex .. ", _Seqno=" .. _Seqno .. ", _Select=" .. _Select .. ", _Data=" .. _Data)
	
	--取消按钮
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
		local tPetName = Char.GetData(tPetIndex, %对象_原名%)
		local tPetID = Char.GetData(tPetIndex, 68)
		local tPetLv = Char.GetData(tPetIndex, %对象_等级%)
		
		local tPetGetLv =Char.GetData(tPetIndex,52);
		local tPetTechSlotMax = Char.GetData(tPetIndex, %宠物_技能栏%)
		--Get Item Data
		local tItemIndex = Char.GetItemIndex(_PlayerIndex, tItemSlot)
		if tItemIndex<0 then
			return 0
		end
		local tItemName = Item.GetData(tItemIndex,%道具_已鉴定%)
		local tItemID = Item.GetData(tItemIndex, %道具_ID%)
		local tTechType = Item.GetData(tItemIndex, %道具_特殊类型%)
		local tTechID = Item.GetData(tItemIndex, %道具_子参一%)
		local tPreTechID = Item.GetData(tItemIndex, %道具_子参二%)
		
		--Check Type
		if tTechType==1 then
			if PetTechNpc_CheckInTable(SPetListA, tPetID)~=true then
				NLG.SystemMessage(_PlayerIndex, "[错误] 你选择的宠物不满足以下学习条件：特定宠物")
				return 0
			end
		elseif tTechType==2 then
			if PetTechNpc_CheckInTable(SPetListB, tPetID)~=true then
				NLG.SystemMessage(_PlayerIndex, "[错误] 你选择的宠物不满足以下学习条件：特定宠物")
				return 0
			end
		elseif tTechType==3 then
			if tPetGetLv>1 then
				NLG.SystemMessage(_PlayerIndex, "[错误] 你选择的宠物不满足以下学习条件：非野生")
				return 0
			end
		elseif tTechType==4 then
			if tPetLv<PetMaxLevel then
				NLG.SystemMessage(_PlayerIndex, "[错误] 你选择的宠物不满足以下学习条件：满级")
				return 0
			end
		end
		--Check NorPreTechID

		--Check PreTech

		if tPreTechID>0 and tPreTechID~=NorPreTechID then
			if PetTechNpc_GetTechPos(tPetIndex, tPreTechID)<0 then
				NLG.SystemMessage(_PlayerIndex, "[错误] 你选择的宠物不满足以下学习条件：前置技能")
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
			NLG.SystemMessage(_PlayerIndex, "[错误] 未知原因错误,请检查宠物技能栏已满")
			return 0
		end
		--Del Item
		Char.DelItem(_PlayerIndex, tItemID, 1)
		--Up Pet
		Pet.UpPet(_PlayerIndex, tPetIndex)
		NLG.SystemMessage(_PlayerIndex, "你的宠物" .. tPetName .. "学会了新技能。")
		return 1
	end
end

--使用道具

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
	local tPetTechSlotMax = Char.GetData(_PetIndex, %宠物_技能栏%)
	for SkillPos = 0, tPetTechSlotMax do
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

