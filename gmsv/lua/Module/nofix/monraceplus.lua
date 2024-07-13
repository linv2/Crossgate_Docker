local GameMasterCdkey = "shiluodegirl" --可使用控制台功能的GM帐号
magnification1 = 3 --比赛获胜者的魔币奖金倍率(1-n 为1时相当于只退本金)
magnification2 = 3 --比赛获胜者的道具1奖金倍率(1-n 为1时相当于只退本金)
magnification3 = 3 --比赛获胜者的道具2奖金倍率(1-n 为1时相当于只退本金)
betitem1 = {"神域点卷",88888,99999,10} --下注使用的道具1 {"道具名称",道具itemid,道具可堆叠最大数量,下注一次使用的道具数量}
betitem2 = {"神域钱箱",88889,99999,50} --下注使用的道具2 {"道具名称",道具itemid,道具可堆叠最大数量,下注一次使用的道具数量}
ctrltype = 2 --控制方式 0为不开放 1为自动控制 2为gm手动开启
starttime = 8 --当自动控制时 每日开启时间 24小时制 
endtime = 23 --当自动控制时 每日关闭时间 24小时制
bettime = 1.5 --下注时间 单位分钟
mainnpcmatamo = 104414 --控制npc形象
mainnpcname = "赛马裁判" --控制npc名字
mainnpcmap = 60002 --控制npc所在地图
mainnpcposx = 21 --控制npc所在x坐标
mainnpcposy = 9 --控制npc所在y坐标
mainnpclook = 6 --控制npc方向
RaceMonstermap = 60002 --参赛魔物所在地图
RaceMonsterposx = 32 --第一只参赛魔物所在x坐标
RaceMonsterposy = 6 --第一只参赛魔物所在y坐标
RaceEndAway = 99 --跑道长度
RaceMonsterDir= 1 --魔物方向 1为参赛魔物沿y方向排列 向x方向奔跑 2为参赛魔物沿x方向排列 向y方向奔跑
FootLimetMin = 500 --行动步数下限(1000为一步)
FootLimetMax = 4000 --行动步数上限(1000为一步)
RaceMonster = { --参赛魔物控制
{"萝莉塔",110379,26573}, --格式为 {"魔物名字",魔物形象,为其下注时图档}
{"爱丽丝",110378,26573},
{"尤利娅",110308,26573},
{"莉贝卡",110307,26573},
{"夏米尔",110306,26573},
{"格瑞斯",110305,26573},
{"莉安娜",110304,26573} --最后一组魔物的{}后不加","
}

--[[注意事项：
1、使用手动控制时，请勿反复操作。
2、若关闭服务器或重新加载本脚本，所有下注记录及未领取的奖金都会丢失。
]]

----以上为可设置区域----

function splitplus(str, pat)
local t = {}
local last_end = 0
local s, e = string.find(str, pat, 1)
local i = 1
while s do
table.insert(t, string.sub(str, last_end + 1, last_end + s - last_end - 1))
last_end = e
s, e = string.find(str, pat, last_end + 1)
i = i + 1
end
if last_end <= string.len(str) then
cap = string.sub(str, last_end + 1)
table.insert(t, cap)
end
return t 
end

function strfindn(str,n)
	local back = nil
	for i = 1,string.len(str) do
		if n == string.sub(str,i,i) then
			back = i
			break
		end
	end
	return back
end

MonsterRacevalue1 = 0
MonsterRacevalue2 = 0
MonsterRacevalue3 = {}
MonsterRacevalue4 = {}
MonsterRacevalue5 = {}
MonsterRacevalue6 = {}
MonsterRacevalue7 = {}
MonsterRacevalue19 = {"接受下注中","比赛中"}
MonsterRacevalue19[0] = "关闭中"
if RaceMonsterDir == 1 then
	MonsterRacevalue20 = RaceEndAway + RaceMonsterposx
else
	MonsterRacevalue20 = RaceEndAway + RaceMonsterposy
end

