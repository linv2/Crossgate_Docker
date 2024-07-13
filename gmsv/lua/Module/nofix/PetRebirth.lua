
NL.RegItemString(nil,"PetAttribItemInit1","LUA_usePet1k4r");

function Myinit1( index)
        print("��������ϴ��NPC1_index = " .. index);
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
                Char.SetData(NPC_PetAttrib1,%����_����%,110308);
                Char.SetData(NPC_PetAttrib1,%����_ԭ��%,110308);
                Char.SetData(NPC_PetAttrib1,%����_��ͼ%,777);
                Char.SetData(NPC_PetAttrib1,%����_X%,19);
                Char.SetData(NPC_PetAttrib1,%����_Y%,14);
                Char.SetData(NPC_PetAttrib1,%����_����%,4);
                Char.SetData(NPC_PetAttrib1,%����_����%,"��������ϴ��1");
                NLG.UpChar(NPC_PetAttrib1);
                Char.SetWindowTalkedEvent(nil,"PetAttrib_callback1",NPC_PetAttrib1);
        end
        
        local str_ChangeWindow = "3|\\n\\n           ��ѡ����Ҫϴ���ĳ�������  \\n\\n";
        for i=0,4 do
                local pet = Char.GetPet(_meIndex,i);
                if(VaildChar(pet)==false)then
                        str_ChangeWindow = str_ChangeWindow .. "��\\n";
                else
                        str_ChangeWindow = str_ChangeWindow .. ""..Char.GetData(pet,%����_����%).."\\n";
                end
        end

        NLG.ShowWindowTalked( _meIndex,NPC_PetAttrib1,2,%��ť_�ر�%, _itemslot, str_ChangeWindow);
        return;
end
function PetAttrib_callback1(_MeIndex,_PlayerIndex,_seqno,_select,_data)
        
        local itemindex = Char.GetItemIndex( _PlayerIndex, _seqno);

        if(itemindex < 0) then
                NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ʹ�ò�������")
                return;
        end
        local itemid = Item.GetData(itemindex,%����_��%);

        local selectitem = tonumber(_data) - 1;
        if(selectitem == nil or selectitem > 4 or selectitem < 0) then
                NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ѡ���λ�ò�����!");
                return;
        end

        local _PetIndex = Char.GetPet(_PlayerIndex,selectitem);
        if (VaildChar(_PetIndex) == false) then
                NLG.SystemMessage(_PlayerIndex,"[ϵͳ]��ȷ������Ӧ�ĳ������г���!");
                return;
        end

       if(Char.GetData(_PetIndex,%����_�ȼ�%) ~= 1) then
              NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�޷��Է�1���������ϴ��!");
              return;
       end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] Ұ�������޷�ϴ����")
		return;
	end
        local arr_rank1 = Pet.GetArtRank(_PetIndex,%�赵_���%);
        local arr_rank11 = Pet.FullArtRank(_PetIndex,%�赵_���%);
        local arr_rank2 = Pet.GetArtRank(_PetIndex,%�赵_����%);
        local arr_rank21 = Pet.FullArtRank(_PetIndex,%�赵_����%);
        local arr_rank3 = Pet.GetArtRank(_PetIndex,%�赵_ǿ��%);
        local arr_rank31 = Pet.FullArtRank(_PetIndex,%�赵_ǿ��%);
        local arr_rank4 = Pet.GetArtRank(_PetIndex,%�赵_����%);
        local arr_rank41 = Pet.FullArtRank(_PetIndex,%�赵_����%);
        local arr_rank5 = Pet.GetArtRank(_PetIndex,%�赵_ħ��%);
        local arr_rank51 = Pet.FullArtRank(_PetIndex,%�赵_ħ��%);
        local a1 = math.abs(arr_rank1 - arr_rank11);
        local a2 = math.abs(arr_rank2 - arr_rank21);
        local a3 = math.abs(arr_rank3 - arr_rank31);
        local a4 = math.abs(arr_rank4 - arr_rank41);
        local a5 = math.abs(arr_rank5 - arr_rank51);
        local a6 = a1 + a2+ a3+ a4+ a5;

        if a6 == 0 then
                NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���ĳ��� "..Char.GetData(_PetIndex,%����_����%).."�Ѿ�������!");
                return;
        end
	   local petkeep = Item.GetData(itemindex,%����_�Ӳ�һ%);
	   local petrand = Item.GetData(itemindex,%����_�Ӳζ�%);
	   if petkeep==nil then
                return;	   
     elseif petkeep==1 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.GetArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,3)); 
		 elseif petkeep==2 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,3)); 	
		 elseif petkeep==3 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.GetArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,3)); 	
		 elseif petkeep==4 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,3));
		 elseif petkeep==5 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,3));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.GetArtRank(_PetIndex,%�赵_ħ��%)); 
		end	
	   if petrand==nil then
                return;	   
     elseif petrand==1 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.GetArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.GetArtRank(_PetIndex,%�赵_ħ��%)); 
		 elseif petrand==2 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.GetArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.GetArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.GetArtRank(_PetIndex,%�赵_ħ��%)); 
		 elseif petrand==3 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.GetArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.GetArtRank(_PetIndex,%�赵_ħ��%)); 
		 elseif petrand==4 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.GetArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.GetArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,1));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.GetArtRank(_PetIndex,%�赵_ħ��%)); 
		 elseif petrand==5 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.GetArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.GetArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.GetArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,1));
		 elseif petrand==6 then
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%));
					Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%));
		end									 												 	              
        if(Char.DelItem(_PlayerIndex,itemid,1) < 0) then
                NLG.SystemMessage(_PlayerIndex,"[ϵͳ]δ֪ԭ������Ʒɾ��ʧ��!");
                return;
        end

        Pet.ReBirth(_PlayerIndex, _PetIndex);
        Pet.UpPet(_PlayerIndex,_PetIndex);
        NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���ĳ��� "..Char.GetData(_PetIndex,%����_����%).."ϴ�����!");
        return;
end
