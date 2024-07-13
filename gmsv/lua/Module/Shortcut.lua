------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
Delegate.RegInit("ShortcutNpc_Init");
Delegate.RegDelTalkEvent("Shortcut_TalkEvent");

function ShortcutNpc_Init()
	ShortcutNpc = NL.CreateNpc(nil, "Myinit");
	Char.SetData(ShortcutNpc,%����_����%,14722);
	Char.SetData(ShortcutNpc,%����_ԭ��%,14722);
	Char.SetData(ShortcutNpc,%����_X%,30);
	Char.SetData(ShortcutNpc,%����_Y%,35);
	Char.SetData(ShortcutNpc,%����_��ͼ%,777);
	Char.SetData(ShortcutNpc,%����_����%,4);
	Char.SetData(ShortcutNpc,%����_����%,"���ټӵ�");
	NLG.UpChar(ShortcutNpc);
	tbl_ShortcutNpc = tbl_ShortcutNpc or {}
	tbl_ShortcutNpc["ShortcutNpc"] = ShortcutNpc;
	Char.SetTalkedEvent(nil, "ShortcutNpc_Talked", ShortcutNpc);
	Char.SetWindowTalkedEvent(nil, "ShortcutNpc_WindowTalked", ShortcutNpc);
	return true;
end

function Myinit(_MeIndex)
	return true;
end

function ShortcutNpc_Talked( _MeIndex, _PlayerIndex, _Mode)
	local TalkBuf =	"4\\n�������ӵ��" ..
			"\\n�����ӵ�ϵͳ�����ʹ��" ..
			"\\n��ǰ�ӵ�ģʽ������ͻ�Ƽӵ�����" ..
			"\\n���Ե���ȫ���ӵ�" ..
			"\\n�����������ӵ㡻" ..
			"\\n�����������ӵ㡻" ..
			"\\n�����������ӵ㡻" ..
			"\\n���������ݼӵ㡻"..
			"\\n������ħ���ӵ㡻" 
	TalkBuf =Shor_GAMsgFormat(TalkBuf);
	Shor_ShowGAWindowTalk(_PlayerIndex, 2, 2, 1,TalkBuf,_MeIndex);
	return ;
end

function Shor_ShowGAWindowTalk(_PlayerIndex,_Window, _Select,_Seqno,_Data,_MePtr)
	return NLG.ShowWindowTalked(_PlayerIndex,_MePtr,_Window,_Select,_Seqno,_Data);
end

function Shor_GAMsgFormat(Msg)
	local tMsg = Split(Msg,"\\n")
	local NewMsg=""
	for i=1,#tMsg do
		if tMsg[i]~="" and string.find(tMsg[i],"|")==nil then
			NewMsg=NewMsg..Shor_strFormat(tMsg[i],45,2).."\\n"
		else
			NewMsg=NewMsg..tMsg[i].."\\n"
		end
		
	end
	return NewMsg
end

function Shor_strFormat(str,str_len,str_type)
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

function Shortcut_TalkEvent(player,msg,color,range,size)
	if msg == "[ksjd]" then
		ShortcutNpc_Talked(tbl_ShortcutNpc["ShortcutNpc"], player, 0, 0, 0)
	end
end

function ShortcutNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	local CdKey = Char.GetData(_PlayerIndex, %����_CDK%)
	local JBP = Char.GetData(_PlayerIndex, %����_������%)
	local TL = (Char.GetData(_PlayerIndex,%����_����%))
	local LL = (Char.GetData(_PlayerIndex,%����_����%))
	local NL = (Char.GetData(_PlayerIndex,%����_ǿ��%))
	local MJ = (Char.GetData(_PlayerIndex,%����_�ٶ�%))
	local MF = (Char.GetData(_PlayerIndex,%����_ħ��%))
	local lv = Char.GetData(_PlayerIndex,%����_�ȼ�%);
	local maxd = ((lv - 1)*2)+15;
	local maxd1 = maxd*100
	--ȡ����ť
	if _Select==2 then
		return
	end
	
	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--��ѯ
		if PlayerSelect==1 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,13,"\n\n\n����,��ӭʹ�������ӵ�\n\n\n���ĵ�ǰʣ��ɼӵ���Ϊ"..JBP.."\n\n\n������ţ�",_MeIndex);
			return;
		end
		if PlayerSelect==2 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,14,"\n\n\n����,��ӭʹ�������ӵ�\n\n\n���ĵ�ǰʣ��ɼӵ���Ϊ"..JBP.."\n\n\n������ţ�",_MeIndex);
			return;
		end
		if PlayerSelect==3 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,15,"\n\n\n����,��ӭʹ�������ӵ�\n\n\n���ĵ�ǰʣ��ɼӵ���Ϊ"..JBP.."\n\n\n������ţ�",_MeIndex);
			return;
		end
		if PlayerSelect==4 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,16,"\n\n\n����,��ӭʹ�����ݼӵ�\n\n\n���ĵ�ǰʣ��ɼӵ���Ϊ"..JBP.."\n\n\n������ţ�",_MeIndex);
			return;
		end
		if PlayerSelect==5 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%��ť_ȷ��%,17,"\n\n\n����,��ӭʹ��ħ���ӵ�\n\n\n���ĵ�ǰʣ��ɼӵ���Ϊ"..JBP.."\n\n\n������ţ�",_MeIndex);
			return;
		end
	end

	if(tonumber(_Seqno)==13 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%����_����%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�����ӵ㷶Χ����ǰ�������Դ�BP��Ϊ"..maxd.."�㡣")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%����_����%,TL+jiadian)
			Char.SetData(_PlayerIndex,%����_������%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ����:��������"..dian.."��,������"..(TL/100)+dian.."�㡣")
		else
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ������㣬�޷��ӵ㡣")
		end
	end
	if(tonumber(_Seqno)==14 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%����_����%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�����ӵ㷶Χ����ǰ�������Դ�BP��Ϊ"..maxd.."�㡣")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%����_����%,LL+jiadian)
			Char.SetData(_PlayerIndex,%����_������%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ����:��������"..dian.."��,������"..(LL/100)+dian.."�㡣")
		else
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ������㣬�޷��ӵ㡣")
		end
	end
	if(tonumber(_Seqno)==15 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%����_ǿ��%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�����ӵ㷶Χ����ǰ�������Դ�BP��Ϊ"..maxd.."�㡣")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%����_ǿ��%,NL+jiadian)
			Char.SetData(_PlayerIndex,%����_������%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ����:��������"..dian.."��,������"..(NL/100)+dian.."�㡣")
		else
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ������㣬�޷��ӵ㡣")
		end
	end
	if(tonumber(_Seqno)==16 and tonumber(_Select)==%��ť_ȷ��% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%����_�ٶ�%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�����ӵ㷶Χ����ǰ�������Դ�BP��Ϊ"..maxd.."�㡣")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%����_�ٶ�%,MJ+jiadian)
			Char.SetData(_PlayerIndex,%����_������%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ����:��������"..dian.."��,������"..(MJ/100)+dian.."�㡣")
		else
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ������㣬�޷��ӵ㡣")
		end
	end

	if(tonumber(_Seqno)==17 and tonumber(_Select)==%��ť_ȷ��% and _Data~="") then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%����_ħ��%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�����ӵ㷶Χ����ǰ�������Դ�BP��Ϊ"..maxd.."�㡣")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%����_ħ��%,MF+jiadian)
			Char.SetData(_PlayerIndex,%����_������%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ����:��������"..dian.."��,������"..(MF/100)+dian.."�㡣")
		else
			NLG.SystemMessage(_PlayerIndex, "[ϵͳ]�ӵ������㣬�޷��ӵ㡣")
		end
	end
end

