------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--极速狂飙（跑马）
--
--指定时间自动开始，玩家下注，押注胜出后获得奖励
--
--by Duckyの復活
--in 2013.12.4
-------------------------------------------------------------
--NPC设置
local RaceNpcName = "赛马裁判员"			--NPC名称
local RaceNpcImage = 106602				--NPC图档
local RaceNpcMapPos = {0,1000,243,83}		--NPC摆放位置
local RaceNpcMapDir = 4					--NPC摆放方向
--自动开始设置(注意：要同时符合以下的时间条件，才会自动开始)
local RaceNpcAutoStartEnable = 1			--跑马是否自动开始
local RaceNpcAutoStartTimeWeek = {0,1,2,3,4,5,6}	--自动开始-星期：0-周日，1-周一，2-周二，3-周三，4-周四，5-周五，6-周六
local RaceNpcAutoStartTimeHour = {20}		--自动开始-小时：0-23
local RaceNpcAutoStartTimeMin = {0}			--自动开始-分钟：0-59
--跑马图档
--豹子110574-110585
--树叶精灵104339-104343
--火柴精灵104372-104376
--番茄精灵104377-104381
local RaceHorseImage = {}
RaceHorseImage[1] = 107002
RaceHorseImage[2] = 120059
RaceHorseImage[3] = 107001
RaceHorseImage[4] = 120060
RaceHorseImage[5] = 107000
--跑马起始位置
local RaceHorsePos = {}
RaceHorsePos[1] = {0,1000,247,86}
RaceHorsePos[2] = {0,1000,247,87}
RaceHorsePos[3] = {0,1000,247,88}
RaceHorsePos[4] = {0,1000,247,89}
RaceHorsePos[5] = {0,1000,247,90}
--跑马终点位置
local RaceHorseEnd = {}
RaceHorseEnd[1] = {0,1000,183,86}
RaceHorseEnd[2] = {0,1000,183,87}
RaceHorseEnd[3] = {0,1000,183,88}
RaceHorseEnd[4] = {0,1000,183,89}
RaceHorseEnd[5] = {0,1000,183,90}
--跑马起始方向
local RaceHorseDir = {6, 6, 6, 6, 6}
--跑马名称
local RaceHorseName = {}
RaceHorseName[1] = "①号红运当头"
RaceHorseName[2] = "②号白兰地"
RaceHorseName[3] = "③号蓝带Martell"
RaceHorseName[4] = "④号黑色旋风"
RaceHorseName[5] = "⑤号黄家马德里"
-------------------------------------------------------------
--跑马对话设置
local RaceHorseSay = 1			--是否开启跑马对话
local RaceHorseColor = {6,0,3,7,4}	--分别对应1-5号的字体颜色
local RaceHorseSaySet = {}
RaceHorseSaySet[1] = "冲啊~~~~~！"
RaceHorseSaySet[2] = "我是冠军！！"
RaceHorseSaySet[3] = "挡我者。。。杀！"
RaceHorseSaySet[4] = "看我幻影冲刺~"
RaceHorseSaySet[5] = "瞬开！"
RaceHorseSaySet[6] = "飞廉踏！"
RaceHorseSaySet[7] = "我腿长~~~"
RaceHorseSaySet[8] = "我停不下来了！！！"
RaceHorseSaySet[9] = "小心我踢你"
RaceHorseSaySet[10] = "赢了奖金记得分我一份哦！"
RaceHorseSaySet[11] = "以我爷爷的名义发誓，我一定要赢！"
RaceHorseSaySet[12] = "冠军就要诞生了！"
RaceHorseSaySet[13] = "你们跑得过我吗？"
RaceHorseSaySet[14] = "胡萝卜~~~别跑！！！"
RaceHorseSaySet[15] = "听说终点有美女！！！"
RaceHorseSaySet[16] = "我不能落后啊！跑最后的今晚没饭吃呢！"
RaceHorseSaySet[17] = "好长的路啊，怎么还没跑完……"
RaceHorseSaySet[18] = "不知道有多少人押注我呢？"
-------------------------------------------------------------
--【赌注设置】
local RaceHorseMode = 2				--模式（1=金币，2=道具）
local RaceHorseGold = 5000			--金币数量（金币模式时生效）
local RaceHorseItemID = 888888		--道具ID（道具模式时生效）
local RaceHorseItemName = "蘑菇"	--道具名称（道具模式时生效）
local RaceHorseItemNum = 5			--道具数量（道具模式时生效）
--【赔点奖励】
local RaceRewardMode = 2			--模式（1-金币，2-道具，3=人数）
local RaceRewardGold = 8000		--金币数量（金币模式时生效）
local RaceRewardItemID = 888888		--道具ID（道具模式时生效）
local RaceRewardItemName = "蘑菇"	--道具名称（道具模式时生效）
local RaceRewardItemNum = 15		--道具数量（道具模式时生效）
local RaceRewardGoldPer = 1000		--金币数量/每个下注者（人数模式时生效）
-------------------------------------------------------------
--系统变量
local RaceHorsePlayer = {}				--玩家记录
local RaceHorsePlayerWin = {}			--获奖玩家记录
local RaceHorsePlayerNum = 0			--玩家人数记录
local RaceHorsePlayerWinNum = 0			--获奖玩家人数记录
--local RaceHorseCtrl = {}
local RaceHorseWalkCount = {0,0,0,0,0}
local RaceHorseStep = 0					--步骤控制
local RaceHorseCount = 0				--步骤计时
local RaceHorseWinNo = 0
local RaceHorseAction = {3,30,5,6}
local 常量 = {}
常量.对象 = {}
常量.对象.形象=1
常量.对象.原形=2
常量.对象.地图类型=3
常量.对象.地图=4
常量.对象.X=5
常量.对象.Y=6
常量.对象.方向=7
常量.对象.等级=8
常量.对象.金币=53
常量.对象.GM=144
常量.对象.原名=2000
常量.对象.账号=2002
常量.道具 = {}
常量.道具.ID=0
常量.道具.类型=3
常量.道具.双手=5
常量.道具.堆叠数=9
常量.道具.等级=11
常量.道具.耐久=65
常量.道具.最大耐久=13
常量.道具.未鉴定名 = 2000
常量.道具.已鉴定名 = 2001
常量.道具.刻印=2002
常量.道具.自用参数=2003
常量.道具.刻印玩家=2004
-------------------------------------------------------------
Delegate.RegInit("RaceHorse_Init");

