tbl_select_name = {"�������","��������","��������","��������","��ɱ����","��������","��˯����","��ʯ����","��������","��������","��������","������","ˮ����","������","������"};
tbl_select_maxvalue ={0,15,15,15,15,80,80,80,80,80,80,50,50,50,50};
tbl_select_keyname = {%����_����%,%����_����%,%����_����%,%����_����%,%����_��ɱ%,%����_����%,%����_��˯%,%����_��ʯ%,%����_����%,%����_����%,%����_����%,%����_������%,%����_ˮ����%,%����_������%,%����_������%};

tbl_skillsoltmaxsetting =
{
     ["�粼��"] = 10;
};


tbl_PetChage_select = {};
Delegate.RegInit("PetChage_Init");
Delegate.RegDelAllOutEvent("PetChage_Out");

function PetChageNpc_Init(index)
	print("�����޸�Ա���ɳɹ���");
	return 1;
end

function initPetChageNpc()
	tbl_PetChageNpc = {};
	if (PetChageNpc == nil) then
		PetChageNpc = NL.CreateNpc("lua/Module/PetChage.lua", "PetChageNpc_Init");
		Char.SetData(PetChageNpc,%����_����%,231088);
		Char.SetData(PetChageNpc,%����_ԭ��%,231088);
		Char.SetData(PetChageNpc,%����_X%,48);
		Char.SetData(PetChageNpc,%����_Y%,48);
		Char.SetData(PetChageNpc,%����_��ͼ%,777);
		Char.SetData(PetChageNpc,%����_����%,4);
		Char.SetData(PetChageNpc,%����_ԭ��%,"PetChageNpc");
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
	local _zc1 = Item.GetData(_itemindex,%����_�Ӳ�һ%);
	tbl_PetChage_select[Playerkey(charPointer)] = slot;
	

	local s_name = tbl_select_name[_zc1];
        

	str_ChangeWindow = "4|\\n\\n 			 \\n	 			������Ҫ����"..s_name.."��������ֻ�����ϣ�\\n\\n";
		for i=0,4 do
			local pet = Char.GetPet(charPointer,i);
			if(VaildChar(pet))then
				str_ChangeWindow = str_ChangeWindow .. " 			 			"..Char.GetData(pet,%����_����%).."\\n";

			else
				str_ChangeWindow = str_ChangeWindow .. " 			 			��\\n";
			end
		end
	NLG.ShowWindowTalked(charPointer,tonumber(tbl_PetChageNpc["PetChageNpc"]),%����_ѡ���%,%��ť_�ر�%,10,str_ChangeWindow);
	
	return;
	
end


function PetChageNpcWinTalk_Event(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	
	if(tonumber(_select)==%��ť_�ر�%)then
		return;
	end
	
	
	if (tonumber(_seqno)==10 and (_data ~= "")) then
               
		local selectitem = tonumber(_data) - 1;
		if (selectitem==nil or (selectitem~=nil and (selectitem > 4 or selectitem < 0))) then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n����ѡ���λ�ò�����!");
				return;
		end
		local pet_indexA = Char.GetPet(_PlayerIndex,selectitem);
		if (pet_indexA < 0) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n��ȷ������Ӧ�ĳ������г���!");
			return;
		end
		
		if(tbl_PetChage_select[Playerkey(_PlayerIndex)]~=nil)then
			local s = tonumber(tbl_PetChage_select[Playerkey(_PlayerIndex)]);
			local _itemindex = Char.GetItemIndex(_PlayerIndex,s);
			local _zc1 = tonumber(Item.GetData(_itemindex,%����_�Ӳ�һ%));
			local _zc2 = tonumber(Item.GetData(_itemindex,%����_�Ӳζ�%));
			

			if(_zc1 == 1)then
				Char.SetData(pet_indexA,tbl_select_keyname[_zc1],_zc2);
				Pet.UpPet(_PlayerIndex,pet_indexA);
			Item.Kill(_PlayerIndex, _itemindex, s);
				NLG.SystemMessage(_PlayerIndex,"[�����޸�]����������Ѿ������˸ı䡣");
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;
			end

			if(_zc1 == 2)then
				local skillsolt = tbl_skillsoltmaxsetting[Char.GetData(pet_indexA,%����_ԭ��%)];
                                if (skillsolt == nil)then
                                   skillsolt = 10;
                                end
				if(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]) > skillsolt)then
                                	NLG.SystemMessage(_PlayerIndex,"[�����޸�]�Ѿ��ﵽ"..tbl_select_name[_zc1].."�����ֵ���޷���ʹ���ˡ�");
                                else
 					Char.SetData(pet_indexA,tbl_select_keyname[_zc1],tonumber(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]))+_zc2);
					Pet.UpPet(_PlayerIndex,pet_indexA);
			Item.Kill(_PlayerIndex, _itemindex, s);
					NLG.SystemMessage(_PlayerIndex,"[�����޸�]��ϲ���������"..tbl_select_name[_zc1].."�� ".._zc2.."��");			
                                end
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;

			end

			if(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]) >= tbl_select_maxvalue[_zc1])then
                                NLG.SystemMessage(_PlayerIndex,"[�����޸�]�Ѿ��ﵽ"..tbl_select_name[_zc1].."�����ֵ���޷���ʹ���ˡ�");
				tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
				return;
			end
			
			Char.SetData(pet_indexA,tbl_select_keyname[_zc1],tonumber(Char.GetData(pet_indexA,tbl_select_keyname[_zc1]))+_zc2);
			Item.Kill(_PlayerIndex, _itemindex, s);
			NLG.SystemMessage(_PlayerIndex,"[�����޸�]��ϲ���������"..tbl_select_name[_zc1].."�� ".._zc2.."��");		
			Pet.UpPet(_PlayerIndex,pet_indexA);	

			
			

			
		else
			NLG.SystemMessage(_PlayerIndex,"[�����޸�]δ֪����������ʹ�ã�");
			
		end
		tbl_PetChage_select[Playerkey(_PlayerIndex)] = nil;
		
		
		
	end
end