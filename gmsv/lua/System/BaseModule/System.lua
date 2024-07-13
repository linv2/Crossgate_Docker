--                 【【【脚本系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
常量 = {}
常量.对象 = {}
常量.对象.类型=0 -- 1人物 2 怪物或NPC 3 宠物
常量.对象.形象=1
常量.对象.原形=2
常量.对象.原始图档=%对象_原始图档%
常量.对象.地图类型=3
常量.对象.地图=4
常量.对象.X=5
常量.对象.Y=6
常量.对象.方向=7
常量.对象.等级=8
常量.对象.HP=9
常量.对象.最大血=287
常量.对象.MP=10
常量.对象.最大魔=288
常量.对象.生命BP=11
常量.对象.力量BP=12
常量.对象.防御BP=13
常量.对象.速度BP=14
常量.对象.魔力BP=15
常量.对象.幸运=16
常量.对象.种族=17
常量.对象.地属性=18
常量.对象.水属性=19
常量.对象.火属性=20
常量.对象.风属性=21
常量.对象.抗毒=22
常量.对象.抗睡=23
常量.对象.抗石=24
常量.对象.抗醉=25
常量.对象.抗混=26
常量.对象.抗忘=27
常量.对象.必杀=28
常量.对象.反击=29
常量.对象.命中=30
常量.对象.闪躲=31
常量.对象.道具栏=32
常量.对象.技能栏=33
常量.对象.经验=41
常量.对象.升级点=42
常量.对象.图像类型=43--未知
常量.对象.名色=44
常量.对象.RegistNumber=48
常量.对象.职业=49
常量.对象.职阶=50
常量.对象.职业类型=51
常量.对象.脸=52
常量.对象.金币=53
常量.对象.银行金币=54
常量.对象.耐力=55
常量.对象.灵巧=56
常量.对象.智力=57
常量.对象.魅力=58
常量.对象.声望=59
常量.对象.装备称号=60 --未测试 -1代表 无称号  0无名旅人 1职业称号
常量.对象.战宠=62
常量.对象.登陆次数=65
常量.对象.获取宠物次数=67
常量.对象.发送邮件次数=68
常量.对象.合成物品次数=69
常量.对象.步行计数=70
常量.对象.宠物死亡次数=71
常量.对象.复活宠物次数=72
常量.对象.治疗宠物次数=73
常量.对象.捕捉宠物个数=74
常量.对象.声望增长上限=76
常量.对象.受伤等级=38
常量.对象.头像版本=80
常量.对象.战绩=139
常量.对象.DP=139
常量.对象.GM=144
常量.对象.登陆点=149
常量.对象.掉魂=150
常量.对象.卡时=153
常量.对象.原名=%对象_名字%
常量.对象.名字=%对象_玩家称号%
常量.对象.账号=%对象_账号%
常量.对象.上次离线=148
常量.对象.本次登录=600
常量.对象.战斗Index=273 --返回战斗Index如 -1 不在战斗状态，
常量.对象.战斗状态=272 --返回战斗的阶段，0不在战斗，2待命阶段。3，选择指令阶段，6战斗结束画面
常量.宠物 = {}
常量.宠物.宠物ID=68
常量.宠物.体力成长=0
常量.宠物.力量成长=1
常量.宠物.强度成长=2
常量.宠物.速度成长=3
常量.宠物.魔法成长=4
常量.宠物.技能栏=51
常量.宠物.入手等级=52
常量.宠物.忠诚=385
常量.宠物.状态=69 --无状态0  待命1 战斗2 休息3 散步16
常量.宠物.主人CDK=2002--自定义
常量.宠物.主人名字=2004
常量.宠物.名字=2001


常量.怪物={}
常量.怪物.卡片类型=53
常量.怪物.卡片等级=49
常量.对象.卡片类型=53
常量.对象.卡片等级=49

常量.道具 = {}
常量.道具.ID = 0
常量.道具.图档 = %道具_图%
常量.道具.类型=3
常量.道具.装饰=4 --赋值10就是可装饰
常量.道具.双手=5
常量.道具.堆叠数=9
常量.道具.最大堆叠数=10
常量.道具.等级=11
常量.道具.耐久=65
常量.道具.最大耐久=13
常量.道具.最小攻击数量=14
常量.道具.最大攻击数量=15
常量.道具.攻击=18
常量.道具.防御=19
常量.道具.敏捷=20
常量.道具.精神=21
常量.道具.回复=22
常量.道具.必杀=23
常量.道具.反击=24
常量.道具.命中=25
常量.道具.闪躲=26
常量.道具.HP=27
常量.道具.MP=28
常量.道具.幸运=29
常量.道具.魅力=31
常量.道具.特殊类型=45
常量.道具.子参一=46
常量.道具.子参二=47
常量.道具.魔攻=72
常量.道具.魔抗=55
常量.道具.属性一=32
常量.道具.属性二=33
常量.道具.属性一值=34
常量.道具.属性二值=35
常量.道具.毒抗=39
常量.道具.睡抗=40
常量.道具.石抗=41
常量.道具.醉抗=42
常量.道具.乱抗=43
常量.道具.忘抗=44
常量.道具.登出消失 = 53
常量.道具.丢地消失 = 53
常量.道具.能否交易 = 54
常量.道具.物品说明=57
常量.道具.右键说明=58
常量.道具.鉴定 = 63
常量.道具.创建时间 = 67
常量.道具.未鉴定名 = 2000
常量.道具.已鉴定名 = 2001
常量.道具.刻印=2002
常量.道具.自用参数=2003
常量.道具.双击效果=2003
常量.道具.刻印玩家=2004
常量.道具.道具参数=2007

