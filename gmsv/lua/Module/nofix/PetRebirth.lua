
NL.RegItemString(nil,"PetAttribItemInit1","LUA_usePet1k4r");

function Myinit1( index)
        print("宠物属性洗档NPC1_index = " .. index);
        return 1;
end


function PetAttribItemInit1(_meIndex,_toIndex,_itemslot)
        local ItemIndex = Char.GetItemIndex(_meIndex,_itemslot);
        if(ItemIndex >= 0) then
                if(Item.GetData(ItemIndex,2007) == "LUA_usePet1k4r") then
                        PetAttrib1(_meIndex,_toIndex,_itemslot);
                        return 1;
                end
        end
        return 0;
end

function PetAttrib1(_meIndex,_toIndex,_itemslot)
        if (NPC_PetAttrib1 == nil) then
                NPC_PetAttrib1 = NL.CreateNpc(nil, "Myinit1");
                Char.SetData(NPC_PetAttrib1,%对象_形象%,110308);
                Char.SetData(NPC_PetAttrib1,%对象_原形%,110308);
                Char.SetData(NPC_PetAttrib1,%对象_地图%,777);
                Char.SetData(NPC_PetAttrib1,%对象_X%,19);
                Char.SetData(NPC_PetAttrib1,%对象_Y%,14);
                Char.SetData(NPC_PetAttrib1,%对象_方向%,4);
                Char.SetData(NPC_PetAttrib1,%对象_名字%,"宠物属性洗档1");
                NLG.UpChar(NPC_PetAttrib1);
                Char.SetWindowTalkedEvent(nil,"PetAttrib_callback1",NPC_PetAttrib1);
        end
        
        local str_ChangeWindow = "3|\\n\\n           请选择您要洗档的宠物名称  \\n\\n";
        for i=0,4 do
                local pet = Char.GetPet(_meIndex,i);
                if(VaildChar(pet)==false)then
                        str_ChangeWindow = str_ChangeWindow .. "空\\n";
                else
                        str_ChangeWindow = str_ChangeWindow .. ""..Char.GetData(pet,%对象_名字%).."\\n";
                end
        end

        NLG.ShowWindowTalked( _meIndex,NPC_PetAttrib1,2,%按钮_关闭%, _itemslot, str_ChangeWindow);
        return;
end
function PetAttrib_callback1(_MeIndex,_PlayerIndex,_seqno,_select,_data)
        
        local itemindex = Char.GetItemIndex( _PlayerIndex, _seqno);

        if(itemindex < 0) then
                NLG.SystemMessage(_PlayerIndex,"[系统]道具使用参数错误")
                return;
        end
        local itemid = Item.GetData(itemindex,%道具_序%);

        local selectitem = tonumber(_data) - 1;
        if(selectitem == nil or selectitem > 4 or selectitem < 0) then
                NLG.SystemMessage(_PlayerIndex,"[系统]您所选择的位置不正常!");
                return;
        end

        local _PetIndex = Char.GetPet(_PlayerIndex,selectitem);
        if (VaildChar(_PetIndex) == false) then
                NLG.SystemMessage(_PlayerIndex,"[系统]请确定您对应的宠物栏有宠物!");
                return;
        end

       if(Char.GetData(_PetIndex,%对象_等级%) ~= 1) then
              NLG.SystemMessage(_PlayerIndex,"[系统]无法对非1级宠物进行洗档!");
              return;
       end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[系统] 野生宠物无法洗档。")
		return;
	end
        local arr_rank1 = Pet.GetArtRank(_PetIndex,%宠档_体成%);
        local arr_rank11 = Pet.FullArtRank(_PetIndex,%宠档_体成%);
        local arr_rank2 = Pet.GetArtRank(_PetIndex,%宠档_力成%);
        local arr_rank21 = Pet.FullArtRank(_PetIndex,%宠档_力成%);
        local arr_rank3 = Pet.GetArtRank(_PetIndex,%宠档_强成%);
        local arr_rank31 = Pet.FullArtRank(_PetIndex,%宠档_强成%);
        local arr_rank4 = Pet.GetArtRank(_PetIndex,%宠档_敏成%);
        local arr_rank41 = Pet.FullArtRank(_PetIndex,%宠档_敏成%);
        local arr_rank5 = Pet.GetArtRank(_PetIndex,%宠档_魔成%);
        local arr_rank51 = Pet.FullArtRank(_PetIndex,%宠档_魔成%);
        local a1 = math.abs(arr_rank1 - arr_rank11);
        local a2 = math.abs(arr_rank2 - arr_rank21);
        local a3 = math.abs(arr_rank3 - arr_rank31);
        local a4 = math.abs(arr_rank4 - arr_rank41);
        local a5 = math.abs(arr_rank5 - arr_rank51);
        local a6 = a1 + a2+ a3+ a4+ a5;

        if a6 == 0 then
                NLG.SystemMessage(_PlayerIndex,"[系统]您的宠物 "..Char.GetData(_PetIndex,%对象_名字%).."已经是满档!");
                return;
        end
	   local petkeep = Item.GetData(itemindex,%道具_子参一%);
	   local petrand = Item.GetData(itemindex,%道具_子参二%);
	   if petkeep==nil then
                return;	   
     elseif petkeep==1 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.GetArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,3)); 
		 elseif petkeep==2 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.GetArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,3)); 	
		 elseif petkeep==3 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.GetArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,3)); 	
		 elseif petkeep==4 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.GetArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,3));
		 elseif petkeep==5 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.GetArtRank(_PetIndex,%宠档_魔成%)); 
		end	
	   if petrand==nil then
                return;	   
     elseif petrand==1 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.GetArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.GetArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.GetArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.GetArtRank(_PetIndex,%宠档_魔成%)); 
		 elseif petrand==2 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.GetArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.GetArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.GetArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.GetArtRank(_PetIndex,%宠档_魔成%)); 
		 elseif petrand==3 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.GetArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.GetArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.GetArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.GetArtRank(_PetIndex,%宠档_魔成%)); 
		 elseif petrand==4 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.GetArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.GetArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.GetArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.GetArtRank(_PetIndex,%宠档_魔成%)); 
		 elseif petrand==5 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.GetArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.GetArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.GetArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.GetArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%) - math.random(0,1));
		 elseif petrand==6 then
					Pet.SetArtRank(_PetIndex,%宠档_体成%,Pet.FullArtRank(_PetIndex,%宠档_体成%));
					Pet.SetArtRank(_PetIndex,%宠档_力成%,Pet.FullArtRank(_PetIndex,%宠档_力成%));
					Pet.SetArtRank(_PetIndex,%宠档_强成%,Pet.FullArtRank(_PetIndex,%宠档_强成%));
					Pet.SetArtRank(_PetIndex,%宠档_敏成%,Pet.FullArtRank(_PetIndex,%宠档_敏成%));
					Pet.SetArtRank(_PetIndex,%宠档_魔成%,Pet.FullArtRank(_PetIndex,%宠档_魔成%));
		end									 												 	              
        if(Char.DelItem(_PlayerIndex,itemid,1) < 0) then
                NLG.SystemMessage(_PlayerIndex,"[系统]未知原因导致物品删除失败!");
                return;
        end

        Pet.ReBirth(_PlayerIndex, _PetIndex);
        Pet.UpPet(_PlayerIndex,_PetIndex);
        NLG.SystemMessage(_PlayerIndex,"[系统]您的宠物 "..Char.GetData(_PetIndex,%对象_名字%).."洗档完毕!");
        return;
end
