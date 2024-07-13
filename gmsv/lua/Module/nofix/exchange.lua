------------------------------------金币魔币兑换参数设定------------------------------------------
金币 = 10000  --金币初始价格
金币比例 = 1  ---购买金币初始比例
魔币比例 = 1  ---兑换魔币初始比例
魔币兑换档次 = 0  --勿动
金卡兑换档次 = 0  --勿动
档次 = {} --勿动
档次[0] = {0} --档次和增加比例
档次[1] = {0.1}
档次[2] = {0.2}
档次[3] = {0.3}
档次[4] = {0.4}
档次[5] = {0.5}
金币总数 = 0 --勿动
魔币总数 = 0 --勿动
日期 = 0 --勿动
兑换金币ID = 999999 --兑换金币的ID
一档最大魔币 = 50000000  ---魔币档次最大值设定
二档最大魔币 = 100000000
三档最大魔币 = 200000000
四档最大魔币 = 500000000
五档最大魔币 = 1000000000
一档最大金币 = 1000  ---金卡档次最大值设定
二档最大金币 = 2000
三档最大金币 = 5000
四档最大金币 = 10000
五档最大金币 = 20000
exchange指令 = "[dhy]"  --快捷指令
exchangeNPC位置 ={100454,1000,246,84,6,"金币魔币兑换员"}  ---NPC位置设定
function exchangeNpc_CallBack(_meIndex)
	local rq = tonumber(os.date("%d", os.time()))
	if rq ~= 日期 then
		金币总数 = 5000   --每天兑换金币总数
		魔币总数 = 500000000 --每天兑换魔币总数
		日期 = rq
	end