function RaceHorse_Myinit(Index)
	return true
end

function RaceHorse_Init()
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,常量.对象.形象, RaceNpcImage);
	Char.SetData(NpcIndex,常量.对象.原形, RaceNpcImage);
	--Char.SetData(NpcIndex,常量.对象.地图类型, RaceNpcMapPos[1]);
	Char.SetData(NpcIndex,常量.对象.地图, RaceNpcMapPos[2]);
	Char.SetData(NpcIndex,常量.对象.X, RaceNpcMapPos[3]);
	Char.SetData(NpcIndex,常量.对象.Y, RaceNpcMapPos[4]);
	Char.SetData(NpcIndex,常量.对象.方向, RaceNpcMapDir);
	Char.SetData(NpcIndex,常量.对象.原名, RaceNpcName);
	tbl_LuaNpcIndex["RaceHorseNPC"]=NpcIndex
	NLG.UpChar(NpcIndex);
	Char.SetLoopEvent(nil, "RaceHorse_LoopEvent", NpcIndex, 100)
	Char.SetTalkedEvent(nil, "RaceHorse_TalkedEvent", NpcIndex)
	Char.SetWindowTalkedEvent(nil, "RaceHorse_WindowTalkEvent", NpcIndex);
	--Char.SetWalkOverEvent(nil, nil, NpcIndex)
	--Char.SetWalkPostEvent(nil, nil, NpcIndex)
	--Char.SetWalkPreEvent(nil, nil, NpcIndex)
--[[
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,常量.对象.形象, RaceNpcImage);
	Char.SetData(NpcIndex,常量.对象.原形, RaceNpcImage); 
	--Char.SetData(NpcIndex,常量.对象.地图类型, RaceNpcMapPos[1]);
	Char.SetData(NpcIndex,常量.对象.地图, RaceNpcMapPos[2]);
	Char.SetData(NpcIndex,常量.对象.X, RaceNpcMapPos[3]);
	Char.SetData(NpcIndex,常量.对象.Y, RaceNpcMapPos[4]-6);
	Char.SetData(NpcIndex,常量.对象.方向, RaceNpcMapDir);
	Char.SetData(NpcIndex,常量.对象.原名, RaceNpcName);
	tbl_LuaNpcIndex["RaceHorseNPC2"]=NpcIndex
	NLG.UpChar(NpcIndex);
--]]
	for i = 1,5 do
		tbl_LuaNpcIndex["RaceHorse_" .. i]=RaceHorse_CreateHorse(RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4], RaceHorseDir[i], RaceHorseImage[i], RaceHorseName[i])
	end
	tbl_LuaNpcIndex["RaceHorse_End"]=RaceHorse_CreateHorse(RaceHorseEnd[3][1], RaceHorseEnd[3][2], RaceHorseEnd[3][3]+1, RaceHorseEnd[3][4], 0, 113217, " ")
