local normalpowerupMax =  50 --强化次数上限
local normalpowerupgold = 10000 --每次强化所需魔币
local normalpowerupname = "装备强化" --npc对此强化方式的称呼
local normalpowerupexplain = "装备强化可以为装备附加属性。" --装备强化说明
local normalpowerupitem = 18310 --每次强化所需道具id
local normalpowerupitemname = "地的水晶碎片" --npc对此道具称呼
local normalpowerupitemnum = 5 --每次强化所需道具数量 为0则不需要
local normalpoweruprateitem = 18088 --强化效果加成道具id
local normalpoweruprateitemname = "魔石" --npc对此道具称呼
local normalpoweruprateitemnum = 1 --强化效果加成道具使用数量 为0则不开放
local normalpowerupratename = "高级装备强化" --npc对此强化方式的称呼
local itempowerupexplain = "    高级装备强化可以用特定道具为装备附加属性。"; --符文强化说明
local normalpoweruprateaddmin = 70; --使用强化效果加成道具后的强化效果最小值提升
local normalpoweruprateaddmax = 0; --使用强化效果加成道具后的强化效果最大值提升
--注意：此2项设置不要使后面的强化效果最小值超过最大值
--local normalpowerup = {%道具_攻击%,80,150,%道具_敏捷%,10,80}; --每次强化成功附加的属性
local normalpowerup = {%道具_生命%,80,150,%道具_魔力%,10,80}; --每次强化成功附加的属性
--格式：{x1,y1,z1,x2,y2,z2} x1为属性1字段 y1为属性1强化效果最小值 z1为属性1强化效果最大值，x2为属性2字段……以此类推
local poweruppre = {} --强化前缀
poweruppre[1] = "冥"
poweruppre[2] = "暝"
poweruppre[3] = "瞑"
poweruppre[4] = "溟"
poweruppre[5] = "凕"
poweruppre[6] = "慏"
poweruppre[7] = "鄍"
poweruppre[8] = "嫇"
poweruppre[9] = "猽"
poweruppre[10] = "慏"
poweruppre[11] = "炎"
poweruppre[12] = "焱"
poweruppre[13] = "燚"
poweruppre[14] = "燿"
poweruppre[15] = "灭"
poweruppre[16] = "灾"
poweruppre[17] = "炙"
poweruppre[18] = "炽"
poweruppre[19] = "焚"
poweruppre[20] = "爆"
poweruppre[21] = "鬼"
poweruppre[22] = "魂"
poweruppre[23] = "魁"
poweruppre[24] = "魅"
poweruppre[25] = "魄"
poweruppre[26] = "魍"
poweruppre[27] = "魉"
poweruppre[28] = "魇"
poweruppre[29] = "魃"
poweruppre[30] = "魔"
poweruppre[31] = "敖"
poweruppre[32] = "熬"
poweruppre[33] = "傲"
poweruppre[34] = "嗷"
poweruppre[35] = "獒"
poweruppre[36] = "鳌"
poweruppre[37] = "螯"
poweruppre[38] = "嗸"
poweruppre[39] = "嶅"
poweruppre[40] = "璈"
poweruppre[41] = "金"
poweruppre[42] = "木"
poweruppre[43] = "水"
poweruppre[44] = "火"
poweruppre[45] = "土"
poweruppre[46] = "风"
poweruppre[47] = "雨"
poweruppre[48] = "雷"
poweruppre[49] = "电"
poweruppre[50] = "烈"

--可跨段任意设置强化前缀，未经设置的前缀会和最近一个经过设置的前缀相同。

local normalpowerupsucceedmsg = "发出耀眼的光芒，强化成功了！" --强化成功时提示

local itempowerupname = "符文强化" --npc对此强化方式的称呼
local itempowerupgold = 10000 --替换或安装花费的魔币。
local itempowerup = {}
itempowerup[18310] = {"A1",1,%道具_攻击%,100};
itempowerup[18311] = {"B1",2,%道具_敏捷%,100};
itempowerup[18312] = {"C1",3,%道具_防御%,100};
itempowerup[18313] = {"D1",4,%道具_精神%,100};
--itempowerup[18088] = {"ZZ",5,%道具_生命%,100,%道具_魔力%,200,%道具_精神%,50,%道具_回复%,50};
itempowerup[18088] = {"ZZ",5,%道具_回复%,100};
--格式itempowerup[物品itemset编号] = {"任意2位缩写",所在分组,属性1字段,属性1数值,属性2字段,属性2数值……}
--注意：两位缩写绝对不可重复，所在分组为数字1-5，不可超越。同分组的道具彼此互斥，安装时会自动替换掉已安装的同分组符文

