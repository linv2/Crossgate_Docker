--物品特效宠物技能学习，其他多样化功能待开发 2017.3.24 长果老
--迷之物？	宠物技能卡3	Pettech			LUA_useLuckyPet						70023	26420	30	26		0	1	0					1		1	1				0																																																			0	32	50					0	0	0			0			100		0			0
local restpetid ={2019}
local PItemChar =PItemChar or {}
local NpcName = "辅助"			--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 777, 21, 25}		--Npc地图坐标
local NpcImage =100500					--Npc图档104561
local NpcDir = 5						--Npc方向（0为左上，顺时针转）

---------------

function ChangePetItem(_PlayerIndex,_toPlayerIndex,_itemslot)
  if (ItemNpc == nil) then
    ItemNpc = NL.CreateNpc(nil,"ItemInitMyinit");
		Char.SetData(ItemNpc,%对象_形象%,NpcImage);
		Char.SetData(ItemNpc,%对象_原形%,NpcImage);
		Char.SetData(ItemNpc,%对象_X%,NpcMapPos[3]);
		Char.SetData(ItemNpc,%对象_Y%,NpcMapPos[4]);
		Char.SetData(ItemNpc,%对象_地图%,NpcMapPos[2]);
		Char.SetData(ItemNpc,%对象_方向%,NpcDir);
		Char.SetData(ItemNpc,%对象_原名%,NpcName);
		NLG.UpChar(ItemNpc);
		Char.SetWindowTalkedEvent(nil,"NPC_ItemNpcWTEvent",ItemNpc);
	end
	local _ItemIndex = Char.GetItemIndex(_PlayerIndex,_itemslot);	
  local ItemType=Item.GetData(_ItemIndex,2003)
	local Zc1 = Item.GetData(_ItemIndex,%道具_子参一%);
	local Zc2= Item.GetData(_ItemIndex,%道具_子参二%);
	local Msg=""
	if ItemType == "PetImge" then
		Msg =Msg.. "2|\\n   您要使用的是宠物形象卡\\n";
		PItemChar[_PlayerIndex]="ChangePetImge"
	elseif ItemType == "PetStock" then
		Msg = "2|\\n 您要使用的是宠物改种族卡\\n";
		PItemChar[_PlayerIndex]="ChangePetStock"
	elseif ItemType == "PetExp" then
		Msg = "2|\\n 您要使用的是宠物经验卡\\n";
		PItemChar[_PlayerIndex]="PetExp"
	elseif ItemType == "Pettech"  then
		PItemChar[_PlayerIndex]="Pettech"
		Msg = "3|\\n 您要使用的是宠物技能卡\\n\\n";
	elseif ItemType == "PetFixer" then
		Msg = "2|\\n 您要使用的是宠物随机修正卡\\n";
		PItemChar[_PlayerIndex]="PetFixer"
	elseif ItemType == "PetFixer2" then
		Msg = "2|\\n 您要使用的是宠物随机抗性修正卡\\n";
		PItemChar[_PlayerIndex]="PetFixer2"
	elseif ItemType == "PetRest" then
		Msg = "2|\\n 您要使用的是宠物洗档卷\\n";
		PItemChar[_PlayerIndex]="PetRest"
	elseif ItemType == "PetRestData" then
		Msg = "2|\\n 您要使用的是宠物洗点卷\\n";
		PItemChar[_PlayerIndex]="PetRestData"
	elseif ItemType == "PetAttrib" then
		Msg = "2|\\n 您要使用的是宠物随机属性卡\\n";
		PItemChar[_PlayerIndex]="PetAttrib"
	elseif ItemType == "PetSkillSolt" then
		Msg = "2|\\n 您要使用的是宠物技能栏拓展卡\\n";
		PItemChar[_PlayerIndex]="PetSkillSolt"
	end

		NLG.ShowWindowTalked(_PlayerIndex,ItemNpc,%窗口_选择框%,%按钮_关闭%,_ItemIndex,ChangePetPosMsg(_PlayerIndex,Msg));
	return;
end


