--��Ʒ��Ч���＼��ѧϰ���������������ܴ����� 2017.3.24 ������
--��֮�	���＼�ܿ�3	Pettech			LUA_useLuckyPet						70023	26420	30	26		0	1	0					1		1	1				0																																																			0	32	50					0	0	0			0			100		0			0
local restpetid ={2019}
local PItemChar =PItemChar or {}
local NpcName = "����"			--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 777, 21, 25}		--Npc��ͼ����
local NpcImage =100500					--Npcͼ��104561
local NpcDir = 5						--Npc����0Ϊ���ϣ�˳ʱ��ת��

---------------

function ChangePetItem(_PlayerIndex,_toPlayerIndex,_itemslot)
  if (ItemNpc == nil) then
    ItemNpc = NL.CreateNpc(nil,"ItemInitMyinit");
		Char.SetData(ItemNpc,%����_����%,NpcImage);
		Char.SetData(ItemNpc,%����_ԭ��%,NpcImage);
		Char.SetData(ItemNpc,%����_X%,NpcMapPos[3]);
		Char.SetData(ItemNpc,%����_Y%,NpcMapPos[4]);
		Char.SetData(ItemNpc,%����_��ͼ%,NpcMapPos[2]);
		Char.SetData(ItemNpc,%����_����%,NpcDir);
		Char.SetData(ItemNpc,%����_ԭ��%,NpcName);
		NLG.UpChar(ItemNpc);
		Char.SetWindowTalkedEvent(nil,"NPC_ItemNpcWTEvent",ItemNpc);
	end
	local _ItemIndex = Char.GetItemIndex(_PlayerIndex,_itemslot);	
  local ItemType=Item.GetData(_ItemIndex,2003)
	local Zc1 = Item.GetData(_ItemIndex,%����_�Ӳ�һ%);
	local Zc2= Item.GetData(_ItemIndex,%����_�Ӳζ�%);
	local Msg=""
	if ItemType == "PetImge" then
		Msg =Msg.. "2|\\n   ��Ҫʹ�õ��ǳ�������\\n";
		PItemChar[_PlayerIndex]="ChangePetImge"
	elseif ItemType == "PetStock" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ�������忨\\n";
		PItemChar[_PlayerIndex]="ChangePetStock"
	elseif ItemType == "PetExp" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ��ﾭ�鿨\\n";
		PItemChar[_PlayerIndex]="PetExp"
	elseif ItemType == "Pettech"  then
		PItemChar[_PlayerIndex]="Pettech"
		Msg = "3|\\n ��Ҫʹ�õ��ǳ��＼�ܿ�\\n\\n";
	elseif ItemType == "PetFixer" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ������������\\n";
		PItemChar[_PlayerIndex]="PetFixer"
	elseif ItemType == "PetFixer2" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ����������������\\n";
		PItemChar[_PlayerIndex]="PetFixer2"
	elseif ItemType == "PetRest" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ���ϴ����\\n";
		PItemChar[_PlayerIndex]="PetRest"
	elseif ItemType == "PetRestData" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ���ϴ���\\n";
		PItemChar[_PlayerIndex]="PetRestData"
	elseif ItemType == "PetAttrib" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ���������Կ�\\n";
		PItemChar[_PlayerIndex]="PetAttrib"
	elseif ItemType == "PetSkillSolt" then
		Msg = "2|\\n ��Ҫʹ�õ��ǳ��＼������չ��\\n";
		PItemChar[_PlayerIndex]="PetSkillSolt"
	end

		NLG.ShowWindowTalked(_PlayerIndex,ItemNpc,%����_ѡ���%,%��ť_�ر�%,_ItemIndex,ChangePetPosMsg(_PlayerIndex,Msg));
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
		NLG.SystemMessage(_PlayerIndex,"����ʹ�ò�������..�޼�¼")
		return;
	end
	--����Ϊ�������
	local _PetPos = tonumber(_Data-1);
	if(_PetPos == nil or _PetPos > 4 or _PetPos < 0) then
		NLG.SystemMessage(_PlayerIndex,"����ѡ���λ�ò�����!");
		PItemChar[_PlayerIndex] =nil
		return;
	end
	local _PetIndex = Char.GetPet(_PlayerIndex,_PetPos);
	if _PetIndex<0 then
		NLG.SystemMessage(_PlayerIndex,"��ȷ������Ӧ�ĳ������г���!");
		PItemChar[_PlayerIndex] =nil
		return;
	end	
	
	local PetName=Char.GetData(_PetIndex,2000)
	if PItemChar[_PlayerIndex]=="PetRest" then	
			 PItemChar[_PlayerIndex] =nil
		local PetD1=RestPet(_PlayerIndex,_PetPos)
		if PetD1 ~= 1 then
				if PetD1 ~= 0 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�ó��ﲻ֧��ϴ����")					
			return;
		end
			return;
		end
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]��ĳ�������̥����������")	
		
		end
	if PItemChar[_PlayerIndex]=="PetRestData" then
			 PItemChar[_PlayerIndex] =nil
		local PetD=RestPetData(_PlayerIndex,_PetPos)
		if PetD == 0 then
			return 0
		end
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]��ĳ����ѿ������¼ӵ�!")
	end
		
	
	--��������
	if PItemChar[_PlayerIndex] =="Pettech" then	
	PItemChar[_PlayerIndex] =nil
		local TechId = Zc1
		local Level = Zc2
		local smdbz = PetTechNpc_GetSmdbzPos(_PetIndex, 15002)
		local jnwz =PetTechNpc_GetTechPos(_PetIndex, TechId ) + 1;
		--NLG.SystemMessage(_PlayerIndex,"ʲô��������λ����"..smdbz);
		if Char.GetData(_PetIndex,%����_�ȼ�%)< Level then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ]����ȼ�����"..Level.."��,�޷�ѧϰ�˼���");
			return;
		--elseif Pet.GetSkill(_PetIndex, PetTechNpc_GetTechPos(_PetIndex, TechId ))>0 then
		elseif jnwz > 0 then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�ó���ĵ�"..jnwz.."���������Ѿ��д˼����ˣ������˷ѡ�");
			--NLG.SystemMessage(_PlayerIndex,"4���м���λ��"..jnwz.."�ȼ�����"..Level.."ʲô����������ֵ"..smdbz);
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
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]��������������ȥ�����ǵ�ð�����ùݣ�31,20��ѧϰ��ʲô���������ܡ���ʹ�ã�");
				--NLG.SystemMessage(_PlayerIndex,"1����id"..TechId.."�ȼ�����"..Level.."ʲô����������ֵ"..smdbz);
				return;
				else
				Pet.DelSkill(_PetIndex, smdbz);--���������ˣ�ɾ��ʲô����������
				Pet.AddSkill(_PetIndex,Zc1);--������ѧϰ�ļ���
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]"..Char.GetData(_PetIndex,%����_ԭ��%).."����ѧϰ�ɹ�");
				--NLG.SystemMessage(_PlayerIndex,"2����id"..TechId.."�ȼ�����"..Level.."ʲô����������ֵ"..smdbz);
				Pet.UpPet(_PlayerIndex,_PetIndex);
				PItemChar[_PlayerIndex] =nil
				end
			else
				Pet.AddSkill(_PetIndex,Zc1);--����δ��ѧϰ����
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ]"..Char.GetData(_PetIndex,%����_ԭ��%).."����ѧϰ�ɹ�");
				--NLG.SystemMessage(_PlayerIndex,"3����id"..TechId.."�ȼ�����"..Level.."ʲô����������ֵ"..smdbz);
				Pet.UpPet(_PlayerIndex,_PetIndex);
				PItemChar[_PlayerIndex] =nil
			end
	  end
	 end
	--ɾ����
	Char.DelItem(_PlayerIndex,ItemID,1);
	NLG.UpChar(_PlayerIndex);
	PItemChar[_PlayerIndex] =nil
	return;
