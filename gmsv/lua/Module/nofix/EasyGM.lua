----------------------------------------------------------------------------
--Lua�߼�GMָ������
local GMPassword = "mm"
--Lua�߼�GMָ�����GM�ȼ����ƣ�1~5����0Ϊ���з�GM��Ҷ�����ʹ��
local GMLevel = 1

----------------------------------------------------------------------------
--��������
local ���� = {}
����.���� = {}
����.����.ԭ�� = %����_ԭ��%
����.����.�ȼ� = %����_�ȼ�%
����.����.��ͼ���� = 3
����.����.��ͼ = %����_��ͼ%
����.����.X = %����_X%
����.����.Y = %����_Y%
����.����.�˺� = 2002
����.����.GM = %����_GM%
----------------------------------------------------------------------------
-- useModule("MapList")
-- Players = Players or {}

if type(Players)~="table" then Players={} end

Delegate.RegDelTalkEvent("EasyGMEvent");

function GetCommandPara(Msg, Cmd)
	local sMsg = string.sub(Msg, string.len("[" .. GMPassword .. " ")+1)
	local tPara = Split(sMsg, " ")
	table.remove(tPara, 1)
	return tPara
end

function EasyGMEvent( _PlayerIndex, _msg, _color, _range, _size)
	--TalkMsg = string.sub(_msg,3)
	TalkMsg = string.sub(_msg,1)
	--print(GMPassword);
	--print("99"..TalkMsg);
	--print(Char.GetData(_PlayerIndex,����.����.GM));
	if CheckGMPassword(TalkMsg)~=true then
		--print(CheckGMPassword(TalkMsg));
		return 0
	end

	if (Char.GetData(_PlayerIndex,����.����.GM)<GMLevel) then
		--NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �㲻��GM���޷�ʹ�ô˹���")
		return 0
	end

	TalkMsg = string.gsub(TalkMsg,"��","[")
	TalkMsg = string.gsub(TalkMsg,"��","]")
	TalkMsg = string.gsub(TalkMsg,"]","")
	
	if CheckCommand(TalkMsg, "����")==true or CheckCommand(TalkMsg, "msg")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		--print(CdKey);
		local toStr = ""
		if CheckCommand(TalkMsg, "����")==true then
			toStr = GetCommandPara(TalkMsg,"����")
		elseif CheckCommand(TalkMsg, "msg")==true then
			toStr = GetCommandPara(TalkMsg,"msg")
		end
		print(toStr[1]);
		print(toStr[2]);
		local toPlayer = toStr[1]
		local toMsg = toStr[2]
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then 
			toCdKey=k
			end
		end
		--local _toPlayer=tonumber(toPlayer)
		--NLG.SystemMessage(_PlayerIndex,_toPlayer)
		--NLG.SystemMessage(_PlayerIndex,CdKey)
		--NLG.SystemMessage(_PlayerIndex,toCdKey)
		--local wanjia=NLG.FindUser(pigwyl2)
		--NLG.SystemMessage(_PlayerIndex,toMsg)
		--NLG.SystemMessage(_PlayerIndex,wanjia)
		if toCdKey ~= -1 then
			--NLG.SystemMessage(_toPlayer, "[��ҹ���] " .. toMsg)
			NLG.SystemMessage(Players[toCdKey]["Index"], "[��ҹ���] " .. toMsg)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���" .. Players[toCdKey]["Name"] .. "���淢�����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
				NLG.SystemMessage(-1, "[ȫ������] " .. toMsg)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���淢�����")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "�߳�")==true or CheckCommand(TalkMsg, "kill")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "�߳�")==true then
			toStr = GetCommandPara(TalkMsg ,"�߳�")[1]
		elseif CheckCommand(TalkMsg, "kill")==true then
			toStr = GetCommandPara(TalkMsg ,"kill")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then 
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���ѽ� [" .. Players[toCdKey].Index .. "][" .. toCdKey .. "]" .. Players[toCdKey].Name .. " �߳���")
			NLG.DropPlayer(Players[toCdKey].Index)
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.DropPlayer(Players[toCdKey].Index)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �ѽ���������߳�")
		elseif toCdKey==Char.GetData(_PlayerIndex,����.����.�˺�) then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �����߳��Լ�")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ����ߡ�")
		end
		return 0
	elseif CheckCommand(TalkMsg, "����")==true or CheckCommand(TalkMsg, "ju")==true then
		local Count = 0
		for ItemSlot = 8,27 do
			local ItemIndex = Char.GetItemIndex(_PlayerIndex, ItemSlot)
			if Item.GetData(ItemIndex, 63)==0 then
				Count = Count + 1
				Item.SetData(ItemIndex, 63, 1)
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �����ϵ� " .. Item.GetData(ItemIndex, 2000) .. " �Ѽ���Ϊ " .. Item.GetData(ItemIndex, 2001))
				Item.UpItem(_PlayerIndex, ItemSlot)
			end
		end
		if Count==0 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ] ������û����Ҫ��������Ʒ")
		end
		return 0
		elseif CheckCommand(TalkMsg, "���")==true or CheckCommand(TalkMsg, "clear")==true then
		for ItemSlot = 8,27 do
			local ItemIndex = Char.GetItemIndex(_PlayerIndex, ItemSlot)
			local ItemID = Item.GetData(ItemIndex, %����_ID%)
			Char.DelItem(_PlayerIndex, ItemID, 999999)
		end
		return 0
	elseif CheckCommand(TalkMsg, "�ٻ�")==true or CheckCommand(TalkMsg, "call")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "�ٻ�")==true then
			toStr = GetCommandPara(TalkMsg ,"�ٻ�")[1]
		elseif CheckCommand(TalkMsg, "call")==true then
			toStr = GetCommandPara(TalkMsg ,"call")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			Char.Warp( Players[toCdKey].Index, Char.GetData(_PlayerIndex, ����.����.��ͼ����), Char.GetData(_PlayerIndex, ����.����.��ͼ), Char.GetData(_PlayerIndex, ����.����.X), Char.GetData(_PlayerIndex, ����.����.Y))
			--NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] ���ѱ�ǿ���ٻ���" .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. " ���")
			--NLG.SystemMessage(_PlayerIndex, "[ϵͳ] ����ǿ���ٻ� " .. Players[toCdKey]["Name"] .. " �����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				Char.Warp( Players[toCdKey].Index, Char.GetData(_PlayerIndex, ����.����.��ͼ����), Char.GetData(_PlayerIndex, ����.����.��ͼ), Char.GetData(_PlayerIndex, ����.����.X), Char.GetData(_PlayerIndex, ����.����.Y))
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ������������ٻ����")
		elseif toCdKey==Char.GetData(_PlayerIndex,����.����.�˺�) then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �����ٻ��Լ�")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ����ߡ�")
		end
		return 0
	elseif CheckCommand(TalkMsg, "����")==true or CheckCommand(TalkMsg, "follow")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "����")==true then
			toStr = GetCommandPara(TalkMsg ,"����")[1]
		elseif CheckCommand(TalkMsg, "follow")==true then
			toStr = GetCommandPara(TalkMsg ,"follow")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then 
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			Char.Warp( _PlayerIndex, Char.GetData(Players[toCdKey]["Index"], ����.����.��ͼ����), Char.GetData(Players[toCdKey]["Index"], ����.����.��ͼ), Char.GetData(Players[toCdKey]["Index"], ����.����.X), Char.GetData(Players[toCdKey]["Index"], ����.����.Y))
			--NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] ���ѱ� " .. Char.GetData(_PlayerIndex,����.����.ԭ��) .. " ����")
			--NLG.SystemMessage(_PlayerIndex, "[ϵͳ] ���Ѹ��� " .. Players[toCdKey]["Name"] .. " ���")
		elseif toCdKey==Char.GetData(_PlayerIndex,����.����.�˺�) then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���ܸ����Լ�")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ����ߡ�")
		end
		return 0
	elseif CheckCommand(TalkMsg, "����")==true or CheckCommand(TalkMsg, "teleport")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "����")==true then
			toStr = GetCommandPara(TalkMsg ,"����")
		elseif CheckCommand(TalkMsg, "teleport")==true then
			toStr = GetCommandPara(TalkMsg ,"teleport")
		end
		local toPlayer = toStr[1]
		local toMapType = toStr[2]
		local toMapID = toStr[3]
		local toPosX = toStr[4]
		local toPosY = toStr[5]
		if toMapType==nil or toMapID==nil or toPosX==nil or toPosY==nil then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �����������������룡")
			return 0
		end
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM������д��Ͳ���")
--			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] �������")
			Char.Warp(Players[toCdKey]["Index"], toMapType, toMapID, toPosX, toPosY)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. " �������")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM������д��Ͳ���")
