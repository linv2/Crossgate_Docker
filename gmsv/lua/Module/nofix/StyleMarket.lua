------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--造型超市 for GE、GP
--
--与选中的造型NPC对话，可限时试穿，或永久改变造型，人宠均有效
--
--by Duckyの復活
--in 2014.4.24
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【基础设置】】】
------------------------------------------------------------------------------
--【脚本基础设置】
local NpcName = "造型超市"		--脚本名称
local TryPrice = 0.02			--试穿折扣（试穿价格=永久价格*折扣）
--【自动分配摆放设置】
--开启：全部由脚本按顺序自动分配摆放
--关闭：将按照每个【形象设置】中的地图坐标自定义摆放
local AutoMapSet = {}
AutoMapSet.On = 1			--自动配分摆放开关（0-关，1-开）
AutoMapSet.Map = 22223		--地图ID
AutoMapSet.MinX = 46		--地图最小X坐标（就是地图最西北方的坐标，一般为1）
AutoMapSet.MinY = 38		--地图最小Y坐标（就是地图最西北方的坐标，一般为1）
AutoMapSet.MaxX = 90		--地图最大X坐标（就是地图最东南方的坐标）
AutoMapSet.MaxY = 70		--地图最大Y坐标（就是地图最东南方的坐标）
AutoMapSet.Spacing = 1		--Npc间隔（每两个Npc横竖之间的间隔，默认为1）
AutoMapSet.AlignDir = 2		--排列方向：1-从北往南，2-从西往东
--【动作设置】
local ActionList = {0,1,2,3,4,5,6,8,9,10}	--随机动作候选编号
local AutoAction = 0		--每10秒自动做动作（选项：0-关闭，1-开启），开服建议关闭，此功能很消耗资源
local WalkAction = 1		--走过自动做动作（选项：0-关闭，1-开启）
local TalkAction = 1		--对话自动做动作（选项：0-关闭，1-开启）
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【形象设置】】】
------------------------------------------------------------------------------

local StyleSet = {}
--【手动设置】
--完整格式：{Name名称，Image图档，Map地图，X，Y，Dir方向，Price价格，Tar可用对象，Try试穿时长}
--简化格式：{Image图档，Price价格，Tar可用对象，Try试穿时长}	注：简化格式只在自动配分摆放打开时有效
--Tar可用对象：0-不可用，1-人物可用，2-宠物可用，3-人宠都可用
--Try试穿时长：0为不可试穿，-1为本地试穿（Warp后恢复），试穿后超过时间会自动恢复原形（单位：秒），默认为7200秒（2小时）
StyleSet[1] = {Name="小男生", Image=115090, Map=999, X=10, Y=10, Dir=6, Price=1000, Tar=0, Try=0}
StyleSet[2] = {Name="猫1", Image=115091, Map=999, X=10, Y=10, Dir=6, Price=2000, Tar=1, Try=0}
StyleSet[3] = {Name="猫2", Image=115092, Map=999, X=10, Y=10, Dir=6, Price=3000, Tar=2, Try=-1}
StyleSet[4] = {Name="猫3", Image=115093, Map=999, X=10, Y=10, Dir=6, Price=10000, Tar=2, Try=-1}
StyleSet[5] = {Name="猫4", Image=115094, Map=999, X=10, Y=10, Dir=6, Price=20000, Tar=3, Try=60}
StyleSet[6] = {Name="猫5", Image=115095, Map=999, X=10, Y=10, Dir=6, Price=30000, Tar=3, Try=60}
StyleSet[7] = {Name="小男生", Image=115096, Map=999, X=10, Y=10, Dir=6, Price=1000, Tar=0, Try=0}
StyleSet[8] = {Name="猫1", Image=115097, Map=999, X=10, Y=10, Dir=6, Price=2000, Tar=1, Try=0}
StyleSet[9] = {Name="猫2", Image=115098, Map=999, X=10, Y=10, Dir=6, Price=3000, Tar=2, Try=-1}
StyleSet[10] = {Name="猫3", Image=115099, Map=999, X=10, Y=10, Dir=6, Price=10000, Tar=2, Try=-1}
StyleSet[11] = {Name="猫4", Image=115100, Map=999, X=10, Y=10, Dir=6, Price=20000, Tar=3, Try=60}
StyleSet[12] = {Name="猫5", Image=115101, Map=999, X=10, Y=10, Dir=6, Price=30000, Tar=3, Try=60}
--【自动设置】
--注：自动设置将紧接在手动设置后面
--Tar可用对象：0-不可用，1-人物可用，2-宠物可用，3-人宠都可用
--Try试穿时长：0为不可试穿，-1为本地试穿（Warp后恢复），试穿后超过时间会自动恢复原形（单位：秒），默认为7200秒（2小时）
local AutoImageOn = 1		--是否开启自动生成图档（选项：0-关闭，1-开启）
local ImageMin = 115000		--最小图档编号
local ImageMax = 115490		--最小图档编号
local Price = 200000		--图档价格
local Tar = 3				--可用对象
local Try = 5			--试穿时长
if AutoImageOn==1 then
	for Image = ImageMin, ImageMax do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
