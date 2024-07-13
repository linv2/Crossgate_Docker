----------------------------------------------------------------------------
--Lua高级GM指令密码
local GMPassword = "mm"
--Lua高级GM指令最低GM等级限制（1~5），0为所有非GM玩家都可以使用
local GMLevel = 1

----------------------------------------------------------------------------
--常量设置
local 常量 = {}
常量.对象 = {}
常量.对象.原名 = %对象_原名%
常量.对象.等级 = %对象_等级%
常量.对象.地图类型 = 3
常量.对象.地图 = %对象_地图%
常量.对象.X = %对象_X%
常量.对象.Y = %对象_Y%
常量.对象.账号 = 2002
常量.对象.GM = %对象_GM%
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
	--print(Char.GetData(_PlayerIndex,常量.对象.GM));
	if CheckGMPassword(TalkMsg)~=true then
		--print(CheckGMPassword(TalkMsg));
		return 0
	end

	if (Char.GetData(_PlayerIndex,常量.对象.GM)<GMLevel) then
		--NLG.SystemMessage(_PlayerIndex,"[系统] 你不是GM，无法使用此功能")
		return 0
	end

	TalkMsg = string.gsub(TalkMsg,"【","[")
	TalkMsg = string.gsub(TalkMsg,"】","]")
	TalkMsg = string.gsub(TalkMsg,"]","")
	
	if CheckCommand(TalkMsg, "公告")==true or CheckCommand(TalkMsg, "msg")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		--print(CdKey);
		local toStr = ""
		if CheckCommand(TalkMsg, "公告")==true then
			toStr = GetCommandPara(TalkMsg,"公告")
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
			--NLG.SystemMessage(_toPlayer, "[玩家公告] " .. toMsg)
			NLG.SystemMessage(Players[toCdKey]["Index"], "[玩家公告] " .. toMsg)
			NLG.SystemMessage(_PlayerIndex,"[系统] 玩家" .. Players[toCdKey]["Name"] .. "公告发放完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
				NLG.SystemMessage(-1, "[全服公告] " .. toMsg)
			NLG.SystemMessage(_PlayerIndex,"[系统] 公告发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "踢出")==true or CheckCommand(TalkMsg, "kill")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "踢出")==true then
			toStr = GetCommandPara(TalkMsg ,"踢出")[1]
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
			NLG.SystemMessage(_PlayerIndex,"[系统] 你已将 [" .. Players[toCdKey].Index .. "][" .. toCdKey .. "]" .. Players[toCdKey].Name .. " 踢出。")
			NLG.DropPlayer(Players[toCdKey].Index)
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.DropPlayer(Players[toCdKey].Index)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 已将所有玩家踢出")
		elseif toCdKey==Char.GetData(_PlayerIndex,常量.对象.账号) then
			NLG.SystemMessage(_PlayerIndex,"[系统] 不能踢出自己")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线。")
		end
		return 0
	elseif CheckCommand(TalkMsg, "鉴定")==true or CheckCommand(TalkMsg, "ju")==true then
		local Count = 0
		for ItemSlot = 8,27 do
			local ItemIndex = Char.GetItemIndex(_PlayerIndex, ItemSlot)
			if Item.GetData(ItemIndex, 63)==0 then
				Count = Count + 1
				Item.SetData(ItemIndex, 63, 1)
				NLG.SystemMessage(_PlayerIndex,"[系统] 你身上的 " .. Item.GetData(ItemIndex, 2000) .. " 已鉴定为 " .. Item.GetData(ItemIndex, 2001))
				Item.UpItem(_PlayerIndex, ItemSlot)
			end
		end
		if Count==0 then
			NLG.SystemMessage(_PlayerIndex, "[系统] 你身上没有需要鉴定的物品")
		end
		return 0
		elseif CheckCommand(TalkMsg, "清空")==true or CheckCommand(TalkMsg, "clear")==true then
		for ItemSlot = 8,27 do
			local ItemIndex = Char.GetItemIndex(_PlayerIndex, ItemSlot)
			local ItemID = Item.GetData(ItemIndex, %道具_ID%)
			Char.DelItem(_PlayerIndex, ItemID, 999999)
		end
		return 0
	elseif CheckCommand(TalkMsg, "召唤")==true or CheckCommand(TalkMsg, "call")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "召唤")==true then
			toStr = GetCommandPara(TalkMsg ,"召唤")[1]
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
			Char.Warp( Players[toCdKey].Index, Char.GetData(_PlayerIndex, 常量.对象.地图类型), Char.GetData(_PlayerIndex, 常量.对象.地图), Char.GetData(_PlayerIndex, 常量.对象.X), Char.GetData(_PlayerIndex, 常量.对象.Y))
			--NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] 你已被强制召唤到" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. " 身边")
			--NLG.SystemMessage(_PlayerIndex, "[系统] 你已强制召唤 " .. Players[toCdKey]["Name"] .. " 到身边")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				Char.Warp( Players[toCdKey].Index, Char.GetData(_PlayerIndex, 常量.对象.地图类型), Char.GetData(_PlayerIndex, 常量.对象.地图), Char.GetData(_PlayerIndex, 常量.对象.X), Char.GetData(_PlayerIndex, 常量.对象.Y))
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家召唤完毕")
		elseif toCdKey==Char.GetData(_PlayerIndex,常量.对象.账号) then
			NLG.SystemMessage(_PlayerIndex,"[系统] 不能召唤自己")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线。")
		end
		return 0
	elseif CheckCommand(TalkMsg, "跟踪")==true or CheckCommand(TalkMsg, "follow")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "跟踪")==true then
			toStr = GetCommandPara(TalkMsg ,"跟踪")[1]
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
			Char.Warp( _PlayerIndex, Char.GetData(Players[toCdKey]["Index"], 常量.对象.地图类型), Char.GetData(Players[toCdKey]["Index"], 常量.对象.地图), Char.GetData(Players[toCdKey]["Index"], 常量.对象.X), Char.GetData(Players[toCdKey]["Index"], 常量.对象.Y))
			--NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] 你已被 " .. Char.GetData(_PlayerIndex,常量.对象.原名) .. " 跟踪")
			--NLG.SystemMessage(_PlayerIndex, "[系统] 你已跟踪 " .. Players[toCdKey]["Name"] .. " 身边")
		elseif toCdKey==Char.GetData(_PlayerIndex,常量.对象.账号) then
			NLG.SystemMessage(_PlayerIndex,"[系统] 不能跟踪自己")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线。")
		end
		return 0
	elseif CheckCommand(TalkMsg, "传送")==true or CheckCommand(TalkMsg, "teleport")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "传送")==true then
			toStr = GetCommandPara(TalkMsg ,"传送")
		elseif CheckCommand(TalkMsg, "teleport")==true then
			toStr = GetCommandPara(TalkMsg ,"teleport")
		end
		local toPlayer = toStr[1]
		local toMapType = toStr[2]
		local toMapID = toStr[3]
		local toPosX = toStr[4]
		local toPosY = toStr[5]
		if toMapType==nil or toMapID==nil or toPosX==nil or toPosY==nil then
			NLG.SystemMessage(_PlayerIndex,"[系统] 参数错误，请重新输入！")
			return 0
		end
		local toCdKey = -1
		for k,v in pairs(Players) do
			if v.Index==tonumber(toPlayer) or v.Name==toPlayer or k==toPlayer then
				toCdKey=k
			end
		end
		if toCdKey~=-1 then
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行传送操作")
--			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] 传送完毕")
			Char.Warp(Players[toCdKey]["Index"], toMapType, toMapID, toPosX, toPosY)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. " 传送完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行传送操作")