end


function ItemInitMyinit( index)
        print("��ƷNPC_index = " .. index);
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

function ChangeItemMsg(_PlayerIndex,Msg) --װ���������ӿ�--����Msg
	Msg =Msg.. "��ѡ��Ҫ������Ŀ����� "
	for i = 0,7 do
		local _ItemIndex = Char.GetItemIndex(_PlayerIndex,i);

		local ItemName = Item.GetData(_ItemIndex,%����_����%)
		if _ItemIndex>=0 then
			Msg = Msg .."\\n"..ItemName..
				" /LV��"..Item.GetData(_ItemIndex,%����_�ȼ�%)
		else
			Msg = Msg ..
				"\\n��";
		end
	end
	return Msg
end	
function ChangePetPosMsg(_PlayerIndex,Msg) --�����������ӿ�--����Msg
	Msg =Msg.. "��ѡ������ĳ��� "
	for i = 0,4 do
		local _PetIndex = Char.GetPet(_PlayerIndex,i);
		local PetName = Char.GetData(_PetIndex,%����_����%)
		if _PetIndex>=0 then
			Msg = Msg .."\\n"..PetName..
				" /LV��"..Char.GetData(_PetIndex,%����_�ȼ�%).."/ HP��"..
				Char.GetData(_PetIndex,%����_Ѫ%).."/"..
				Char.GetData(_PetIndex,%����_���Ѫ%);
		else
			Msg = Msg ..
				"\\n��";
		end
	end
	return Msg