function MonsterRacevalue24(npc)
	Char.SetData(npc,%对象_形象%,mainnpcmatamo)
	Char.SetData(npc,%对象_原形%,mainnpcmatamo)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%对象_地图%,mainnpcmap)
	Char.SetData(npc,%对象_X%,mainnpcposx)
	Char.SetData(npc,%对象_Y%,mainnpcposy)
	Char.SetData(npc,%对象_方向%,mainnpclook)
	Char.SetData(npc,%对象_原名%,mainnpcname)
	Char.SetTalkedEvent(nil, "MonsterRacevalue21",npc)
	Char.SetWindowTalkedEvent(nil,"MonsterRacevalue22",npc)
	Char.SetLoopEvent(nil,"MonsterRacevalue23",npc,1000)
	NLG.UpChar(npc)
	return true
end

function MonsterRacevalue26()
	return true;
end

function MonsterRacevalue21(npc,player)
	local MonsterRacevalue8 = Char.GetData(player,2002)
	local MonsterRacevalue10
	local MonsterRacevalue9
	if MonsterRacevalue8 == GameMasterCdkey then
		MonsterRacevalue10 = 1000
		MonsterRacevalue9 = "2\n当前控制方式为"..ctrltype.." 运行状态为"..MonsterRacevalue19[MonsterRacevalue2].."\n(0为关闭，1为自动，2为手动)\n1.手动/自动切换\n2.查看当前下注\n3.查看当前未被提领的奖金\n4.为本场比赛魔物加速\n5.为本场比赛魔物减速\n6.关闭系统\n7.开始比赛"
	else
		MonsterRacevalue10 = 0
		MonsterRacevalue9 = "3\n          **欢迎光临**\n当前赛马比赛"..MonsterRacevalue19[MonsterRacevalue2].."\n\n1.我要投注\n2.我要领奖"
	end
	NLG.ShowWindowTalked(player,npc,2,2,MonsterRacevalue10,MonsterRacevalue9)
end

