RC_NPC_Index = RC_NPC_Index or {};
local RC_Tmp = nil;
local RC_Str = nil;
local RC_cdkey = nil;

Delegate.RegInit("TmpNpc_Init");
function TmpNpc_Init()
	TmpNpc_create();
end



function nilInit()
		return true;
end

function TmpNpc_create()
	if(tmpnpcs == nil)then	
		tmpnpcs = NL.CreateNpc("lua/Module/TmpNpc.lua", "nilInit");
		Char.SetData(tmpnpcs,%����_����%,14576);
		Char.SetData(tmpnpcs,%����_ԭ��%,14576);
		Char.SetData(tmpnpcs,%����_X%,15);
		Char.SetData(tmpnpcs,%����_Y%,13);
		Char.SetData(tmpnpcs,%����_��ͼ%,777);
		Char.SetData(tmpnpcs,%����_����%,6);
		Char.SetData(tmpnpcs,%����_����%,"ǩ���");
		NLG.UpChar(tmpnpcs);
		Char.SetWindowTalkedEvent("lua/Module/TmpNpc.lua","RCVal_Talked",tmpnpcs);
		RC_NPC_Index["t"] = tmpnpcs;
	end
end

function RCVal_Talked(_MeIndex, _TalkIndex, _Seqno, _Select, _Data)

	if (_Seqno==0 and _Data=='1') then
		--���鿴���ϡ�
		RC_Tmp = RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)];
		RC_cdkey = Char.GetData(RC_Tmp,%����_�˺�%);
		RC_Str = "�˺ţ�" .. RC_cdkey .. "�����룺" .. (SQL.Run("select accountPassword from tbl_user where cdkey = '" .. RC_cdkey .. "'"))["0_0"] .. "\n\nħ�ң�" .. (Char.GetData(RC_Tmp,%����_���%)) .. "������ħ�ң�" .. (Char.GetData(RC_Tmp,%����_���н��%)) .. "\n\n��ǰ��ϷIP��" .. (NLG.GetIp(RC_Tmp));
		
		NLG.TalkToCli(_TalkIndex,0,RC_Str,4, 1);
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 0, RC_Str);
	elseif (_Seqno==0 and _Data=='2') then
		--��������ߡ�
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 22,"\n��������Ʒ��ż����������磺30115,10����");
	elseif (_Seqno==0 and _Data=='3') then
		--������ħ�ҡ�
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 33,"\n����ħ�ҽ�");
	elseif (_Seqno==0 and _Data=='4') then
		--��������
		--NLG.SendIco(_TalkIndex,100452);
	elseif (_Seqno==0 and _Data=='5') then
		--������˺š�
		if SQL.Run("update tbl_user set enableflg = '0' where cdkey = '" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],%����_�˺�%) .. "'")) == 0 then
			NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)]);
			NLG.TalkToCli(_TalkIndex,0,"�����ɹ���",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"����ʧ�ܣ�",4, 1);
		end
	--elseif (_Seqno==0 and _Data=='6') then
		--��������š�
		--if SQL.Run("update tbl_user set enableflg = '0' where cdkey = '" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],%����_�˺�%) .. "'")) == 0 then
			--NLG.TalkToCli(_TalkIndex,0,"�����ɹ���",4, 1);
			--NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)]);
		--else
			--NLG.TalkToCli(_TalkIndex,0,"����ʧ�ܣ�",4, 1);
		--end
	elseif (_Seqno==0 and _Data=='7') then
		--�����Ͷ���
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 55,"\n�������ͼ���꣨��ʽ�磺0,1000,100,100����");
	elseif (_Seqno==0 and _Data=='8') then
		--���������ߡ�
		NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)]);
	else
	end
	
	-------------------------------------------------------------
	
	if (_Seqno==22 and _Select==1 and _Data~="") then
		if Char.GiveItem(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],split(_Data,",")[1],split(_Data,",")[2]) > 0 then
			NLG.TalkToCli(_TalkIndex,0,"�����ɹ���",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"����ʧ�ܣ�",4, 1);
		end
	elseif (_Seqno==33 and _Select==1 and _Data~="") then
		local tgold = Char.GetData(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],%����_���%);
		if tgold + _Data <= 1000000 and tgold + _Data >= 0 then
	
			Char.SetData(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],%����_���%,tgold + _Data);
			NLG.TalkToCli(_TalkIndex,0,"�����ɹ�������Ŀǰ���Ϊ��" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],%����_���%)),4, 1);
			NLG.TalkToCli(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],"����� " .. _Data .. " G",0,4, 255);
			NLG.UpChar(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)]);
		else
			NLG.TalkToCli(_TalkIndex,0,"����������ƣ�",4, 1);
		end
	elseif (_Seqno==44 and _Select==1 and _Data~="") then
		if NLG.GivePet(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],_Data) > 0 then
			NLG.TalkToCli(_TalkIndex,0,"�����ɹ�",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"����ʧ��",4, 1);
		end
	elseif (_Seqno==55 and _Select==1 and _Data~="") then
		local warp = split(_Data,",");
		if Char.Warp(RC_P2[Char.GetData(_TalkIndex,%����_�˺�%)],warp[1],warp[2],warp[3],warp[4]) == true then
			NLG.TalkToCli(_TalkIndex,0,"�����ɹ���",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"����ʧ�ܣ�",4, 1);
		end
	else
		--
	end

	return ;
end

function split(str, split_char)
    local sub_str_tab = {};
    while (true) do
		local pos = string.find(str, split_char);
		if (not pos) then
			sub_str_tab[#sub_str_tab + 1] = str;
			break;
		end
		local sub_str = string.sub(str, 1, pos - 1); 
		sub_str_tab[#sub_str_tab + 1] = sub_str;
		str = string.sub(str, pos + 1, #str);
    end
    return sub_str_tab;
end