tbl_NpcIndexToNo = tbl_NpcIndexToNo or {}
tbl_NpcLoop = tbl_NpcLoop or {}
tbl_NpcWarp = tbl_NpcWarp or {}
tbl_NpcCount = tbl_NpcCount or {}
tbl_LuaNpcIndex = tbl_LuaNpcIndex or{}
local CR = string.char(10)	--回车
local 常量 = {}
常量.对象 = {}
常量.对象.类型=0
常量.对象.形象=1
常量.对象.原形=2
常量.对象.地图类型=3
常量.对象.地图=4
常量.对象.X=5
常量.对象.Y=6
常量.对象.方向=7
常量.对象.等级=8
常量.对象.金币=53
常量.对象.战宠=62
常量.对象.原始图档=158
常量.对象.原名=2000
常量.对象.账号=2002
常量.按钮 = {}
常量.按钮.无=0
常量.按钮.确定=1
常量.按钮.关闭=2
常量.按钮.确定关闭=3
常量.按钮.是=4
常量.按钮.否=8
常量.按钮.是否=12
常量.按钮.下取消=34
常量.按钮.上取消=18
常量.按钮.上下取消=50
常量.按钮.上一页=16
常量.按钮.下一页=32
常量.对象类型={}
常量.对象类型.人物=1
常量.对象类型.怪物=2
常量.对象类型.NPC=2
常量.对象类型.宠物=3
------------------------------------------------------------------------------

Delegate.RegInit("StyleMarketNpc_Init");
function StyleMarketNpc_Init()
	--自动排列
	if AutoMapSet.On==1 then
		--从北往南
		if AutoMapSet.AlignDir==1 then
			local tX = AutoMapSet.MinX
			local tY = AutoMapSet.MinY
			for No = 1,table.getn(StyleSet) do
				local tName = StyleSet[No].Name or StyleSet[No].Image
				local tImage = StyleSet[No].Image or 0
				local tMap = AutoMapSet.Map or 999
				local tDir = 6
				if tX>AutoMapSet.MaxX-1 then
					print("\n[" .. NpcName .. "] 错误：地图已满，无法创建动物！")
					return false
				end
				if tY>AutoMapSet.MaxY-1 then
					tX = tX + AutoMapSet.Spacing + 1
					tY = AutoMapSet.MinY
				end
				StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--创建NPC
				tY = tY + AutoMapSet.Spacing+1
			end
		end
		--从西往东
		if AutoMapSet.AlignDir==2 then
			local tX = AutoMapSet.MinX
			local tY = AutoMapSet.MinY
			for No = 1,table.getn(StyleSet) do
				local tName = StyleSet[No].Name or StyleSet[No].Image
				local tImage = StyleSet[No].Image or 0
				local tMap = AutoMapSet.Map or 999
				local tDir = 4
				if tY>AutoMapSet.MaxY-1 then
					print("\n[" .. NpcName .. "] 错误：地图已满，无法创建动物！")
					return false
				end
				if tX>AutoMapSet.MaxX-1 then
					tY = tY + AutoMapSet.Spacing + 1
					tX = AutoMapSet.MinX
				end
				StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--创建NPC
				tX = tX + AutoMapSet.Spacing + 1
			end
		end
	end
	
	--自定义排列
	if AutoMapSet.On==0 then
		for No = 1,table.getn(StyleSet) do
			local tName = StyleSet[No].Name or StyleSet[No].Image
			local tImage = StyleSet[No].Image or 0
			local tMap = StyleSet[No].Map or 999
			local tX = StyleSet[No].X or 10
			local tY = StyleSet[No].Y or 10
			local tDir = StyleSet[No].Dir or 6
			--local tPrice = StyleSet[No].Price or 200000
			--local tTarget = StyleSet[No].Tar or 3
			--local tTry = StyleSet[No].Try or 7200
			StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--创建NPC
		end
	end
	return 1