窗口 = {}
窗口.信息窗=0			--直接顯示Data的字符串內容
窗口.输入窗=1			--直接顯示Data的字符串內容
窗口.选择窗=2			--标题行数|内容
窗口.双行输入窗=35		--Data1data2
窗口.图档窗=37		--带图档对话框

按钮 = {}
按钮.无=0
按钮.确定=1
按钮.关闭=2
按钮.确定关闭=3
按钮.是=4
按钮.否=8
按钮.是否=12
按钮.确定关闭是=7
按钮.下取消=34
按钮.上取消=18
按钮.上下取消=50
按钮.上一页=16
按钮.下一页=32
常量.对象类型={}
常量.对象类型.人物=1
常量.对象类型.怪物=2
常量.对象类型.NPC=2
常量.对象类型.宠物=3

动作={}
动作.站立=1
动作.静止=2
动作.跑=3
动作.急停=4
动作.攻击=5
动作.魔法=6
动作.投掷=7
动作.受伤=8
动作.防御=9
动作.倒下=10
动作.坐下=11
动作.挥手=12
动作.高兴=13
动作.愤怒=14
动作.悲伤=15
动作.点头=16
动作.石头=17
动作.剪子=18
动作.布=19
动作.走路=30
动作.站立=31
颜色={}
颜色.白色 =0 
颜色.青色 =1
颜色.紫色 =2 
颜色.蓝色 =3 
颜色.黄色 =4 
颜色.绿色 =5 
颜色.红色 =6 
颜色.灰色 =7 
颜色.深蓝色=8 
颜色.深绿色 =9
字体={}
字体.大=3
字体.中=2
字体.小=1
tab_laba = tab_laba or {}
function MSG(Msg)--系统提示：过滤喇叭开关玩家
	for k,v in pairs(Players) do
		if tab_laba[k]==nil then
			NLG.SystemMessage(v.Index,Msg)
		end
	end
end
--秒转化为时间
function ShowGAWindowTalk(_PlayerIndex,_Window, _Select,_Seqno,_Data,_MePtr)
	return NLG.ShowWindowTalked(_PlayerIndex,_MePtr,_Window,_Select,_Seqno,_Data);
end
function NumtoTime(time)
	local 小时 =math.floor(time/3600);
	time=time-小时*3600
	local 分 = math.floor(time/60);
	time=time-分*60
	local 秒 = time
	local MSG=小时.."小时"..分.."分"..秒.."秒"
	return MSG
end
function CheckAutoTime(Time)--计时器开关{W,h,m}
	_Time = os.time()
	local tWeek = tonumber(os.date("%w"))
	local tHour = tonumber(os.date("%H"))
	local tMin = tonumber(os.date("%M"))
	local rt = false
	for i = 1,#Time[1] do
		if tWeek==Time[1][i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #Time[2] do
		if tHour== Time[2][i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	local rt = false
	for i = 1, #Time[3] do
		if tMin==Time[3][i] then
			rt = true
		end
	end
	if rt==false then
		return false
	end
	return true
end

function getIntPart(x) ---分割去除小数点
	if x <= 0 then
	   return math.ceil(x);
	end

	if math.ceil(x) == x then
	   x = math.ceil(x);
	else
	   x = math.ceil(x) - 1;
	end
	return x;
end

function Playerkey(player)
	return Char.GetData(player,%对象_账号%)..Char.GetData(player,48);
end
function Char.PetPos(_PlayerIndex) --获得现在宠物栏空位接口返回空位
	local PetPos = 5	
	for t = 0,4 do
	local PetIndex =Char.GetPetIndex(_PlayerIndex,t);
		if (PetIndex>0) then 
			PetPos = PetPos - 1			
		end	
	end	
	return PetPos
end	
function Char.ItemSlot(_PlayerIndex)--获得已使用道具栏数量
	local nTotal = 0
	for Pos = 8,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex,Pos)
		if tItemIndex>=0 then
			nTotal = nTotal + 1
		end
	end
	return nTotal
end
function Char.ItemPos(_PlayerIndex) --获得现在道具栏空位接口
	local ItemPos = 20	
	for t = 8,27 do
	local ItemIndex =Char.GetItemIndex(_PlayerIndex,t);
		if (ItemIndex>0) then 
			ItemPos = ItemPos - 1			
		end	
	end	
	return ItemPos
end
function Char.GetItemPos(_PlayerIndex,_ItemIndex) --获得道具所在栏位
	local ItemPos = -1	
	for Pos =1,27 do
		local tItemIndex =Char.GetItemIndex(_PlayerIndex,Pos);
		if (tItemIndex==_ItemIndex) then 
			ItemPos = Pos	
			break
		end	
	end	
	return ItemPos
end
function Char.HaveItem( _PlayerIndex,_ItemID)--GE判断道具数量接口
	local tHaveItem = {}
	local nTotal = 0
	for Pos = 0,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex,Pos)
		if tItemIndex>=0 and (Item.GetData(tItemIndex,常量.道具.ID)==_ItemID) then
			local Num = Item.GetData(Char.GetItemIndex(_PlayerIndex,Pos),常量.道具.堆叠数)
			nTotal = nTotal + Num
		end
	end
	return nTotal