local weapenpowerupnpcmetamo = 100500 --npc形象
local weapenpowerupnpcmap = 555 --npc地图
local weapenpowerupnpcposx = 20 --npcx坐标
local weapenpowerupnpcposy = 26 --npcy坐标
local weapenpowerupnpcdir = 4 --方向
local weapenpowerupnpcname = "装备强化" --npc名字

local weapenpowerupnpcmetamo2 = 100500 --符文npc形象
local weapenpowerupnpcmap2 = 555 --符文npc地图
local weapenpowerupnpcposx2 = 20 --符文npcx坐标
local weapenpowerupnpcposy2 = 27 --符文npcy坐标
local weapenpowerupnpcdir2 = 4 --符文方向
local weapenpowerupnpcname2 = "符文强化" --符文npc名字

local jewelledin = 4 --宝石标志位

--[[附常见道具属性字段表：
	%道具_攻击%
	%道具_防御%
	%道具_敏捷%
	%道具_精神%
	%道具_回复%
	%道具_必杀%
	%道具_反击%
	%道具_命中%
	%道具_闪躲%
	%道具_生命%
	%道具_魔力%
	%道具_毒抗%
	%道具_睡抗%
	%道具_石抗%
	%道具_醉抗%
	%道具_乱抗%
	%道具_忘抗%
	%道具_魔抗%
]]

--**警告：此系统使用道具的"未鉴定名"和"魔力txt脚本"所在字段，在Itemset.txt中，切勿以纯数字作为装备的未鉴定名、切勿在装备的"魔力txt脚本"处写入任何字符
--------------------------------------------------------
local weapenpowerup1

for i = 1,100 do
	if poweruppre[i] == nil then
		poweruppre[i] = weapenpowerup1
	else
		weapenpowerup1 = poweruppre[i]
	end
end

local weapenpowerup2 = {}

for k,v in pairs(itempowerup) do
	weapenpowerup2[v[1]] = k
end

function weapenpowerup3(player,itemindex,n1)
	local weapenpowerup5 = Item.GetData(itemindex,%道具_类型%)
	local weapenpowerup6
	local weapenpowerup7 = Char.GetData(player,%对象_金币%)
	local weapenpowerup8
	local weapenpowerup9
	local weapenpowerup10 = Item.GetData(itemindex,%道具_名字%)
	if weapenpowerup5 >= 0 and weapenpowerup5 <= 14 then
		weapenpowerup6 = tonumber(Item.GetData(itemindex,%道具_鉴前名%))
		if type(weapenpowerup6) ~= "number" then
			weapenpowerup6 = 0
		end
		if weapenpowerup6 < normalpowerupMax then
			if weapenpowerup7 >= normalpowerupgold and Char.ItemNum(player,normalpowerupitem) >= normalpowerupitemnum then
				if ( n1 ~= nil and n1 == 1 and normalpoweruprateitemnum > 0 and Char.ItemNum(player,normalpoweruprateitem) >= normalpoweruprateitemnum ) or ( n1 == nil or n1 ~= 1) then
					if n1 ~= nil and n1 == 1 then
						Char.DelItem(player,normalpoweruprateitem,normalpoweruprateitemnum)
					end
					Char.DelItem(player,normalpowerupitem,normalpowerupitemnum)
					Char.AddGold(player,-normalpowerupgold)
					for i = 1,#normalpowerup,3 do
						for k = 1,10 do
							if n1 ~= nil and n1 == 1 then
								weapenpowerup9 = math.random(normalpowerup[i+1]+normalpoweruprateaddmin,normalpowerup[i+2]+normalpoweruprateaddmax)
							else
								weapenpowerup9 = math.random(normalpowerup[i+1],normalpowerup[i+2])
							end
						end
						weapenpowerup8 = Item.GetData(itemindex,normalpowerup[i])
						Item.SetData(itemindex,normalpowerup[i],weapenpowerup8+weapenpowerup9)
					end
					Item.SetData(itemindex,%道具_鉴前名%,weapenpowerup6+1)
					--NLG.SystemMessage(player,(Item.GetData(itemindex,%道具_名字%))..normalpowerupsucceedmsg)
					NLG.SystemMessage(player,(Item.GetData(itemindex,%道具_名字%))..normalpowerupsucceedmsg)
					if string.find(weapenpowerup10,"+",1) then
						weapenpowerup10 = splitplus(weapenpowerup10,"+")[1]
					end
					if string.find(weapenpowerup10,"*",1) then
						weapenpowerup10 = splitplus(weapenpowerup10,"*")[2]
					end
					Item.SetData(itemindex,%道具_名字%,poweruppre[(weapenpowerup6+1)].."*"..weapenpowerup10.."+"..(weapenpowerup6+1))
					Item.SetData(itemindex,jewelledin,0)
					for i = 0,27 do
						Item.UpItem(player,i)
					end
					return 1
				else
					NLG.SystemMessage(player,"强化所需的道具不足。")
					return -1
				end
			else
				NLG.SystemMessage(player,"强化所需的道具或者魔币不足。")
				return -1
			end
		else
			NLG.SystemMessage(player,"您的道具已经强化至顶级。")
			return -1
		end
	else
		NLG.SystemMessage(player,"请选择正确的道具进行强化。")
		return -1
	end