function NPC_ItemNpcWTEvent(_MeIndex,_PlayerIndex,_seqno,_Select,_Data)
	 if _Select == 2 or _Select ==8 then
		 PItemChar[_PlayerIndex] =nil
		 return;
	 end
	  local _ItemIndex=_seqno;
	local ItemType=Item.GetData(_ItemIndex,2003)
	local Zc1=  tonumber(Item.GetData(_ItemIndex,46))
	local Zc2 = tonumber( Item.GetData(_ItemIndex,47))
	local ItemID = Item.GetData( _ItemIndex,0);
	if PItemChar[_PlayerIndex] == nil then
		NLG.SystemMessage(_PlayerIndex,"道具使用参数错误..无记录")
		return;
	end
	--以下为宠物道具
	local _PetPos = tonumber(_Data-1);
	if(_PetPos == nil or _PetPos > 4 or _PetPos < 0) then
		NLG.SystemMessage(_PlayerIndex,"您所选择的位置不正常!");
		PItemChar[_PlayerIndex] =nil
		return;
	end
	local _PetIndex = Char.GetPet(_PlayerIndex,_PetPos);
	if _PetIndex<0 then
		NLG.SystemMessage(_PlayerIndex,"请确定您对应的宠物栏有宠物!");
		PItemChar[_PlayerIndex] =nil
		return;
	end	
	
	local PetName=Char.GetData(_PetIndex,2000)
	if PItemChar[_PlayerIndex]=="PetRest" then	
			 PItemChar[_PlayerIndex] =nil
		local PetD1=RestPet(_PlayerIndex,_PetPos)
		if PetD1 ~= 1 then
				if PetD1 ~= 0 then
		NLG.SystemMessage(_PlayerIndex,"[系统]该宠物不支持洗档！")					
			return;
		end
			return;
		end
		NLG.SystemMessage(_PlayerIndex,"[系统]你的宠物已脱胎换骨重生！")	
		
		end
	if PItemChar[_PlayerIndex]=="PetRestData" then
			 PItemChar[_PlayerIndex] =nil
		local PetD=RestPetData(_PlayerIndex,_PetPos)
		if PetD == 0 then
			return 0
		end
		NLG.SystemMessage(_PlayerIndex,"[系统]你的宠物已可以重新加点!")
	end
		
	
	--技能增加
	if PItemChar[_PlayerIndex] =="Pettech" then	
	PItemChar[_PlayerIndex] =nil
		local TechId = Zc1
		local Level = Zc2
		local smdbz = PetTechNpc_GetSmdbzPos(_PetIndex, 15002)
		local jnwz =PetTechNpc_GetTechPos(_PetIndex, TechId ) + 1;
		--NLG.SystemMessage(_PlayerIndex,"什么都不做的位置在"..smdbz);
		if Char.GetData(_PetIndex,%对象_等级%)< Level then
			NLG.SystemMessage(_PlayerIndex,"[系统]对象等级不足"..Level.."级,无法学习此技能");
			return;
		--elseif Pet.GetSkill(_PetIndex, PetTechNpc_GetTechPos(_PetIndex, TechId ))>0 then
		elseif jnwz > 0 then
			NLG.SystemMessage(_PlayerIndex,"[系统]该宠物的第"..jnwz.."个技能栏已经有此技能了，请勿浪费。");
			--NLG.SystemMessage(_PlayerIndex,"4已有技能位置"..jnwz.."等级限制"..Level.."什么都不做返回值"..smdbz);
			return;			
		else
			local MaxtechPos=Char.GetData(_PetIndex,51)-1
			local TechPos=-1
			for i = 0,MaxtechPos do
				if Pet.GetSkill(_PetIndex,i)==-1 then
					TechPos=i
					break
				end
			end
			if TechPos==-1 then
				if smdbz ==-1 then
				NLG.SystemMessage(_PlayerIndex,"[系统]技能栏已满，请去法兰城的冒险者旅馆（31,20）学习【什么都不做技能】再使用！");
				--NLG.SystemMessage(_PlayerIndex,"1技能id"..TechId.."等级限制"..Level.."什么都不做返回值"..smdbz);
				return;
				else
				Pet.DelSkill(_PetIndex, smdbz);--技能栏满了，删除什么都不做技能
				Pet.AddSkill(_PetIndex,Zc1);--增加新学习的技能
				NLG.SystemMessage(_PlayerIndex,"[系统]"..Char.GetData(_PetIndex,%对象_原名%).."技能学习成功");
				--NLG.SystemMessage(_PlayerIndex,"2技能id"..TechId.."等级限制"..Level.."什么都不做返回值"..smdbz);
				Pet.UpPet(_PlayerIndex,_PetIndex);
				PItemChar[_PlayerIndex] =nil
				end
			else
				Pet.AddSkill(_PetIndex,Zc1);--技能未满学习技能
				NLG.SystemMessage(_PlayerIndex,"[系统]"..Char.GetData(_PetIndex,%对象_原名%).."技能学习成功");
				--NLG.SystemMessage(_PlayerIndex,"3技能id"..TechId.."等级限制"..Level.."什么都不做返回值"..smdbz);
				Pet.UpPet(_PlayerIndex,_PetIndex);
				PItemChar[_PlayerIndex] =nil
			end
	  end
	 end
	--删道具
	Char.DelItem(_PlayerIndex,ItemID,1);
	NLG.UpChar(_PlayerIndex);
	PItemChar[_PlayerIndex] =nil
	return;
end


function ItemInitMyinit( index)
        print("物品NPC_index = " .. index);
        return 1;
end

	NL.RegItemString(nil,"ItemInit","LUA_useLuckyPet");