end
function Char.ItemNum( _PlayerIndex, _ItemID)
	local tHaveItem = {}
	local nTotal = 0
	for Pos = 0,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex, Pos)
		if tItemIndex>=0 and (Item.GetData(tItemIndex, 常量.道具.ID)==_ItemID) then
			local Num = Item.GetData(Char.GetItemIndex(_PlayerIndex, Pos), 常量.道具.堆叠数)
			nTotal = nTotal + Num
		end
	end
	return nTotal
end

function Char.GiveJinKa(_PlayerIndex,Num)	--GE增加兼容GA给道具接口
	local CdKey=Char.GetData(_PlayerIndex,%对象_账号%)
	if Char.ItemPos(_PlayerIndex) == 0 then
		NLG.SystemMessage(_PlayerIndex,"[系统]由于您道具栏不足，发放的金卡将转入您的商业银行积分里"..Num)
		EasySqlJKBank(CdKey,Num)
	else
		Char.GiveItem(_PlayerIndex,JinKaItem,Num)
	end
	return Gold
end
function Char.SetGold(_PlayerIndex,Gold)	--GE增加兼容GA给道具接口
	local tMaxGold=10000000 --携带最大金币
	local tGold=Char.GetData(_PlayerIndex,%对象_金币%)
	local CdKey=Char.GetData(_PlayerIndex,%对象_账号%)
	if tGold+Gold > tMaxGold and Gold>0 then
		local BankGold=tGold+Gold-tMaxGold
		Gold = tMaxGold - tGold
		EasySqlBank(CdKey,BankGold)
		NLG.SystemMessage(_PlayerIndex,"[系统]携带金币已经超过最大值请注意。已将多出魔币"..BankGold.."存入商业银行");
	end

	if Gold<0  and tGold+Gold < 0 then
		Gold = tGold
		NLG.SystemMessage(_PlayerIndex,"[系统]携带魔币不足。");
		EasySqlBank(CdKey,tGold+Gold)
	end
	if Gold==0 then
		return 0
	end
	if Gold >0 then
		NLG.SystemMessage(_PlayerIndex,"[系统]魔币+"..Gold.."。");
	else
		NLG.SystemMessage(_PlayerIndex,"[系统]魔币"..Gold.."。");
	end
	Char.PlusData(_PlayerIndex,%对象_金币%,Gold)
	NLG.UpChar(_PlayerIndex);
	return Gold
end
function Char.GetTeamNum(_PlayerIndex)   ---GE接口--判断队伍中有多少人
	local Num= 0
	if Char.GetData(_PlayerIndex,%对象_组队模式%) == 0 then
		Num=1
	else
		local TeamDIndex = Char.GetTeamIndex(_PlayerIndex,0);
		for _Pos = 0,4 do
			_PosIndex = Char.GetTeamIndex(TeamDIndex,_Pos);
			if _PosIndex >=0 then
				Num = Num+1
			end
		end
	end
	return Num
end
function Char.InTeam(_PlayerIndex,P2)   --判断P2是否在队伍中
	local Num= -1
	if Char.GetData(_PlayerIndex,%对象_组队模式%) == 0 then
		Num=-1
	else
		local TeamDIndex = Char.GetTeamIndex(_PlayerIndex,0);
			for _Pos = 0,4 do
				local _PosIndex = Char.GetTeamIndex(TeamDIndex,_Pos);
				if _PosIndex >=0 then
					if _PosIndex==P2 then
						Num = 1
					end
				end
			end
	end
	return Num
end
function Char.GetTeamMaxLevel(_PlayerIndex)   ---GE接口--判断队伍中最高级玩家
	local Level= 0
	if Char.GetData(_PlayerIndex,%对象_组队模式%) == 0 then
		Level=Char.GetData(_PlayerIndex,%对象_等级%)
	else
		local TeamDIndex = Char.GetTeamIndex(_PlayerIndex,0);
		for _Pos = 0,4 do
			_PosIndex = Char.GetTeamIndex(TeamDIndex,_Pos);
			if _PosIndex >=0 then
				local tLevel=Char.GetData(_PosIndex,%对象_等级%)
				if tLevel >Level then
					Level=tLevel
				end
			end
		end
	end
	return Level
end
function GetJinKa(_PlayerIndex)   ---GE接口--判断玩家金卡数量
	local JinKaItem =JinKaItem or 23159
	local tHaveItem = {}
	local nTotal = 0
	for Pos = 0,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex,Pos)
		if tItemIndex>=0 and (Item.GetData(tItemIndex,常量.道具.ID)==JinKaItem) then
			local Num = Item.GetData(Char.GetItemIndex(_PlayerIndex,Pos),常量.道具.堆叠数)
			nTotal = nTotal + Num
		end
	end
	return nTotal
