------------------------------------���ħ�Ҷһ������趨------------------------------------------
��� = 10000  --��ҳ�ʼ�۸�
��ұ��� = 1  ---�����ҳ�ʼ����
ħ�ұ��� = 1  ---�һ�ħ�ҳ�ʼ����
ħ�Ҷһ����� = 0  --��
�𿨶һ����� = 0  --��
���� = {} --��
����[0] = {0} --���κ����ӱ���
����[1] = {0.1}
����[2] = {0.2}
����[3] = {0.3}
����[4] = {0.4}
����[5] = {0.5}
������� = 0 --��
ħ������ = 0 --��
���� = 0 --��
�һ����ID = 999999 --�һ���ҵ�ID
һ�����ħ�� = 50000000  ---ħ�ҵ������ֵ�趨
�������ħ�� = 100000000
�������ħ�� = 200000000
�ĵ����ħ�� = 500000000
�嵵���ħ�� = 1000000000
һ������� = 1000  ---�𿨵������ֵ�趨
��������� = 2000
��������� = 5000
�ĵ������ = 10000
�嵵����� = 20000
exchangeָ�� = "[dhy]"  --���ָ��
exchangeNPCλ�� ={100454,1000,246,84,6,"���ħ�Ҷһ�Ա"}  ---NPCλ���趨
function exchangeNpc_CallBack(_meIndex)
	local rq = tonumber(os.date("%d", os.time()))
	if rq ~= ���� then
		������� = 5000   --ÿ��һ��������
		ħ������ = 500000000 --ÿ��һ�ħ������
		���� = rq
	end
end
ħ������ = 5000000
--------------------------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
Delegate.RegInit("exchangeNpc_Init");
Delegate.RegDelTalkEvent("exchange_TalkEvent");
function exchangeNpc_Init()
	exchangeNpc = NL.CreateNpc(nil, "Myinit");
	Char.SetData(exchangeNpc,%����_����%,exchangeNPCλ��[1]);
	Char.SetData(exchangeNpc,%����_ԭ��%,exchangeNPCλ��[1]);
	Char.SetData(exchangeNpc,%����_X%,exchangeNPCλ��[3]);
	Char.SetData(exchangeNpc,%����_Y%,exchangeNPCλ��[4]);
	Char.SetData(exchangeNpc,%����_��ͼ%,exchangeNPCλ��[2]);
	Char.SetData(exchangeNpc,%����_����%,exchangeNPCλ��[5]);
	Char.SetData(exchangeNpc,%����_����%,exchangeNPCλ��[6]);
	NLG.UpChar(exchangeNpc)
	Char.SetData(exchangeNpc, %����_��ɫ%, 4)
	--NLG.SetShowName(exchangeNpc, 1)
	tbl_exchangeNpc = tbl_exchangeNpc or {}
	tbl_exchangeNpc["exchangeNpc"] = exchangeNpc
	Char.SetTalkedEvent(nil, "exchangeNpc_Talked", exchangeNpc)
	Char.SetWindowTalkedEvent(nil, "exchangeNpc_WindowTalked", exchangeNpc)
	Char.SetLoopEvent("lua/Module/exchange.lua", "exchangeNpc_CallBack", exchangeNpc, 1000);
	return true;
end
function Myinit(_MeIndex)
	return true;