function MonsterRacevalue22(npc,player,Seqno,Select,Data)
	if Select ~= 2 then
		local MonsterRacevalue8 = Char.GetData(player,2002)
		if Seqno == 0 then
			if tonumber(Data) == 1 then
				if MonsterRacevalue2 == 1 then
					local MonsterRacevalue9 = "3\n请选择下注方式：\n\n\n1.魔币下注(每注1000魔币)\n2.魔币下注(每注10000魔币)\n3."..betitem1[1].."下注\n4."..betitem2[1].."下注"
					NLG.ShowWindowTalked(player,npc,2,2,10,MonsterRacevalue9)
				else
					NLG.SystemMessage(player,"当前赛马比赛"..MonsterRacevalue19[MonsterRacevalue2].."不接受投注，请等待下次机会。")
					return
				end
			elseif tonumber(Data) == 2 then
				if type(MonsterRacevalue5[MonsterRacevalue8]) == "table" then
					if MonsterRacevalue5[MonsterRacevalue8][1] ~= nil and MonsterRacevalue5[MonsterRacevalue8][1] > 0 then
						if Char.GetData(player,%对象_金币%) + MonsterRacevalue5[MonsterRacevalue8][1] <= 1000000 then
							Char.AddGold(player,MonsterRacevalue5[MonsterRacevalue8][1])
							NLG.SystemMessage(player,"得到"..MonsterRacevalue5[MonsterRacevalue8][1].."G。")
							MonsterRacevalue5[MonsterRacevalue8][1] = 0
						else
							local MonsterRacevalue11 = 1000000 - Char.GetData(player,%对象_金币%)
							if MonsterRacevalue11 > 0 and MonsterRacevalue5[MonsterRacevalue8][1] > MonsterRacevalue11 then
								MonsterRacevalue5[MonsterRacevalue8][1] = MonsterRacevalue5[MonsterRacevalue8][1] - MonsterRacevalue11
								Char.AddGold(player,MonsterRacevalue11)
								NLG.SystemMessage(player,"得到"..MonsterRacevalue11.."G。")
								NLG.SystemMessage(player,"你的钱满了，剩余"..MonsterRacevalue5[MonsterRacevalue8][1].."魔币奖金未领。")
							end
						end
					else
						NLG.SystemMessage(player,"已无可领取的魔币奖金。")
					end
					if MonsterRacevalue5[MonsterRacevalue8][2] ~= nil and MonsterRacevalue5[MonsterRacevalue8][2] > 0 then
						if Char.ItemSlot(player) + math.ceil(MonsterRacevalue5[MonsterRacevalue8][2]/betitem1[3]) <= 20 then
							Char.GiveItem(player,betitem1[2],MonsterRacevalue5[MonsterRacevalue8][2])
							MonsterRacevalue5[MonsterRacevalue8][2] = 0
						else
							if Char.ItemSlot(player) <= 19 and MonsterRacevalue5[MonsterRacevalue8][2] > betitem1[3] then
								MonsterRacevalue5[MonsterRacevalue8][2] = MonsterRacevalue5[MonsterRacevalue8][2] - betitem1[3]
								Char.GiveItem(player,betitem1[2],betitem1[3])
								NLG.SystemMessage(player,"你的道具满了，剩余"..MonsterRacevalue5[MonsterRacevalue8][2]..betitem1[1].."奖金未领。")
							end
						end
					else
						NLG.SystemMessage(player,"已无可领取的"..betitem1[1].."奖金。")
					end
					if MonsterRacevalue5[MonsterRacevalue8][3] ~= nil and MonsterRacevalue5[MonsterRacevalue8][3] > 0 then
						if Char.ItemSlot(player) + math.ceil(MonsterRacevalue5[MonsterRacevalue8][3]/betitem2[3]) <= 20 then
							Char.GiveItem(player,betitem2[2],MonsterRacevalue5[MonsterRacevalue8][3])
							MonsterRacevalue5[MonsterRacevalue8][3] = 0
						else
							if Char.ItemSlot(player) <= 19 and MonsterRacevalue5[MonsterRacevalue8][3] > betitem2[3] then
								MonsterRacevalue5[MonsterRacevalue8][3] = MonsterRacevalue5[MonsterRacevalue8][3] - betitem2[3]
								Char.GiveItem(player,betitem2[2],betitem2[3])
								NLG.SystemMessage(player,"你的道具满了，剩余"..MonsterRacevalue5[MonsterRacevalue8][3]..betitem2[1].."奖金未领。")
							end
						end
					else
						NLG.SystemMessage(player,"已无可领取的"..betitem2[1].."奖金。")
					end
				end
			end
		elseif Seqno == 10 then
			if MonsterRacevalue2 == 1 then
				if tonumber(Data) == 1 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择您支持的宠物下注。当前每注为1000魔币。|您的魔币不足。|您的道具栏不足。"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|投注"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1000|$6每注为1000魔币|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,11,MonsterRacevalue9)
				elseif tonumber(Data) == 2 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择您支持的宠物下注。当前每注为10000魔币。|您的魔币不足。|您的道具栏不足。"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|投注"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|10000|$6每注为10000魔币|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,12,MonsterRacevalue9)
				elseif tonumber(Data) == 3 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择您支持的宠物下注。当前每注为"..betitem1[4].."个"..betitem1[1].."。|您的魔币不足。|您的道具栏不足。"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|投注"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6每注为"..betitem1[4].."个"..betitem1[1].."|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,13,MonsterRacevalue9)
				elseif tonumber(Data) == 4 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择您支持的宠物下注。当前每注为"..betitem2[4].."个"..betitem2[1].."。|您的魔币不足。|您的道具栏不足。"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|投注"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6每注为"..betitem2[4].."个"..betitem2[1].."|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,14,MonsterRacevalue9)
				end
			else
				NLG.SystemMessage(player,"当前赛马比赛"..MonsterRacevalue19[MonsterRacevalue2].."不接受投注，请等待下次机会。")
				return
			end
		elseif Seqno == 11 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*1000
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*1000
					end
					if Char.GetData(player,%对象_金币%) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.AddGold(player,-MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][1] = MonsterRacevalue4[MonsterRacevalue8][k][1] + v
							MonsterRacevalue6[k][1] = MonsterRacevalue6[k][1] + v
							NLG.SystemMessage(player,"您为"..RaceMonster[k][1].."下注"..v.."魔币成功，当前总下注额为："..MonsterRacevalue4[MonsterRacevalue8][k][1].."魔币，"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."，"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."。")
						end
					else
						NLG.SystemMessage(player,"您的魔币不足。")
					end
				end
			end
		elseif Seqno == 12 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*10000
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*10000
					end
					if Char.GetData(player,%对象_金币%) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.AddGold(player,-MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][1] = MonsterRacevalue4[MonsterRacevalue8][k][1] + v
							MonsterRacevalue6[k][1] = MonsterRacevalue6[k][1] + v
							NLG.SystemMessage(player,"您为"..RaceMonster[k][1].."下注"..v.."魔币成功，当前总下注额为："..MonsterRacevalue4[MonsterRacevalue8][k][1].."魔币，"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."，"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."。")
						end
					else
						NLG.SystemMessage(player,"您的魔币不足。")
					end
				end
			end
		elseif Seqno == 13 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*betitem1[4]
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*betitem1[4]
					end
					if Char.ItemNum(player,betitem1[2]) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.DelItem(player,betitem1[2],MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][2] = MonsterRacevalue4[MonsterRacevalue8][k][2] + v
							MonsterRacevalue6[k][2] = MonsterRacevalue6[k][2] + v
							NLG.SystemMessage(player,"您为"..RaceMonster[k][1].."下注"..v..betitem1[1].."成功，当前总下注额为："..MonsterRacevalue4[MonsterRacevalue8][k][1].."魔币，"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."，"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."。")
						end
					else
						NLG.SystemMessage(player,"您的"..betitem1[1].."不足。")
					end
				end
			end
		elseif Seqno == 14 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*betitem2[4]
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*betitem2[4]
					end
					if Char.ItemNum(player,betitem2[2]) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.DelItem(player,betitem2[2],MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][3] = MonsterRacevalue4[MonsterRacevalue8][k][3] + v
							MonsterRacevalue6[k][3] = MonsterRacevalue6[k][3] + v
							NLG.SystemMessage(player,"您为"..RaceMonster[k][1].."下注"..v..betitem2[1].."成功，当前总下注额为："..MonsterRacevalue4[MonsterRacevalue8][k][1].."魔币，"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."，"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."。")
						end
					else
						NLG.SystemMessage(player,"您的"..betitem2[1].."不足。")
					end
				end
			end
		elseif Seqno == 1000 then
			if MonsterRacevalue8 == GameMasterCdkey then
				if tonumber(Data) == 1 then
					if ctrltype == 1 then
						ctrltype = 2
						NLG.SystemMessage(player,"控制方式切换为手动。")
					else
						ctrltype = 1
						NLG.SystemMessage(player,"控制方式切换为自动。")
					end
				elseif tonumber(Data) == 2 then
					for i = 1,#MonsterRacevalue6 do
						NLG.SystemMessage(player,RaceMonster[i][1].."的投注金额为："..MonsterRacevalue6[i][1].."魔币，"..MonsterRacevalue6[i][2]..betitem1[1].."，"..MonsterRacevalue6[i][3]..betitem2[1].."。")
					end
				elseif tonumber(Data) == 3 then
					for k,v in pairs(MonsterRacevalue5) do
						NLG.SystemMessage(player,"玩家帐号"..k.."尚未领取的奖金为："..v[1].."魔币，"..v[2]..betitem1[1].."，"..v[3]..betitem2[1].."。")
					end
				elseif tonumber(Data) == 4 then
					if MonsterRacevalue2 >= 1 then
						local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择要加速的宠物。加速幅度1-10。|您的魔币不足。|您的道具栏不足。"
						for i = 1,#RaceMonster do
							MonsterRacevalue9 = MonsterRacevalue9.."|加速"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6每一点加速幅度为50\n$6当前额外速度为"..MonsterRacevalue3[MonsterRacevalue7[i]][2].."|1|999"
						end
						NLG.ShowWindowTalked(player,npc,6,2,1100,MonsterRacevalue9)
					else
						NLG.SystemMessage(player,"现在没有比赛。")
					end
				elseif tonumber(Data) == 5 then
					if MonsterRacevalue2 >= 1 then
						local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|请选择要减速的宠物。减速幅度无限制。|您的魔币不足。|您的道具栏不足。"
						for i = 1,#RaceMonster do
							MonsterRacevalue9 = MonsterRacevalue9.."|减速"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6每一点减速幅度为50\n$6当前额外速度为"..MonsterRacevalue3[MonsterRacevalue7[i]][2].."|1|999"
						end
						NLG.ShowWindowTalked(player,npc,6,2,1200,MonsterRacevalue9)
					else
						NLG.SystemMessage(player,"现在没有比赛。")
					end
				elseif tonumber(Data) == 6 then
					MonsterRacevalue2 = 0
					ctrltype = 0
					MonsterRacevalue28()
					NLG.SystemMessage(player,"活动已关闭。")
				elseif tonumber(Data) == 7 then
					if MonsterRacevalue2 == 0 then
						MonsterRacevalue2 = 1
						MonsterRacevalue1 = os.time()
						MonsterRacevalue29()
						NLG.SystemMessage(-1,"赛马比赛现在开始接受投注啦~想要参与的玩家快来咯~")
					else
						NLG.SystemMessage(player,"活动正在运行中。")
					end
				end
			else
				return
			end
		elseif Seqno == 1100 then
			if MonsterRacevalue8 == GameMasterCdkey then
				local MonsterRacevalue12 = splitplus(Data,"|")
				local MonsterRacevalue14 = 0
				for i = 1,(#MonsterRacevalue12/2) do
					for k,v in pairs(MonsterRacevalue3) do
						if tonumber(v[1]) == tonumber(MonsterRacevalue12[i*2-1]) + 1 then
							MonsterRacevalue3[k][2] = v[2] + tonumber(MonsterRacevalue12[i*2])*50
							NLG.SystemMessage(player,RaceMonster[tonumber(MonsterRacevalue12[i*2-1])+1][1].."的速度提高"..tonumber(MonsterRacevalue12[i*2]).."级。")
							break
						end
					end
				end
			else
				return
			end
		elseif Seqno == 1200 then
			if MonsterRacevalue8 == GameMasterCdkey then
				local MonsterRacevalue12 = splitplus(Data,"|")
				local MonsterRacevalue14 = 0
				for i = 1,(#MonsterRacevalue12/2) do
					for k,v in pairs(MonsterRacevalue3) do
						if v[1] == tonumber(MonsterRacevalue12[i*2-1]) + 1 then
							MonsterRacevalue3[k][2] = v[2] - tonumber(MonsterRacevalue12[i*2])*50
							NLG.SystemMessage(player,RaceMonster[tonumber(MonsterRacevalue12[i*2-1])+1][1].."的速度降低"..tonumber(MonsterRacevalue12[i*2]).."级。")
							break
						end
					end
				end
			else
				return
			end
		end
	end
end

function MonsterRacevalue23(npc)
	if MonsterRacevalue2 == 0 then
		if ctrltype == 1 then
			local MonsterRacevalue15 = tonumber(os.date("%H"))
			--print("MonsterRacevalue15 = "..MonsterRacevalue15)
			if MonsterRacevalue15 >= starttime and MonsterRacevalue15 < endtime then
				MonsterRacevalue2 = 1
				MonsterRacevalue1 = os.time()
				MonsterRacevalue29()
				NLG.SystemMessage(-1,"赛马比赛现在开始接受投注啦~想要参与的玩家快来咯~")
			end
		end
	elseif MonsterRacevalue2 == 1 then
		if os.time() - MonsterRacevalue1 >= bettime * 60 then
			MonsterRacevalue2 = 2
			NLG.SystemMessage(-1,"赛马比赛现在正式开赛啦！没来得及投注的玩家请等下次机会~")
		end
	end
end

function MonsterRacevalue27(npc)
	if MonsterRacevalue2 == 2 then
		NLG.SetAction(npc,1)
		local MonsterRacevalue16= math.random(FootLimetMin,FootLimetMax)
		MonsterRacevalue16 = MonsterRacevalue16 + MonsterRacevalue3[npc][2]
		if MonsterRacevalue16 >= 3000 then
			MonsterRacevalue16 = 3000
		elseif MonsterRacevalue16 <= 100 then
			MonsterRacevalue16 = 100
		end
		MonsterRacevalue3[npc][3] = MonsterRacevalue3[npc][3] + MonsterRacevalue16
		if MonsterRacevalue3[npc][3] >= 1000 then
			repeat
				--if MonsterRacevalue3[npc][3] >= 1000 then
					if RaceMonsterDir == 1 then
						NLG.WalkMove(npc,2)
					else
						NLG.WalkMove(npc,4)
					end
					MonsterRacevalue3[npc][3] = MonsterRacevalue3[npc][3] - 1000
					local MonsterRacevalue17
					if RaceMonsterDir == 1 then
						MonsterRacevalue17 = Char.GetData(npc,%对象_X%)
					else
						MonsterRacevalue17 = Char.GetData(npc,%对象_Y%)
					end
					if MonsterRacevalue17 >= MonsterRacevalue20 then
						NLG.SystemMessage(-1,"恭喜"..Char.GetData(npc,%对象_名字%).."获得了本次比赛的胜利！")
						for k,v in pairs(MonsterRacevalue4) do
							if type(v[MonsterRacevalue3[npc][1]]) == "table" then
								if v[MonsterRacevalue3[npc][1]][1] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][1] ~= nil then
										MonsterRacevalue5[k][1] = MonsterRacevalue5[k][1] + magnification1 * v[MonsterRacevalue3[npc][1]][1]
									else
										MonsterRacevalue5[k][1] = magnification1 * v[MonsterRacevalue3[npc][1]][1]
									end
								end
								if v[MonsterRacevalue3[npc][1]][2] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][2] ~= nil then
										MonsterRacevalue5[k][2] = MonsterRacevalue5[k][2] + magnification2 * v[MonsterRacevalue3[npc][1]][2]
									else
										MonsterRacevalue5[k][2] = magnification2 * v[MonsterRacevalue3[npc][1]][2]
									end						
								end
								if v[MonsterRacevalue3[npc][1]][3] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][3] ~= nil then
										MonsterRacevalue5[k][3] = MonsterRacevalue5[k][3] + magnification3 * v[MonsterRacevalue3[npc][1]][3]
									else
										MonsterRacevalue5[k][3] = magnification3 * v[MonsterRacevalue3[npc][1]][3]
									end						
								end
							end
						end
						MonsterRacevalue4 = {}
						local MonsterRacevalue15 = tonumber(os.date("%H"))
						if MonsterRacevalue15 >= starttime and MonsterRacevalue15 < endtime and ctrltype == 1 then
							--[[
							MonsterRacevalue2 = 1
							MonsterRacevalue1 = os.time()
							MonsterRacevalue28()
							MonsterRacevalue29()
							]]
							MonsterRacevalue2 = 0
							MonsterRacevalue28()
						else
							MonsterRacevalue2 = 0
							MonsterRacevalue28()
						end
						break
					end
				--else
				--	break
				--end
			until MonsterRacevalue3[npc][3] < 1000 or MonsterRacevalue2 ~= 2
		end
	end
