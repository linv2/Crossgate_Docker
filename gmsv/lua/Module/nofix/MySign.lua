local GMCDKEY = "shiluodegirl" --控制帐号
local NpcMetamo = 100452 --签到npc形象
local NpcMap = 1000 --签到npc地图
local Npcposx = 225 --签到Npcx坐标
local Npcposy = 83 --签到Npcy坐标
local NpcDir = 4 --签到Npc方向
local NpcName = "签到管理员" --签到npc名字
local Npcmsg = "这里可以签到。每天签到可以得到奖励。" --签到说明
local NpcChangeDays = "换日时间到，所有签到资料已被清除。" --换日喊话
local VipEndEvent = 198 --判断是否vip的endevent旗标
local SignGiveItem = {} --签到给予的道具
SignGiveItem[10] = {520026,520027} --SignGiveItem[level] = {item1,item2} 等级为level时，通常得到1个item1，vip得到1个item2
SignGiveItem[40] = {520028,520029}
SignGiveItem[70] = {520030,520031}
SignGiveItem[100] = {520032,520033}
SignGiveItem[130] = {520034,520035}
--*注意：如果在服务器关闭时间内跨日 请在开服前手动删除./lua/Module/目录下MySignTemp.txt文件。否则将导致关服前签到者无法重新签到。
--其他情况请勿打开、移动、修改或删除此文件。否则将导致签到信息丢失。
----------------------------------------------------------
local MySignValue1
for i = 1,999 do
	if SignGiveItem[i] == nil then
		SignGiveItem[i] = MySignValue1
	else
		MySignValue1 = SignGiveItem[i]
	end
end

function MySignValue2(npc)
	Char.SetData(npc,(%对象_形象%),NpcMetamo)
	Char.SetData(npc,%对象_原形%,NpcMetamo)
	Char.SetData(npc,%对象_地图%,NpcMap)
	--Char.SetData(npc,%对象_X%,Npcposx)
	Char.SetData(npc,%对象_X%,Npcposx)
	Char.SetData(npc,%对象_Y%,Npcposy)
	Char.SetData(npc,%对象_方向%,NpcDir)
	Char.SetData(npc,%对象_原名%,NpcName)
	Char.SetTalkedEvent(nil, "MySignValue3",npc)
	Char.SetWindowTalkedEvent(nil,"MySignValue6",npc)
	Char.SetLoopEvent(nil,"MySignValue7",npc,1000)
	NLG.UpChar(npc)
	return true
end

function MySignValue3(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local MySignValue4 = "3\n请选择您需要的服务：\n\n\n1.签到说明\n2.立刻签到"
		local MySignValue5 = Char.GetData(player,%对象_CDK%)
		if MySignValue5 == GMCDKEY then
			MySignValue4 = MySignValue4.."\n3.立即重置签到"
		end
		NLG.ShowWindowTalked(player,npc,2,2,0,MySignValue4)
	end
end

function MySignValue6(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					NLG.ShowWindowTalked(player,npc,0,2,2,Npcmsg)
				elseif tonumber(Data) == 2 then
					MySignValue8(player)
				elseif tonumber(Data) == 3 then
					local MySignValue5 = Char.GetData(player,%对象_CDK%)
					if MySignValue5 == GMCDKEY then
						MySignValue17 = os.time()
						SignInReset()
					end
				end
			end
		end
	end	
end

function MySignValue7(npc)
	if os.date("%x",MySignValue17) ~= os.date("%x",os.time()) then
		MySignValue17 = os.time()
		SignInReset()
		if type(NpcChangeDays) == "string" then
			NLG.SystemMessage(-1,NpcChangeDays)
		end
	end
end

function MySignValue8(player)
	local MySignValue5 = Char.GetData(player,%对象_CDK%)
	local MySignValue9  = Char.GetData(player,%对象_等级%)
	local MySignValue10  = Char.EndEvent(player,VipEndEvent)
	if Char.ItemSlot(player) <= 19 then
		if MySignValue16[MySignValue5] == nil then
			MySignValue16[MySignValue5] = 1
			local MySignValue11 = io.open("./lua/Module/MySignTemp.txt","a")
			MySignValue11:write(MySignValue5.."\n")
			MySignValue11:close()
			Char.GiveItem(player,SignGiveItem[MySignValue9][1+MySignValue10],1)
			NLG.SystemMessage(player,"签到成功！")
		else
			NLG.SystemMessage(player,"你已经签到过了。")
		end
	else
		NLG.SystemMessage(player,"你的东西太多了。")
	end
end

function SignInReset(key)
	if key ~= nil and key == 1 then
		local MySignValue12 = io.open("./lua/Module/MySignTemp.txt","r")
		if MySignValue12 ~= nil then
			for line in MySignValue12:lines() do
				MySignValue16[line] = 1
			end
			MySignValue12:close()
		else
			local MySignValue13 = io.open("./lua/Module/MySignTemp.txt","w")
			MySignValue13:close()
		end
	else
		local MySignValue14 = io.open("./lua/Module/MySignTemp.txt","w")
		MySignValue14:close()
		MySignValue16 = {}
	end
end

if MySignValue15 == nil or MySignValue15 < 0 then
	MySignValue15 = NL.CreateNpc(nil,"MySignValue2")
end

if type(MySignValue16) ~= "table" then
	MySignValue16 = {}
	SignInReset(1)
	MySignValue17 = os.time()
end
