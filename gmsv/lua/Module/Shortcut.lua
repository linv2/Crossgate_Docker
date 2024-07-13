------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
Delegate.RegInit("ShortcutNpc_Init");
Delegate.RegDelTalkEvent("Shortcut_TalkEvent");

function ShortcutNpc_Init()
	ShortcutNpc = NL.CreateNpc(nil, "Myinit");
	Char.SetData(ShortcutNpc,%对象_形象%,14722);
	Char.SetData(ShortcutNpc,%对象_原形%,14722);
	Char.SetData(ShortcutNpc,%对象_X%,30);
	Char.SetData(ShortcutNpc,%对象_Y%,35);
	Char.SetData(ShortcutNpc,%对象_地图%,777);
	Char.SetData(ShortcutNpc,%对象_方向%,4);
	Char.SetData(ShortcutNpc,%对象_名字%,"快速加点");
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
	local TalkBuf =	"4\\n◆超级加点◆" ..
			"\\n超级加点系统请谨慎使用" ..
			"\\n当前加点模式不可以突破加点限制" ..
			"\\n可以单项全部加点" ..
			"\\n『快速体力加点』" ..
			"\\n『快速力量加点』" ..
			"\\n『快速耐力加点』" ..
			"\\n『快速敏捷加点』"..
			"\\n『快速魔力加点』" 
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
	local CdKey = Char.GetData(_PlayerIndex, %对象_CDK%)
	local JBP = Char.GetData(_PlayerIndex, %对象_升级点%)
	local TL = (Char.GetData(_PlayerIndex,%对象_体力%))
	local LL = (Char.GetData(_PlayerIndex,%对象_力量%))
	local NL = (Char.GetData(_PlayerIndex,%对象_强度%))
	local MJ = (Char.GetData(_PlayerIndex,%对象_速度%))
	local MF = (Char.GetData(_PlayerIndex,%对象_魔法%))
	local lv = Char.GetData(_PlayerIndex,%对象_等级%);
	local maxd = ((lv - 1)*2)+15;
	local maxd1 = maxd*100
	--取消按钮
	if _Select==2 then
		return
	end
	
	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--查询
		if PlayerSelect==1 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,13,"\n\n\n您好,欢迎使用体力加点\n\n\n您的当前剩余可加点数为"..JBP.."\n\n\n请合理安排！",_MeIndex);
			return;
		end
		if PlayerSelect==2 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,14,"\n\n\n您好,欢迎使用力量加点\n\n\n您的当前剩余可加点数为"..JBP.."\n\n\n请合理安排！",_MeIndex);
			return;
		end
		if PlayerSelect==3 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,15,"\n\n\n您好,欢迎使用耐力加点\n\n\n您的当前剩余可加点数为"..JBP.."\n\n\n请合理安排！",_MeIndex);
			return;
		end
		if PlayerSelect==4 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,16,"\n\n\n您好,欢迎使用敏捷加点\n\n\n您的当前剩余可加点数为"..JBP.."\n\n\n请合理安排！",_MeIndex);
			return;
		end
		if PlayerSelect==5 then
			Shor_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,17,"\n\n\n您好,欢迎使用魔法加点\n\n\n您的当前剩余可加点数为"..JBP.."\n\n\n请合理安排！",_MeIndex);
			return;
		end
	end

	if(tonumber(_Seqno)==13 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%对象_体力%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[系统]超出加点范围。当前级别单项自大BP点为"..maxd.."点。")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%对象_体力%,TL+jiadian)
			Char.SetData(_PlayerIndex,%对象_升级点%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[系统]加点完成:增加体力"..dian.."点,总体力"..(TL/100)+dian.."点。")
		else
			NLG.SystemMessage(_PlayerIndex, "[系统]加点数不足，无法加点。")
		end
	end
	if(tonumber(_Seqno)==14 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%对象_力量%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[系统]超出加点范围。当前级别单项自大BP点为"..maxd.."点。")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%对象_力量%,LL+jiadian)
			Char.SetData(_PlayerIndex,%对象_升级点%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[系统]加点完成:增加体力"..dian.."点,总体力"..(LL/100)+dian.."点。")
		else
			NLG.SystemMessage(_PlayerIndex, "[系统]加点数不足，无法加点。")
		end
	end
	if(tonumber(_Seqno)==15 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%对象_强度%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[系统]超出加点范围。当前级别单项自大BP点为"..maxd.."点。")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%对象_强度%,NL+jiadian)
			Char.SetData(_PlayerIndex,%对象_升级点%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[系统]加点完成:增加体力"..dian.."点,总体力"..(NL/100)+dian.."点。")
		else
			NLG.SystemMessage(_PlayerIndex, "[系统]加点数不足，无法加点。")
		end
	end
	if(tonumber(_Seqno)==16 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%对象_速度%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[系统]超出加点范围。当前级别单项自大BP点为"..maxd.."点。")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%对象_速度%,MJ+jiadian)
			Char.SetData(_PlayerIndex,%对象_升级点%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[系统]加点完成:增加体力"..dian.."点,总体力"..(MJ/100)+dian.."点。")
		else
			NLG.SystemMessage(_PlayerIndex, "[系统]加点数不足，无法加点。")
		end
	end

	if(tonumber(_Seqno)==17 and tonumber(_Select)==%按钮_确定% and _Data~="") then
		local dian = tonumber("".._Data.."");
		local jiadian = dian*100
		local td = Char.GetData(_PlayerIndex,%对象_魔法%);
		local jd = jiadian+td
		if jd > maxd1 then
			NLG.SystemMessage(_PlayerIndex, "[系统]超出加点范围。当前级别单项自大BP点为"..maxd.."点。")
			return;
		end
		if dian <= JBP and dian >= 0 then
			Char.SetData(_PlayerIndex,%对象_魔法%,MF+jiadian)
			Char.SetData(_PlayerIndex,%对象_升级点%,JBP-dian)
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(_PlayerIndex, "[系统]加点完成:增加体力"..dian.."点,总体力"..(MF/100)+dian.."点。")
		else
			NLG.SystemMessage(_PlayerIndex, "[系统]加点数不足，无法加点。")
		end
	end
end