end


function StyleMarketNpc_CreateNpc(_Name, _Image, _Map, _X, _Y, _Dir, _No)
	local StyleMarketNpc = NL.CreateNpc(nil, "StyleMarketNpc_Myinit");
	Char.SetData( StyleMarketNpc, %对象_形象%, _Image);
	Char.SetData( StyleMarketNpc, %对象_原形%, _Image);
	Char.SetData( StyleMarketNpc, 常量.对象.地图, _Map);
	Char.SetData( StyleMarketNpc, 常量.对象.X, _X);
	Char.SetData( StyleMarketNpc, 常量.对象.Y, _Y);
	Char.SetData( StyleMarketNpc, 常量.对象.方向, _Dir);
	Char.SetData( StyleMarketNpc, 常量.对象.原名, _Name);
	NLG.UpChar(StyleMarketNpc)

	tbl_LuaNpcIndex["StyleMarketNpc_" .. _No] = StyleMarketNpc
	tbl_NpcIndexToNo[StyleMarketNpc] = _No

	local LoopTime = math.random(900,1100)
	Char.SetLoopEvent(nil, "StyleMarketNpc_LoopEvent", StyleMarketNpc, LoopTime)
	Char.SetTalkedEvent(nil, "StyleMarketNpc_Talked", StyleMarketNpc)
	Char.SetWindowTalkedEvent(nil, "StyleMarketNpc_WindowTalked", StyleMarketNpc)
	
	return true;
end
function StyleMarketNpc_Myinit(index)
	return true
end
--NpcLoop事件（计时器）
function StyleMarketNpc_LoopEvent( _Index )
	--自动做动作
	if AutoAction==1 then
		tbl_NpcCount[_Index] = (tbl_NpcCount[_Index] or 0) + 1
		if tbl_NpcCount[_Index]==9999 then
			tbl_NpcCount[_Index] = 0
		end
		if math.mod(tbl_NpcCount[_Index],10)==0 then
			StyleMarketNpc_Action( _Index )
		end
	end
	
	for _PlayerIndex, _LimitTime in pairs(tbl_NpcLoop) do
		if _LimitTime>0 and os.time()>=_LimitTime then
			Char.SetData(_PlayerIndex, %对象_形象%, Char.GetData(_PlayerIndex,%对象_原始图档%));
			NLG.UpChar(_PlayerIndex)
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你试穿的时间已到，恢复本来形象。")
			tbl_NpcLoop[_PlayerIndex] = nil
		end
	end
	return 1
end

--玩家瞬移事件
Delegate.RegDelWarpEvent("StyleMarket_WarpEvent");
function StyleMarket_WarpEvent( _PlayerIndex, _PosX, _PosY )
	if tbl_NpcWarp[_PlayerIndex]~=nil then
		Char.SetData(_PlayerIndex, %对象_形象%, Char.GetData(_PlayerIndex,%对象_原始图档%));
		NLG.UpChar(_PlayerIndex)
		NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你已离开" .. NpcName .. "地图，恢复本来形象。")
		tbl_NpcWarp[_PlayerIndex] = nil
	end
	return 1
end