end

function weapenpowerup4(player,itemindex1,itemindex2)
	local weapenpowerup11 = {"","","","",""}
	local weapenpowerup12 = {0,0,0,0,0}
	local weapenpowerup5 = Item.GetData(itemindex1,%道具_类型%)
	local weapenpowerup13 = Item.GetData(itemindex2,%道具_ID%)
	local weapenpowerup8
	local weapenpowerup14 = ""
	local weapenpowerup7 = Char.GetData(player,%对象_金币%)
	if weapenpowerup7 >= itempowerupgold then
		if weapenpowerup5 >= 0 and weapenpowerup5 <= 14 then
			if type(itempowerup[weapenpowerup13]) == "table" then
				if Char.ItemSlot(player) <= 19 then
					Char.AddGold(player,-itempowerupgold)
					if string.find(Item.GetData(itemindex1,%道具_自用参数%),"/",1) then
						weapenpowerup11 = splitplus(Item.GetData(itemindex1,%道具_自用参数%),"/")
					end
					for i = 1,5 do
						if type(weapenpowerup2[weapenpowerup11[i]]) == "number" then
							weapenpowerup12[i] = weapenpowerup2[weapenpowerup11[i]]
						end
					end
					if weapenpowerup12[itempowerup[weapenpowerup13][2]] > 0 then
						for i = 3,#itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]],2 do
							weapenpowerup8 = Item.GetData(itemindex1,itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i])
							Item.SetData(itemindex1,itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i],weapenpowerup8-itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i+1])
						end
						Char.GiveItem(player,weapenpowerup12[itempowerup[weapenpowerup13][2]],1)
					end
					for i = 3,#itempowerup[weapenpowerup13],2 do
						weapenpowerup8 = Item.GetData(itemindex1,itempowerup[weapenpowerup13][i])
						Item.SetData(itemindex1,itempowerup[weapenpowerup13][i],weapenpowerup8+itempowerup[weapenpowerup13][i+1])
					end
					Char.DelItem(player,weapenpowerup13,1)
					weapenpowerup11[itempowerup[weapenpowerup13][2]] = itempowerup[weapenpowerup13][1]
					for i = 1,5 do
						weapenpowerup14 = weapenpowerup14..weapenpowerup11[i].."/"
					end
					Item.SetData(itemindex1,%道具_自用参数%,weapenpowerup14)
					Item.SetData(itemindex1,jewelledin,0)
					NLG.SystemMessage(player,itempowerupname.."成功！")
					for i = 0,27 do
						Item.UpItem(player,i)
					end
					return 1
				else
					NLG.SystemMessage(player,"你的东西太多了。")
					return -1
				end
			else
				NLG.SystemMessage(player,"强化使用的道具不正确。")
				return -1
			end
		else
			NLG.SystemMessage(player,"请选择正确的道具进行强化。")
			return -1
		end
	else
		NLG.SystemMessage(player,"您的魔币不足。")
		return -1
	end
end

function weapenpowerup15(npc)
	--Char.SetData(npc,(%对象_形象%),weapenpowerupnpcmetamo)
	Char.SetData(npc,(%对象_形象%),weapenpowerupnpcmetamo)
	Char.SetData(npc,%对象_原形%,weapenpowerupnpcmetamo)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%对象_地图%,weapenpowerupnpcmap)
	Char.SetData(npc,%对象_X%,weapenpowerupnpcposx)
	Char.SetData(npc,%对象_Y%,weapenpowerupnpcposy)
	Char.SetData(npc,%对象_方向%,weapenpowerupnpcdir)
	Char.SetData(npc,%对象_原名%,weapenpowerupnpcname)
	Char.SetTalkedEvent(nil, "weapenpowerup16",npc)
	Char.SetWindowTalkedEvent(nil,"weapenpowerup17",npc)
	NLG.UpChar(npc)
	return true
end