end
function GetGold(_PlayerIndex)   ---GE接口--判断玩家金币
	return Char.GetData(_PlayerIndex,%对象_金币%)
end

function Char.GiveItemAdv(_PlayerIndex,_ItemID,_ItemNum)--GE新增道具接口
	local OldItem = {}
	local NewItem = {}
	local NewItemPos = {}
	for i = 8,27 do
		OldItem[i]=Item.GetData(Char.GetItemIndex(_PlayerIndex,i),常量.道具.ID)
	end
	Char.GiveItem(_PlayerIndex,_ItemID,_ItemNum)
	for i = 8,27 do
		if OldItem[i]~=Item.GetData(Char.GetItemIndex(_PlayerIndex,i),常量.道具.ID) then
			table.insert(NewItemPos,i)
		end
	end
	if table.getn(NewItemPos)==0 then
		return -1
	else
		return NewItemPos
	end
end

function EasyGive(_PlayerIndex,GiveStr)---- --奖励格式：类型|编号|数量--类型（G-金币，I-道具，P-宠物，E-经验，F-声望，T-卡时，A-人物属性，S-加点）
	local TM_Give = Split(GiveStr,"|")
	local MaxLevel=MaxLevel or 150
	local tLevel=Char.GetData(_PlayerIndex,%对象_等级%)
	TM_Give[2] = tonumber(TM_Give[2])
	TM_Give[3] = tonumber(TM_Give[3])
	local TM_RT = ""
	if (TM_Give[1]=="G") then
		Char.SetGold(_PlayerIndex,TM_Give[3]); 
		TM_RT = "[金币]" .. TM_Give[3] .. "G，"
	elseif (TM_Give[1]=="I") then
		if Char.ItemPos(_PlayerIndex) == 0 then
		
			TM_RT = "[道具]领取操作失败，道具栏不足!"
		else
			Char.GiveItem(_PlayerIndex,TM_Give[2],TM_Give[3])
			TM_RT = "[道具]*" .. TM_Give[3] .. "个，"
		end
	elseif (TM_Give[1]=="P") then
		if Char.PetPos(_PlayerIndex)==0 then
			TM_RT = "[宠物]领取操作失败，宠物栏不足!"
		else
			if tonumber(TM_Give[3])>=1 then TM_Give[3]=1 end
			local PetIndex=Char.GivePet(_PlayerIndex,TM_Give[2],TM_Give[3])
			if PetIndex>=0 then
				PetName=Char.GetData(PetIndex,%对象_原名%)
				if TM_Give[3]==0 then
					TM_RT = "[宠物]" .. PetName.. "*1只，"
				else
					TM_RT = "[满档宠物]" .. PetName.. "*1只，"
				end
			end
		end
	elseif (TM_Give[1]=="T") then
	if Char.IsFeverTime(_PlayerIndex)==1 then Char.FeverTimeStop(_PlayerIndex) end--GP可以用关闭打卡增加卡时
		Char.SetData(_PlayerIndex,153,Char.GetData(_PlayerIndex,153)+TM_Give[3])
		local TM_FeverTime = tonumber(TM_Give[3])
		TM_RT = "[卡时]" .. TM_FeverTime .. "秒，"
	elseif (TM_Give[1]=="E") then
		if tLevel >= MaxLevel then
			return "[经验]领取操作失败，等级到达上限!"
		end
		Char.SetData(_PlayerIndex,%对象_经验%,Char.GetData(_PlayerIndex,%对象_经验%)+TM_Give[3])
		TM_RT = "[经验]" .. TM_Give[3] .. "点，"
	elseif (TM_Give[1]=="F") then
		Char.SetData(_PlayerIndex,%对象_声望%,Char.GetData(_PlayerIndex,%对象_声望%)+TM_Give[3])
		TM_RT = "[声望]" .. TM_Give[3] .. "点，"
	elseif (TM_Give[1]=="A") then
		Char.SetData(_PlayerIndex,TM_Give[2],Char.GetData(_PlayerIndex,Give[2])+TM_Give[3])
		TM_RT = "[人物属性" .. TM_Give[2] .. "]" .. TM_Give[3] .. "点，"
	elseif (TM_Give[1]=="S") then
		Char.SetData(_PlayerIndex,%对象_升级点%,Char.GetData(_PlayerIndex,%对象_升级点%+TM_Give[3]))
		TM_RT = "[人物升级点]"..TM_Give[3].."点"
	end
	NLG.UpChar(_PlayerIndex);
	return TM_RT
end

function getTabKey(_PlayerIndex)
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tPlayerLR = Char.GetData(_PlayerIndex, 47)
	local tTabKey = "T_" .. tCdKey .. "_" .. tPlayerLR
	return tTabKey
end

