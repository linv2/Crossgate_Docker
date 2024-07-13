local NpcName = "计时驱魔香"		--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 999, 16, 18}			--Npc地图坐标
local NpcImage = 101022						--Npc图档101022
local NpcDir = 6							--Npc方向（0为左上，顺时针转）
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
--驱魔香物品设置
local TohelosItemID = 9700249
local TohelosItemName = "计时驱魔香（10分钟）"
local TohelosTime = 10

local TohelosItemIDB = 9700248
local TohelosItemNameB = "计时驱魔香（5分钟）"
local TohelosTimeB = 5

local TohelosItemIDC = 9700247
local TohelosItemNameC = "计时驱魔香（2分钟）"
local TohelosTimeC = 2

local TohelosPlayer = {}
------------------------------------------------------------------------------

function TohelosNpc_Func(index)
	return 1;
end

Delegate.RegInit("TohelosNpc_Init");
function TohelosNpc_Init()
	local TohelosNpc = NL.CreateNpc("lua/Module/Tohelos.lua", "TohelosNpc_Func");
	Char.SetData( TohelosNpc, %对象_形象%, NpcImage);
	Char.SetData( TohelosNpc, %对象_原形%, NpcImage);
	Char.SetData( TohelosNpc, %对象_地图%, NpcMapPos[2]);
	Char.SetData( TohelosNpc, %对象_X%, NpcMapPos[3]);
	Char.SetData( TohelosNpc, %对象_Y%, NpcMapPos[4]);
	Char.SetData( TohelosNpc, %对象_方向%, NpcDir);
	Char.SetData( TohelosNpc, %对象_名字%, NpcName);
	NLG.UpChar(TohelosNpc)

	tbl_LuaNpcIndex = tbl_LuaNpcIndex or {}
	tbl_LuaNpcIndex["TohelosNpc"] = TohelosNpc

	Char.SetWindowTalkedEvent("lua/Module/Tohelos.lua", "TohelosNpc_WindowTalked", TohelosNpc)
end


Delegate.RegDelLogoutEvent("TohelosNpc_LogoutEvent");
function TohelosNpc_LogoutEvent(_PlayerIndex)
	TohelosNpc_ChangeStat(_PlayerIndex, 0)
	return 1
end


NL.RegItemString(nil, "TohelosNpc_ItemUse", "LUA_useTohelosQ");
function TohelosNpc_ItemUse(_PlayerIndex, _ToPlayerIndex, _Slot)
	local _itemindex = Char.GetItemIndex(_PlayerIndex,_Slot);
	local _itemID = Item.GetData(_itemindex,%道具_序%);
	if (_itemID == TohelosItemID) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 10, 0, 0)
	end

	if (_itemID == TohelosItemIDB) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 20, 0, 0)
	end

	if (_itemID == TohelosItemIDC) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 30, 0, 0)
	end
	return 1
end


function TohelosNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	--取消按钮
	if _Select==2 or _Seqno==99999 then
		return
	end

	if _Seqno==10 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
		local TohelosHour = math.floor((TohelosTime*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTime*TohelosItemNum, 60))
		local TohelosStat = "开启"
		if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0 then
			TohelosStat = "关闭"
		end
		
		--Show WinTalk
		local TalkMsg = "　　　　　　　　◆" .. NpcName .. "◆" ..
						"\n" ..
						"\n感谢你的支持，当前系统信息如下：" ..
						"\n" .. os.date("%X") ..
						"\n[物品消耗]：每" .. TohelosTime .. "分钟1个" .. TohelosItemName .. "(先扣除后计时)" ..
						"\n[剩余数量]：" .. TohelosItemName .. TohelosItemNum .. "个(大约使用" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)" ..
						"\n[使用状态]：" .. TohelosStat .. "　　　(点[确定]按钮修改状态)" ..
						"\n" .. 
						"\n操作提示：" .. 
						"\n点[确定]控制驱魔使用状态开关，点[取消]关闭窗口"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 1, TalkMsg);
		return 1
	end

	if _Seqno==20 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
		local TohelosHour = math.floor((TohelosTimeB*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTimeB*TohelosItemNum, 60))
		local TohelosStat = "开启"
		if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0 then
			TohelosStat = "关闭"
		end
		
		--Show WinTalk
		local TalkMsg = "　　　　　　　　◆" .. NpcName .. "◆" ..
						"\n" ..
						"\n感谢你的支持，当前系统信息如下：" ..
						"\n" .. os.date("%X") ..
						"\n[物品消耗]：每" .. TohelosTimeB .. "分钟1个" .. TohelosItemNameB .. "(先扣除后计时)" ..
						"\n[剩余数量]：" .. TohelosItemNameB .. TohelosItemNum .. "个(大约使用" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)" ..
						"\n[使用状态]：" .. TohelosStat .. "　　　(点[确定]按钮修改状态)" ..
						"\n" .. 
						"\n操作提示：" .. 
						"\n点[确定]控制驱魔使用状态开关，点[取消]关闭窗口"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 2, TalkMsg);
		return 1
	end

	if _Seqno==30 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
		local TohelosHour = math.floor((TohelosTimeC*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTimeC*TohelosItemNum, 60))
		local TohelosStat = "开启"
		if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0 then
			TohelosStat = "关闭"
		end
		
		--Show WinTalk
		local TalkMsg = "　　　　　　　　◆" .. NpcName .. "◆" ..
						"\n" ..
						"\n感谢你的支持，当前系统信息如下：" ..
						"\n" .. os.date("%X") ..
						"\n[物品消耗]：每" .. TohelosTimeC .. "分钟1个" .. TohelosItemNameC .. "(先扣除后计时)" ..
						"\n[剩余数量]：" .. TohelosItemNameC .. TohelosItemNum .. "个(大约使用" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)" ..
						"\n[使用状态]：" .. TohelosStat .. "　　　(点[确定]按钮修改状态)" ..
						"\n" .. 
						"\n操作提示：" .. 
						"\n点[确定]控制驱魔使用状态开关，点[取消]关闭窗口"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 3, TalkMsg);
		return 1
	end

	--【确定】
	if _Seqno==1 and _Select==1 then
		TohelosNpc_ChangeStat(_PlayerIndex)
		return 1
	end

	if _Seqno==2 and _Select==1 then
		TohelosNpc_ChangeStatB(_PlayerIndex)
		return 1
	end

	if _Seqno==3 and _Select==1 then
		TohelosNpc_ChangeStatC(_PlayerIndex)
		return 1
	end
end

function TohelosNpc_ChangeStat(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1) then
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已关闭.")
		--NLG.UpChar(_PlayerIndex)
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemID, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 你的" .. TohelosItemName .. "数量不足，无法启动.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_Loop", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已开启，你全身散发出让给魔物讨厌的气味...  " .. os.date("%X"))
		--NLG.UpChar(_PlayerIndex)
		return 1
	end
	
end

function TohelosNpc_Loop(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTime*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemID, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemName .. "已全部用完，系统自动关闭  " .. os.date("%X"))
				TohelosNpc_ChangeStat(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTime*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTime*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemName .. "还剩" .. TohelosItemNum-1 .. "个(大约" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)  " .. os.date("%X"))
		end
	end
	return 1
end

function TohelosNpc_ChangeStatB(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1) then
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已关闭.")
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDB, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 你的" .. TohelosItemNameB .. "数量不足，无法启动.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_LoopB", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已开启，你全身散发出让给魔物讨厌的气味...  " .. os.date("%X"))
		return 1
	end
	
end

function TohelosNpc_LoopB(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTimeB*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDB, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemNameB .. "已全部用完，系统自动关闭  " .. os.date("%X"))
				TohelosNpc_ChangeStatB(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTimeB*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTimeB*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemNameB .. "还剩" .. TohelosItemNum-1 .. "个(大约" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)  " .. os.date("%X"))
		end
	end
	return 1
end

function TohelosNpc_ChangeStatC(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1) then
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已关闭.")
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDC, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 你的" .. TohelosItemNameC .. "数量不足，无法启动.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_LoopC", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %对象_不遇敌开关%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] 使用状态已开启，你全身散发出让给魔物讨厌的气味...  " .. os.date("%X"))
		return 1
	end
	
end

function TohelosNpc_LoopC(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %对象_不遇敌开关%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTimeC*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDC, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemNameC .. "已全部用完，系统自动关闭  " .. os.date("%X"))
				TohelosNpc_ChangeStatC(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTimeC*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTimeC*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的" .. TohelosItemNameC .. "还剩" .. TohelosItemNum-1 .. "个(大约" .. TohelosHour .. "小时" .. TohelosMinute .. "分钟)  " .. os.date("%X"))
		end
	end
	return 1
end