end
function PetTechNpc_GetTechPos(_PetIndex, _TechID)
	local tPetTechSlotMax = Char.GetData(_PetIndex, %����_������%) --�õ����＼����������
	for SkillPos = 0, tPetTechSlotMax do  ---����ȥ��
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

function PetTechNpc_GetSmdbzPos(_PetIndex, _TechID) --�õ�ʲô���������ܵ�λ��
	local tPetTechSlotMax = Char.GetData(_PetIndex, %����_������%) --�õ����＼����������
	for SkillPos = 0, tPetTechSlotMax do  ---����ȥ��
		if Pet.GetSkill(_PetIndex, SkillPos)==_TechID then
			return SkillPos
		end
	end
	return -1
end

function RestPetData(_PlayerIndex,PetPos) --����ϴ�����¼ӵ�
	local _PetIndex=Char.GetPet(_PlayerIndex,PetPos)
	if _PetIndex == -1 then
		return 0
	end
	if Char.GetData(_PetIndex,%����_�ȼ�%) == 1 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] һ�����ﲻ��Ҫϴ�㡣")
		return 0
	end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] Ұ�������޷�ϴ�㡣")
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
	Char.SetData(_PetIndex,%����_����%,(Pet.GetArtRank(_PetIndex,%�赵_���%)+FixConst[1])*20);
	Char.SetData(_PetIndex,%����_����%,(Pet.GetArtRank(_PetIndex,%�赵_����%)+FixConst[2])*20);
	Char.SetData(_PetIndex,%����_ǿ��%,(Pet.GetArtRank(_PetIndex,%�赵_ǿ��%)+FixConst[3])*20);
	Char.SetData(_PetIndex,%����_�ٶ�%,(Pet.GetArtRank(_PetIndex,%�赵_����%)+FixConst[4])*20);
	Char.SetData(_PetIndex,%����_ħ��%,(Pet.GetArtRank(_PetIndex,%�赵_ħ��%)+FixConst[5])*20);
	Char.SetData(_PetIndex,%����_������%,0);
	Char.SetData(_PetIndex,%����_�ȼ�%,1);	
	Pet.UpPet(_PlayerIndex,_PetIndex);
	return 1
end

function RestPet(_PlayerIndex,PetPos) --����ϴ��
	local _PetIndex=Char.GetPet(_PlayerIndex,PetPos)
	local PetID = Char.GetData(_PetIndex, 68)
--	for i=1,#restpetid do
			for k,v in ipairs(restpetid) do
	if PetID ~=restpetid[k] then
--	if PetID ~=restpetid[i] then
--		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �ó����޷�ϴ����")
	else	
	if _PetIndex == -1 then
		return 0
	end
	if Char.GetData(_PetIndex,%����_�ȼ�%) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ��һ�������޷�ϴ����")
		return 0
	end
	if Char.GetData(_PetIndex,52) ~= 1 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] Ұ�������޷�ϴ����")
		return 0
	end
					Pet.SetArtRank(_PetIndex,%�赵_���%,Pet.FullArtRank(_PetIndex,%�赵_���%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%�赵_ǿ��%,Pet.FullArtRank(_PetIndex,%�赵_ǿ��%) - math.random(0,4));
					Pet.SetArtRank(_PetIndex,%�赵_����%,Pet.FullArtRank(_PetIndex,%�赵_����%) - math.random(0,4));
		  		Pet.SetArtRank(_PetIndex,%�赵_ħ��%,Pet.FullArtRank(_PetIndex,%�赵_ħ��%) - math.random(0,4));
        Pet.ReBirth(_PlayerIndex, _PetIndex);
	Pet.UpPet(_PlayerIndex,_PetIndex);	

return 1
end
end
end