function GAMsgFormat(Msg)
	local tMsg = Split(Msg,"\\n")
	local NewMsg=""
	for i=1,#tMsg do
		if tMsg[i]~="" and string.find(tMsg[i],"|")==nil then
			NewMsg=NewMsg..strFormat(tMsg[i],45,2).."\\n"
		else
			NewMsg=NewMsg..tMsg[i].."\\n"
		end
		
	end
	return NewMsg
end
function strFormat(str,str_len,str_type)
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
function diffDay(basetime,difftime)--以基点天数的 0:00:00 来计算，判断两个时间点的天数差
	local PassSec = os.date("%S",basetime)
	local PassMin = os.date("%M",basetime)
	local PassHour = os.date("%H",basetime)
	basetime = basetime - PassHour*3600 - PassMin*60 - PassSec
	return math.floor((basetime-difftime)/86400)+1
end

function EquipPlusStat( _ItemIndex,_StatTab,_StatValue )--强化符文接口
	--  S-强化，R-符文，E-附魔，D-魔化，L-限时
	--使用方案参考 if EquipPlusStat(itemindex,"S") ==nil then  EquipPlusStat(itemindex,"S",0) end 返回值是次数
	local tStatTab = {}
	if type(_StatTab)=="nil" then
		--GetAll
		local tItemStat = Item.GetData(_ItemIndex,常量.道具.自用参数)
		if string.find(tItemStat,",")==nil then
			return nil
		end
		if string.find(tItemStat,"|")==nil then
			local tSub = Split(tItemStat,",")
			tStatTab[tSub[1]]=tonumber(tSub[2])
			return tStatTab
		end
		local tStat = Split(tItemStat,"|")
		for k,v in pairs(tStat) do
			local tSub = Split(v,",")
			tStatTab[tSub[1]]=tonumber(tSub[2])
		end
		return tStatTab
	elseif type(_StatTab)=="table" then
		--SetAll
		local tStat = ""
		for k,v in pairs(_StatTab) do
			tStat = tStat .. k .. "," .. v .. "|"
		end
		Item.SetData(_ItemIndex,常量.道具.自用参数,tStat)
	elseif type(_StatTab)=="string" and type(_StatValue)=="nil" then
		--GetSub
		local tStatTab = EquipPlusStat(_ItemIndex) or {}
		for k,v in pairs(tStatTab) do
			if _StatTab==k then
				return tonumber(v)
			end
		end
		return nil
	elseif type(_StatTab)=="string" then
		--SetSub
		local tStatTab = EquipPlusStat(_ItemIndex) or {}
		tStatTab[_StatTab]=_StatValue
		EquipPlusStat(_ItemIndex,tStatTab)
	end
end
function Char.GivePet(_PlayerIndex,PetID)
	local PetMstCdk =Char.GetData(_PlayerIndex,常量.对象.账号)
	local PetIndex= Char.GivePet(_PlayerIndex,PetID)
	Char.SetData(PetIndex,常量.宠物.主人CDK,PetMstCdk)
	return PetIndex
end
function Char.DurMaxItemNum(_PlayerIndex,ItmeID) --获取满耐久道具的道具栏位返回
	local DurMaxItemPos={}
	for i = 8,27 do
		if ItmeID==Item.GetData(Char.GetItemIndex(_PlayerIndex,i),常量.道具.ID) then
			if Item.GetData(Char.GetItemIndex(_PlayerIndex,i),常量.道具.耐久)==Item.GetData(Char.GetItemIndex(_PlayerIndex,i),常量.道具.最大耐久)  then
				table.insert(DurMaxItemPos,i)
			end
		end
	end
	return DurMaxItemPos
end

function Item.PlusData(Index,Const,Value)--强化道具设置
	Item.SetData(Index,Const,Item.GetData(Index,Const) + Value)
	return
end
function Char.PlusData(Index,Const,Value)--强化人物、宠物
	return Char.SetData(Index,Const,Char.GetData(Index,Const) + Value)
end
function Char.GetPlusData(Index,Const,Value)--强化获取
	return Char.SetData(Index,Const,Char.GetData(Index,Const) + Value)
end

function CreateNpc(NPCName)
	IntNpc = IntNpc or {}
	if IntNpc[NPCName] == nil then
		IntNpc[NPCName]  = NL.CreateNpc("lua/Module/System.lua", "Myinit")
	end
	return IntNpc[NPCName]
end
function GQDelLuaNpc(NpcIndex)
	for Name, Index in pairs(IntNpc) do
		if Index==NpcIndex then
			IntNpc[Name] = nil
		end
	end
	NL.DelNpc(NpcIndex)
	return 
end
function SetNpc(NpcIndex,MapId,x,y,Imge,dir,Name)
		Char.SetData(NpcIndex, 3, 0);
		Char.SetData(NpcIndex, %对象_地图%,MapId);      
		Char.SetData(NpcIndex, %对象_X%,x);         
		Char.SetData(NpcIndex, %对象_Y%,y);    
		Char.SetData(NpcIndex,%对象_方向%,dir);    
		Char.SetData(NpcIndex, %对象_原名%, Name); 
		Char.SetData(NpcIndex, %对象_原形%, Imge);    
		Char.SetData(NpcIndex, %对象_形象%, Imge);    
		NLG.UpChar(NpcIndex);
	return -1