--				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] 传送完毕")
				Char.Warp(Players[toCdKey]["Index"], toMapType, toMapID, toPosX, toPosY)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家传送完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "查人物")==true or CheckCommand(TalkMsg, "checkplayer")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "查人物")==true then
			toStr = GetCommandPara(TalkMsg ,"查人物")[1]
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
			buf = buf .. " " .. getJobTypeName(Char.GetData(Players[toCdKey]["Index"], %对象_职类ID%)) .. Char.GetData(Players[toCdKey]["Index"], %对象_职阶%) .. "阶"
			buf = buf .. " Lv." .. Char.GetData(Players[toCdKey]["Index"], 常量.对象.等级)
			--buf = buf .. "\n【声望战绩信息】"
			buf = buf .. strFormat("\n\n声望:" .. Char.GetData(Players[toCdKey]["Index"], %对象_声望%) .. " 战绩:" .. Char.GetData(Players[toCdKey]["Index"], %对象_DP%) .. " 幸运:" .. Char.GetData(Players[toCdKey]["Index"], %对象_运%), 30, 1)
			--buf = buf .. "\n【金币信息】"
			buf = buf .. "\n\n身上:" .. Char.GetData(Players[toCdKey]["Index"], %对象_金币%) .. "G"
			buf = buf .. " 银行:" .. Char.GetData(Players[toCdKey]["Index"], %对象_银行金币%) .. "G"
			--buf = buf .. "\n【登录信息】"
			buf = buf .. "\n\n上次离线:" .. os.date("%Y.%m.%d %X", Char.GetData(Players[toCdKey]["Index"], 148))
			buf = buf .. "\n本次登入:" .. os.date("%Y.%m.%d %X", Char.GetData(Players[toCdKey]["Index"], 600))
			--[[
			buf = buf .. "\n登录[" .. Char.GetData(Players[toCdKey]["Index"], 65) .. "，走动[" .. Char.GetData(Players[toCdKey]["Index"], %对象_走动次数%)
			buf = buf .. "，死亡" .. Char.GetData(Players[toCdKey]["Index"], %对象_死亡数%) .. "，杀敌[" .. Char.GetData(Players[toCdKey]["Index"], %对象_杀宠数%) .. "，被打[" .. Char.GetData(Players[toCdKey]["Index"], %对象_伤害数%)
			buf = buf .. "，获宠" .. Char.GetData(Players[toCdKey]["Index"], %对象_获得宠数%) .. "，生产[" .. Char.GetData(Players[toCdKey]["Index"], %对象_生产数%) .. "，封印[" .. Char.GetData(Players[toCdKey]["Index"], %对象_封印数%)
			--]]
			NLG.ShowWindowTalked( _PlayerIndex, _PlayerIndex, 37, 1, 999, buf);
		end
	elseif CheckCommand(TalkMsg, "查物品")==true or CheckCommand(TalkMsg, "查道具")==true or CheckCommand(TalkMsg, "checkitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "查物品")==true then
			toStr = GetCommandPara(TalkMsg ,"查物品")[1]
		elseif CheckCommand(TalkMsg, "查道具")==true then
			toStr = GetCommandPara(TalkMsg ,"查道具")[1]
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
			local ItemPosName = {"头部", "身体", "右手", "左手", "脚部", "饰品1", "饰品2", "水晶"}
			NLG.SystemMessage(_PlayerIndex,"玩家   [" .. Players[toCdKey]["CdKey"] .. "]   " .. Players[toCdKey]["Name"] .. " 道具清单如下：")
			NLG.SystemMessage(_PlayerIndex,"　     名称(ID)　　　　类型　　Lv　　堆叠　　　耐久")
			for i = 1,28 do
				local Pos = i-1
				local buf = ""
				local ItemIndex = Char.GetItemIndex(Players[toCdKey]["Index"], Pos)
				if ItemPosName[i]~=nil then
					buf = buf .. strFormat(ItemPosName[i],6,1) .. "："
				else
					buf = buf .. strFormat("道具" .. Pos-7,6,1) .. "："
				end
				if ItemIndex>=0 then
					buf = buf .. strFormat(Item.GetData(ItemIndex, 2001) .. "[" .. Item.GetData(ItemIndex, %道具_ID%) .. "]",18,2) .. " "	--名称
					buf = buf .. strFormat(GetItemType(Item.GetData(ItemIndex, %道具_类型%)),8,2) .. " "	--类型
					buf = buf .. strFormat(Item.GetData(ItemIndex, %道具_等级%),3,3) .. " "	--等级
					buf = buf .. strFormat(Item.GetData(ItemIndex, %道具_堆叠数%),4,3) .. "/" .. strFormat(Item.GetData(ItemIndex, %道具_最大堆叠数%),4,1) .. " "	--堆叠
					buf = buf .. strFormat(Item.GetData(ItemIndex, 65),4,3) .. "/" .. strFormat(Item.GetData(ItemIndex, %道具_最大耐久%),4,1)	--耐久
				else
					--buf = buf .. "空"
				end
				NLG.SystemMessage(_PlayerIndex, buf)
			end
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线。")
		end
		return 0
	elseif CheckCommand(TalkMsg, "查宠物")==true or CheckCommand(TalkMsg, "checkpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "查宠物")==true then
			toStr = GetCommandPara(TalkMsg ,"查宠物")[1]
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
			NLG.SystemMessage(_PlayerIndex,"[系统] 玩家 [" .. Players[toCdKey]["CdKey"] .. "]" .. Players[toCdKey]["Name"] .. " 宠物清单如下：")
			NLG.SystemMessage(_PlayerIndex,"名称(ID)　　　类型　 Lv　体　力　防　敏　魔　总")
			for i = 1,5 do
				local Pos = i-1
				local buf = ""
				local PetIndex = Char.GetPet(Players[toCdKey]["Index"], Pos)
				buf = buf .. strFormat("宠物" .. i,5,1) .. "："
				local buf1 = (Pet.GetArtRank(PetIndex, %宠档_体成%) + Pet.GetArtRank(PetIndex, %宠档_力成%) + Pet.GetArtRank(PetIndex, %宠档_强成%) + Pet.GetArtRank(PetIndex, %宠档_敏成%) + Pet.GetArtRank(PetIndex, %宠档_魔成%) - Pet.FullArtRank(PetIndex, %宠档_体成%) - Pet.FullArtRank(PetIndex, %宠档_力成%) - Pet.FullArtRank(PetIndex, %宠档_强成%) - Pet.FullArtRank(PetIndex, %宠档_敏成%) - Pet.FullArtRank(PetIndex, %宠档_魔成%));								
				if PetIndex>=0 then
					buf = buf .. strFormat(Char.GetData(PetIndex, 常量.对象.原名) .. "[" .. Char.GetData(PetIndex, 68) .. "]",18,2) .. " "	--名称
					buf = buf .. strFormat(getPetTypeName(Char.GetData(PetIndex, %对象_种族%)),4,2) .. " "	--类型
					buf = buf .. strFormat(Char.GetData(PetIndex, 常量.对象.等级),3,3) .. " "	--等级
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %宠档_体成%) - Pet.FullArtRank(PetIndex, %宠档_体成%),3,3) .. " "	--体力档数
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %宠档_力成%) - Pet.FullArtRank(PetIndex, %宠档_力成%),3,3) .. " "	--力量档数
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %宠档_强成%) - Pet.FullArtRank(PetIndex, %宠档_强成%),3,3) .. " "	--强度档数
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %宠档_敏成%) - Pet.FullArtRank(PetIndex, %宠档_敏成%),3,3) .. " "	--速度档数
					buf = buf .. strFormat(Pet.GetArtRank(PetIndex, %宠档_魔成%) - Pet.FullArtRank(PetIndex, %宠档_魔成%),3,3) .. " "	--魔法档数
					buf = buf .. strFormat(buf1,3,3)	--总档数
				else
					--buf = buf .. "空"
				end
				NLG.SystemMessage(_PlayerIndex, buf)
			end
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线。")
		end
		return 0
	elseif CheckCommand(TalkMsg, "给物品")==true or CheckCommand(TalkMsg, "给道具")==true or CheckCommand(TalkMsg, "giveitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "给物品")==true then
			toStr = GetCommandPara(TalkMsg ,"给物品")
		elseif CheckCommand(TalkMsg, "给道具")==true then
			toStr = GetCommandPara(TalkMsg ,"给道具")
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
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行给物品操作.")
			Char.GiveItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. "物品发放完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行给物品操作.")
				Char.GiveItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家物品发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "删物品")==true or CheckCommand(TalkMsg, "删道具")==true or CheckCommand(TalkMsg, "killitem")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "删物品")==true then
			toStr = GetCommandPara(TalkMsg ,"删物品")
		elseif CheckCommand(TalkMsg, "删道具")==true then
			toStr = GetCommandPara(TalkMsg ,"删道具")
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
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行删物品操作.")
			Char.DelItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. "的物品删除完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行删物品操作.")
				Char.DelItem(Players[toCdKey]["Index"], toItemID, toItemNum)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家物品发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "给宠物")==true or CheckCommand(TalkMsg, "givepet")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "给宠物")==true then
			toStr = GetCommandPara(TalkMsg ,"给宠物")
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
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM给你一只宠物.")
			Char.GivePet(Players[toCdKey]["Index"], toPetID)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. "宠物发放完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM给你一只宠物.")
				Char.GivePet(Players[toCdKey]["Index"], toPetID)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家宠物发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "给满档宠物")==true or CheckCommand(TalkMsg, "givefullpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "给满档宠物")==true then
			toStr = GetCommandPara(TalkMsg ,"给满档宠物")
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
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM给你一只满档宠物.")
			Char.GivePet(Players[toCdKey]["Index"], toPetID,1)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. "满档宠物发放完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM给你一只满档宠物.")
				Char.GivePet(Players[toCdKey]["Index"], toPetID,1)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家满档宠物发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "删宠物")==true or CheckCommand(TalkMsg, "killpet")==true then
		local CdKey = Char.GetData(_PlayerIndex,常量.对象.账号);
		local toStr = ""
		if CheckCommand(TalkMsg, "删宠物")==true then
			toStr = GetCommandPara(TalkMsg ,"删宠物")
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
			NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行删宠物操作.")
			Char.DelPet(Players[toCdKey]["Index"], toPetID, toLevel, toMode)
			NLG.SystemMessage(_PlayerIndex,"[系统] " .. Players[toCdKey]["Name"] .. "的物品删除完毕")
		elseif toPlayer=="all" or toPlayer=="All" or toPlayer=="全部" or toPlayer=="全" or toPlayer=="-1" or toPlayer==-1 or toPlayer=="*" then
			local rt = ""
			for k,v in pairs(Players) do
				toCdKey=k
				NLG.SystemMessage(Players[toCdKey]["Index"], "[系统] GM对你进行删宠物操作.")
				Char.DelPet(Players[toCdKey]["Index"], toPetID, toLevel, toMode)
			end
			NLG.SystemMessage(_PlayerIndex,"[系统] 所有在线玩家物品发放完毕")
		else
			NLG.SystemMessage(_PlayerIndex,"[系统] 没有找到该玩家或该玩家不在线")
		end
		return 0
	elseif CheckCommand(TalkMsg, "高级在线")==true or CheckCommand(TalkMsg, "list")==true or CheckCommand(TalkMsg, "l")==true then
		NLG.SystemMessage(_PlayerIndex, "[高级在线玩家列表] 清单如下：");
		for Key,Value in pairs(Players) do
			local tName = Char.GetData(Value.Index, 常量.对象.原名)   --Name
			local tLv = Char.GetData(Value.Index, 常量.对象.等级)    --Lv
			local tMapName = ""
			if Char.GetData(Value.Index, 常量.对象.地图类型)==0 then
				tMapName = getMapName(Char.GetData(Value.Index, 常量.对象.地图))
			elseif Char.GetData(Value.Index, 常量.对象.地图类型)==1 then
				tMapName = "随机迷宫"
			elseif Char.GetData(Value.Index, 常量.对象.地图类型)==2 then
				tMapName = "出租屋"
			else
				tMapName = "未知"
			end
			local tMapPos = Char.GetData(Value.Index, 常量.对象.地图类型) .. "." .. Char.GetData(Value.Index, 常量.对象.地图) .. "." .. Char.GetData(Value.Index, 常量.对象.X) .. "." .. Char.GetData(Value.Index, 常量.对象.Y)
			local BattleStat = ""
			if Char.GetData(Value.Index, 8000)==true then BattleStat=" *战斗中*" end
			NLG.SystemMessage(_PlayerIndex, "[" .. Value.Index .. "][" .. Value.CdKey .. "]" .. tName .. "(Lv." .. tLv .. ") At " .. tMapName .. " [" .. tMapPos .. "] " .. BattleStat);
		end
		return 0
	elseif CheckCommand(TalkMsg, "地图在线")==true or CheckCommand(TalkMsg, "maplist")==true or CheckCommand(TalkMsg, "ml")==true then
		NLG.SystemMessage(_PlayerIndex, "[高级在线玩家列表] 清单如下：");
		for Key,Value in pairs(Players) do
			if Char.GetData(_PlayerIndex, 常量.对象.地图类型)==Char.GetData(Value.Index, 常量.对象.地图类型) and Char.GetData(_PlayerIndex, 常量.对象.地图)==Char.GetData(Value.Index, 常量.对象.地图) then
				local tName = Char.GetData(Value.Index, 常量.对象.原名)   --Name
				local tLv = Char.GetData(Value.Index, 常量.对象.等级)    --Lv
				local tMapName = ""
				if Char.GetData(Value.Index, 常量.对象.地图类型)==0 then
					tMapName = getMapName(Char.GetData(Value.Index, 常量.对象.地图))
				elseif Char.GetData(Value.Index, 常量.对象.地图类型)==1 then
					tMapName = "随机迷宫"
				elseif Char.GetData(Value.Index, 常量.对象.地图类型)==2 then
					tMapName = "出租屋"
				else
					tMapName = "未知"
				end
				local pMapID = Char.GetData(_PlayerIndex, 常量.对象.地图)
				local tMapPos = Char.GetData(Value.Index, 常量.对象.地图类型) .. "." .. Char.GetData(Value.Index, 常量.对象.地图) .. "." .. Char.GetData(Value.Index, 常量.对象.X) .. "." .. Char.GetData(Value.Index, 常量.对象.Y)
				local BattleStat = ""
				if Char.GetData(Value.Index, 8000)==true then BattleStat=" *战斗中*" end
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
	ItemTypeName[1]="剑"
	ItemTypeName[2]="斧"
	ItemTypeName[3]="枪"
	ItemTypeName[4]="杖"
	ItemTypeName[5]="弓"
	ItemTypeName[6]="小刀"
	ItemTypeName[7]="回力"
	ItemTypeName[8]="盾"
	ItemTypeName[9]="头盔"
	ItemTypeName[10]="帽子"
	ItemTypeName[11]="铠"
	ItemTypeName[12]="衣"
	ItemTypeName[13]="袍"
	ItemTypeName[14]="靴"
	ItemTypeName[15]="鞋"
	ItemTypeName[16]="手环"
	ItemTypeName[17]="乐器"
	ItemTypeName[18]="项链"
	ItemTypeName[19]="戒指"
	ItemTypeName[20]="拳套"
	ItemTypeName[21]="耳环"
	ItemTypeName[22]="头饰"
	ItemTypeName[23]="水晶"
	ItemTypeName[24]="料理"
	ItemTypeName[25]="家具"
	ItemTypeName[26]="神秘之物"
	ItemTypeName[27]="任务道具"
	ItemTypeName[28]="宝箱"
	ItemTypeName[29]="钥匙"
	ItemTypeName[30]="矿"
	ItemTypeName[31]="木材"
	ItemTypeName[32]="布"
	ItemTypeName[33]="肉类"
	ItemTypeName[34]="鱼"
	ItemTypeName[35]="蔬菜"
	ItemTypeName[36]="猎物"
	ItemTypeName[37]="花"
	ItemTypeName[38]="草药"
	ItemTypeName[39]="宝石"
	ItemTypeName[40]="证件"
	ItemTypeName[41]="封印卡"
	ItemTypeName[42]="图鉴卡"
	ItemTypeName[43]="特殊料理"
	ItemTypeName[44]="特殊药水"
	ItemTypeName[45]="书"
	ItemTypeName[46]="锥形水晶"
	ItemTypeName[47]="红三菱镜"
	ItemTypeName[48]="彩票"
	ItemTypeName[49]="卡片其他"
	ItemTypeName[50]="无"
	ItemTypeName[51]="无"
	ItemTypeName[52]="炸弹"
	ItemTypeName[53]="粪便"
	ItemTypeName[54]="食物"
	ItemTypeName[55]="家族兽笛"
	ItemTypeName[56]="头饰"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="人形"
	PetType[2]="龙"
	PetType[3]="不死"
	PetType[4]="飞行"
	PetType[5]="昆虫"
	PetType[6]="植物"
	PetType[7]="野兽"
	PetType[8]="特殊"
	PetType[9]="金属"
	PetType[10]="邪魔"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="游民"
	JobTypeName[10]="剑士"
	JobTypeName[20]="战斧斗士"
	JobTypeName[30]="骑士"
	JobTypeName[40]="弓箭手"
	JobTypeName[50]="士兵"
	JobTypeName[60]="传教士"
	JobTypeName[70]="魔术师"
	JobTypeName[80]="咒术师"
	JobTypeName[90]="封印师"
	JobTypeName[100]="饲养师"
	JobTypeName[110]="驯兽师"
	JobTypeName[120]="盗贼"
	JobTypeName[130]="巫师"
	JobTypeName[140]="格斗士"
	JobTypeName[150]="忍者"
	JobTypeName[160]="舞者"
	JobTypeName[200]="制造者"
	JobTypeName[210]="斧职人"
	JobTypeName[220]="枪职人"
	JobTypeName[230]="弓职人"
	JobTypeName[240]="杖职人"
	JobTypeName[250]="回力职人"
	JobTypeName[260]="小刀职人"
	JobTypeName[270]="兜职人"
	JobTypeName[280]="帽子职人"
	JobTypeName[290]="铠职人"
	JobTypeName[300]="服职人"
	JobTypeName[310]="袍职人"
	JobTypeName[320]="靴职人"
	JobTypeName[330]="鞋职人"
	JobTypeName[340]="盾职人"
	JobTypeName[350]="厨师"
	JobTypeName[360]="药剂师"
	JobTypeName[370]="武器修理师"
	JobTypeName[380]="防具修理师"
	JobTypeName[390]="鉴定师"
	JobTypeName[400]="はんこ屋"
	JobTypeName[410]="探侦"
	JobTypeName[420]="仙人"
	JobTypeName[430]="护士"
	JobTypeName[440]="一生"
	JobTypeName[450]="樵夫"
	JobTypeName[460]="猎人"
	JobTypeName[470]="矿工"
	JobTypeName[480]="神"
	JobTypeName[1000]="爆弹师"
	JobTypeName[1010]="纺织工"
	JobTypeName[170]="圣骑士"
	JobTypeName[180]="影刺客"
	JobTypeName[190]="魔剑士"
	JobTypeName[720]="重装制造达人"
	JobTypeName[710]="轻装制造达人"
	JobTypeName[730]="法装制造达人"
	JobTypeName[740]="拳套制作"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function getItemTypeName(_TypeNo)
	local ItemTypeName={}
	ItemTypeName[1]="剑"
	ItemTypeName[2]="斧"
	ItemTypeName[3]="枪"
	ItemTypeName[4]="杖"
	ItemTypeName[5]="弓"
	ItemTypeName[6]="小刀"
	ItemTypeName[7]="回力"
	ItemTypeName[8]="盾"
	ItemTypeName[9]="头盔"
	ItemTypeName[10]="帽子"
	ItemTypeName[11]="铠"
	ItemTypeName[12]="衣"
	ItemTypeName[13]="袍"
	ItemTypeName[14]="靴"
	ItemTypeName[15]="鞋"
	ItemTypeName[16]="手环"
	ItemTypeName[17]="乐器"
	ItemTypeName[18]="项链"
	ItemTypeName[19]="戒指"
	ItemTypeName[20]="拳套"
	ItemTypeName[21]="耳环"
	ItemTypeName[22]="头饰"
	ItemTypeName[23]="水晶"
	ItemTypeName[24]="料理"
	ItemTypeName[25]="家具"
	ItemTypeName[26]="神秘之物"
	ItemTypeName[27]="任务道具"
	ItemTypeName[28]="宝箱"
	ItemTypeName[29]="钥匙"
	ItemTypeName[30]="矿"
	ItemTypeName[31]="木材"
	ItemTypeName[32]="布"
	ItemTypeName[33]="肉类"
	ItemTypeName[34]="鱼"
	ItemTypeName[35]="蔬菜"
	ItemTypeName[36]="猎物"
	ItemTypeName[37]="花"
	ItemTypeName[38]="草药"
	ItemTypeName[39]="宝石"
	ItemTypeName[40]="证件"
	ItemTypeName[41]="封印卡"
	ItemTypeName[42]="图鉴卡"
	ItemTypeName[43]="特殊料理"
	ItemTypeName[44]="特殊药水"
	ItemTypeName[45]="书"
	ItemTypeName[46]="锥形水晶"
	ItemTypeName[47]="红三菱镜"
	ItemTypeName[48]="彩票"
	ItemTypeName[49]="卡片其他"
	ItemTypeName[50]="无"
	ItemTypeName[51]="无"
	ItemTypeName[52]="炸弹"
	ItemTypeName[53]="粪便"
	ItemTypeName[54]="食物"
	ItemTypeName[55]="家族兽笛"
	ItemTypeName[56]="头饰"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="人形"
	PetType[2]="龙"
	PetType[3]="不死"
	PetType[4]="飞行"
	PetType[5]="昆虫"
	PetType[6]="植物"
	PetType[7]="野兽"
	PetType[8]="特殊"
	PetType[9]="金属"
	PetType[10]="邪魔"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="游民"
	JobTypeName[10]="剑士"
	JobTypeName[20]="战斧斗士"
	JobTypeName[30]="骑士"
	JobTypeName[40]="弓箭手"
	JobTypeName[50]="士兵"
	JobTypeName[60]="传教士"
	JobTypeName[70]="魔术师"
	JobTypeName[80]="咒术师"
	JobTypeName[90]="封印师"
	JobTypeName[100]="饲养师"
	JobTypeName[110]="驯兽师"
	JobTypeName[120]="盗贼"
	JobTypeName[130]="巫师"
	JobTypeName[140]="格斗士"
	JobTypeName[150]="忍者"
	JobTypeName[160]="舞者"
	JobTypeName[200]="制造者"
	JobTypeName[210]="斧职人"
	JobTypeName[220]="枪职人"
	JobTypeName[230]="弓职人"
	JobTypeName[240]="杖职人"
	JobTypeName[250]="回力职人"
	JobTypeName[260]="小刀职人"
	JobTypeName[270]="兜职人"
	JobTypeName[280]="帽子职人"
	JobTypeName[290]="铠职人"
	JobTypeName[300]="服职人"
	JobTypeName[310]="袍职人"
	JobTypeName[320]="靴职人"
	JobTypeName[330]="鞋职人"
	JobTypeName[340]="盾职人"
	JobTypeName[350]="厨师"
	JobTypeName[360]="药剂师"
	JobTypeName[370]="武器修理师"
	JobTypeName[380]="防具修理师"
	JobTypeName[390]="鉴定师"
	JobTypeName[400]="はんこ屋"
	JobTypeName[410]="探侦"
	JobTypeName[420]="仙人"
	JobTypeName[430]="护士"
	JobTypeName[440]="一生"
	JobTypeName[450]="樵夫"
	JobTypeName[460]="猎人"
	JobTypeName[470]="矿工"
	JobTypeName[480]="神"
	JobTypeName[1000]="爆弹师"
	JobTypeName[1010]="纺织工"
	JobTypeName[170]="圣骑士"
	JobTypeName[180]="影刺客"
	JobTypeName[190]="魔剑士"
	JobTypeName[720]="重装制造达人"
	JobTypeName[710]="轻装制造达人"
	JobTypeName[730]="法装制造达人"
	JobTypeName[740]="拳套制作"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function getItemTypeName(_TypeNo)
	local ItemTypeName={}
	ItemTypeName[1]="剑"
	ItemTypeName[2]="斧"
	ItemTypeName[3]="枪"
	ItemTypeName[4]="杖"
	ItemTypeName[5]="弓"
	ItemTypeName[6]="小刀"
	ItemTypeName[7]="回力"
	ItemTypeName[8]="盾"
	ItemTypeName[9]="头盔"
	ItemTypeName[10]="帽子"
	ItemTypeName[11]="铠"
	ItemTypeName[12]="衣"
	ItemTypeName[13]="袍"
	ItemTypeName[14]="靴"
	ItemTypeName[15]="鞋"
	ItemTypeName[16]="手环"
	ItemTypeName[17]="乐器"
	ItemTypeName[18]="项链"
	ItemTypeName[19]="戒指"
	ItemTypeName[20]="拳套"
	ItemTypeName[21]="耳环"
	ItemTypeName[22]="头饰"
	ItemTypeName[23]="水晶"
	ItemTypeName[24]="料理"
	ItemTypeName[25]="家具"
	ItemTypeName[26]="神秘之物"
	ItemTypeName[27]="任务道具"
	ItemTypeName[28]="宝箱"
	ItemTypeName[29]="钥匙"
	ItemTypeName[30]="矿"
	ItemTypeName[31]="木材"
	ItemTypeName[32]="布"
	ItemTypeName[33]="肉类"
	ItemTypeName[34]="鱼"
	ItemTypeName[35]="蔬菜"
	ItemTypeName[36]="猎物"
	ItemTypeName[37]="花"
	ItemTypeName[38]="草药"
	ItemTypeName[39]="宝石"
	ItemTypeName[40]="证件"
	ItemTypeName[41]="封印卡"
	ItemTypeName[42]="图鉴卡"
	ItemTypeName[43]="特殊料理"
	ItemTypeName[44]="特殊药水"
	ItemTypeName[45]="书"
	ItemTypeName[46]="锥形水晶"
	ItemTypeName[47]="红三菱镜"
	ItemTypeName[48]="彩票"
	ItemTypeName[49]="卡片其他"
	ItemTypeName[50]="无"
	ItemTypeName[51]="无"
	ItemTypeName[52]="炸弹"
	ItemTypeName[53]="粪便"
	ItemTypeName[54]="食物"
	ItemTypeName[55]="家族兽笛"
	ItemTypeName[56]="头饰"
	return ItemTypeName[_TypeNo+1]