end

function MonsterRacevalue28()
	for k,v in pairs(MonsterRacevalue7) do
		local MonsterRacevalue18 = NL.DelNpc(v)
		MonsterRacevalue7[k] = nil
	end
	MonsterRacevalue3 = {}
	MonsterRacevalue6 = {}
	MonsterRacevalue7 = {}
end

function MonsterRacevalue29()
	for i = 1,#RaceMonster do
		MonsterRacevalue7[i] = NL.CreateNpc(nil,"MonsterRacevalue26")
		MonsterRacevalue3[MonsterRacevalue7[i]] = {i,0,i}
		MonsterRacevalue6[i] = {0,0,0}
		Char.SetData(MonsterRacevalue7[i],%对象_形象%,RaceMonster[i][2])
		Char.SetData(MonsterRacevalue7[i],%对象_原形%,RaceMonster[i][2])
		--Char.SetData(MonsterRacevalue7[i],3,0)
		Char.SetData(MonsterRacevalue7[i],%对象_地图%,RaceMonstermap)
		Char.SetData(MonsterRacevalue7[i],%对象_原名%,RaceMonster[i][1])
		if RaceMonsterDir == 1 then
			Char.SetData(MonsterRacevalue7[i],%对象_X%,RaceMonsterposx)
			Char.SetData(MonsterRacevalue7[i],%对象_Y%,RaceMonsterposy+i-1)
			Char.SetData(MonsterRacevalue7[i],%对象_方向%,4)
		else
			Char.SetData(MonsterRacevalue7[i],%对象_X%,RaceMonsterposx+i-1)
			Char.SetData(MonsterRacevalue7[i],%对象_Y%,RaceMonsterposy)
			Char.SetData(MonsterRacevalue7[i],%对象_方向%,2)
		end
		NLG.UpChar(MonsterRacevalue7[i])
		Char.SetLoopEvent(nil,"MonsterRacevalue27",MonsterRacevalue7[i],1000)
	end
end

if MonsterRacevalue25 == nil or MonsterRacevalue25 < 0 then
	MonsterRacevalue25 = NL.CreateNpc(nil,"MonsterRacevalue24")
end