end
function Myinit(_MeIndex) --创建NPC
	return true;
end


function Log(strTxt,_Mode) ----LOG写入设置自动添加时间
	local LogFile = "./lua/Lua.Log"
	local file = io.open(LogFile,"a")
	if _Mode==1 then
		file:write(strTxt,"\r\n")
	else
		file:write(os.date("%Y年%m月%d日%X："),strTxt,"\r\n")
	end
	file:close()
end
function Char.DelItemByIndex(_PlayerIndex,_ItemIndex)
	local _ItemNum=Item.GetData(_ItemIndex,%道具_堆叠数%)
	local _ItemDur=Item.GetData(_ItemIndex,常量.道具.耐久)
	local _ItemPos=Char.GetItemPos(_PlayerIndex,_ItemIndex)
	LogItem("[道具使用记录][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. "：使用了"..Item.GetData(_ItemIndex,常量.道具.已鉴定名))
	if _ItemNum>1 then
		Item.PlusData(_ItemIndex,%道具_堆叠数%,-1)
		Item.UpItem(_PlayerIndex,_ItemIndex);
		return  -1
	end
	if _ItemDur>1 then
		Item.PlusData(_ItemIndex,常量.道具.耐久,-1)
		Item.UpItem(_PlayerIndex,_ItemIndex);
		return  -2
	end
	return NLG.DelItemByPos(_PlayerIndex,_ItemPos)
end
function LogItem(strTxt,_Mode) ----LOG写入设置自动添加时间
	local LogFile = "./lua/Log/"..os.date("%Y-%m-%d").."LogItem.Log"
	local file = io.open(LogFile,"a")
	if _Mode==1 then
		file:write(strTxt,"\r\n")
	else
		file:write(os.date("%Y年%m月%d日%X："),strTxt,"\r\n")
	end
	file:close()
end
function NLG.CanTalk( _MePtr ,_PlayerPtr) 
	if(NLG.CheckInFront(_PlayerPtr,_MePtr,2) == false) then
		return false
	end 
	return true
end
function ShopItemSplit(strTxt,rtSub)
	if (strTxt=='' or strTxt==nil or rtSub=='' or rtSub==nil) then
		return "Error Shop Data";
	end
	local TM_ShopItem = Split(strTxt,"|")
	local TM_ShopItemID = {}
	local TM_ShopItemNum = {}
	for i,v in pairs(TM_ShopItem) do
		if (math.mod(i,2)==1) then
			TM_ShopItemID[#TM_ShopItemID+1]=v
		else
			TM_ShopItemNum[#TM_ShopItemNum+1]=v
		end
	end
	if (string.lower(rtSub)=='item' or rtSub=='物品') then
		return TM_ShopItemID;
	elseif (string.lower(rtSub)=='num' or rtSub=='数量') then
		return TM_ShopItemNum
	elseif (string.lower(rtSub)=='quantity' or rtSub=='种数') then
		return #TM_ShopItemID;
	else
		return {TM_ShopItemID,TM_ShopItemNum,#TM_ShopItemID};
	end
end

function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end
			
function window_check(_tbl)								-------自动分页模块（暂时仅限对table分页a = {{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},{3},{1},{2},}）

local page = 1
local pos = 1
local _table = {}
local _temp = {}

while true do
	if #_tbl - pos*(page - 1) >= 7 then
		pos = 1
		while pos<=8 do
			if pos == 8 then
				_temp[pos] = page
				_table[page] = _temp
				page = page +1
				break
			else
				_temp[pos] = _tbl[pos+(page-1)*7]
			end
			pos = pos +1
		end
		_temp = {}
	end
	pos = pos-1
	if #_tbl - pos*(page - 1) < 7  then
		pos = 1
		while true do
			if _tbl[pos+(page-1)*7] ==nil then
					if pos == 1 then
						_table[page-1][#_table[page-1]] = 0
						break
					end
					_temp[pos] = 0
					_table[page] = _temp
					page = 0
					pos = 0
					break
			else
				_temp[pos] = _tbl[pos+(page-1)*7]
			end
			pos = pos +1
		end
		_temp = {}
		break
	end
end
return _table
end

function type_check (_type)
	if _type =="剑" then
		_type = 0
		return 3,_type
	elseif _type =="斧" or _type =="斧头" then
		_type = 1
		return 3,_type
	elseif _type =="枪" then
	_type = 2
	return 3,_type
elseif _type =="杖" or _type =="帐" then
	_type = 3
	return 3,_type
elseif _type =="弓" then
	_type = 4
	return 3,_type
elseif _type =="小刀" or _type =="刀" then
	_type = 5
	return 3,_type
elseif _type =="回力" or _type =="回力镖" then
	_type = 6
	return 3,_type
elseif _type =="盾牌" or _type =="盾" then
	_type = 7
	return 3,_type
elseif _type =="头盔" or _type =="头"then
	_type = 8
	return 3,_type
elseif _type =="帽子" or _type =="帽" then
	_type = 9
	return 3,_type
elseif _type =="铠甲" or _type =="铠" then
	_type = 10
	return 3,_type
elseif _type =="衣服" or _type =="衣" then
	_type = 11
	return 3,_type
elseif _type =="长袍" or _type =="袍" then
	_type = 12
	return 3,_type
elseif _type =="靴子" or _type =="靴" then
	_type = 13
	return 3,_type
elseif _type =="鞋子" or _type =="鞋" then
	_type = 14
	return 3,_type
elseif _type =="手环"then
	_type = 15
	return 3,_type
elseif _type =="乐器" then
	_type = 16
	return 3,_type
elseif _type =="项链" then
	_type = 17
	return 3,_type
elseif _type =="戒指" then
	_type = 18
	return 3,_type
elseif _type =="头带" then
	_type = 19
	return 3,_type
elseif _type =="耳环" then
	_type = 20
	return 3,_type
elseif _type =="护身符" then
	_type = 21
	return 3,_type
elseif _type =="料理" then
	_type = 23
	return 3,_type
elseif _type =="钥匙" then
	_type = 28
	return 3,_type
elseif _type =="矿石" or _type =="矿" then
	_type = 29
	return 3,_type
elseif _type =="木材" or _type =="木" then
	_type = 30
	return 3,_type
elseif _type =="布" then
	_type = 31
	return 3,_type
elseif _type =="肉" then
	_type = 32
	return 3,_type
elseif _type =="鱼" then
	_type = 33
	return 3,_type
elseif _type =="蔬菜" then
	_type = 34
	return 3,_type
elseif _type =="其它" or _type =="食材" or _type =="其他" then
	_type = 35
	return 3,_type
elseif _type =="香草" then
	_type = 36
	return 3,_type
elseif _type =="宝石" then
	_type = 38
	return 3,_type
elseif _type =="封印卡" then
	_type = 40
	return 3,_type
elseif _type =="图鉴卡" or _type =="图鉴" then
	_type = 41
	return 3,_type
elseif _type =="药水" or _type =="药" or _type =="血" or _type =="血瓶" or _type =="瓶子" then
	_type = 30
	return 3,_type
elseif _type =="彩票" then
	_type = 47
	return 3,_type
elseif  type(tonumber(_type) ) == number then
	return 11,_type
else
	return -1,_type
end
end

function GetPetTechPos(_PetIndex)
	local	PetMaxTechPos=Char.GetData(_PetIndex,常量.宠物.技能栏)
	NLG.SystemMessage(-1,PetMaxTechPos);
	local str_ChangeWindow = "3|\\n所选宠技能已满\\n请选择删除的技能\\n";
	for _SkillPos=0,PetMaxTechPos-1 do
		local TechID = Pet.GetTechID(_PetIndex, _SkillPos)
		if TechID<0 then
			str_ChangeWindow = str_ChangeWindow .. "空\\n";
		else
			str_ChangeWindow = str_ChangeWindow .. ""..GetTech(TechID).."\\n";
		end
	end
	return str_ChangeWindow
end
function Num(_Data) --数字化
	return tonumber(_Data)
end

function DelDurItem(_PlayerIndex,ItemIndex) --根据INDEX获取 pos并且POS
	local ItemDur = Item.GetData(ItemIndex,常量.道具.耐久);
	if(ItemDur - 1 <= 0 )then
		GetItemPos(_PlayerIndex,ItemIndex,1);
	else
		Item.SetData(ItemIndex,常量.道具.耐久,tonumber(ItemDur - 1));
		GetItemPos(_PlayerIndex,ItemIndex,0);
	end
	return 1;
end
function DeleteItemUser(_PlayerIndex,ItemIndex) --根据INDEX获取 pos并且POS
	local ItemDur = Item.GetData(ItemIndex,常量.道具.耐久);
	if(ItemDur - 1 <= 0 )then
		GetItemPos(_PlayerIndex,ItemIndex,1);
	else
		Item.SetData(ItemIndex,常量.道具.耐久,tonumber(ItemDur - 1));
		GetItemPos(_PlayerIndex,ItemIndex,0);
	end
	return 1;
end
function UpItemIndex(_PlayerIndex,ItemIndex)
	local i;
	for i=8,28 do
		if (Char.GetItemIndex(_PlayerIndex,i) == ItemIndex)then
			if(Num == 1)then
				NLG.DelItemByPos(_PlayerIndex,i);
				break;
			end
		Item.UpItem(_PlayerIndex,ItemIndex)
		break;
		end
	end
end
function GetItemPos(_PlayerIndex,ItemIndex,Num)---获取道具POS，刷新idnex
	local i;
	for i=8,28 do
		if (Char.GetItemIndex(_PlayerIndex,i) == ItemIndex)then
			if(Num == 1)then
				NLG.DelItemByPos(_PlayerIndex,i);
				break;
			end
		Item.UpItem(_PlayerIndex,ItemIndex)
		break;
		end
	end
	return i
end

function BattleinEvent(_PlayerIndex)  --判断是否在战斗中，返回-1 0 不在战斗画面，返回 1在战斗画面
	local v4=Char.GetData(_PlayerIndex,273);
	local v2=Char.GetData(_PlayerIndex,272);--
	local battin=-1;
	if ( v2 == 6 or v2 < 1 or v4 == -1 ) then
		battin =0 --人物不在战斗
	else
		battin =1 --战斗
	end
	return battin
end

function 获取队友Index(_PlayerIndex)
	local tMemberList = {}
	if Char.GetData(_PlayerIndex,%对象_组队模式%) == 0 then
		tMemberList={_PlayerIndex}
	else
		for i = 0,4 do
			local tPlayerIndex = Char.GetTeamIndex(_PlayerIndex, i)
			if tPlayerIndex>=0 then
				table.insert(tMemberList, tPlayerIndex)
			end
		end
	end
	return tMemberList
end
function strTrim(s)	--去除获取文件读取的首尾的空格
   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function GetJobName(JobID)
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
	JobTypeName[90]="宠物大师"
	JobTypeName[100]="饲养师"
	JobTypeName[110]="驯兽师"
	JobTypeName[120]="盗贼"
	JobTypeName[130]="巫师"
	JobTypeName[140]="格斗士"
	JobTypeName[150]="忍者"
	JobTypeName[160]="舞者"
	JobTypeName[200]="万物制造者"
	JobTypeName[210]="近战武器"
	JobTypeName[220]="枪职人"
	JobTypeName[230]="远程武器"
	JobTypeName[240]="杖职人"
	JobTypeName[250]="回力职人"
	JobTypeName[260]="小刀职人"
	JobTypeName[270]="重装防具"
	JobTypeName[280]="轻装防具"
	JobTypeName[290]="铠职人"
	JobTypeName[300]="服职人"
	JobTypeName[310]="袍职人"
	JobTypeName[320]="靴职人"
	JobTypeName[330]="鞋职人"
	JobTypeName[340]="盾职人"
	JobTypeName[350]="炼药师"
	JobTypeName[360]="药剂师"
	JobTypeName[370]="武器修理师"
	JobTypeName[380]="防具修理师"
	JobTypeName[390]="鉴定师"
	JobTypeName[400]="はんこ屋"
	JobTypeName[410]="探侦"
	JobTypeName[420]="仙人"
	JobTypeName[430]="护士"
	JobTypeName[440]="医生"
	JobTypeName[450]="采集达人"
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
	if JobID==0 then JobID=1 end
	if JobTypeName[JobID] == nil then
		JobTypeName[JobID]="未知"
	end
	return JobTypeName[JobID]
end


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
ItemTypeName[43]="料理"
ItemTypeName[44]="药水"
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
function GetItemType(ItemTypeID)
	if ItemTypeID==0 then ItemTypeID=1 end
	if ItemTypeName[ItemTypeID] == nil then
		ItemTypeName[ItemTypeID]="未知"
	end
	return ItemTypeName[ItemTypeID]
end

function GoToPlayerIntPos(_MeIndex,_PlayerIndex,intMapType,intMap,intPosX,intPosY) --NPC跟踪玩家
	local MeMap=Char.GetData(_MeIndex,4)
	local mePosX = Char.GetData(_MeIndex,5);
	local mePosY = Char.GetData(_MeIndex,6);
	local dir=CharGoToDir(mePosX,mePosY,intPosX,intPosY);
	NPCPos_tab=NPCPos_tab or {}
	if NPCPos_tab[_MeIndex]==nil then
		NPCPos_tab[_MeIndex]={mePosX,mePosY,dir}
	end
	
	if  NPCPos_tab[_MeIndex][1]==mePosX and  NPCPos_tab[_MeIndex][2] == mePosY then
		dir=NPCPos_tab[_MeIndex][3]+1
		if dir > 7 then
			dir= 0
		end
		NPCPos_tab[_MeIndex]={mePosX,mePosY,dir}
		if mePosX==intPosX and intPosY==mePosY then
			return 0
		end
		NLG.SetAction(_MeIndex,2)
		print("走动")
		--dir=math.random(0,7)
	end
	NPCPos_tab[_MeIndex]={mePosX,mePosY,dir}
	NLG.WalkMove(_MeIndex,dir);
end
function CharGoToDir(posX_A,posY_A,posX_B,posY_B) --获取目标朝向
	local TM_Dir = -1;
	if (posX_A==posX_B and posY_A>posY_B) then
		TM_Dir = 0;
	elseif (posX_A<posX_B and posY_A>posY_B) then
		TM_Dir = 1;
	elseif (posX_A<posX_B and posY_A==posY_B) then
		TM_Dir = 2;
	elseif (posX_A<posX_B and posY_A<posY_B) then
		TM_Dir = 3;
	elseif (posX_A==posX_B and posY_A<posY_B) then
		TM_Dir = 4;
	elseif (posX_A>posX_B and posY_A<posY_B) then
		TM_Dir = 5;
	elseif (posX_A>posX_B and posY_A==posY_B) then
		TM_Dir = 6;
	elseif (posX_A>posX_B and posY_A>posY_B) then
		TM_Dir = 7;
	end
	return TM_Dir
end 
function myrandom(a1,a2)
	local b1;
	if(a1>=a2)then
		b1 = math.random(a2,a1);
	else
		b1 = math.random(a1,a2);
	end
	return b1;
end