end
function exchangeNpc_Talked( _MeIndex, _PlayerIndex, _Mode)
	local mb1 = SQL.Run("select sum(Gold) from `tbl_character` ") ["0_0"]
	local mb2 = tonumber(mb1 or 0)
	local mb11 = SQL.Run("select sum(PoolGold) from `tbl_character` ") ["0_0"]
	local mb21 = tonumber(mb11 or 0)
	local mb3 = mb2+mb21
	local jb1 = SQL.Run("select sum(ITEM_REMAIN) from `tbl_item` WHERE `ITEM_ID`='"..�һ����ID.."'") ["0_0"]
	local jb3 = tonumber(jb1 or 0)
	if mb3 >= 0 and mb3 <= һ�����ħ�� then
		ħ�Ҷһ����� = 0
	end
	if mb3 >= һ�����ħ�� and mb3 <= �������ħ�� then
		ħ�Ҷһ����� = 1
	end
	if mb3 >= �������ħ�� and mb3 <= �������ħ�� then
		ħ�Ҷһ����� = 2
	end
	if mb3 >= �������ħ�� and mb3 <= �ĵ����ħ�� then
		ħ�Ҷһ����� = 3
	end
	if mb3 >= �ĵ����ħ�� and mb3 <= �嵵���ħ�� then
		ħ�Ҷһ����� = 4
	end
	if mb3 >= �嵵���ħ�� then
		ħ�Ҷһ����� = 5
	end
	if jb3 >= 0 and jb3 <= һ������� then
		�𿨶һ����� = 0
	end
	if jb3 >= һ������� and jb3 <= ��������� then
		�𿨶һ����� = 1
	end
	if jb3 >= ��������� and jb3 <= ��������� then
		�𿨶һ����� = 2
	end
	if jb3 >= ��������� and jb3 <= �ĵ������ then
		�𿨶һ����� = 3
	end
	if jb3 >= �ĵ������ and jb3 <= �嵵����� then
		�𿨶һ����� = 4
	end
	if jb3 >= �嵵����� then
		�𿨶һ����� = 5
	end
	local mbsjbl = ����[ħ�Ҷһ�����][1]
	local jksjbl = ����[�𿨶һ�����][1]
	local dqjbbl = ��ұ��� + jksjbl
	local dqjbjg = ���*dqjbbl
	local dqmbbl = ħ�ұ��� - mbsjbl
	local dqmbjg = ���*dqmbbl
	local TalkBuf =	"7\\n��ȫ��ħ��������"..mb3.."����" ..
			"\\n��ȫ����������"..jb3.."����" ..
			"\\nħ�Ҷһ�Ϊ��"..ħ�Ҷһ�����.."����-�𿨶һ�Ϊ��"..�𿨶һ�����.."����" ..
			"\\n��ǰħ�ҹ����Ҽ۸�Ϊ��"..dqjbjg.."��" ..
			"\\nλ��ǰ��Ҷһ�ħ�Ҽ۸�Ϊ��"..dqmbjg.."��" ..
			"\\n��ǰʣ���Ҷһ�������"..�������.."��" ..
			"\\n��ǰʣ��ħ�Ҷһ�������"..ħ������.."��" ..
			"\\n��ħ�ҹ����ҡ�"..
			"\\n����Ҷһ�ħ�ҡ�" 
	TalkBuf =Against_GAMsgFormat(TalkBuf)
	Against_ShowGAWindowTalk(_PlayerIndex, 2, 2, 1,TalkBuf,_MeIndex);
	return ;
end
function Against_ShowGAWindowTalk(_PlayerIndex,_Window, _Select,_Seqno,_Data,_MePtr)
	return NLG.ShowWindowTalked(_PlayerIndex,_MePtr,_Window,_Select,_Seqno,_Data);
end
function Against_GAMsgFormat(Msg)
	local tMsg = Split(Msg,"\\n")
	local NewMsg=""
	for i=1,#tMsg do
		if tMsg[i]~="" and string.find(tMsg[i],"|")==nil then
			NewMsg=NewMsg..Against_strFormat(tMsg[i],45,2).."\\n"
		else
			NewMsg=NewMsg..tMsg[i].."\\n"
		end
		
	end
	return NewMsg