end
魔币上限 = 5000000
--------------------------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
Delegate.RegInit("exchangeNpc_Init");
Delegate.RegDelTalkEvent("exchange_TalkEvent");
function exchangeNpc_Init()
	exchangeNpc = NL.CreateNpc(nil, "Myinit");
	Char.SetData(exchangeNpc,%对象_形象%,exchangeNPC位置[1]);
	Char.SetData(exchangeNpc,%对象_原形%,exchangeNPC位置[1]);
	Char.SetData(exchangeNpc,%对象_X%,exchangeNPC位置[3]);
	Char.SetData(exchangeNpc,%对象_Y%,exchangeNPC位置[4]);
	Char.SetData(exchangeNpc,%对象_地图%,exchangeNPC位置[2]);
	Char.SetData(exchangeNpc,%对象_方向%,exchangeNPC位置[5]);
	Char.SetData(exchangeNpc,%对象_名字%,exchangeNPC位置[6]);
	NLG.UpChar(exchangeNpc)
	Char.SetData(exchangeNpc, %对象_名色%, 4)
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
	local jb1 = SQL.Run("select sum(ITEM_REMAIN) from `tbl_item` WHERE `ITEM_ID`='"..兑换金币ID.."'") ["0_0"]
	local jb3 = tonumber(jb1 or 0)
	if mb3 >= 0 and mb3 <= 一档最大魔币 then
		魔币兑换档次 = 0
	end
	if mb3 >= 一档最大魔币 and mb3 <= 二档最大魔币 then
		魔币兑换档次 = 1
	end
	if mb3 >= 二档最大魔币 and mb3 <= 三档最大魔币 then
		魔币兑换档次 = 2
	end
	if mb3 >= 三档最大魔币 and mb3 <= 四档最大魔币 then
		魔币兑换档次 = 3
	end
	if mb3 >= 四档最大魔币 and mb3 <= 五档最大魔币 then
		魔币兑换档次 = 4
	end
	if mb3 >= 五档最大魔币 then
		魔币兑换档次 = 5
	end
	if jb3 >= 0 and jb3 <= 一档最大金币 then
		金卡兑换档次 = 0
	end
	if jb3 >= 一档最大金币 and jb3 <= 二档最大金币 then
		金卡兑换档次 = 1
	end
	if jb3 >= 二档最大金币 and jb3 <= 三档最大金币 then
		金卡兑换档次 = 2
	end
	if jb3 >= 三档最大金币 and jb3 <= 四档最大金币 then
		金卡兑换档次 = 3
	end
	if jb3 >= 四档最大金币 and jb3 <= 五档最大金币 then
		金卡兑换档次 = 4
	end
	if jb3 >= 五档最大金币 then
		金卡兑换档次 = 5
	end
	local mbsjbl = 档次[魔币兑换档次][1]
	local jksjbl = 档次[金卡兑换档次][1]
	local dqjbbl = 金币比例 + jksjbl
	local dqjbjg = 金币*dqjbbl
	local dqmbbl = 魔币比例 - mbsjbl
	local dqmbjg = 金币*dqmbbl
	local TalkBuf =	"7\\n◆全服魔币总数【"..mb3.."】◆" ..
			"\\n◆全服金卡总数【"..jb3.."】◆" ..
			"\\n魔币兑换为【"..魔币兑换档次.."】档-金卡兑换为【"..金卡兑换档次.."】档" ..
			"\\n当前魔币购买金币价格为【"..dqjbjg.."】" ..
			"\\n位当前金币兑换魔币价格为【"..dqmbjg.."】" ..
			"\\n当前剩余金币兑换数量【"..金币总数.."】" ..
			"\\n当前剩余魔币兑换数量【"..魔币总数.."】" ..
			"\\n『魔币购买金币』"..
			"\\n『金币兑换魔币』" 
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
参数一：传入的字符串
参数二：放置的空间长度
参数三：1：居左，2：居中，3：居右
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
	if msg == exchange指令 then
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
	local jb1 = SQL.Run("select sum(ITEM_REMAIN) from `tbl_item` WHERE `ITEM_ID`='"..兑换金币ID.."'") ["0_0"]
	local jb3 = tonumber(jb1 or 0)
	if mb3 >= 0 and mb3 <= 一档最大魔币 then
		魔币兑换档次 = 0
	end
	if mb3 >= 一档最大魔币 and mb3 <= 二档最大魔币 then
		魔币兑换档次 = 1
	end
	if mb3 >= 二档最大魔币 and mb3 <= 三档最大魔币 then
		魔币兑换档次 = 2
	end
	if mb3 >= 三档最大魔币 and mb3 <= 四档最大魔币 then
		魔币兑换档次 = 3
	end
	if mb3 >= 四档最大魔币 and mb3 <= 五档最大魔币 then
		魔币兑换档次 = 4
	end
	if mb3 >= 五档最大魔币 then
		魔币兑换档次 = 5
	end
	if jb3 >= 0 and jb3 <= 一档最大金币 then
		金卡兑换档次 = 0
	end
	if jb3 >= 一档最大金币 and jb3 <= 二档最大金币 then
		金卡兑换档次 = 1
	end
	if jb3 >= 二档最大金币 and jb3 <= 三档最大金币 then
		金卡兑换档次 = 2
	end
	if jb3 >= 三档最大金币 and jb3 <= 四档最大金币 then
		金卡兑换档次 = 3
	end
	if jb3 >= 四档最大金币 and jb3 <= 五档最大金币 then
		金卡兑换档次 = 4
	end
	if jb3 >= 五档最大金币 then
		金卡兑换档次 = 5
	end
	local mbsjbl = 档次[魔币兑换档次][1]
	local jksjbl = 档次[金卡兑换档次][1]
	local dqjbbl = 金币比例 + jksjbl
	local dqjbjg = 金币*dqjbbl
	local dqmbbl = 魔币比例 - mbsjbl
	local dqmbjg = 金币*dqmbbl
	--取消按钮
	if _Select==2 then
		return
	end
	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--查询
		if PlayerSelect==1 then
			Against_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,14,"\n当前是魔币购买金币，\n\n当前购买价格为【"..dqjbjg.."】魔币一个金币。\n\n当前剩余兑换金币量为【"..金币总数.."】\n\n请输入购买金币数量",_MeIndex);
			return	
		end
		if PlayerSelect==2 then
			Against_ShowGAWindowTalk(_PlayerIndex,1,%按钮_确定%,15,"\n当前是金币购买魔币，\n\n当前购买价格为一金币兑换【"..dqmbjg.."】魔币。\n\n当前剩余兑换魔币量为【"..魔币总数.."】\n\n请输入金币兑换魔币数量",_MeIndex);
			return;
		end
	end
	if(tonumber(_Seqno)==14 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local Wei = tonumber("".._Data.."");
		if Wei > 金币总数 then
			NLG.SystemMessage(_PlayerIndex, "[系统]当前兑换金币总数超过了剩余兑换数，无法兑换。")
			return;
		end
		local money = Char.GetData(_PlayerIndex,%对象_金币%);
		local xhmb = Wei*dqjbjg
		if xhmb > money then
			NLG.SystemMessage(_PlayerIndex, "[系统]您的魔币不足兑换你输入的数量。")
			return;
		end
		if xhmb <= money then
			Char.SetData(_PlayerIndex,%对象_金币%,money-xhmb);
			Char.GiveItem(_PlayerIndex,兑换金币ID,Wei)
			金币总数 = 金币总数-Wei
			NLG.UpChar(_PlayerIndex);
		end
	end
	if(tonumber(_Seqno)==15 and tonumber(_Select)==%按钮_确定% and _Data~="")then
		local Wei = tonumber("".._Data.."");
		local ItemNUM = Char.ItemNum(_PlayerIndex,兑换金币ID)
		local money = Char.GetData(_PlayerIndex,%对象_金币%);
		if Wei > ItemNUM then
			NLG.SystemMessage(_PlayerIndex, "[系统]您的金币不足，无法兑换你输入的数量。")
			return;
		end
		local dhmb = Wei*dqmbjg
		local moneysx = money + dhmb
		if moneysx > 魔币上限 then
			NLG.SystemMessage(_PlayerIndex, "[系统]您的魔币加兑换魔币已超上限无法兑换。上限为【"..魔币上限.."】")
			return;
		end
		if dhmb > 魔币总数 then
			NLG.SystemMessage(_PlayerIndex, "[系统]您兑换的魔币总数大于剩余魔币总数。")
			return;
		end
		if Wei <= ItemNUM and dhmb <= 魔币总数 then
			Char.DelItem(_PlayerIndex,兑换金币ID,Wei)
			Char.SetData(_PlayerIndex,%对象_金币%,money+dhmb);
			NLG.SystemMessage(_PlayerIndex, "[系统]恭喜您兑换了【"..dhmb.."】魔币")
			魔币总数 = 魔币总数 - dhmb
			NLG.UpChar(_PlayerIndex);
		end
	end
end