--				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] �������")
				Char.Warp(Players[toCdKey]["Index"], toMapType, toMapID, toPosX, toPosY)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ����������Ҵ������")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "������")==true or CheckCommand(TalkMsg, "checkplayer")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "������")==true then
			toStr = GetCommandPara(TalkMsg ,"������")[1]
		elseif CheckCommand(TalkMsg, "checkplayer")==true then
			toStr = GetCommandPara(TalkMsg ,"checkplayer")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			local buf= Char.GetData(Players[toCdKey]["Index"], 1) .. "|"
				buf = buf .. "[" .. Players[toCdKey]["CdKey"] .. "]" .. Players[toCdKey]["Name"]
			buf = buf .. " " .. getJobTypeName(Char.GetData(Players[toCdKey]["Index"], %����_ְ��ID%)) .. Char.GetData(Players[toCdKey]["Index"], %����_ְ��%) .. "��"
			buf = buf .. " Lv." .. Char.GetData(Players[toCdKey]["Index"], ����.����.�ȼ�)
			--buf = buf .. "\n������ս����Ϣ��"
			buf = buf .. strFormat("\n\n����:" .. Char.GetData(Players[toCdKey]["Index"], %����_����%) .. " ս��:" .. Char.GetData(Players[toCdKey]["Index"], %����_DP%) .. " ����:" .. Char.GetData(Players[toCdKey]["Index"], %����_��%), 30, 1)
			--buf = buf .. "\n�������Ϣ��"
			buf = buf .. "\n\n����:" .. Char.GetData(Players[toCdKey]["Index"], %����_���%) .. "G"
			buf = buf .. " ����:" .. Char.GetData(Players[toCdKey]["Index"], %����_���н��%) .. "G"
			--buf = buf .. "\n����¼��Ϣ��"
			buf = buf .. "\n\n�ϴ�����:" .. os.date("%Y.%m.%d %X", Char.GetData(Players[toCdKey]["Index"], 148))
			buf = buf .. "\n���ε���:" .. os.date("%Y.%m.%d %X", Char.GetData(Players[toCdKey]["Index"], 600))
			--[[
			buf = buf .. "\n��¼[" .. Char.GetData(Players[toCdKey]["Index"], 65) .. "���߶�[" .. Char.GetData(Players[toCdKey]["Index"], %����_�߶�����%)
			buf = buf .. "������" .. Char.GetData(Players[toCdKey]["Index"], %����_������%) .. "��ɱ��[" .. Char.GetData(Players[toCdKey]["Index"], %����_ɱ����%) .. "������[" .. Char.GetData(Players[toCdKey]["Index"], %����_�˺���%)
			buf = buf .. "�����" .. Char.GetData(Players[toCdKey]["Index"], %����_��ó���%) .. "������[" .. Char.GetData(Players[toCdKey]["Index"], %����_������%) .. "����ӡ[" .. Char.GetData(Players[toCdKey]["Index"], %����_��ӡ��%)
			--]]
			NLG.ShowWindowTalked( _PlayerIndex, _PlayerIndex, 37, 1, 999, buf);
		end
	elseif CheckCommand(TalkMsg, "����Ʒ")==true or CheckCommand(TalkMsg, "�����")==true or CheckCommand(TalkMsg, "checkitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "����Ʒ")==true then
			toStr = GetCommandPara(TalkMsg ,"����Ʒ")[1]
		elseif CheckCommand(TalkMsg, "�����")==true then
			toStr = GetCommandPara(TalkMsg ,"�����")[1]
		elseif CheckCommand(TalkMsg, "checkitem")==true then
			toStr = GetCommandPara(TalkMsg ,"checkitem")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			local ItemPosName = {"ͷ��", "����", "����", "����", "�Ų�", "��Ʒ1", "��Ʒ2", "ˮ��"}
			NLG.SystemMessage(_PlayerIndex,"���   [" .. Players[toCdKey]["CdKey"] .. "]   " .. Players[toCdKey]["Name"] .. " �����嵥���£�")
			NLG.SystemMessage(_PlayerIndex,"��     ����(ID)�����������͡���Lv�����ѵ��������;�")
			for i = 1,28 do
				local Pos = i-1
				local buf = ""
				local ItemIndex = Char.GetItemIndex(Players[toCdKey]["Index"], Pos)
				if ItemPosName[i]~=nil then
					buf = buf .. strFormat(ItemPosName[i],6,1) .. "��"
				else
					buf = buf .. strFormat("����" .. Pos-7,6,1) .. "��"
				end
				if ItemIndex>=0 then
					buf = buf .. strFormat(Item.GetData(ItemIndex, 2001) .. "[" .. Item.GetData(ItemIndex, %����_ID%) .. "]",18,2) .. " "	--����
					buf = buf .. strFormat(GetItemType(Item.GetData(ItemIndex, %����_����%)),8,2) .. " "	--����
					buf = buf .. strFormat(Item.GetData(ItemIndex, %����_�ȼ�%),3,3) .. " "	--�ȼ�
					buf = buf .. strFormat(Item.GetData(ItemIndex, %����_�ѵ���%),4,3) .. "/" .. strFormat(Item.GetData(ItemIndex, %����_���ѵ���%),4,1) .. " "	--�ѵ�
					buf = buf .. strFormat(Item.GetData(ItemIndex, 65),4,3) .. "/" .. strFormat(Item.GetData(ItemIndex, %����_����;�%),4,1)	--�;�
				else
					--buf = buf .. "��"
				end
				NLG.SystemMessage(_PlayerIndex, buf)
			end
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ����ߡ�")
		end
		return 0
	elseif CheckCommand(TalkMsg, "�����")==true or CheckCommand(TalkMsg, "checkpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "�����")==true then
			toStr = GetCommandPara(TalkMsg ,"�����")[1]
		elseif CheckCommand(TalkMsg, "checkpet")==true then
			toStr = GetCommandPara(TalkMsg ,"checkpet")[1]
		end
		local toPlayer = toStr
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ��� [" .. Players[toCdKey]["CdKey"] .. "]" .. Players[toCdKey]["Name"] .. " �����嵥���£�")
			NLG.SystemMessage(_PlayerIndex,"����(ID)���������͡� Lv���塡������������ħ����")
			for i = 1,5 do
				local Pos = i-1
				local buf = ""
				local PetIndex = Char.GetPet(Players[toCdKey]["Index"], Pos)
				buf = buf .. strFormat("����" .. i,5,1) .. "��"
				local buf1 = (Pet.GetArtRank(PetIndex, %�赵_���%) + Pet.GetArtRank(PetIndex, %�赵_����%) + Pet.GetArtRank(PetIndex, %�赵_ǿ��%) + Pet.GetArtRank(PetIndex, %�赵_����%) + Pet.GetArtRank(PetIndex, %�赵_ħ��%) - Pet.FullArtRank(PetIndex, %�赵_���%) - Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.FullArtRank(PetIndex, %�赵_ǿ��%) - Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.FullArtRank(PetIndex, %�赵_ħ��%));								
				if PetIndex>=0 then
					buf = buf .. strFormat(Char.GetData(PetIndex, ����.����.ԭ��) .. "[" .. Char.GetData(PetIndex, 68) .. "]",18,2) .. " "	--����
					buf = buf .. strFormat(getPetTypeName(Char.GetData(PetIndex, %����_����%)),4,2) .. " "	--����
					buf = buf .. strFormat(Char.GetData(PetIndex, ����.����.�ȼ�),3,3) .. " "	--�ȼ�
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %�赵_���%) - Pet.FullArtRank(PetIndex, %�赵_���%),3,3) .. " "	--��������
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %�赵_����%) - Pet.FullArtRank(PetIndex, %�赵_����%),3,3) .. " "	--��������
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %�赵_ǿ��%) - Pet.FullArtRank(PetIndex, %�赵_ǿ��%),3,3) .. " "	--ǿ�ȵ���
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %�赵_����%) - Pet.FullArtRank(PetIndex, %�赵_����%),3,3) .. " "	--�ٶȵ���
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %�赵_ħ��%) - Pet.FullArtRank(PetIndex, %�赵_ħ��%),3,3) .. " "	--ħ������
					buf = buf .. strFormat(buf1,3,3)	--�ܵ���
				else
					--buf = buf .. "��"
				end
				NLG.SystemMessage(_PlayerIndex, buf)
			end
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ����ߡ�")
		end
		return 0
	elseif CheckCommand(TalkMsg, "����Ʒ")==true or CheckCommand(TalkMsg, "������")==true or CheckCommand(TalkMsg, "giveitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "����Ʒ")==true then
			toStr = GetCommandPara(TalkMsg ,"����Ʒ")
		elseif CheckCommand(TalkMsg, "������")==true then
			toStr = GetCommandPara(TalkMsg ,"������")
		elseif CheckCommand(TalkMsg, "giveitem")==true then
			toStr = GetCommandPara(TalkMsg ,"giveitem")
		end
		local toPlayer = toStr[1]
		local toItemID = toStr[2]
		local toItemNum = toStr[3]
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM������и���Ʒ����.")
			Char.GiveItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. "��Ʒ�������")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM������и���Ʒ����.")
				Char.GiveItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �������������Ʒ�������")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "ɾ��Ʒ")==true or CheckCommand(TalkMsg, "ɾ����")==true or CheckCommand(TalkMsg, "killitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "ɾ��Ʒ")==true then
			toStr = GetCommandPara(TalkMsg ,"ɾ��Ʒ")
		elseif CheckCommand(TalkMsg, "ɾ����")==true then
			toStr = GetCommandPara(TalkMsg ,"ɾ����")
		elseif CheckCommand(TalkMsg, "killitem")==true then
			toStr = GetCommandPara(TalkMsg ,"killitem")
		end
		local toPlayer = toStr[1]
		local toItemID = toStr[2]
		local toItemNum = toStr[3]
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM�������ɾ��Ʒ����.")
			Char.DelItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. "����Ʒɾ�����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM�������ɾ��Ʒ����.")
				Char.DelItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �������������Ʒ�������")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "������")==true or CheckCommand(TalkMsg, "givepet")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "������")==true then
			toStr = GetCommandPara(TalkMsg ,"������")
		elseif CheckCommand(TalkMsg, "givepet")==true then
			toStr = GetCommandPara(TalkMsg ,"givepet")
		end
		local toPlayer = toStr[1]
		local toPetID = toStr[2]
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM����һֻ����.")
			Char.GivePet(Players[toCdKey]["Index"], toPetID)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. "���﷢�����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM����һֻ����.")
				Char.GivePet(Players[toCdKey]["Index"], toPetID)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ����������ҳ��﷢�����")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "����������")==true or CheckCommand(TalkMsg, "givefullpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "����������")==true then
			toStr = GetCommandPara(TalkMsg ,"����������")
		elseif CheckCommand(TalkMsg, "givefullpet")==true then
			toStr = GetCommandPara(TalkMsg ,"givefullpet")
		end
		local toPlayer = toStr[1]
		local toPetID = toStr[2]
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM����һֻ��������.")
			Char.GivePet(Players[toCdKey]["Index"], toPetID,1)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. "�������﷢�����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM����һֻ��������.")
				Char.GivePet(Players[toCdKey]["Index"], toPetID,1)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ������������������﷢�����")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "ɾ����")==true or CheckCommand(TalkMsg, "killpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,����.����.�˺�);
		local toStr = ""
		if CheckCommand(TalkMsg, "ɾ����")==true then
			toStr = GetCommandPara(TalkMsg ,"ɾ����")
		elseif CheckCommand(TalkMsg, "killpet")==true then
			toStr = GetCommandPara(TalkMsg ,"killpet")
		end
		local toPlayer = toStr[1]
		local toPetID = toStr[2]
		local toLevel = tonumber(toStr[4])
		local toMode = nil
		if toStr[3]==">=" then
			toMode=2
		elseif toStr[3]==">" then
			toMode=2
			toLevel = toLevel + 1
		elseif toStr[3]=="=" then
			toMode=1
		elseif toStr[3]=="<" then
			toMode=0
			toLevel = toLevel - 1
		elseif toStr[3]=="<=" then
			toMode=0
		end
		
		if toStr[3]==nil or toStr[4]==nil then
			toMode=2
			toLevel=1
		end
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM�������ɾ�������.")
			Char.DelPet(Players[toCdKey]["Index"], toPetID, toLevel, toMode)
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] " .. Players[toCdKey]["Name"] .. "����Ʒɾ�����")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="ȫ��" or toPlayer=="ȫ" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[ϵͳ] GM�������ɾ�������.")
				Char.DelPet(Players[toCdKey]["Index"], toPetID, toLevel, toMode)
			end
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �������������Ʒ�������")
		else
			NLG.SystemMessage(_PlayerIndex,"[ϵͳ] û���ҵ�����һ����Ҳ�����")
		end
		return 0
	elseif CheckCommand(TalkMsg, "�߼�����")==true or CheckCommand(TalkMsg, "list")==true or CheckCommand(TalkMsg, "l")==true then
		NLG.SystemMessage(_PlayerIndex, "[�߼���������б�] �嵥���£�");
		for Key,Value in pairs(Players) do
			local tName = Char.GetData(Value.Index, ����.����.ԭ��)   --Name
			local tLv = Char.GetData(Value.Index, ����.����.�ȼ�)    --Lv
			local tMapName = ""
			if Char.GetData(Value.Index, ����.����.��ͼ����)==0 then
				tMapName = getMapName(Char.GetData(Value.Index, ����.����.��ͼ))
			elseif Char.GetData(Value.Index, ����.����.��ͼ����)==1 then
				tMapName = "����Թ�"
			elseif Char.GetData(Value.Index, ����.����.��ͼ����)==2 then
				tMapName = "������"
			else
				tMapName = "δ֪"
			end
			local tMapPos = Char.GetData(Value.Index, ����.����.��ͼ����) .. "." .. Char.GetData(Value.Index, ����.����.��ͼ) .. "." .. Char.GetData(Value.Index, ����.����.X) .. "." .. Char.GetData(Value.Index, ����.����.Y)
			local BattleStat = ""
			if Char.GetData(Value.Index, 8000)==true then BattleStat=" *ս����*" end
			NLG.SystemMessage(_PlayerIndex, "[" .. Value.Index .. "][" .. Value.CdKey .. "]" .. tName .. "(Lv." .. tLv .. ") At " .. tMapName .. " [" .. tMapPos .. "] " .. BattleStat);
		end
		return 0
	elseif CheckCommand(TalkMsg, "��ͼ����")==true or CheckCommand(TalkMsg, "maplist")==true or CheckCommand(TalkMsg, "ml")==true then
		NLG.SystemMessage(_PlayerIndex, "[�߼���������б�] �嵥���£�");
		for Key,Value in pairs(Players) do
			if Char.GetData(_PlayerIndex, ����.����.��ͼ����)==Char.GetData(Value.Index, ����.����.��ͼ����) and Char.GetData(_PlayerIndex, ����.����.��ͼ)==Char.GetData(Value.Index, ����.����.��ͼ) then
				local tName = Char.GetData(Value.Index, ����.����.ԭ��)   --Name
				local tLv = Char.GetData(Value.Index, ����.����.�ȼ�)    --Lv
				local tMapName = ""
				if Char.GetData(Value.Index, ����.����.��ͼ����)==0 then
					tMapName = getMapName(Char.GetData(Value.Index, ����.����.��ͼ))
				elseif Char.GetData(Value.Index, ����.����.��ͼ����)==1 then
					tMapName = "����Թ�"
				elseif Char.GetData(Value.Index, ����.����.��ͼ����)==2 then
					tMapName = "������"
				else
					tMapName = "δ֪"
				end
				local pMapID = Char.GetData(_PlayerIndex, ����.����.��ͼ)
				local tMapPos = Char.GetData(Value.Index, ����.����.��ͼ����) .. "." .. Char.GetData(Value.Index, ����.����.��ͼ) .. "." .. Char.GetData(Value.Index, ����.����.X) .. "." .. Char.GetData(Value.Index, ����.����.Y)
				local BattleStat = ""
				if Char.GetData(Value.Index, 8000)==true then BattleStat=" *ս����*" end
				NLG.SystemMessage(_PlayerIndex, "[" .. Value.Index .. "][" .. Value.CdKey .. "]" .. tName .. "(Lv." .. tLv .. ") At " .. tMapName .. " [" .. tMapPos .. "] " .. BattleStat);
			end
		end
		return 0
	end