end
function Against_strFormat(str,str_len,str_type)
--[[
����һ��������ַ���
�����������õĿռ䳤��
��������1������2�����У�3������
]]--
	if string.len(str)>str_len then
		str = string.sub(str,1,str_len)
	end
	if(str_type == 3) then
		str_tmp=string.format("%"..str_len.."s", str);
	elseif(str_type == 1) then
		str_tmp=string.format("%-"..str_len.."s", str);
	elseif(str_type == 2) then
		local tmp_splace=math.floor((str_len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-"..str_len.."s", str_tmp);
	end
	return str_tmp;
end
function exchange_TalkEvent(player,msg,color,range,size)
	if msg == exchangeָ�� then
		exchangeNpc_Talked(tbl_exchangeNpc["exchangeNpc"], player, 0, 0, 0)
	end
end
function exchangeNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	local CdKey = Char.GetData(_PlayerIndex, 2002)
	local mb1 = SQL.Run("select sum(Gold) from `tbl_character` ") ["0_0"]
	local mb2 = tonumber(mb1 or 0)
	local mb11 = SQL.Run("select sum(PoolGold) from `tbl_character` ") ["0_0"]
	local mb21 = tonumber(mb11 or 0)
	local mb3 = mb2+mb21
	local jb1 = SQL.Run("select sum(ITEM_REMAIN) from `tbl_item` WHERE `ITEM_ID`='"..�һ����ID.."'") ["0_0"]
	local jb3 = tonumber(jb1 or 0)
	if mb3 >= 0 and mb3 <= һ�����ħ�� then
		ħ�Ҷһ����� = 0
	end
	if mb3 >= һ�����ħ�� and mb3 <= �������ħ�� then
		ħ�Ҷһ����� = 1
	end
	if mb3 >= �������ħ�� and mb3 <= �������ħ�� then
		ħ�Ҷһ����� = 2
	end
	if mb3 >= �������ħ�� and mb3 <= �ĵ����ħ�� then
		ħ�Ҷһ����� = 3
	end
	if mb3 >= �ĵ����ħ�� and mb3 <= �嵵���ħ�� then
		ħ�Ҷһ����� = 4
	end
	if mb3 >= �嵵���ħ�� then
		ħ�Ҷһ����� = 5
	end
	if jb3 >= 0 and jb3 <= һ������� then
		�𿨶һ����� = 0
	end
	if jb3 >= һ������� and jb3 <= ��������� then
		�𿨶һ����� = 1
	end
	if jb3 >= ��������� and jb3 <= ��������� then
		�𿨶һ����� = 2
	end
	if jb3 >= ��������� and jb3 <= �ĵ������ then
		�𿨶һ����� = 3
	end
	if jb3 >= �ĵ������ and jb3 <= �嵵����� then
		�𿨶һ����� = 4
	end
	if jb3 >= �嵵����� then
		�𿨶һ����� = 5
	end
	local mbsjbl = ����[ħ�Ҷһ�����][1]
	local jksjbl = ����[�𿨶һ�����][1]
	local dqjbbl = ��ұ��� + jksjbl
	local dqjbjg = ���*dqjbbl
	local dqmbbl = ħ�ұ��� - mbsjbl
	local dqmbjg = ���*dqmbbl
	--ȡ����ť
	if _Select==2 then
		return
	end
	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--��ѯ
		if PlayerSelect==1 then
			Against_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,14,"\n��ǰ��ħ�ҹ����ң�\n\n��ǰ����۸�Ϊ��"..dqjbjg.."��ħ��һ����ҡ�\n\n��ǰʣ��һ������Ϊ��"..�������.."��\n\n�����빺��������",_MeIndex);
			return	
		end
		if PlayerSelect==2 then
			Against_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,15,"\n��ǰ�ǽ�ҹ���ħ�ң�\n\n��ǰ����۸�Ϊһ��Ҷһ���"..dqmbjg.."��ħ�ҡ�\n\n��ǰʣ��һ�ħ����Ϊ��"..ħ������.."��\n\n�������Ҷһ�ħ������",_MeIndex);
			return;
		end
	end
	if(tonumber(_Seqno)==14 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local Wei = tonumber("".._Data.."");
		if Wei > ������� then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]��ǰ�һ��������������ʣ��һ������޷��һ���")
			return;
		end
		local money = Char.GetData(_PlayerIndex,%����_���%);
		local xhmb = Wei*dqjbjg
		if xhmb > money then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]����ħ�Ҳ���һ��������������")
			return;
		end
		if xhmb <= money then
			Char.SetData(_PlayerIndex,%����_���%,money-xhmb);
			Char.GiveItem(_PlayerIndex,�һ����ID,Wei)
			������� = �������-Wei
			NLG.UpChar(_PlayerIndex);
		end
	end
	if(tonumber(_Seqno)==15 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local Wei = tonumber("".._Data.."");
		local ItemNUM = Char.ItemNum(_PlayerIndex,�һ����ID)
		local money = Char.GetData(_PlayerIndex,%����_���%);
		if Wei > ItemNUM then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]���Ľ�Ҳ��㣬�޷��һ��������������")
			return;
		end
		local dhmb = Wei*dqmbjg
		local moneysx = money + dhmb
		if moneysx > ħ������ then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]����ħ�ҼӶһ�ħ���ѳ������޷��һ�������Ϊ��"..ħ������.."��")
			return;
		end
		if dhmb > ħ������ then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]���һ���ħ����������ʣ��ħ��������")
			return;
		end
		if Wei <= ItemNUM and dhmb <= ħ������ then
			Char.DelItem(_PlayerIndex,�һ����ID,Wei)
			Char.SetData(_PlayerIndex,%����_���%,money+dhmb);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]��ϲ���һ��ˡ�"..dhmb.."��ħ��")
			ħ������ = ħ������ - dhmb
			NLG.UpChar(_PlayerIndex);
		end
	end
end

