tbl_select_name = {"种族更改","反击增加","命中增加","闪躲增加","必杀增加","抗毒增加","抗睡增加","抗石增加","抗醉增加","抗乱增加","抗忘增加","地属性","水属性","火属性","风属性"};
tbl_select_maxvalue ={0,15,15,15,15,80,80,80,80,80,80,50,50,50,50};
tbl_select_keyname = {%对象_种族%,%对象_反击%,%对象_命中%,%对象_闪躲%,%对象_必杀%,%对象_抗毒%,%对象_抗睡%,%对象_抗石%,%对象_抗醉%,%对象_抗乱%,%对象_抗忘%,%对象_地属性%,%对象_水属性%,%对象_火属性%,%对象_风属性%};

tbl_skillsoltmaxsetting =
{
     ["哥布林"] = 10;
};


tbl_PetChage_select = {};
Delegate.RegInit("PetChage_Init");
Delegate.RegDelAllOutEvent("PetChage_Out");

function PetChageNpc_Init(index)
	print("形象修改员生成成功！");
	return 1;
end

function initPetChageNpc()
	tbl_PetChageNpc = {};
	if (PetChageNpc == nil) then
		PetChageNpc = NL.CreateNpc("lua/Module/PetChage.lua", "PetChageNpc_Init");
		Char.SetData(PetChageNpc,%对象_形象%,231088);
		Char.SetData(PetChageNpc,%对象_原形%,231088);
		Char.SetData(PetChageNpc,%对象_X%,48);
		Char.SetData(PetChageNpc,%对象_Y%,48);
		Char.SetData(PetChageNpc,%对象_地图%,777);
		Char.SetData(PetChageNpc,%对象_方向%,4);
		Char.SetData(PetChageNpc,%对象_原名%,"PetChageNpc");
		NLG.UpChar(PetChageNpc);
		--Char.SetTalkedEvent("lua/Module/PetChage.lua","PetChageNpcTalk_Event", PetChageNpc);
		Char.SetWindowTalkedEvent("lua/Module/PetChage.lua","PetChageNpcWinTalk_Event",PetChageNpc);
		tbl_PetChageNpc["PetChageNpc"] = tonumber(PetChageNpc);
	end
	
end


function PetChage_Init()
	initPetChageNpc();
	NL.RegItemString("lua/Module/PetChage.lua","PetChage_Event","LUA_useM01");
end

function PetChage_Out(player)
	tbl_PetChage_select[Playerkey(player)] = nil;
	
end

function PetChage_Event(charPointer,toPlayerPointer,slot)
	
    local _itemindex = Char.GetItemIndex(charPointer,slot);
	local _zc1 = Item.GetData(_itemindex,%道具_子参一%);
	tbl_PetChage_select[Playerkey(charPointer)] = slot;
	

	local s_name = tbl_select_name[_zc1];
        

	str_ChangeWindow = "4|\\n\\n 			 \\n	 			请问你要将【"..s_name.."】用在哪只宠物上？\\n\\n";
		for i=0,4 do
			local pet = Char.GetPet(charPointer,i);
			if(VaildChar(pet))then
				str_ChangeWindow = str_ChangeWindow .. " 			 			"..Char.GetData(pet,%对象_名字%).."\\n";

			else
				str_ChangeWindow = str_ChangeWindow .. " 			 			空\\n";
			end
		end
	NLG.ShowWindowTalked(charPointer,tonumber(tbl_PetChageNpc["PetChageNpc"]),%窗口_选择框%,%按钮_关闭%,10,str_ChangeWindow);
	
	return;
	
end


function PetChageNpcWinTalk_Event(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	
	if(tonumber(_select)==%按钮_关闭%)then
		return;
	end
	
	
	if (tonumber(_seqno)==10 and (_data ~= "")) then
               
		local selectitem = tonumber(_data) - 1;
		if (selectitem==nil or (selectitem~=nil and (selectitem > 4 or selectitem < 0))) then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您所选择的位置不正常!");
				return;
		end
		local pet_indexA = Char.GetPet(_PlayerIndex,selectitem);
		if (pet_indexA < 0) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n请确定您对应的宠物栏有宠物!");
			return;
		end
		
		if(tbl_PetChage_select[Playerkey(_PlayerIndex)]~=nil)then
			local s = tonumber(tbl_PetChage_select[Playerkey(_PlayerIndex)]);
			local _itemindex = Char.GetItemIndex(_PlayerIndex,s);
			local _zc1 = tonumber(Item.GetData(_itemindex,%道具_子参一%));
			local _zc2 = tonumber(Item.GetData(_itemindex,%道具_子参二%));
			

			if(_zc1 == 1)then
				Char.SetData(pet_indexA,tbl_select_keyname[_zc1],_zc2);
				Pet.UpPet(_PlayerIndex,pet_indexA);
			Item.Kill(_PlayerIndex, _itemindex, s);
				NLG.SystemMessage(_PlayerIndex,"[宠物修改]宠物的种族已经发生了改变。");
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;
			end

			if(_zc1 == 2)then
				local skillsolt = tbl_skillsoltmaxsetting[Char.GetData(pet_indexA,%对象_原名%)];
                                if (skillsolt == nil)then
                                   skillsolt = 10;
                                end
				if(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]) > skillsolt)then
                                	NLG.SystemMessage(_PlayerIndex,"[宠物修改]已经达到"..tbl_select_name[_zc1].."的最大值，无法再使用了。");
                                else
 					Char.SetData(pet_indexA,tbl_select_keyname[_zc1],tonumber(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]))+_zc2);
					Pet.UpPet(_PlayerIndex,pet_indexA);
			Item.Kill(_PlayerIndex, _itemindex, s);
					NLG.SystemMessage(_PlayerIndex,"[宠物修改]恭喜您，宠物的"..tbl_select_name[_zc1].."了 ".._zc2.."。");			
                                end
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;

			end

			if(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]) >= tbl_select_maxvalue[_zc1])then
                                NLG.SystemMessage(_PlayerIndex,"[宠物修改]已经达到"..tbl_select_name[_zc1].."的最大值，无法再使用了。");
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;
			end
			
			Char.SetData(pet_indexA,tbl_select_keyname[_zc1],tonumber(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]))+_zc2);
			Item.Kill(_PlayerIndex, _itemindex, s);
			NLG.SystemMessage(_PlayerIndex,"[宠物修改]恭喜您，宠物的"..tbl_select_name[_zc1].."了 ".._zc2.."。");		
			Pet.UpPet(_PlayerIndex,pet_indexA);	

			
			

			
		else
			NLG.SystemMessage(_PlayerIndex,"[宠物修改]未知错误，请重新使用！");
			
		end
		tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
		
		
		
	end
end