end

function RaceHorse_CreateHorse(MapType, MapID, PosX, PosY, Dir, Image, Name)
	local NpcIndex = NL.CreateNpc(nil, "RaceHorse_Myinit");
	Char.SetData(NpcIndex,常量.对象.形象, Image);
	Char.SetData(NpcIndex,常量.对象.原形, Image);
	--Char.SetData(NpcIndex,常量.对象.地图类型, MapType);
	Char.SetData(NpcIndex,常量.对象.地图, MapID);
	Char.SetData(NpcIndex,常量.对象.X, PosX);
	Char.SetData(NpcIndex,常量.对象.Y, PosY);
	Char.SetData(NpcIndex,常量.对象.方向, Dir);
	Char.SetData(NpcIndex,常量.对象.原名, Name);
	NLG.UpChar(NpcIndex);
	--Char.SetLoopEvent(nil, nil, NpcIndex, 1000)
	Char.SetTalkedEvent(nil, "RaceHorseSub_TalkedEvent", NpcIndex)
	Char.SetWindowTalkedEvent(nil, "RaceHorseSub_WindowTalkEvent", NpcIndex);
	return NpcIndex
end




function RaceHorse_LoopEvent( _MeIndex )
	if RaceHorseStep==0 then
		--没事做，直接回碗里去吧
		if RaceNpcAutoStartEnable==1 then
			RaceHorseCount = RaceHorseCount + 1
			if math.fmod(RaceHorseCount,200)==0 then
				local rt = RaceHorseSub_CheckAutoTime(os.time())
				--print("\n rt=" .. tostring(rt) .. " | " .. os.date())
				if rt==true then
					RaceHorseSub_AutoStart()
				end
			end
		end
		return
	end
	RaceHorseCount = RaceHorseCount + 1

	local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
	local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)

	if RaceHorseStep==1 and RaceHorseCount>=600 then
		local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
		local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)
		NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] 解说员：比赛开始！！！")
		RaceHorseStep=2
		RaceHorseCount=0
	elseif RaceHorseStep==1 then
		if math.fmod(RaceHorseCount,100)==0 and (600-RaceHorseCount)>=51 then
			for i = 1,5 do
				local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
				NLG.SetAction(HorseIndex, 6)
			end
			local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
			local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)
			NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] 解说员：活动将在" .. math.floor((600-RaceHorseCount)/10) .. "秒后开始了！")
		elseif (600-RaceHorseCount)<51 and math.fmod(RaceHorseCount,10)==0 then
			local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
			local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)
			NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] 解说员：比赛预备倒数..." .. (600-RaceHorseCount)/10 .. "...")
		end
	elseif RaceHorseStep==2 then
		for i = 1,5 do
			local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
			--到终点
			if RaceHorse_getDistancePos(HorseIndex, RaceHorseEnd[i][3], RaceHorseEnd[i][4])==0 then
				RaceHorseWinNo = i
				RaceHorseStep = 3
				RaceHorseCount = 0
				for o = 1,5 do
					local tHorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. o]
					NLG.SetAction(tHorseIndex, 10)
				end
				NLG.SetAction(tbl_LuaNpcIndex["RaceHorse_" .. RaceHorseWinNo], 6)
				RaceHorsePlayerWinNum = 0
				print("\n---------------------列出下注玩家清单：")
				for k,v in pairs(RaceHorsePlayer) do
					print(k .. "=" .. v)
					if v==RaceHorseWinNo then
						--print("\n中奖玩家：" .. Char.GetData(v, 常量.对象.原名))
						RaceHorsePlayerWinNum=RaceHorsePlayerWinNum+1
						RaceHorsePlayerWin[k] = true
					end
				end
				RaceHorsePlayer = {}
				NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] 解说员：【" .. RaceHorseName[RaceHorseWinNo] .. "】以迅雷不及掩耳的速度冲刺了！成为新一轮的冠军霸主！")
				NLG.SystemMessageToMap(MeMapType, MeMapID, "[" .. RaceNpcName .. "] 解说员：请押注了【" .. RaceHorseName[RaceHorseWinNo] .. "】的玩家，尽快来跑马处领奖，逾期当弃权处理。")
				return
			--未到终点
			else
				local RND = NLG.Rand(5,10)
				NLG.SetAction(HorseIndex, 3)
				if RND==5 then
					RaceHorseWalkCount[i] = RaceHorseWalkCount[i] + 1
					NLG.WalkMove(HorseIndex, 6)
					local SRND = NLG.Rand(1,100)
					if RaceHorseSaySet[SRND]~=nil then
						RaceHorse_EasySay(HorseIndex, RaceHorseSaySet[SRND], 5, RaceHorseColor[i], 2)
					end
				end
			end
		end
	elseif RaceHorseStep==3 then
		
		if RaceHorseCount>30 then
			for i = 1,5 do
				local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
				Char.Warp(HorseIndex, RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4])
			end
			RaceHorseStep = 0
			RaceHorseCount = 0
		elseif math.fmod(RaceHorseCount,100)==0 or RaceHorseCount<5 then
			for o = 1,5 do
				local tHorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. o]
				NLG.SetAction(tHorseIndex, 10)
			end
			NLG.SetAction(tbl_LuaNpcIndex["RaceHorse_" .. RaceHorseWinNo], 6)
		end
	end
	
	return