function StyleMarketNpc_Talked( _MeIndex, _PlayerIndex, _Mode)

	if _Mode==1 or _Mode==true then
		--远程调用，直接执行
	elseif NLG.CheckInFront(_PlayerIndex, _MeIndex, 2)==false then
		--对话调用，检测距离
		return false
	end

	--对话做动作
	if TalkAction==1 then
		StyleMarketNpc_Action( _MeIndex )
	end

	--获取造型设置信息
	local No = tbl_NpcIndexToNo[_MeIndex]
	local tPrice = StyleSet[No].Price or 200000
	local tTarget = StyleSet[No].Tar or 3
	local tTryTime = StyleSet[No].Try or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	local tTryMsg = "限时试穿" .. tTryTime .. "秒（超时后自动恢复原形）"
	if tTryTime==0 then
		tTryMsg = "不可试穿"
	elseif tTryTime==-1 then
		tTryMsg = "本地试穿（离开本房间自动恢复原形）"
	end

	local tTitle = NpcName		--对话框标题
	local tSL = 5			--选择框简介信息行数（下一行起可以选择）
	local tTalk = {}
	tTalk[1] = tSL .. CR .. "　　　　　　　　　◆" .. tTitle .. "◆"
	tTalk[2] =        CR .. "造型名称：" .. Char.GetData(_MeIndex, 常量.对象.原名) .. "(ID:" .. Char.GetData(_MeIndex, %对象_原形%) .. ")"
	tTalk[3] =        CR .. "造型售价：" .. tPrice .. "G/永久　　" .. tTryPrice .. "G/试穿"
	tTalk[4] =        CR .. "试穿模式：" .. tTryMsg
	tTalk[5] =        CR .. ""
	tTalk[6] =        CR .. "　　　　　　　　　『试穿-人物』"
	tTalk[7] =        CR .. "　　　　　　　　　『试穿-战宠』"
	tTalk[8] =        CR .. "　　　　　　　　　『永久-人物』"
	tTalk[9] =        CR .. "　　　　　　　　　『永久-战宠』"

	--关闭不需要的按钮
	if tTryTime==0 then	--试穿
		tTalk[6] = CR .. ""
		tTalk[7] = CR .. ""
	end
	if tTarget==0 or tTarget==1 then	--战宠
		tTalk[7] = CR .. ""
		tTalk[9] = CR .. ""
	end
	if tTarget==0 or tTarget==2 then	--人物
		tTalk[6] = CR .. ""
		tTalk[8] = CR .. ""
	end
	if tTarget==0 then	--售价
		tTalk[3] = CR .. "造型售价：暂不出售"
	end

	local tTalkMsg = table.concat(tTalk)

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 1, tTalkMsg);

	return ;
end

function StyleMarketNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	--print("\n_MeIndex=" .. _MeIndex .. ", _PlayerIndex=" .. _PlayerIndex .. ", _Seqno=" .. _Seqno .. ", _Select=" .. _Select .. ", _Data=" .. _Data)
	
	--取消按钮
	if _Select==2 then
		return
	end

	--对话做动作
	if TalkAction==1 then
		StyleMarketNpc_Action( _MeIndex )
	end

	--获取造型设置信息
	local No = tbl_NpcIndexToNo[_MeIndex]
	local tPrice = StyleSet[No].Price or 200000
	local tTarget = StyleSet[No].Tar or 3
	local tTryTime = StyleSet[No].Try or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	--获取对象类型

	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		local tResult = 0
		--『试穿-人物』
		if PlayerSelect==1 then
			tResult = StyleMarketNpc_ChangeType(_PlayerIndex, _PlayerIndex, No, 1)
		end

		--『试穿-战宠』
		if PlayerSelect==2 then
			local tPetPos = Char.GetData(_PlayerIndex,常量.对象.战宠)
			local tPetIndex = -2
			if tPetPos>=0 then
				tPetIndex = Char.GetPet(_PlayerIndex, tPetPos)
			end
			if tPetIndex<0 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 请先把宠物设置为出战状态。")
				return 0
			end
			tResult = StyleMarketNpc_ChangeType(tPetIndex, _PlayerIndex, No, 1)
		end

		--『永久-人物』
		if PlayerSelect==3 then
			tResult = StyleMarketNpc_ChangeType(_PlayerIndex, _PlayerIndex, No, 0)
		end

		--『永久-战宠』
		if PlayerSelect==4 then
			local tPetPos = Char.GetData(_PlayerIndex,常量.对象.战宠)
			local tPetIndex = -2
			if tPetPos>=0 then
				tPetIndex = Char.GetPet(_PlayerIndex, tPetPos)
			end
			if tPetIndex<0 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 请先把宠物设置为出战状态。")
				return 0
			end
			tResult = StyleMarketNpc_ChangeType(tPetIndex, _PlayerIndex, No, 0)
		end

		--错误反馈-魔币不足
		if tResult==-1 then
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你持有的魔币不足。")
			return
		end

		--错误反馈-类型不符
		if tResult==-2 then
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你要换装的对象类型不符合。")
			return
		end

		--顺利完成
		if tResult==1 then
			local tTryTime = StyleSet[No].Try or 0
			local tTryMsg = "限时试穿" .. tTryTime .. "秒（超时后自动恢复原形）"
			if tTryTime==-1 then
				tTryMsg = "本地试穿（离开本房间自动恢复原形）"
			end
			
			if PlayerSelect==1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的人物已换上试用造型。" .. tTryMsg)
			elseif PlayerSelect==2 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的战宠已换上试用造型。" .. tTryMsg)
			elseif PlayerSelect==3 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的人物已永久更换造型。")
			elseif PlayerSelect==4 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] 你的战宠已永久更换造型。")
			end
			return
		end
	end
	return 1
