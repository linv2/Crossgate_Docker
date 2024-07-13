NL.RegItemString(nil,"PetAttribItemInit","LUA_usePetAttrib");

function Myinit( index)
        print("��������ϴ��NPC_index = " .. index);
        return 1;
end

--��������
function PetAttrib_callback(_MeIndex,_PlayerIndex,_seqno,_select,_data)
        
        local itemindex = Char.GetItemIndex( _PlayerIndex, _seqno);

        if(tonumber(_data) == -3) then
            return;
        end

        if(itemindex < 0) then
            NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ʹ�ò�������")
            return;
        end
        local itemid = Item.GetData(itemindex,%����_��%);

        local selectitem = tonumber(_data) - 1;
        print(tonumber(_data));
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
        if Char.GetData(_PetIndex,%����_��ȡʱ�ȼ�%) ~= 1 then
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
            NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���ĳ��� "..Char.GetData(_PetIndex,%����_����%).." �Ѿ�������!");
            return;
        end
		Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,4));
		Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,4));
		Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,4));
		Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,4));
		Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,4));

                
        if(Char.DelItem(_PlayerIndex,itemid,1) < 0) then
            NLG.SystemMessage(_PlayerIndex,"[ϵͳ]δ֪ԭ������Ʒɾ��ʧ��!");
            return;
        end

        Pet.ReBirth(_PlayerIndex, _PetIndex);
        Pet.UpPet(_PlayerIndex,_PetIndex);
        NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���ĳ��� "..Char.GetData(_PetIndex,%����_����%).." ϴ�����!");
        return;
end

function PetAttrib(_meIndex,_toIndex,_itemslot)
        if (NPC_PetAttrib == nil) then
            NPC_PetAttrib = NL.CreateNpc(nil, "Myinit");
            Char.SetData(NPC_PetAttrib,%����_����%,110308);
            Char.SetData(NPC_PetAttrib,%����_ԭ��%,110308);
            Char.SetData(NPC_PetAttrib,%����_��ͼ%,777);
            Char.SetData(NPC_PetAttrib,%����_X%,9);
            Char.SetData(NPC_PetAttrib,%����_Y%,14);
            Char.SetData(NPC_PetAttrib,%����_����%,4);
            Char.SetData(NPC_PetAttrib,%����_����%,"��������ϴ��");
            NLG.UpChar(NPC_PetAttrib);
            Char.SetWindowTalkedEvent(nil,"PetAttrib_callback",NPC_PetAttrib);
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

        NLG.ShowWindowTalked( _meIndex,NPC_PetAttrib,2,%��ť_�ر�%, _itemslot, str_ChangeWindow);
        return;
end

function PetAttribItemInit(_meIndex,_toIndex,_itemslot)
    local ItemIndex = Char.GetItemIndex(_meIndex,_itemslot);
    if(ItemIndex >= 0) then
        if(Item.GetData(ItemIndex,%����_USEFUNC%) == "LUA_usePetAttrib") then
            PetAttrib(_meIndex,_toIndex,_itemslot);
            return 1;
        end
    end
    return 0;
end