end

function RaceHorse_TalkedEvent( _MeIndex, _PlayerIndex, _Mode)

	if NLG.CheckInFront(_PlayerIndex, _MeIndex, 3) == false then
		return ;
	end

	local PriceMSG = RaceHorseGold .. "G"
	if RaceHorseMode==2 then
		PriceMSG = "[" .. RaceHorseItemName .. "]" .. RaceHorseItemNum .. "个"
	end

	local RewardMSG = "[" .. RaceRewardGold .. "]G"
	if RaceRewardMode==2 then
		RewardMSG = "[" .. RaceRewardItemName .. "]" .. RaceRewardItemNum .. "个"
	end
	if RaceRewardMode==3 then
		if RaceHorsePlayer[getTabKey(_PlayerIndex)]==nil then
			RewardMSG = RaceRewardGoldPer .. "G×" .. RaceHorsePlayerNum+1 .. "人，共计[" .. RaceRewardGoldPer*(RaceHorsePlayerNum+1) .. "]G（所有获奖者平分）"
		else
			RewardMSG = RaceRewardGoldPer .. "G×" .. RaceHorsePlayerNum+1 .. "人，共计[" .. RaceRewardGoldPer*(RaceHorsePlayerNum) .. "]G（所有获奖者平分）"
		end
	end

	local buf = "7\n　　　　　　　　　◆" .. RaceNpcName .. "◆"
	buf = buf .. "\n系统说明如下："
	buf = buf .. "\n1、每天晚上8点（或GM临时开启）开始跑马"
	buf = buf .. "\n2、每次花费 " .. PriceMSG .. " 押注一批跑马"
	buf = buf .. "\n3、活动开始后，跑马将绕着大半个法兰城赛跑"
	buf = buf .. "\n4、下注的跑马最先到达重点，可获得："
	buf = buf .. "\n 　" .. RewardMSG
	buf = buf .. "\n　　　　　　　　　『跑马开始』（GM专用）"
	buf = buf .. "\n　　　　　　　　　『投注点数』"
	buf = buf .. "\n　　　　　　　　　『领取奖励』"

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 0, 0, buf);

	return ;
end