end

function StyleMarketNpc_ChangeType(_TargetIndex, _OperatorIndex, _No, _Try)
	--获取造型设置信息
	local No = tonumber(_No)
	local tImage = tonumber(StyleSet[No].Image) or 0
	local tPrice = tonumber(StyleSet[No].Price) or 200000
	local tTarget = tonumber(StyleSet[No].Tar) or 3
	local tTryTime = tonumber(StyleSet[No].Try) or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	--获取对象类型
	local tTypeName = {"人物","怪物","宠物"}
	local tType = Char.GetData(_TargetIndex, 常量.对象.类型)

	--检测对象类型
	if tTarget==0 or (tTarget==1 and tType~=1) or (tTarget==2 and tType~=3) then
		return -2	--类型不符合
	end
	--检测魔币
	local tPlayerGold = Char.GetData(_OperatorIndex, 常量.对象.金币)
	local tNeedGold = tPrice
	if _Try==1 then 
		tNeedGold = tTryPrice
	end
	if tPlayerGold<tNeedGold then
		return -1	--金币不足
	end

	--扣除魔币（以下两种操作方式，二选一，如果脚本出错，可以尝试改用另外一个）
--	NLG.AddGold(_OperatorIndex, -1*tNeedGold)
   Char.SetData(_TargetIndex, 常量.对象.金币, Char.GetData(_TargetIndex, 常量.对象.金币)-tNeedGold)

	--更改形象
	if _Try==1 then 
		Char.SetData(_TargetIndex, %对象_形象%, tImage)
		Char.SetData(_TargetIndex, %对象_原形%, tImage)
	else
		Char.SetData(_TargetIndex, %对象_形象%, tImage)
		Char.SetData(_TargetIndex, %对象_原形%, tImage)
		Char.SetData(_TargetIndex, %对象_原始图档%, tImage)
	end

	--加入Loop计时器
	if _Try==1 and tTryTime>0 then
		tbl_NpcLoop[_TargetIndex] = os.time() + tTryTime
	end

	--加入Warp事件
	if _Try==1 and tTryTime==-1 then
		tbl_NpcWarp[_TargetIndex] = Char.GetData(_OperatorIndex, 常量.对象.地图)
	end

	--更新数据
	NLG.UpChar(_TargetIndex)
	NLG.UpChar(_OperatorIndex)
	Pet.UpPet(_OperatorIndex, Char.GetData(_OperatorIndex,%对象_战宠%))
	return 1
end

function StyleMarketNpc_Action( _NpcIndex )
	local No = math.random(1, #ActionList)
	NLG.SetAction(_NpcIndex, ActionList[No])
end