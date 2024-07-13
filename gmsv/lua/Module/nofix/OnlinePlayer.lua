table_laba={};
table_dlcs={};
tbl_player={};
tbl_playername={};
tbl_hanging={}
if type(Players)~="table" then Players={} end
if type(tab_laba)~="table" then tab_laba={} end
if type(tab_siliao)~="table" then tab_siliao={} end
if type(tab_msg)~="table" then tab_msg={} end

Delegate.RegDelLoginEvent("OnlinePlayer_LoginEvent");
Delegate.RegDelDropEvent("OnlinePlayer_DropEvent");
Delegate.RegDelLogoutEvent("OnlinePlayer_LogoutEvent");
Delegate.RegDelLoginGateEvent("OnlinePlayer_LoginGateEvent");

--登录全局事件
function OnlinePlayer_LoginEvent(_PlayerIndex)
	local Name = Char.GetData(_PlayerIndex, %对象_名字%)
	local Lv = Char.GetData(_PlayerIndex, %对象_等级%)
	--NLG.SystemMessage(-1, "[二键魔力公告]欢迎 " .. Name .. "(Lv." .. Lv .. ") 登入游戏！");
	--NLG.SystemMessage(_PlayerIndex,  "[二键魔力公告]可用 /help 指令查看当前可用LuaTalk指令");
	
	--在线玩家列表
	All_Online(_PlayerIndex)

	return 1
end

--玩家离开全局事件
function OnlinePlayer_DropEvent(_PlayerIndex)

	--在线玩家列表
	All_Offline(_PlayerIndex)

	return 1
end

--玩家登出全局事件，如掉线不会触发此事件，如果要保存各种内容，请写在All_DropEvent中
function OnlinePlayer_LogoutEvent(_PlayerIndex)

	--在线玩家列表
	All_Offline(_PlayerIndex)

	Field.Set(_PlayerIndex, "yd_warp", Char.GetData(_PlayerIndex, %对象_MAP%) .. "|" .. Char.GetData(_PlayerIndex, %对象_地图%) .. "|" .. Char.GetData(_PlayerIndex, %对象_X%) .. "|" .. Char.GetData(_PlayerIndex, %对象_Y%))

	return 1
end

--玩家登出全局事件
function OnlinePlayer_LoginGateEvent(_PlayerIndex)

	return 1;
end

--------------------
--OnlineList Start--
--------------------
function All_Online(Index)
	local tPlayer = {
							CdKey = Char.GetData(Index, %对象_账号%),
							Name = Char.GetData(Index, %对象_名字%),
							Index = Index,
							LoginTime = os.time()
							}
    Players[tPlayer.CdKey] = tPlayer;
	tab_laba[tPlayer.CdKey] = Index
	tab_siliao[tPlayer.CdKey] = Index
	tab_msg[tPlayer.CdKey] = Index
	return
end

function All_Offline(Index)
	local CdKey = Char.GetData(Index,2002)
	All_OfflineCdKey(CdKey)
	return
end

function All_OfflineCdKey(CdKey)
	Players[CdKey] = nil
	tab_laba[CdKey] = nil
	tab_siliao[CdKey] = nil
	tab_msg[CdKey] = nil
	if battle_remotepk==CdKey then battle_remotepk=-2 end
	return
end
------------------
--OnlineList End--
------------------