function RaceHorse_WindowTalkEvent(_MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	--『首页』
	if _Seqno==0 and tonumber(_Data)==1 then
		--『跑马开始』
		if (Char.GetData(_PlayerIndex,%对象_GM%)~=1) then
			NLG.SystemMessage(_PlayerIndex, "[系统] 你不是GM，无法使用此功能")
			return
		end
		RaceHorseSub_AutoStart()
	elseif _Seqno==0 and tonumber(_Data)==2 then
		--『投注点数』
		local HorseList = ""
		for i = 1,5 do
			HorseList = HorseList .. "\n　　　　　║　　" .. strFormat(RaceHorseName[i],20,1) .. "║"
		end
		
		local buf = "3\n　　　　　　　　　◆" .. RaceNpcName .. "◆"
		buf = buf .. "\n请选择要下注的跑马："
		buf = buf .. "\n　　　　　╔════════════╗"
		buf = buf .. HorseList
		buf = buf .. "\n　　　　　╚════════════╝"
		buf = buf .. "\n　　　　　　　　　　『退出』"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 0, 1, buf);
	elseif _Seqno==0 and tonumber(_Data)==3 then
		--『领取奖励』
		--判断是否已下注
		if RaceHorsePlayerWin[getTabKey(_PlayerIndex)]~=true then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你没有获奖！")
			return
		end
		--领取
		if RaceRewardMode==1 then
			local tPlayerGold = Char.GetData(_PlayerIndex, 常量.对象.金币)
			if (tPlayerGold+RaceRewardGold)>1000000 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你身上的钱太多了，花掉一点再来吧！")
				return
			else
				Char.SetData(_PlayerIndex, 常量.对象.金币, Char.GetData(_PlayerIndex, 常量.对象.金币) + RaceRewardGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你领取了" .. RaceRewardGold .. "G")
				RaceHorsePlayerWin[getTabKey(_PlayerIndex)] = nil
				NLG.UpChar(_PlayerIndex)
				return
			end
		elseif RaceRewardMode==2 then
			if Char.ItemSlot(_PlayerIndex)>=20 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你身上的道具太多了，卖掉一点再来吧！")
				return
			else
				Char.GiveItem(_PlayerIndex, RaceRewardItemID, RaceRewardItemNum)
				RaceHorsePlayerWin[getTabKey(_PlayerIndex)] = nil
				return
			end
		elseif RaceRewardMode==3 then
			local TotalGold = RaceRewardGoldPer*RaceHorsePlayerNum
			local PerGold = math.floor(TotalGold/RaceHorsePlayerWinNum)
			local tPlayerGold = Char.GetData(_PlayerIndex, 常量.对象.金币)
			if (tPlayerGold+PerGold)>1000000 then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你身上的钱太多了，花掉一点再来吧！")
				return
			else
				Char.SetData(_PlayerIndex, 常量.对象.金币, Char.GetData(_PlayerIndex, 常量.对象.金币) + PerGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 本期比赛共有奖金" .. TotalGold .. "G，共" .. RaceHorsePlayerWinNum .. "人中，你领取了" .. PerGold .. "G奖金。")
				NLG.UpChar(_PlayerIndex)
				return
			end
		end
	end

	if _Seqno==1 then
		local SelectPos = tonumber(_Data)
		if SelectPos>5 then
			return
		end
		--判断是否已下注
		if RaceHorsePlayer[getTabKey(_PlayerIndex)]~=nil then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你已下注了" .. RaceHorseName[RaceHorsePlayer[getTabKey(_PlayerIndex)]] .. "，请勿重复下注！")
			return
		end
		--判断比赛是否开始
		if RaceHorseStep~=0 then
			NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 比赛已开始，无法下注！")
			return
		end
		--判断是否够钱
		if RaceHorseMode==1 then
			local tPlayerGold = Char.GetData(_PlayerIndex, 常量.对象.金币)
			if tPlayerGold<RaceHorseGold then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 连" .. RaceHorseGold .. "G都没有，滚一边去，别碍着大爷做生意！")
				return
			else
				Char.SetData(_PlayerIndex, 常量.对象.金币, Char.GetData(_PlayerIndex, 常量.对象.金币) - RaceHorseGold)
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你花费了" .. RaceHorseGold .. "G")
				NLG.UpChar(_PlayerIndex)
			end
		elseif RaceHorseMode==2 then
			local tItemNum = Char.ItemNum(_PlayerIndex, RaceHorseItemID)
			if tItemNum<RaceHorseItemNum then
				NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 连" .. RaceHorseItemNum .. "个" .. RaceHorseItemName .. "都没有，滚一边去，别碍着大爷做生意！")
				return
			else
				Char.DelItem(_PlayerIndex, RaceHorseItemID, RaceHorseItemNum)
			end
		end
		RaceHorsePlayer[getTabKey(_PlayerIndex)] = SelectPos
		RaceHorsePlayerNum = RaceHorsePlayerNum + 1
		NLG.SystemMessage(_PlayerIndex, "[" .. RaceNpcName .. "] 你成功下注了" .. RaceHorseName[SelectPos] .. "，祝你好运！")
	end
	return
end

function RaceHorseSub_TalkedEvent( _MeIndex, _PlayerIndex, _Mode)
	local SelectHorse = 0
	for i = 1,5 do
		if tbl_LuaNpcIndex["RaceHorse_" .. i]==_MeIndex then
			SelectHorse=i
		end
	end
	--『投注点数』
	local HorseList = ""
	for i = 1,5 do
		if SelectHorse==i then
			HorseList = HorseList .. "\n　　　　　║★☆" .. strFormat(RaceHorseName[i],20,1) .. "║"
		else
			HorseList = HorseList .. "\n　　　　　║　　" .. strFormat(RaceHorseName[i],20,1) .. "║"
		end
	end
	
	local buf = "3\n　　　　　　　　　◆" .. RaceNpcName .. "◆"
	buf = buf .. "\n请选择要下注的跑马："
	buf = buf .. "\n　　　　　╔════════════╗"
	buf = buf .. HorseList
	buf = buf .. "\n　　　　　╚════════════╝"
	buf = buf .. "\n　　　　　　　　　　『退出』"
	
	NLG.ShowWindowTalked(_PlayerIndex, tbl_LuaNpcIndex["RaceHorseNPC"], 2, 0, 1, buf);
	return
end

function RaceHorseSub_AutoStart()
		RaceHorseStep = 1
		RaceHorseCount = 450
		RaceHorseWinNo = 0
		RaceHorseWalkCount = {0,0,0,0,0}
		--RaceHorsePlayer = {}
		RaceHorsePlayerWin = {}
		RaceHorsePlayerNum = 0
		RaceHorsePlayerWinNum = 0
		for i = 1,5 do
			local HorseIndex = tbl_LuaNpcIndex["RaceHorse_" .. i]
			Char.Warp(HorseIndex, RaceHorsePos[i][1], RaceHorsePos[i][2], RaceHorsePos[i][3], RaceHorsePos[i][4])
		end
end

function RaceHorseSub_WindowTalkEvent(_MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	return
end

function RaceHorse_getFrontPos(x, y, dir)
	if dir>=1 and dir<=3 then
		x=x+1
	end
	if dir>=3 and dir<=5 then
		y=y+1
	end
	if dir>=5 and dir<=7 then
		x=x-1
	end
	if dir>=7 or dir<=1 then
		y=y-1
	end
	return {x, y}
end

function RaceHorse_getTurnDir(_Dir, _Turn)
	return math.fmod((_Dir+_Turn),8)
end

function RaceHorse_EasySay(_MeIndex, _Msg, _Range, _Color, _Size)
	local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
	local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)
	local Target = NLG.GetMapPlayer(MeMapType, MeMapID)
	if type(Target)~="table" then
		return
	end
	for Key, TargetIndex in pairs(Target) do
		if RaceHorse_getDistance(_MeIndex, TargetIndex)<=_Range then
			NLG.TalkToCli(TargetIndex, _MeIndex, _Msg, _Color, _Size)
		end
	end
end

function RaceHorse_getDistance(_MeIndex, _ToIndex)
	local MeMapType = Char.GetData(_MeIndex, 常量.对象.地图类型)
	local MeMapID = Char.GetData(_MeIndex, 常量.对象.地图)
	local MePosX = Char.GetData(_MeIndex, 常量.对象.X)
	local MePosY = Char.GetData(_MeIndex, 常量.对象.Y)
	local ToMapType = Char.GetData(_ToIndex, 常量.对象.地图类型)
	local ToMapID = Char.GetData(_ToIndex, 常量.对象.地图)
	local ToPosX = Char.GetData(_ToIndex, 常量.对象.X)
	local ToPosY = Char.GetData(_ToIndex, 常量.对象.Y)
	if MeMapType~=ToMapType or MeMapID~=ToMapID then
		return -1
	end
	return math.abs(math.floor(math.sqrt((MePosX-ToPosX)*(MePosX-ToPosX)+(MePosY-ToPosY)*(MePosY-ToPosY))));
end

function RaceHorse_getDistancePos(_MeIndex, ToPosX, ToPosY)
	local MePosX = Char.GetData(_MeIndex, 常量.对象.X)
	local MePosY = Char.GetData(_MeIndex, 常量.对象.Y)
	return math.abs(math.floor(math.sqrt((MePosX-ToPosX)*(MePosX-ToPosX)+(MePosY-ToPosY)*(MePosY-ToPosY))))
end


function RaceHorseSub_CheckAutoTime(_Time)
	_Time = _Time or os.time()
	local tWeek = tonumber(os.date("%w", _Time))
	local tHour = tonumber(os.date("%H", _Time))
	local tMin = tonumber(os.date("%M", _Time))
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeWeek do
		if tWeek==RaceNpcAutoStartTimeWeek[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeHour do
		if tHour==RaceNpcAutoStartTimeHour[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #RaceNpcAutoStartTimeMin do
		if tMin==RaceNpcAutoStartTimeMin[i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	return true
end