--[[function getMapName( _MapID )
	if _MapID==1 then
	return BaseMapName[_MapID]	
elseif CheckCommand(TalkMsg, "lua")==true then
		toStr = GetCommandPara(TalkMsg ,"lua")[1]
		f = loadstring(toStr)
		return 0
end
end--]]
end

function CheckGMPassword(Msg)
	local RightGM = "[" .. GMPassword .. " "
		--print(Msg.."=" .. RightGM);
	if string.sub(Msg,1,string.len(GMPassword)+2) == RightGM then
		--print(string.sub(Msg,1,string.len(GMPassword)+2));
		return true;
	end
	return false
end

function CheckCommand(Msg, Cmd)
	local sMsg = string.sub(Msg, string.len("[" .. GMPassword .. " ")+1)
	if sMsg==Cmd then
		return true
	end
	if string.find(sMsg, " ")~=nil then
		local tMsg = Split(sMsg, " ")		
		if tMsg[1]==Cmd then
			return true
		end
	end
	return false
end

function GetCommandPara(Msg, Cmd)
	local sMsg = string.sub(Msg, string.len("[" .. GMPassword .. " ")+1)
	local tPara = Split(sMsg, " ")
	table.remove(tPara, 1)
	return tPara
end

function getItemTypeName(_TypeNo)
	local ItemTypeName={}
	ItemTypeName[1]="��"
	ItemTypeName[2]="��"
	ItemTypeName[3]="ǹ"
	ItemTypeName[4]="��"
	ItemTypeName[5]="��"
	ItemTypeName[6]="С��"
	ItemTypeName[7]="����"
	ItemTypeName[8]="��"
	ItemTypeName[9]="ͷ��"
	ItemTypeName[10]="ñ��"
	ItemTypeName[11]="��"
	ItemTypeName[12]="��"
	ItemTypeName[13]="��"
	ItemTypeName[14]="ѥ"
	ItemTypeName[15]="Ь"
	ItemTypeName[16]="�ֻ�"
	ItemTypeName[17]="����"
	ItemTypeName[18]="����"
	ItemTypeName[19]="��ָ"
	ItemTypeName[20]="ȭ��"
	ItemTypeName[21]="����"
	ItemTypeName[22]="ͷ��"
	ItemTypeName[23]="ˮ��"
	ItemTypeName[24]="����"
	ItemTypeName[25]="�Ҿ�"
	ItemTypeName[26]="����֮��"
	ItemTypeName[27]="�������"
	ItemTypeName[28]="����"
	ItemTypeName[29]="Կ��"
	ItemTypeName[30]="��"
	ItemTypeName[31]="ľ��"
	ItemTypeName[32]="��"
	ItemTypeName[33]="����"
	ItemTypeName[34]="��"
	ItemTypeName[35]="�߲�"
	ItemTypeName[36]="����"
	ItemTypeName[37]="��"
	ItemTypeName[38]="��ҩ"
	ItemTypeName[39]="��ʯ"
	ItemTypeName[40]="֤��"
	ItemTypeName[41]="��ӡ��"
	ItemTypeName[42]="ͼ����"
	ItemTypeName[43]="��������"
	ItemTypeName[44]="����ҩˮ"
	ItemTypeName[45]="��"
	ItemTypeName[46]="׶��ˮ��"
	ItemTypeName[47]="�����⾵"
	ItemTypeName[48]="��Ʊ"
	ItemTypeName[49]="��Ƭ����"
	ItemTypeName[50]="��"
	ItemTypeName[51]="��"
	ItemTypeName[52]="ը��"
	ItemTypeName[53]="���"
	ItemTypeName[54]="ʳ��"
	ItemTypeName[55]="�����޵�"
	ItemTypeName[56]="ͷ��"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="����"
	PetType[2]="��"
	PetType[3]="����"
	PetType[4]="����"
	PetType[5]="����"
	PetType[6]="ֲ��"
	PetType[7]="Ұ��"
	PetType[8]="����"
	PetType[9]="����"
	PetType[10]="аħ"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="����"
	JobTypeName[10]="��ʿ"
	JobTypeName[20]="ս����ʿ"
	JobTypeName[30]="��ʿ"
	JobTypeName[40]="������"
	JobTypeName[50]="ʿ��"
	JobTypeName[60]="����ʿ"
	JobTypeName[70]="ħ��ʦ"
	JobTypeName[80]="����ʦ"
	JobTypeName[90]="��ӡʦ"
	JobTypeName[100]="����ʦ"
	JobTypeName[110]="ѱ��ʦ"
	JobTypeName[120]="����"
	JobTypeName[130]="��ʦ"
	JobTypeName[140]="��ʿ"
	JobTypeName[150]="����"
	JobTypeName[160]="����"
	JobTypeName[200]="������"
	JobTypeName[210]="��ְ��"
	JobTypeName[220]="ǹְ��"
	JobTypeName[230]="��ְ��"
	JobTypeName[240]="��ְ��"
	JobTypeName[250]="����ְ��"
	JobTypeName[260]="С��ְ��"
	JobTypeName[270]="��ְ��"
	JobTypeName[280]="ñ��ְ��"
	JobTypeName[290]="��ְ��"
	JobTypeName[300]="��ְ��"
	JobTypeName[310]="��ְ��"
	JobTypeName[320]="ѥְ��"
	JobTypeName[330]="Ьְ��"
	JobTypeName[340]="��ְ��"
	JobTypeName[350]="��ʦ"
	JobTypeName[360]="ҩ��ʦ"
	JobTypeName[370]="��������ʦ"
	JobTypeName[380]="��������ʦ"
	JobTypeName[390]="����ʦ"
	JobTypeName[400]="�Ϥ���"
	JobTypeName[410]="̽��"
	JobTypeName[420]="����"
	JobTypeName[430]="��ʿ"
	JobTypeName[440]="һ��"
	JobTypeName[450]="�Է�"
	JobTypeName[460]="����"
	JobTypeName[470]="��"
	JobTypeName[480]="��"
	JobTypeName[1000]="����ʦ"
	JobTypeName[1010]="��֯��"
	JobTypeName[170]="ʥ��ʿ"
	JobTypeName[180]="Ӱ�̿�"
	JobTypeName[190]="ħ��ʿ"
	JobTypeName[720]="��װ�������"
	JobTypeName[710]="��װ�������"
	JobTypeName[730]="��װ�������"
	JobTypeName[740]="ȭ������"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function getItemTypeName(_TypeNo)
	local ItemTypeName={}
	ItemTypeName[1]="��"
	ItemTypeName[2]="��"
	ItemTypeName[3]="ǹ"
	ItemTypeName[4]="��"
	ItemTypeName[5]="��"
	ItemTypeName[6]="С��"
	ItemTypeName[7]="����"
	ItemTypeName[8]="��"
	ItemTypeName[9]="ͷ��"
	ItemTypeName[10]="ñ��"
	ItemTypeName[11]="��"
	ItemTypeName[12]="��"
	ItemTypeName[13]="��"
	ItemTypeName[14]="ѥ"
	ItemTypeName[15]="Ь"
	ItemTypeName[16]="�ֻ�"
	ItemTypeName[17]="����"
	ItemTypeName[18]="����"
	ItemTypeName[19]="��ָ"
	ItemTypeName[20]="ȭ��"
	ItemTypeName[21]="����"
	ItemTypeName[22]="ͷ��"
	ItemTypeName[23]="ˮ��"
	ItemTypeName[24]="����"
	ItemTypeName[25]="�Ҿ�"
	ItemTypeName[26]="����֮��"
	ItemTypeName[27]="�������"
	ItemTypeName[28]="����"
	ItemTypeName[29]="Կ��"
	ItemTypeName[30]="��"
	ItemTypeName[31]="ľ��"
	ItemTypeName[32]="��"
	ItemTypeName[33]="����"
	ItemTypeName[34]="��"
	ItemTypeName[35]="�߲�"
	ItemTypeName[36]="����"
	ItemTypeName[37]="��"
	ItemTypeName[38]="��ҩ"
	ItemTypeName[39]="��ʯ"
	ItemTypeName[40]="֤��"
	ItemTypeName[41]="��ӡ��"
	ItemTypeName[42]="ͼ����"
	ItemTypeName[43]="��������"
	ItemTypeName[44]="����ҩˮ"
	ItemTypeName[45]="��"
	ItemTypeName[46]="׶��ˮ��"
	ItemTypeName[47]="�����⾵"
	ItemTypeName[48]="��Ʊ"
	ItemTypeName[49]="��Ƭ����"
	ItemTypeName[50]="��"
	ItemTypeName[51]="��"
	ItemTypeName[52]="ը��"
	ItemTypeName[53]="���"
	ItemTypeName[54]="ʳ��"
	ItemTypeName[55]="�����޵�"
	ItemTypeName[56]="ͷ��"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="����"
	PetType[2]="��"
	PetType[3]="����"
	PetType[4]="����"
	PetType[5]="����"
	PetType[6]="ֲ��"
	PetType[7]="Ұ��"
	PetType[8]="����"
	PetType[9]="����"
	PetType[10]="аħ"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="����"
	JobTypeName[10]="��ʿ"
	JobTypeName[20]="ս����ʿ"
	JobTypeName[30]="��ʿ"
	JobTypeName[40]="������"
	JobTypeName[50]="ʿ��"
	JobTypeName[60]="����ʿ"
	JobTypeName[70]="ħ��ʦ"
	JobTypeName[80]="����ʦ"
	JobTypeName[90]="��ӡʦ"
	JobTypeName[100]="����ʦ"
	JobTypeName[110]="ѱ��ʦ"
	JobTypeName[120]="����"
	JobTypeName[130]="��ʦ"
	JobTypeName[140]="��ʿ"
	JobTypeName[150]="����"
	JobTypeName[160]="����"
	JobTypeName[200]="������"
	JobTypeName[210]="��ְ��"
	JobTypeName[220]="ǹְ��"
	JobTypeName[230]="��ְ��"
	JobTypeName[240]="��ְ��"
	JobTypeName[250]="����ְ��"
	JobTypeName[260]="С��ְ��"
	JobTypeName[270]="��ְ��"
	JobTypeName[280]="ñ��ְ��"
	JobTypeName[290]="��ְ��"
	JobTypeName[300]="��ְ��"
	JobTypeName[310]="��ְ��"
	JobTypeName[320]="ѥְ��"
	JobTypeName[330]="Ьְ��"
	JobTypeName[340]="��ְ��"
	JobTypeName[350]="��ʦ"
	JobTypeName[360]="ҩ��ʦ"
	JobTypeName[370]="��������ʦ"
	JobTypeName[380]="��������ʦ"
	JobTypeName[390]="����ʦ"
	JobTypeName[400]="�Ϥ���"
	JobTypeName[410]="̽��"
	JobTypeName[420]="����"
	JobTypeName[430]="��ʿ"
	JobTypeName[440]="һ��"
	JobTypeName[450]="�Է�"
	JobTypeName[460]="����"
	JobTypeName[470]="��"
	JobTypeName[480]="��"
	JobTypeName[1000]="����ʦ"
	JobTypeName[1010]="��֯��"
	JobTypeName[170]="ʥ��ʿ"
	JobTypeName[180]="Ӱ�̿�"
	JobTypeName[190]="ħ��ʿ"
	JobTypeName[720]="��װ�������"
	JobTypeName[710]="��װ�������"
	JobTypeName[730]="��װ�������"
	JobTypeName[740]="ȭ������"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function getItemTypeName(_TypeNo)
	local ItemTypeName={}
	ItemTypeName[1]="��"
	ItemTypeName[2]="��"
	ItemTypeName[3]="ǹ"
	ItemTypeName[4]="��"
	ItemTypeName[5]="��"
	ItemTypeName[6]="С��"
	ItemTypeName[7]="����"
	ItemTypeName[8]="��"
	ItemTypeName[9]="ͷ��"
	ItemTypeName[10]="ñ��"
	ItemTypeName[11]="��"
	ItemTypeName[12]="��"
	ItemTypeName[13]="��"
	ItemTypeName[14]="ѥ"
	ItemTypeName[15]="Ь"
	ItemTypeName[16]="�ֻ�"
	ItemTypeName[17]="����"
	ItemTypeName[18]="����"
	ItemTypeName[19]="��ָ"
	ItemTypeName[20]="ȭ��"
	ItemTypeName[21]="����"
	ItemTypeName[22]="ͷ��"
	ItemTypeName[23]="ˮ��"
	ItemTypeName[24]="����"
	ItemTypeName[25]="�Ҿ�"
	ItemTypeName[26]="����֮��"
	ItemTypeName[27]="�������"
	ItemTypeName[28]="����"
	ItemTypeName[29]="Կ��"
	ItemTypeName[30]="��"
	ItemTypeName[31]="ľ��"
	ItemTypeName[32]="��"
	ItemTypeName[33]="����"
	ItemTypeName[34]="��"
	ItemTypeName[35]="�߲�"
	ItemTypeName[36]="����"
	ItemTypeName[37]="��"
	ItemTypeName[38]="��ҩ"
	ItemTypeName[39]="��ʯ"
	ItemTypeName[40]="֤��"
	ItemTypeName[41]="��ӡ��"
	ItemTypeName[42]="ͼ����"
	ItemTypeName[43]="��������"
	ItemTypeName[44]="����ҩˮ"
	ItemTypeName[45]="��"
	ItemTypeName[46]="׶��ˮ��"
	ItemTypeName[47]="�����⾵"
	ItemTypeName[48]="��Ʊ"
	ItemTypeName[49]="��Ƭ����"
	ItemTypeName[50]="��"
	ItemTypeName[51]="��"
	ItemTypeName[52]="ը��"
	ItemTypeName[53]="���"
	ItemTypeName[54]="ʳ��"
	ItemTypeName[55]="�����޵�"
	ItemTypeName[56]="ͷ��"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="����"
	PetType[2]="��"
	PetType[3]="����"
	PetType[4]="����"
	PetType[5]="����"
	PetType[6]="ֲ��"
	PetType[7]="Ұ��"
	PetType[8]="����"
	PetType[9]="����"
	PetType[10]="аħ"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="����"
	JobTypeName[10]="��ʿ"
	JobTypeName[20]="ս����ʿ"
	JobTypeName[30]="��ʿ"
	JobTypeName[40]="������"
	JobTypeName[50]="ʿ��"
	JobTypeName[60]="����ʿ"
	JobTypeName[70]="ħ��ʦ"
	JobTypeName[80]="����ʦ"
	JobTypeName[90]="��ӡʦ"
	JobTypeName[100]="����ʦ"
	JobTypeName[110]="ѱ��ʦ"
	JobTypeName[120]="����"
	JobTypeName[130]="��ʦ"
	JobTypeName[140]="��ʿ"
	JobTypeName[150]="����"
	JobTypeName[160]="����"
	JobTypeName[200]="������"
	JobTypeName[210]="��ְ��"
	JobTypeName[220]="ǹְ��"
	JobTypeName[230]="��ְ��"
	JobTypeName[240]="��ְ��"
	JobTypeName[250]="����ְ��"
	JobTypeName[260]="С��ְ��"
	JobTypeName[270]="��ְ��"
	JobTypeName[280]="ñ��ְ��"
	JobTypeName[290]="��ְ��"
	JobTypeName[300]="��ְ��"
	JobTypeName[310]="��ְ��"
	JobTypeName[320]="ѥְ��"
	JobTypeName[330]="Ьְ��"
	JobTypeName[340]="��ְ��"
	JobTypeName[350]="��ʦ"
	JobTypeName[360]="ҩ��ʦ"
	JobTypeName[370]="��������ʦ"
	JobTypeName[380]="��������ʦ"
	JobTypeName[390]="����ʦ"
	JobTypeName[400]="�Ϥ���"
	JobTypeName[410]="̽��"
	JobTypeName[420]="����"
	JobTypeName[430]="��ʿ"
	JobTypeName[440]="һ��"
	JobTypeName[450]="�Է�"
	JobTypeName[460]="����"
	JobTypeName[470]="��"
	JobTypeName[480]="��"
	JobTypeName[1000]="����ʦ"
	JobTypeName[1010]="��֯��"
	JobTypeName[170]="ʥ��ʿ"
	JobTypeName[180]="Ӱ�̿�"
	JobTypeName[190]="ħ��ʿ"
	JobTypeName[720]="��װ�������"
	JobTypeName[710]="��װ�������"
	JobTypeName[730]="��װ�������"
	JobTypeName[740]="ȭ������"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end



function getMapName( _MapID )
	return BaseMapName[_MapID]
end