function weapenpowerup151(npc)
	--Char.SetData(npc,(%对象_形象%),weapenpowerupnpcmetamo)
	Char.SetData(npc,(%对象_形象%),weapenpowerupnpcmetamo2)
	Char.SetData(npc,%对象_原形%,weapenpowerupnpcmetamo2)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%对象_地图%,weapenpowerupnpcmap2)
	Char.SetData(npc,%对象_X%,weapenpowerupnpcposx2)
	Char.SetData(npc,%对象_Y%,weapenpowerupnpcposy2)
	Char.SetData(npc,%对象_方向%,weapenpowerupnpcdir2)
	Char.SetData(npc,%对象_原名%,weapenpowerupnpcname2)
	Char.SetTalkedEvent(nil, "weapenpowerup161",npc)
	Char.SetWindowTalkedEvent(nil,"weapenpowerup171",npc)
	NLG.UpChar(npc)
	return true
end

function weapenpowerup16(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local weapenpowerup20 = "2\n这里可以强化装备，请选择：\n\n1.使用说明\n2."..normalpowerupname
		if normalpoweruprateitemnum > 0 then
			weapenpowerup20 = weapenpowerup20.."\n3."..normalpowerupratename
		end
		NLG.ShowWindowTalked(player,npc,2,2,0,weapenpowerup20)
	end
end

function weapenpowerup17(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			local weapenpowerup20
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					NLG.ShowWindowTalked(player,npc,0,2,1,normalpowerupexplain)
				elseif tonumber(Data) == 2 then
					weapenpowerup20 = "\n"..normalpowerupname.."需要以下材料：\n1.魔币"..normalpowerupgold.."\n2."..normalpowerupitemnum.."个"..normalpowerupitemname.."\n\n点击【确定】将强化位于道具栏【第一格】的道具。"
					NLG.ShowWindowTalked(player,npc,0,3,2,weapenpowerup20)
				elseif tonumber(Data) == 3 then
					if normalpoweruprateitemnum > 0 then
						weapenpowerup20 = "\n"..normalpowerupratename.."需要以下材料：\n1.魔币"..normalpowerupgold.."\n2."..normalpowerupitemnum.."个"..normalpowerupitemname.."\n3."..normalpoweruprateitemnum.."个"..normalpoweruprateitemname.."\n\n点击【确定】将强化位于道具栏【第一格】的道具。"
						NLG.ShowWindowTalked(player,npc,0,3,3,weapenpowerup20)
					else
						return
					end
				end
			elseif Seqno == 2 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				if weapenpowerup18 > 0 then
					weapenpowerup3(player,weapenpowerup18,0)
				else
					NLG.SystemMessage(player,"没有可强化的道具。")
				end
			elseif Seqno == 3 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				if weapenpowerup18 > 0 then
					weapenpowerup3(player,weapenpowerup18,1)
				else
					NLG.SystemMessage(player,"没有可强化的道具。")
				end
			end
		end
	end
end

function weapenpowerup161(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local weapenpowerup20 = "2\n这里可以为装备增加或替换符文。\n请选择：\n1.使用说明\n2."..itempowerupname
		NLG.ShowWindowTalked(player,npc,2,2,0,weapenpowerup20)
	end
end

function weapenpowerup171(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			local weapenpowerup20
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					weapenpowerup20 = itempowerupexplain
					NLG.ShowWindowTalked(player,npc,0,2,1,weapenpowerup20)
				elseif tonumber(Data) == 2 then
					weapenpowerup20 = "\n"..itempowerupname.."需要：\n1.将欲强化的装备放在道具栏【第一格】\n2.将用于"..itempowerupname.."的道具放在道具栏【第二格】\n3.花费"..itempowerupgold.."魔币\n\n点击【确定】将进行"..itempowerupname.."。"
					NLG.ShowWindowTalked(player,npc,0,3,2,weapenpowerup20)
				end
			elseif Seqno == 2 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				local weapenpowerup19 = Char.GetItemIndex(player,9)
				if weapenpowerup18 > 0 and weapenpowerup19 > 0 then
					weapenpowerup4(player,weapenpowerup18,weapenpowerup19)
				else
					NLG.SystemMessage(player,"请正确放置道具。")
				end
			end
		end
	end
end

--[[
if weapenpowerup21 == nil or weapenpowerup21 < 0 then
	print("WeapenPowerUpNpc1 Start")
	weapenpowerup21 = NL.CreateNpc(nil,"weapenpowerup15")
	print("WeapenPowerUpNpc1 Done")
end
if weapenpowerup22 == nil or weapenpowerup22 < 0 then
	print("WeapenPowerUpNpc2 Start")
	weapenpowerup22 = NL.CreateNpc(nil,"weapenpowerup151")
	print("WeapenPowerUpNpc2 Done")
end
]]
NL.CreateNpc(nil,"weapenpowerup15")
NL.CreateNpc(nil,"weapenpowerup151")