end

function getPetTypeName(_TypeNo)
	local PetType = {}
	PetType[1]="人形"
	PetType[2]="龙"
	PetType[3]="不死"
	PetType[4]="飞行"
	PetType[5]="昆虫"
	PetType[6]="植物"
	PetType[7]="野兽"
	PetType[8]="特殊"
	PetType[9]="金属"
	PetType[10]="邪魔"
	return PetType[_TypeNo+1]
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="游民"
	JobTypeName[10]="剑士"
	JobTypeName[20]="战斧斗士"
	JobTypeName[30]="骑士"
	JobTypeName[40]="弓箭手"
	JobTypeName[50]="士兵"
	JobTypeName[60]="传教士"
	JobTypeName[70]="魔术师"
	JobTypeName[80]="咒术师"
	JobTypeName[90]="封印师"
	JobTypeName[100]="饲养师"
	JobTypeName[110]="驯兽师"
	JobTypeName[120]="盗贼"
	JobTypeName[130]="巫师"
	JobTypeName[140]="格斗士"
	JobTypeName[150]="忍者"
	JobTypeName[160]="舞者"
	JobTypeName[200]="制造者"
	JobTypeName[210]="斧职人"
	JobTypeName[220]="枪职人"
	JobTypeName[230]="弓职人"
	JobTypeName[240]="杖职人"
	JobTypeName[250]="回力职人"
	JobTypeName[260]="小刀职人"
	JobTypeName[270]="兜职人"
	JobTypeName[280]="帽子职人"
	JobTypeName[290]="铠职人"
	JobTypeName[300]="服职人"
	JobTypeName[310]="袍职人"
	JobTypeName[320]="靴职人"
	JobTypeName[330]="鞋职人"
	JobTypeName[340]="盾职人"
	JobTypeName[350]="厨师"
	JobTypeName[360]="药剂师"
	JobTypeName[370]="武器修理师"
	JobTypeName[380]="防具修理师"
	JobTypeName[390]="鉴定师"
	JobTypeName[400]="はんこ屋"
	JobTypeName[410]="探侦"
	JobTypeName[420]="仙人"
	JobTypeName[430]="护士"
	JobTypeName[440]="一生"
	JobTypeName[450]="樵夫"
	JobTypeName[460]="猎人"
	JobTypeName[470]="矿工"
	JobTypeName[480]="神"
	JobTypeName[1000]="爆弹师"
	JobTypeName[1010]="纺织工"
	JobTypeName[170]="圣骑士"
	JobTypeName[180]="影刺客"
	JobTypeName[190]="魔剑士"
	JobTypeName[720]="重装制造达人"
	JobTypeName[710]="轻装制造达人"
	JobTypeName[730]="法装制造达人"
	JobTypeName[740]="拳套制作"
	if _TypeNo==0 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end



function getMapName( _MapID )
	return BaseMapName[_MapID]
end
