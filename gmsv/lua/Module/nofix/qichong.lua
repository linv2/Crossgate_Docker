Global_Reg.RegMoveEquipItem("qichongtuoxia");
Global_Reg.RegEquipItem("qichongshuangji");
Global_Reg.RegTalkEvent("qichongtalk");

--[[ ���߸�ʽ

ˮ����	�ص�ˮ��(��裩	qichong									741003	27511	0	22		0	1	2	0	1	1	1	1	0	1500	1500			0	0	0	0	0	0																									1		100																					101022	210					0	0	1			0	140000	179201	100	0	0			0																	

˫��Ч������ Ϊ qichong
�Ӳ�1 ����Ϊͼ��
�Ӳ�2 ����Ϊ�ٶ�
]]--

function qichongtalk( _PlayerIndex,_msg,_color,_range,_size)
	local Name = Char.GetData(_PlayerIndex,%����_ԭ��%)
	--NLG.SetClientCharRestart(_PlayerIndex,200)
	local TalkMsg = string.sub(_msg,3)
	print("\n[" .. Name .. "]"..TalkMsg );--�����Gmsv�Ŀ���̨����	
	if TalkMsg=="/���" or TalkMsg=="/qc" or TalkMsg=="/QC" then
		--NLG.SystemMessage(_PlayerIndex,"ʹ�õ������talkevent");
		if (Char.GetData(_PlayerIndex,%����_���%)<300) then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ���Ǯ������")
		return -1
		end
		local ItemIndex = Char.GetItemIndex(_PlayerIndex, 7);  --��ȡ8��λ�õĵ�������
		local itemid = Item.GetData(ItemIndex, %����_ID%); ---��ȡ���߱��
		local ClickItemType = Item.GetData(ItemIndex,2003)--��ȡ��������
		local zc1 = tonumber(Item.GetData(ItemIndex, %����_�Ӳ�һ%)); -- ͼ�����
		local zc2 = tonumber(Item.GetData(ItemIndex, %����_�Ӳζ�%)); --�ٶ�
		
		if(zc1 == nil and zc2 == nil )then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]������û�п������ĵ��ߣ�")
		elseif (zc1 >0 and zc2 >0 and ClickItemType == "qichong" ) then
		NLG.AddGold(_PlayerIndex,-300); 
		--NLG.SystemMessage(_PlayerIndex,"ˮ������" ..zc1 .. "/"..zc2)
		Char.RideFalse(_PlayerIndex,zc1,zc2);
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���Ѿ���裡����ٶ�:" .. zc2 .. "!��ԭʼֵΪ100��")
		else
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]������û�п������ĵ��ߣ�1")
		
		end
		return -1
	elseif TalkMsg=="/�����" or TalkMsg=="/xqc" or TalkMsg=="/XQC" then
	--NLG.SystemMessage(_PlayerIndex,"ʹ�õ������talkevent");
		local ItemIndex = Char.GetItemIndex(_PlayerIndex, 7); 
		local ClickItemType = Item.GetData(ItemIndex,2003)--��ȡ��������
		if ClickItemType == "qichong" then 
		Char.RideFalse(_PlayerIndex,-1,100);
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]���Ѿ��ָ������״̬��")
		else
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�����ϲ�δװ�����ˮ����")
		end
		return -1
	else
	end
end

function qichongshuangji(CharIndex, OldItemPos)
--NLG.SystemMessage(CharIndex,"[ϵͳ]ִ�к���")

	local ItemIndex = Char.GetItemIndex(CharIndex, 7); 
	local ClickItemType = Item.GetData(ItemIndex,2003)--��ȡ��������
	
	if ClickItemType == "qichong" then 
	--Char.RideFalse(CharIndex,-1,100);
	NLG.SystemMessage(CharIndex,"[ϵͳ]������װ���������ˮ�������ֶ�ժ����װ�������ˮ���ٽ�����һ��������")
	return -1;
	end
    return 0;
end


function qichongtuoxia(CharIndex, OldItemPos, NewItemPos,Type)
    local ItemIndex = Char.GetItemIndex(CharIndex, 8);  --��ȡ8��λ�õĵ�������
	local itemid = Item.GetData(ItemIndex, %����_ID%); ---��ȡ���߱��
	local OldItemPos = Char.FindItemId(CharIndex, itemid); -----��ȡװ��ǰ����λ��
	local NewItemPos = Char.FindItemId(CharIndex, itemid); -----��ȡװ��ǰ����λ��
	
	if (NewItemPos ~= 7)then
        --print(Char.GetData(CharIndex, %����_����%).."װ����ˮ��");
		Char.RideFalse(CharIndex,-1,100);
        return 0;
    end



end