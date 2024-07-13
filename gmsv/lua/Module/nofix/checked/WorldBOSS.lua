Delegate.RegInit("Boss_Init");
local bossID = {}
bossID[1] = {"法兰城",100454,0,1000,168,21,"大圣堂附近",10000} ---地图名，BOSS形象，地图类型，地图编号，东，南，BOSS坐标提示，战斗编号【参照encount】--多个请复制添加 编号往下推


local BOSS最大随机 = 1   ----设置随机刷新到几号BOSS
function Myinit(_MeIndex)
	return true;
end
function Boss_referee()
	if (que_referee == nil) then
		que_referee = NL.CreateNpc("lua/Module/WorldBOSS.lua", "Myinit");
		Char.SetData(que_referee,%对象_形象%,101003);
		Char.SetData(que_referee,%对象_原形%,101003);
		Char.SetData(que_referee,%对象_X%,20);
		Char.SetData(que_referee,%对象_Y%,20);
		Char.SetData(que_referee,%对象_地图%,777);
		Char.SetData(que_referee,%对象_方向%,4);
		Char.SetData(que_referee,%对象_名字%,"boss");
		NLG.UpChar(que_referee);
		Char.SetLoopEvent("lua/Module/WorldBOSS.lua", "Boss", que_referee, 5000);
	end
end
function Boss_Init()
	Boss_referee();
end

local Openweek = {0,1,2,3,4,5,6}  --星期几开放
local Opening = {2,4,6,8,10,12,14,16,18,20,22} --几点开放
local MinuteK = 0  ---开放分钟
local Recovery = {3,5,7,9,11,13,15,17,19,21,23} --几点回收
local MinuteH = 0  ---回收分钟
----------BOSS的编号记录-----刷新几个请设置几个--------
BOSS001 = 0
-------------------------------------------------------
BOSSSX = 0
--BOSSYD = 0

function Boss(_index)
	local tWeek = tonumber(os.date("%w", os.time()))
	local tHour = tonumber(os.date("%H", os.time()))
	local tMin = tonumber(os.date("%M", os.time()))
	local tS = tonumber(os.date("%S", os.time()))
	if Boss_CheckInTable(Openweek,tWeek)==true then
		if BOSSSX == 0 then	
			if Boss_CheckInTable(Opening,tHour)==true and tMin == MinuteK then
				Refresh_boss (_index)
				return
			end
		else
			if Boss_CheckInTable(Recovery,tHour)==true and tMin == MinuteH then
				Recoveryofboss (_index)
				return
			end
		end
	end
--	if BOSSYD == 1 then
--		local dir= math.random(0,7);
--		NLG.WalkMove(BOSS001,dir);
--		return
--	end
	return
end
function Refresh_boss (_index)
	if BOSSSX == 0 then	
		local SXJL =NLG.Rand(1,BOSS最大随机);
		local A = bossID[SXJL][1]
		local B = bossID[SXJL][2]
		local C = bossID[SXJL][3]
		local D = bossID[SXJL][4]
		local E = bossID[SXJL][5]
		local F = bossID[SXJL][6]
		local G = bossID[SXJL][7]
		local H = bossID[SXJL][8]
		local NPC = NL.CreateArgNpc("WalkEnemy","1|1000|1|1000|0|0||||||||9999999|"..H.."|||||||||","神秘BOSS",B,C,D,E,F,1);
		BOSS001 = NPC
		BOSSSX = 1
		--BOSSYD = 1
		NLG.SystemMessage(-1, "[系统]【"..G.."】出现了神秘BOSS，请大神速去剿灭。");
		return
	else
		NLG.SystemMessage(_index, "[系统]【当前boss已经在魔力世界里作乱，请尽快消灭】");
		return
	end	
end
function Recoveryofboss (_index)
	if BOSSSX == 1 then	
		Char.Warp(BOSS001, 0, 555, 10, 10)
		BOSSSX = 0
		--BOSSYD = 0
		NLG.SystemMessage(-1, "[系统]【由于世界BOSS无人挑战，感觉你们很无趣，默默的消失了】");
		return
	else
		NLG.SystemMessage(_index, "[系统]【当前没有可以回收的BOSS】");
		return
	end		
end
Delegate.RegDelTalkEvent("Boss_TalkEvent")
function Boss_TalkEvent(player,msg,color,range,size)
	local GM = Char.GetData(player,%对象_GM%);
	if(msg == "/BOSS") then
		if GM >= 1 then
			Refresh_boss (_index)
		else
			NLG.SystemMessage(_index, "[系统]您不是管理员无法使用。。。")
		end
	end
	if(msg == "/BOSS1") then
		if GM >= 1 then
			Recoveryofboss (_index)
		else
			NLG.SystemMessage(_index, "[系统]您不是管理员无法使用。。。")
		end
	end
end
function Boss_CheckInTable(_idTab, _idVar) ---循环函数
	for k,v in pairs(_idTab) do
		if v==_idVar then
			return true
		end
	end
	return false
end