function ItemInit(_PlayerIndex,_toPlayerIndex,_itemslot)
	PItemChar[_PlayerIndex] = nil
	local _ItemIndex = Char.GetItemIndex(_PlayerIndex,_itemslot);	
	if Item.GetData(_ItemIndex,2007) == "LUA_useLuckyPet" then
		ChangePetItem(_PlayerIndex,_toPlayerIndex,_itemslot)
		return 1;
	end
	return 0;
end

function ChangeItemMsg(_PlayerIndex,Msg) --装备栏弹窗接口--返回Msg
	Msg =Msg.. "请选择要操作的目标道具 "
	for i = 0,7 do
		local _ItemIndex = Char.GetItemIndex(_PlayerIndex,i);

		local ItemName = Item.GetData(_ItemIndex,%道具_名字%)
		if _ItemIndex>=0 then
			Msg = Msg .."\\n"..ItemName..
				" /LV："..Item.GetData(_ItemIndex,%道具_等级%)
		else
			Msg = Msg ..
				"\\n无";
		end
	end
	return Msg
end	
function ChangePetPosMsg(_PlayerIndex,Msg) --宠物栏弹窗接口--返回Msg
	Msg =Msg.. "请选择操作的宠物 "
	for i = 0,4 do
		local _PetIndex = Char.GetPet(_PlayerIndex,i);
		local PetName = Char.GetData(_PetIndex,%对象_名字%)
		if _PetIndex>=0 then
			Msg = Msg .."\\n"..PetName..
				" /LV："..Char.GetData(_PetIndex,%对象_等级%).."/ HP："..
				Char.GetData(_PetIndex,%对象_血%).."/"..
				Char.GetData(_PetIndex,%对象_最大血%);
		else
			Msg = Msg ..
				"\\n无";
		end
	end
	return Msg
end
function PetTechNpc_GetTechPos(_PetIndex, _TechID)
	local tPetTechSlotMax = Char.GetData(_PetIndex, %宠物_技能栏%) --得到宠物技能栏的数量
	for SkillPos = 0, tPetTechSlotMax do  ---挨个去找
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

function PetTechNpc_GetSmdbzPos(_PetIndex, _TechID) --得到什么都不做技能的位置
	local tPetTechSlotMax = Char.GetData(_PetIndex, %宠物_技能栏%) --得到宠物技能栏的数量
	for SkillPos = 0, tPetTechSlotMax do  ---挨个去找
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

function RestPetData(_PlayerIndex,PetPos) --宠物洗点重新加点
	local _PetIndex=Char.GetPet(_PlayerIndex,PetPos)
	if _PetIndex == -1 then
		return 0
	end
	if Char.GetData(_PetIndex,%对象_等级%) == 1 then
		NLG.SystemMessage(_PlayerIndex,"[系统] 一级宠物不需要洗点。")
		return 0
	end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[系统] 野生宠物无法洗点。")
		return 0
	end
	local FixConst = {0,0,0,0,0}
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	i= math.random(1,5);
	FixConst[i]= FixConst[i]+1
	Char.SetData(_PetIndex,%对象_体力%,(Pet.GetArtRank(_PetIndex,%宠档_体成%)+FixConst[1])*20);
	Char.SetData(_PetIndex,%对象_力量%,(Pet.GetArtRank(_PetIndex,%宠档_力成%)+FixConst[2])*20);
	Char.SetData(_PetIndex,%对象_强度%,(Pet.GetArtRank(_PetIndex,%宠档_强成%)+FixConst[3])*20);
	Char.SetData(_PetIndex,%对象_速度%,(Pet.GetArtRank(_PetIndex,%宠档_敏成%)+FixConst[4])*20);
	Char.SetData(_PetIndex,%对象_魔法%,(Pet.GetArtRank(_PetIndex,%宠档_魔成%)+FixConst[5])*20);
	Char.SetData(_PetIndex,%对象_升级点%,0);
	Char.SetData(_PetIndex,%对象_等级%,1);	
	Pet.UpPet(_PlayerIndex,_PetIndex);
	return 1
end

function RestPet(_PlayerIndex,PetPos) --宠物洗档
	local _PetIndex=Char.GetPet(_PlayerIndex,PetPos)
	local PetID = Char.GetData(_PetIndex, 68)
--	for i=1,#restpetid do
			for k,v in ipairs(restpetid) do
	if PetID ~=restpetid[k] then
--	if PetID ~=restpetid[i] then
--		NLG.SystemMessage(_PlayerIndex,"[系统] 该宠物无法洗档。")
	else	
	if _PetIndex == -1 then
		return 0
	end
	if Char.GetData(_PetIndex,%对象_等级%) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[系统] 非一级宠物无法洗档。")
		return 0
	end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[系统] 野生宠物无法洗档。")
		return 0
	end
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,4));
		  		Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,4));
        Pet.ReBirth(_PlayerIndex, _PetIndex);
	Pet.UpPet(_PlayerIndex,_PetIndex);	

return 1
end
end
end




