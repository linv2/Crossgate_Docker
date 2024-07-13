------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--家族工会模块
--
--自定义全新的家族系统，
--
--by Duckyの復活
--in 2014.2.26
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【家族设置】】】
------------------------------------------------------------------------------
GuildClass = GuildClass or {}
--创建家族设置
GuildClass.CreateNeedItemName = "创建家族许可证"	--物品名称
GuildClass.CreateNeedItemID = 475001			--物品ID
GuildClass.CreateNeedItemNum = 1				--物品所需数量（写0为不扣除）
GuildClass.CreatePointName = "点卷"				--点卷名称
GuildClass.CreatePointID = 88888				--点卷ID
GuildClass.CreatePointNum = 50					--点卷所需数量（写0为不扣除）
GuildClass.CreateNeedGold = 0					--金币所需数量（写0为不扣除）
GuildClass.CreateNeedLv = 120					--人物等级限制（写0为不检测）
GuildClass.CreateNeedJobRank = 2				--职业阶级限制（写0为不检测）
GuildClass.CreateGiveItem = {}
--创建家族后给予族长道具清单：{名称，道具ID，数量}  --(注意：数量请勿超出堆叠上限，否则容易出现少给的情况)
GuildClass.CreateGiveItem[1] = {"家族招募卷", 475004, 30}		--创建家族给予道具
GuildClass.CreateGiveItem[2] = {"族员驱逐令", 475005, 30}		--创建家族给予道具
GuildClass.CreateGiveItem[3] = {"族长首饰", 475006, 1}			--创建家族给予道具
--家族宣言修改设置
GuildClass.EditNeedManageLv = 9					--修改家族宣言所需管理权限
--人事任命设置
GuildClass.TitleNeedManageLv = 9					--人事任命所需管理权限
GuildClass.TitleName = {}
GuildClass.TitleName[9] = "族长"
GuildClass.TitleName[5] = "长老"
GuildClass.TitleName[3] = "堂主"
GuildClass.TitleName[1] = "族员"
GuildClass.TitleNum = {}
GuildClass.TitleNum[5] = {1, 1, 2, 3}			--各家族等级可以任命的长老数(最多4个)
GuildClass.TitleNum[3] = {2, 3, 4, 4}			--各家族等级可以任命的堂主数(最多4个)
--家族地图设置
GuildClass.GuildMapSet = {0, 999, 10, 10}
--家族贡献设置
GuildClass.DonateGoldRate = 0.0005		--贡献每点魔币获得贡献度
GuildClass.DonatePointRate = 10			--贡献每点点卷获得贡献度
--家族人数设置
GuildClass.MaxMemberSet = {50, 70, 90, 100, 999}		--各等级家族可容纳人数｛1级人数，2级人数，3级人数，4级人数，5级人数……｝
--家族加人设置
GuildClass.JoinNeedItemName = "家族招募卷"		--物品名称
GuildClass.JoinNeedItemID = 475004				--物品ID
GuildClass.JoinNeedItemNum = 1					--物品所需数量
GuildClass.JoinNeedManageLv = 2					--邀请加入所需管理权限
GuildClass.JoinOperater = {}
GuildClass.UseItemSolt = {}
GuildClass.JoinGiveItem = {}
GuildClass.JoinGiveItem[1] = {"家族证明书", 475006, 1}		--加入家族给予道具
--家族踢人设置
GuildClass.ExpulsionNeedItemName = "族员驱逐令"	--物品名称
GuildClass.ExpulsionNeedItemID = 475005			--物品ID
GuildClass.ExpulsionNeedItemNum = 1				--物品所需数量
GuildClass.ExpulsionNeedManageLv = 3			--家族踢人所需管理权限
GuildClass.ExpulsionSaveGold = 0				--踢出家族后，是否保留家族的魔币（选项：0-扣除，1-保留）
GuildClass.ExpulsionSavePoint = 0				--踢出家族后，是否保留家族的点卷（选项：0-扣除，1-保留）
GuildClass.ExpulsionSaveContribution = 0		--踢出家族后，是否保留家族的贡献度（选项：0-扣除，1-保留）
--退出家族设置
GuildClass.LeaveSaveGold = 1				--退出家族后，是否保留家族的魔币（选项：0-扣除，1-保留）
GuildClass.LeaveSavePoint = 1				--退出家族后，是否保留家族的点卷（选项：0-扣除，1-保留）
GuildClass.LeaveSaveContribution = 1		--退出家族后，是否保留家族的贡献度（选项：0-扣除，1-保留）
--家族升级设置
GuildClass.UpgradeNeedItemName = {"家族升级许可证 Lv.1", "家族升级许可证 Lv.2" ,"家族升级许可证 Lv.3", "家族升级许可证 Lv.4"}	--物品名称
GuildClass.UpgradeNeedItemID = {475011, 475012, 475013, 475014}		--升级所需物品ID
GuildClass.UpgradeNeedItemNum = {1, 1, 1, 9999}						--升级所需物品数量
GuildClass.UpgradeNeedGold = {0, 0, 0, 0}					--家族升级所需魔币数｛1级升2级魔币，2级升3级魔币，3级升4级魔币……｝
GuildClass.UpgradeNeedPoint = {0, 0, 0, 0}					--家族升级所需点卷数｛1级升2级点卷，2级升3级点卷，3级升4级点卷……｝
GuildClass.UpgradeNeedContribution = {10000, 15000, 64000, 0}		--家族升级必须满足家族贡献度｛1级升2级贡献，2级升3级贡献，3级升4级贡献……｝
GuildClass.UpgradeNeedMember = {2, 3, 20, 999}			--家族升级必须满足家族人数｛1级升2级人数，2级升3级人数，3级升4级人数……｝
GuildClass.UpgradeNeedCreateTime = {0,7,30, 999}		--家族升级必须满足距离家族成立时间（单位：天）
GuildClass.UpgradeNeedManageLv = 9				--家族升级所需管理权限
GuildClass.UpgradeSaveGold = 1					--升级家族后，是否保留家族的魔币（选项：0-扣除，1-保留）
GuildClass.UpgradeSavePoint = 1					--升级家族后，是否保留家族的点卷（选项：0-扣除，1-保留）
GuildClass.UpgradeGiveItem = {}
GuildClass.UpgradeGiveItem[1] = {"家族招募卷", 475004, 30}		--升级家族给予道具
GuildClass.UpgradeGiveItem[2] = {"族员驱逐令", 475005, 30}		--升级家族给予道具
--家族列表设置
GuildClass.GuildList = {}						
GuildClass.PlayerGuildList = {}					--以玩家Index为Key的成员表
GuildClass.PlayerGuildID = {}					--以玩家Index为Key的GuildID
GuildClass.GuildListSelect = {}					--以玩家Index为Key的选择结果
GuildClass.GuildListReturn = {}					--以玩家Index为Key的返回函数
GuildClass.GuildListPageBase = 1000
GuildClass.GuildListPagePerNum = 8
--族员列表设置
GuildClass.MemberList = {}						--以GuildID为Key的成员表
GuildClass.PlayerMemberList = {}				--以玩家Index为Key的成员表
GuildClass.MemberListType = {}					--以玩家Index为Key的查看类型
GuildClass.MemberListSelect = {}				--以玩家Index为Key的选择结果
GuildClass.MemberListReturn = {}				--以玩家Index为Key的返回函数
GuildClass.MemberListPageBase = 1000
GuildClass.MemberListPagePerNum = 8
--家族商店
GuildClass.ShopCurrency	= 1						--交易货币（选项：0-免费，1-贡献，2-魔币，3-点卷）
GuildClass.ShopNeedManageLv = 1					--购买道具所需权限（大于此权限可购买）
GuildClass.ShopDiscountRate = 1					--商品价格折扣设置
GuildClass.ShopList = {}
--家族商店：道具设置（添加商品时，请整段复制，等级由低到高排序）
local tNo = 1									--道具序号（必须连续无重复）
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.1"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加1小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 50				--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 2
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.2"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加2小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 100			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 3
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.3"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加3小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 100			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 4
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.4"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加4小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 100			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 5
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.5"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加5小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 100			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 6
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "卡时水晶Lv.6"	--道具名称
GuildClass.ShopList[tNo].Desc = "使用后增加6小时卡时"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 200			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 999			--限制贩卖数量
local tNo = 7
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "家族头饰"		--道具名称
GuildClass.ShopList[tNo].Desc = "不带属性的家族头饰"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 2000			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 200				--限制贩卖数量
local tNo = 8
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "家族头饰"		--道具名称
GuildClass.ShopList[tNo].Desc = "不带属性的家族头饰"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 2000			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 200				--限制贩卖数量
local tNo = 9
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "家族头饰"		--道具名称
GuildClass.ShopList[tNo].Desc = "不带属性的家族头饰"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 2000			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 20				--限制贩卖数量
local tNo = 10
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--物品等级（家族等级达到时才会显示出来）
GuildClass.ShopList[tNo].Name = "家族头饰（限量）"		--道具名称
GuildClass.ShopList[tNo].Desc = "带有少量随机属性的家族头饰"		--道具说明
GuildClass.ShopList[tNo].Image = 29101			--道具图档
GuildClass.ShopList[tNo].ID = 908613			--道具ID
GuildClass.ShopList[tNo].Stack = 1				--道具每组数量（每次购买获得的数量）
GuildClass.ShopList[tNo].Price = 2000			--贩卖价格
GuildClass.ShopList[tNo].MaxNum = 5				--限制贩卖数量
--家族技能
GuildClass.SkillCurrency	= 1					--交易货币（选项：0-免费，1-贡献，2-魔币，3-点卷）
GuildClass.SkillNeedManageLv = 1				--购买道具所需权限（大于此权限可购买）
GuildClass.SkillDiscountRate = 1				--商品价格折扣设置
GuildClass.SkillList = {}
--家族技能：技能设置（添加技能时，请整段复制，等级由低到高排序）
local tNo = 1									--技能序号（必须连续无重复）
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 1				--技能等级（家族等级达到时才会显示出来）
GuildClass.SkillList[tNo].Name = "颠倒乾坤 Lv.1"		--技能名称
GuildClass.SkillList[tNo].Desc = "敌方或我方全体，水晶属性反转（此技能仅有1级）"		--技能说明
GuildClass.SkillList[tNo].ID = 517			--技能ID
GuildClass.SkillList[tNo].Price = 50			--学习价格
GuildClass.SkillList[tNo].MaxNum = 999			--限制学习数量
local tNo = 2
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 1				--技能等级（家族等级达到时才会显示出来）
GuildClass.SkillList[tNo].Name = "暗渡陈仓 Lv.1"		--技能名称
GuildClass.SkillList[tNo].Desc = "偷偷潜行至敌阵，给敌方全体套上1级恢复（此技能仅有1级）"		--技能说明
GuildClass.SkillList[tNo].ID = 518			--技能ID
GuildClass.SkillList[tNo].Price = 200			--学习价格
GuildClass.SkillList[tNo].MaxNum = 50			--限制学习数量
local tNo = 3
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 2				--技能等级（家族等级达到时才会显示出来）
GuildClass.SkillList[tNo].Name = "瑶池蟠桃 Lv.1"		--技能名称
GuildClass.SkillList[tNo].Desc = "吃下蟠桃仙果，牺牲自己，为全体恢复HP（此技能仅有1级）"		--技能说明
GuildClass.SkillList[tNo].ID = 519			--技能ID
GuildClass.SkillList[tNo].Price = 5000			--学习价格
GuildClass.SkillList[tNo].MaxNum = 10			--限制学习数量
local tNo = 4
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 3				--技能等级（家族等级达到时才会显示出来）
GuildClass.SkillList[tNo].Name = "天神降临 Lv.1"		--技能名称
GuildClass.SkillList[tNo].Desc = "召唤天神协助，全体复活并恢复1血（此技能仅有1级）"			--技能说明
GuildClass.SkillList[tNo].ID = 520			--技能ID
GuildClass.SkillList[tNo].Price = 5000			--学习价格
GuildClass.SkillList[tNo].MaxNum = 10			--限制学习数量
--【其他设置】
GuildClass.OnlineMember = GuildClass.OnlineMember or {}
GuildClass.TitleList = GuildClass.TitleList or {}
GuildClass.PlayerTitleList = GuildClass.PlayerTitleList or {}
------------------------------------------------------------------------------
Delegate.RegDelLoginEvent("GuildClass.MemberLogin");
Delegate.RegDelDropEvent("GuildClass.MemberLogout");
Delegate.RegDelLogoutEvent("GuildClass.MemberLogout");
Delegate.RegDelLoginGateEvent("GuildClass.MemberLoginGate");

function GuildClass.MemberLogin(_PlayerIndex)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	--print("Login tGuildID=" .. tGuildID)
	if tGuildID>0 then
		GuildClass.OnlineMember[tGuildID] = GuildClass.OnlineMember[tGuildID] or {}
		local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
		local tDataPN = Char.GetData(_PlayerIndex, 48)
		local tRegistNumber = Char.GetData(_PlayerIndex, 49)
		local tName = Char.GetData(_PlayerIndex, %对象_名字%)
		local tKey = GuildClass.getTabKey(_PlayerIndex)
		GuildClass.OnlineMember[tGuildID][tKey] = {
													Index = _PlayerIndex,
													CdKey = tCdKey,
													RegistNumber = tRegistNumber,
													DataPN = tDataPN,
													Name = tName,
													Time = os.time()
													}
		--GuildClass.GuildMessage(tGuildID, "族员 " .. tName .. " 上线了！")
		--GuildClass.GuildTalk(tGuildID, "大家好，我是" .. tName .. "！快来找我一起做任务吧！")
	end
	return 1
end

function GuildClass.MemberLogout(_PlayerIndex)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if tGuildID>0 then
		GuildClass.OnlineMember[tGuildID] = GuildClass.OnlineMember[tGuildID] or {}
		local tKey = GuildClass.getTabKey(_PlayerIndex)
		GuildClass.OnlineMember[tGuildID][tKey] = nil
	end
	return 1
end

function GuildClass.MemberLoginGate(_PlayerIndex)
	return 1
end

--获取家族ID
function GuildClass.GetID(_PlayerIndex)
	return Field.Get(_PlayerIndex, "GuildID")
end

--设置家族ID
function GuildClass.SetID(_PlayerIndex, _GuildID)
	if _GuildID~=nil then
		_GuildID = tonumber(_GuildID)
	end
	return Field.Set(_PlayerIndex, "GuildID", _GuildID)
end

--创建家族
function GuildClass.CreateGuild(_PlayerIndex, _GuildName)
	_GuildName = _GuildName or ""
	--_GuildName = string.trims(_GuildName)
	if string.len(_GuildName)<8 or string.len(_GuildName)>16 then
		print("CreateGuild Error: string.len(_GuildName)=" .. string.len(_GuildName))
		return -1	--家族名太短太长
	end
	if GuildClass.GetID(_PlayerIndex)~=nil and GuildClass.GetID(_PlayerIndex)~=0 and GuildClass.GetID(_PlayerIndex)~="0" and GuildClass.GetID(_PlayerIndex)~="" then
		return -2	--你已加入家族
	end
	if GuildClass.GuildNameToID(_GuildName)~=nil then
		print("CreateGuild Error: _GuildName=" .. _GuildName)
		return -3	--家族名称已存在
	end
	if Char.ItemNumAdv(_PlayerIndex, GuildClass.CreateNeedItemID)<GuildClass.CreateNeedItemNum then
		print("CreateGuild Error: Char.ItemNumAdv=" .. GuildClass.CreateNeedItemID .. "," .. Char.ItemNumAdv(_PlayerIndex, GuildClass.CreateNeedItemID) .. "<" .. GuildClass.CreateNeedItemNum)
		return -4	--缺少家族创建证
	end
	if Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID)<GuildClass.CreatePointNum then
		print("CreateGuild Error: Char.ItemNumAdv=" .. GuildClass.CreatePointID .. "," .. Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID) .. "<" .. GuildClass.CreatePointNum)
		return -5	--缺少点卷
	end
	if Char.GetData(_PlayerIndex, %对象_金币%)<GuildClass.CreateNeedGold then
		print("CreateGuild Error: Char.GetData(_PlayerIndex, %对象_金币%)=" .. Char.GetData(_PlayerIndex, %对象_金币%) .. "<" .. GuildClass.CreateNeedGold)
		return -6	--缺少金币
	end
	if Char.GetData(_PlayerIndex, %对象_职阶%)<GuildClass.CreateNeedJobRank then
		print("CreateGuild Error: Char.GetData(_PlayerIndex, %对象_职阶%)=" .. Char.GetData(_PlayerIndex, %对象_职阶%) .. "<" .. GuildClass.CreateNeedJobRank)
		return -7	--职阶不够
	end
	local tEmptySlot = Char.ItemSlot(_PlayerIndex)
	if tEmptySlot<table.getn(GuildClass.CreateGiveItem) then
		print("CreateGuild Error: Char.ItemSlot(_PlayerIndex)=" .. tEmptySlot .. "<" .. table.getn(GuildClass.CreateGiveItem))
		return -8	--空余道具栏不足
	end
	Char.DelItem(_PlayerIndex, GuildClass.CreateNeedItemID, GuildClass.CreateNeedItemNum)
	Char.DelItem(_PlayerIndex, GuildClass.CreatePointID, GuildClass.CreatePointNum)
	Char.AddGold(_PlayerIndex, GuildClass.CreateNeedGold*-1)
	--Char.SetData(_PlayerIndex, %对象_金币%, Char.GetData(_PlayerIndex, %对象_金币%)-GuildClass.CreateNeedJobRank)
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %对象_名字%)
	local tGuildID = GuildClass.GetMaxGuildID() + 1
	local tMaxMember = GuildClass.MaxMemberSet[1]
	local tSql1 = "insert into "
	tSql1 = tSql1 .. "lua_guild (GuildID, GuildName, MaxMember, GM_CdKey, GM_RegistNumber, GM_DataPlaceNumber, CreateTime) "
	tSql1 = tSql1 .. "values (" .. tGuildID .. ", '" .. _GuildName .. "', " .. tMaxMember .. ", '" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. os.time() .. "); "
	SQL.Run(tSql1)
	local tSql2 = "insert into "
	tSql2 = tSql2 .. "lua_guildmember (CdKey, RegistNumber, DataPlaceNumber, GuildID, TitleID, JoinTime) "
	tSql2 = tSql2 .. "values ('" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. tGuildID .. ", " .. 9 .. ", " .. os.time() .. "); "
	SQL.Run(tSql2)
	GuildClass.SetID(_PlayerIndex, tGuildID)
	for i = 1, table.getn(GuildClass.CreateGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.CreateGiveItem[i][2], GuildClass.CreateGiveItem[i][3])
	end
	GuildClass.MemberSetData(_PlayerIndex, "Gold", GuildClass.CreateNeedGold)
	GuildClass.MemberSetData(_PlayerIndex, "Point", GuildClass.CreatePointNum)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.GuildSetData(tGuildID, "Gold", GuildClass.CreateNeedGold)
	GuildClass.GuildSetData(tGuildID, "Point", GuildClass.CreatePointNum)
	GuildClass.GuildSetData(tGuildID, "Contribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.Log(tGuildID, _PlayerIndex, "CreateGuild", nil, _GuildName)
	return 1
end

--删除家族
function GuildClass.DelGuild(_PlayerIndex)
	local _GuildID = GuildClass.GetID(_PlayerIndex)
	if _GuildID==nil or _GuildID=="" or _GuildID==0 or _GuildID=="0" then
		return -1	--没有加入家族
	end
	_GuildID = tonumber(_GuildID)
	if GuildClass.GetMemberNum(_GuildID)>1 then
		return -2	--家族人员没有清空
	end
	local tGuildName = GuildClass.GuildGetData(_GuildID, "GuildName")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tRegistNumber = tonumber(Char.GetData(_PlayerIndex, 49))
	local tDataPlaceNumber = tonumber(Char.GetData(_PlayerIndex, 48))
	if GM_CdKey~=tCdKey or GM_RegistNumber~=tRegistNumber or GM_DataPlaceNumber~=tDataPlaceNumber then
		return -3	--你不是管理员
	end
	local tSql1 = "Delete From lua_guildmember where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql1)
	local tSql2 = "Delete From lua_guild where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql2)
	local tSql4 = "Delete From lua_guildmission where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql4)
	--SQL.Run(tSql1 .. tSql2 .. tSql3 .. tSql4)
	GuildClass.SetID(_PlayerIndex, 0)
	Char.Warp(_PlayerIndex, 0, 1000, 242, 88)
	Char.DelItem(_PlayerIndex, 475004, 99999)
	Char.DelItem(_PlayerIndex, 475005, 99999)
	Char.DelItem(_PlayerIndex, 475006, 99999)
	Char.DelItem(_PlayerIndex, 475004, 99999)
	Char.DelItem(_PlayerIndex, 475005, 99999)
	Char.DelItem(_PlayerIndex, 475006, 99999)
	GuildClass.Log(_GuildID, _PlayerIndex, "DelGuild", nil, tGuildName)
	return 1
end

--升级家族
function GuildClass.UpgradeGuild(_PlayerIndex, _GuildID)
	_GuildID = tonumber(_GuildID)
	local tGuildLv = tonumber(GuildClass.GuildGetData(_GuildID, "GuildLv"))
	local tGuildGold = tonumber(GuildClass.GuildGetData(_GuildID, "Gold"))
	local tGuildPoint = tonumber(GuildClass.GuildGetData(_GuildID, "Point"))
	local tGuildContribution = tonumber(GuildClass.GuildGetData(_GuildID, "Contribution"))
	local tGuildMember = tonumber(GuildClass.GetMemberNum(_GuildID))
	local tNeedGold = tonumber(GuildClass.UpgradeNeedGold[tGuildLv])
	local tNeedPoint = tonumber(GuildClass.UpgradeNeedPoint[tGuildLv])
	local tNeedContribution = tonumber(GuildClass.UpgradeNeedContribution[tGuildLv])
	local tNeedMember = tonumber(GuildClass.UpgradeNeedMember[tGuildLv])
	local tNeedCreateTime = tonumber(GuildClass.UpgradeNeedCreateTime[tGuildLv])
	local tNeedItemName = GuildClass.UpgradeNeedItemName[tGuildLv]
	local tNeedItemID = tonumber(GuildClass.UpgradeNeedItemID[tGuildLv])
	local tNeedItemNum = tonumber(GuildClass.UpgradeNeedItemNum[tGuildLv])
	local tOperaterTitleID = GuildClass.MemberGetData(_PlayerIndex, "TitleID")
	if tOperaterTitleID<GuildClass.UpgradeNeedManageLv then
		return -1	--权限不够
	end
	if Char.ItemNumAdv(_PlayerIndex, tNeedItemID)<tNeedItemNum then
		return -2	--道具不足
	end
	if tGuildGold<tNeedGold or tGuildPoint<tNeedPoint or tGuildMember<tNeedMember or tGuildContribution<tNeedContribution then
		return -3	--条件不足
	end
	GuildClass.GuildSetData(_GuildID, "GuildLv", tGuildLv + 1)
	if GuildClass.UpgradeSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tNeedGold)
	end
	if GuildClass.UpgradeSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tNeedPoint)
	end
	Char.DelItem(_PlayerIndex, tNeedItemID, tNeedItemNum)
	GuildClass.GuildSetData(_GuildID, "MissionID", 0)
	for i = 1, table.getn(GuildClass.UpgradeGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.UpgradeGiveItem[i][2], GuildClass.UpgradeGiveItem[i][3])
	end
	return 1
end

function GuildClass.EnterGuildMap(_PlayerIndex, _GuildID)
	
end

function GuildClass.InviteGuild(_PlayerIndex, _GuildID, _TargetIndex)
	
end

--加入家族
function GuildClass.JoinGuild(_PlayerIndex, _GuildID, _OperaterIndex)
	--if _GuildID~=nil then _GuildID = tonumber(_GuildID) end
	--if GuildClass.GetID(_PlayerIndex)~=nil then
	--	return -2	--你已加入家族
	--end
	_GuildID = tonumber(_GuildID)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if tGuildID>0 then
		return -2	--你已加入家族
	end
	local tGuildLv = tonumber(GuildClass.GuildGetData(_GuildID, "GuildLv"))
	local tGuildMemberNum = GuildClass.GetMemberNum(_GuildID)
	if tGuildMemberNum>=GuildClass.MaxMemberSet[tGuildLv] then
		return -3
	end
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %对象_名字%)
	local tSql = "insert into "
	tSql = tSql .. "lua_guildmember (CdKey, RegistNumber, DataPlaceNumber, GuildID, TitleID, JoinTime) "
	tSql = tSql .. "values ('" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. _GuildID .. ", " .. 1 .. ", " .. os.time() .. "); "
	SQL.Run(tSql)
	GuildClass.SetID(_PlayerIndex, _GuildID)
	GuildClass.MemberLogin(_PlayerIndex)
	for i = 1, table.getn(GuildClass.JoinGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.JoinGiveItem[i][2], GuildClass.JoinGiveItem[i][3])
	end
	GuildClass.Log(_GuildID, _PlayerIndex, "JoinGuild", _OperaterIndex, nil)
	return 1
end

--退出家族
function GuildClass.LeaveGuild(_PlayerIndex)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--你未加入家族
	end
	local tPlayerGold = GuildClass.MemberGetData(_PlayerIndex, "Gold")
	local tPlayerPoint = GuildClass.MemberGetData(_PlayerIndex, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tRegistNumber = tonumber(Char.GetData(_PlayerIndex, 49))
	local tDataPlaceNumber = tonumber(Char.GetData(_PlayerIndex, 48))
	if GM_CdKey==tCdKey and GM_RegistNumber==tRegistNumber and GM_DataPlaceNumber==tDataPlaceNumber then
		return -2	--你是管理员
	end
	if GuildClass.LeaveSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tPlayerGold)
	end
	if GuildClass.LeaveSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tPlayerPoint)
	end
	if GuildClass.LeaveSaveContribution~=1 then
		GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution - tPlayerMaxContribution)
	end
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %对象_名字%)
	local tSql = "delete from lua_guildmember where GuildID=" .. _GuildID .. " and CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	SQL.Run(tSql)
	GuildClass.SetID(_PlayerIndex, 0)
	GuildClass.MemberLogout(_PlayerIndex)
	Char.Warp(_PlayerIndex, 0, 1000, 242, 88)
	GuildClass.Log(_GuildID, _PlayerIndex, "LeaveGuild", nil, nil)
	return 1
end

--驱逐族员
function GuildClass.ExpulsionGuild(_PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber, _OperaterIndex)
	_PlayerRegistNumber = tonumber(_PlayerRegistNumber)
	_PlayerDataPlaceNumber = tonumber(_PlayerDataPlaceNumber)
	local _GuildID = tonumber(GuildClass.GetID(_OperaterIndex)) or 0
	if _GuildID<=0 then
		return -1	--你未加入家族
	end
	local tPlayerTab = {_PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber}
	local tPlayerGold = GuildClass.MemberGetData(tPlayerTab, "Gold")
	local tPlayerPoint = GuildClass.MemberGetData(tPlayerTab, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(tPlayerTab, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(tPlayerTab, "MaxContribution")
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tOperaterTitleID = GuildClass.MemberGetData(_OperaterIndex, "TitleID")
	if tOperaterTitleID<GuildClass.ExpulsionNeedManageLv then
		return -2	--权限不够
	end
	if GM_CdKey==_PlayerCdKey and GM_RegistNumber==_PlayerRegistNumber and GM_DataPlaceNumber==_PlayerDataPlaceNumber then
		return -3	--族长无法驱逐
	end
	if Char.ItemNumAdv(_OperaterIndex, GuildClass.ExpulsionNeedItemID)<GuildClass.ExpulsionNeedItemNum then
		return -4	--道具不足
	end
	if GuildClass.ExpulsionSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tPlayerGold)
	end
	if GuildClass.ExpulsionSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tPlayerPoint)
	end
	if GuildClass.ExpulsionSaveContribution~=1 then
		GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution - tPlayerMaxContribution)
	end
	local tName = ""
	local tPlayerIndex = GuildClass.IsOnline(_GuildID, _PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber)
	print("_PlayerCdKey=" .. _PlayerCdKey)
	print("_PlayerRegistNumber=" .. _PlayerRegistNumber)
	print("_PlayerDataPlaceNumber=" .. _PlayerDataPlaceNumber)
	print("tPlayerIndex=" .. tPlayerIndex)
	print("_OperaterIndex=" .. _OperaterIndex)
	if tPlayerIndex~=0 and tPlayerIndex~=-1 and tPlayerIndex~=-2 then
		--Online
		print("Setp: Get Target Name")
		tName = Char.GetData(tPlayerIndex, %对象_名字%)
		print("Setp: Get Operator Name")
		local tOperaterName = Char.GetData(_OperaterIndex, %对象_名字%)
		print("Setp: Get Guild Name")
		local tGuildName = GuildClass.GuildGetData(_GuildID, "GuildName")
		print("Setp: Send SystemMessage")
		NLG.SystemMessage(tPlayerIndex, "[家族] 你已被" .. tOperaterName .. "踢出" .. tGuildName .. "家族！")
		--GuildClass.MemberLogout(tPlayerIndex)
		print("Setp: Set Field nil")
		GuildClass.SetID(tPlayerIndex, 0)
		print("Setp: Get Map Info")
		local tGuildMapType = GuildClass.GuildGetData(_GuildID, "MapType")
		local tGuildMapID = GuildClass.GuildGetData(_GuildID, "MapID")
		local tPlayerMapType = Char.GetData(tPlayerIndex, %对象_MAP%)
		local tPlayerMapID = Char.GetData(tPlayerIndex, %对象_地图%)
		if tPlayerMapType==tGuildMapType and tGuildMapID==tPlayerMapID then
			print("Setp: Warp Target")
			Char.Warp(tPlayerIndex, 0, 1000, 242, 88)
		end
	else
		--Offline
		print("Setp: SQL.Run")
		local tSql1 = "select Name from tbl_character where CdKey='" .. _PlayerCdKey .. "' and RegistNumber=" .. _PlayerRegistNumber .. " and DataPlaceNumber=" .. _PlayerDataPlaceNumber .. ";"
		local tRS = SQL.Run(tSql1)
		if type(tRS)=="table" then
			tName = tRS["0_0"]
		else
			tName = "未知"
		end
		print("\n[家族] " .. tName .. "（Offline） 已被踢出家族")
		local tSql2 = "delete from tbl_globalregvalue where account_id='" .. _PlayerCdKey .. "' and reg_num=" .. _PlayerRegistNumber .. " and data_place=" .. _PlayerDataPlaceNumber .. " and str='GuildID';"
		local tRS = SQL.Run(tSql2)
	end
	print("Setp: SQL.Run")
	local tSql = "delete from lua_guildmember where GuildID=" .. _GuildID .. " and CdKey='" .. _PlayerCdKey .. "' and RegistNumber=" .. _PlayerRegistNumber .. " and DataPlaceNumber=" .. _PlayerDataPlaceNumber .. ";"
	SQL.Run(tSql)
	print("Setp: Del Item")
	Char.DelItem(_OperaterIndex, GuildClass.ExpulsionNeedItemID, GuildClass.ExpulsionNeedItemNum)
	print("Setp: Log")
	GuildClass.Log(_GuildID, _OperaterIndex, "ExpulsionGuild", tPlayerIndex, nil)
	return 1
end

--族员贡献金币
function GuildClass.DonateGold(_PlayerIndex, _Value)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--你未加入家族
	end
	_Value = tonumber(_Value) or 0
	if _Value<=0 or _Value<(1/GuildClass.DonateGoldRate) or _Value>Char.GetData(_PlayerIndex, %对象_金币%) then
		return -2
	end
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local tPlayerGold = GuildClass.MemberGetData(_PlayerIndex, "Gold")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	--Char.SetData(_PlayerIndex, %对象_金币%, Char.GetData(_PlayerIndex, %对象_金币%) - _Value)
	Char.AddGold(_PlayerIndex, _Value*-1)
	GuildClass.MemberSetData(_PlayerIndex, "Gold", tPlayerGold + _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", tPlayerContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", tPlayerMaxContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold + _Value)
	GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	return 1
end

--族员贡献点卷
function GuildClass.DonatePoint(_PlayerIndex, _Value)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--你未加入家族
	end
	_Value = tonumber(_Value) or 0
	if _Value<=0 or _Value>Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID) then
		return -2
	end
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local tPlayerPoint = GuildClass.MemberGetData(_PlayerIndex, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	Char.DelItem(_PlayerIndex, GuildClass.CreatePointID, _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Point", tPlayerPoint + _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", tPlayerContribution + math.floor(_Value * GuildClass.DonatePointRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", tPlayerMaxContribution + math.floor(_Value * GuildClass.DonatePointRate))
	GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint + _Value)
	GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution + math.floor(_Value * GuildClass.DonatePointRate))
	return 1
end

--获取家族列表
function GuildClass.GetGuildList()
	local tGuildNum = GuildClass.GetGuildNum()
	local tSql = "SELECT g.GuildID, g.GuildName, g.GuildLv, count(m.CdKey) AS Member, g.Contribution " .. 
				"FROM lua_guild g LEFT JOIN lua_guildmember m ON g.GuildID = m.GuildID " .. 
				"GROUP BY g.GuildName ORDER BY g.GuildLv DESC, g.Contribution DESC"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetGuildList Error: 数据库错误: " .. tRS)
		 return -2		--数据库错误
	end
	local tFieldName = {"GuildID", "GuildName", "GuildLv", "Member", "Contribution"}
	local tGuildList = {}
	for tRow = 0, tGuildNum-1 do
		if tRS[tRow .. "_" .. 0]~=nil then
			--break
			local tGuildListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tGuildListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tGuildList, tGuildListRow)
		end
	end
	GuildClass.GuildList = tGuildList
	return tGuildList
end

--获取成员列表
function GuildClass.GetMemberList(_GuildID)
	local _GuildID = tonumber(_GuildID) or 0
	if _GuildID<=0 then
		print("GetMemberList Error: 家族编号有误")
		return -1	--家族编号有误
	end
	local tMemberNum = GuildClass.GetMemberNum(_GuildID)
	--print("GetMemberList.tMemberNum=" .. tMemberNum)
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				"AND m.GuildID = " .. _GuildID .. 
				" order by m.TitleID desc, m.MaxContribution desc;"
	--local tSql = "select g.GuildName, g.GuildID, m.Contribution from lua_guild g, lua_guildmember m where g.GuildID=m.GuildID;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetMemberList Error: 数据库错误: " .. tRS)
		 return -2		--数据库错误
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tMemberList = {}
	for tRow = 0, tMemberNum-1 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tMemberListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tMemberListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tMemberList, tMemberListRow)
		end
	end
	GuildClass.MemberList[_GuildID] = tMemberList
	--print("#tMemberList=" .. #tMemberList)
	return tMemberList
end

--获取全服成员列表
function GuildClass.GetMemberAllList()
	local tMemberNum = GuildClass.GetMemberAllNum()
	--print("GetMemberList.tMemberNum=" .. tMemberNum)
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				" order by m.MaxContribution desc;"
	--local tSql = "select g.GuildName, g.GuildID, m.Contribution from lua_guild g, lua_guildmember m where g.GuildID=m.GuildID;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetMemberList Error: 数据库错误: " .. tRS)
		 return -2		--数据库错误
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tMemberList = {}
	for tRow = 0, tMemberNum-1 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tMemberListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tMemberListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tMemberList, tMemberListRow)
		end
	end
	GuildClass.MemberList[-9] = tMemberList
	--print("#tMemberList=" .. #tMemberList)
	return tMemberList
end

function GuildClass.GetTitleList(_GuildID, _TitleID)
	local _GuildID = tonumber(_GuildID) or 0
	if _GuildID<=0 then
		print("GetTitleList Error: 家族编号有误")
		return -1	--家族编号有误
	end
	local _TitleID = tonumber(_TitleID) or 0
	if _TitleID<=0 then
		print("GetTitleList Error: 称号编号有误")
		return -2	--称号编号有误
	end
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				" AND m.GuildID = " .. _GuildID .. 
				" AND m.TitleID = " .. _TitleID .. 
				" order by m.TitleID desc, m.MaxContribution desc;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetTitleList Error: 数据库错误: " .. tRS)
		return {}		--数据库错误
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tTitleList = {}
	for tRow = 0, 3 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tTitleListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tTitleListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tTitleList, tTitleListRow)
		end
	end
	GuildClass.TitleList[_GuildID] = GuildClass.TitleList[_GuildID] or {}
	GuildClass.TitleList[_GuildID][_TitleID] = tTitleList
	return tTitleList
end

--获取家族表数据
function GuildClass.GuildGetData(_GuildID, _Const)
	_GuildID = tonumber(_GuildID)  or 0
	local tSql = "select " .. _Const .. " from lua_guild where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tRS["0_0"]
end

--设置家族表数据
function GuildClass.GuildSetData(_GuildID, _Const, _Value)
	_GuildID = tonumber(_GuildID)  or 0
	if _Value==nil then _Value=0 end
	if type(_Value)=="string" then _Value = "'" .. _Value .. "'" end
	local tSql = "update lua_guild set " .. _Const .. "=" .. _Value .. " where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql)
end

--获取族员表数据
function GuildClass.MemberGetData(_PlayerIndex, _Const)
	local tCdKey, tDataPN, tRegistNumber
	if type(_PlayerIndex)=="number" then
		tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
		tDataPN = Char.GetData(_PlayerIndex, 48)
		tRegistNumber = Char.GetData(_PlayerIndex, 49)
	elseif type(_PlayerIndex)=="table" then
		tCdKey = _PlayerIndex[1]
		tRegistNumber = _PlayerIndex[2]
		tDataPN = _PlayerIndex[3]
	end
	local tSql = "select " .. _Const .. " from lua_guildmember where CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--设置族员表数据
function GuildClass.MemberSetData(_PlayerIndex, _Const, _Value)
	if _Value==nil then _Value=0 end
	local tCdKey, tDataPN, tRegistNumber
	if type(_PlayerIndex)=="number" then
		tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
		tDataPN = Char.GetData(_PlayerIndex, 48)
		tRegistNumber = Char.GetData(_PlayerIndex, 49)
	elseif type(_PlayerIndex)=="table" then
		tCdKey = _PlayerIndex[1]
		tRegistNumber = _PlayerIndex[2]
		tDataPN = _PlayerIndex[3]
	end
	local tSql = "update lua_guildmember set " .. _Const .. "=" .. _Value .. " where CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	return SQL.Run(tSql)
end

--获取任务表数据
function GuildClass.MissionGetData(_GuildID, _Const)
	_GuildID = tonumber(_GuildID)  or 0
	local tSql = "select " .. _Const .. "from lua_guildmission where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--设置任务表数据
function GuildClass.MissionSetData(_GuildID, _Const, _Value)
	_GuildID = tonumber(_GuildID)  or 0
	if _Value==nil then _Value=0 end
	local tSql = "update lua_guildmission set " .. _Const .. "=" .. _Value .. " where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql)
end

function GuildClass.IsOnline(_GuildID, _PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber)
	--GuildClass.OnlineMember[_GuildID] = GuildClass.OnlineMember[_GuildID] or {}
	--print("_GuildID=" .. _GuildID)
	--print("type(GuildClass.OnlineMember[_GuildID])=" .. type(GuildClass.OnlineMember[_GuildID]))
	_GuildID = tonumber(_GuildID) or -1
	_PlayerCdKey = tostring(_PlayerCdKey)
	_PlayerRegistNumber = tonumber(_PlayerRegistNumber)
	_PlayerDataPlaceNumber = tonumber(_PlayerDataPlaceNumber)
	local tKey = "T_" .. _PlayerCdKey .. "_" .. _PlayerRegistNumber .. "_" .. _PlayerDataPlaceNumber
	if GuildClass.OnlineMember[_GuildID]==nil then
		return -1
	end
	if GuildClass.OnlineMember[_GuildID][tKey]==nil then
		return -2
	end
	local tPlayerIndex = GuildClass.OnlineMember[_GuildID][tKey].Index
	local tCdKey = Char.GetData(tPlayerIndex, %对象_账号%)
	local tDataPN = Char.GetData(tPlayerIndex, 48)
	local tRegistNumber = Char.GetData(tPlayerIndex, 49)
	if tCdKey==_PlayerCdKey and tRegistNumber==_PlayerRegistNumber and tDataPN==_PlayerDataPlaceNumber then
		return tPlayerIndex
	end
	return -3
end

--获取家族数
function GuildClass.GetGuildNum()
	local tSql = "select count(*) from lua_guild;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--获取家族族员数
function GuildClass.GetMemberNum(_GuildID)
	_GuildID = tonumber(_GuildID)
	local tSql = "select count(*) from lua_guildmember where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--获取家族族员数
function GuildClass.GetMemberAllNum()
	local tSql = "select count(*) from lua_guildmember;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--获取最大家族ID
function GuildClass.GetMaxGuildID()
	local tSql = "select GuildID from lua_guild order by GuildID desc limit 1;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--通过家族名称查询家族ID
function GuildClass.GuildNameToID(_GuildName)
	local tSql = "select GuildID from lua_guild where GuildName='" .. _GuildName .. "';"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return nil
	end
	return tonumber(tRS["0_0"])
end

--通过家族名称查询家族ID
function GuildClass.GuildIDToName(_GuildID)
	_GuildID = tonumber(_GuildID) or 0
	if _GuildID==-9 then
		return "全服"
	end
	local tSql = "select GuildName from lua_guild where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return nil
	end
	return tonumber(tRS["0_0"])
end

function GuildClass.GuildTalk(_GuildID, _Talk)
	local tCount = 0
	for Key, Value in pairs(GuildClass.OnlineMember[_GuildID]) do
		if Field.Get(Value.Index, "GuildMessageOff")~=1 then
			NLG.TalkToCli(Value.Index, 0, "[家族] " .. Value.Name .. "：" .. _Talk)
			tCount = tCount + 1
		end
	end
	return tCount
end

function GuildClass.GuildMessage(_GuildID, _Message)
	local tCount = 0
	for Key, Value in pairs(GuildClass.OnlineMember[_GuildID]) do
		if Field.Get(Value.Index, "GuildMessageOff")~=1 then
			NLG.SystemMessage(Value.Index, "[家族] " .. _Message)
			tCount = tCount + 1
		end
	end
	return tCount
end

function GuildClass.getTabKey(_PlayerIndex)
	local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	return "T_" .. tCdKey .. "_" .. tRegistNumber .. "_" .. tDataPN
end

--记录家族Log
function GuildClass.Log(_GuildID, _OperatorIndex, _Operation, _TargetIndex, _Value)
	_Operation = _Operation or ""
	_Value = _Value or ""
	local oCdKey = Char.GetData(_OperatorIndex, %对象_账号%)
	local oName = Char.GetData(_OperatorIndex, %对象_名字%)
	local oShow = oName .. "[" .. oCdKey .. "]"
	local tShow = ""
	if _TargetIndex~=nil and _TargetIndex~=0 and _TargetIndex~=-1 and _TargetIndex~=-2 then
		local tCdKey = Char.GetData(_TargetIndex, %对象_账号%) or ""
		local tName = Char.GetData(_TargetIndex, %对象_名字%) or ""
		tShow = tName .. "[" .. tCdKey .. "]" or ""
	end
	if type(_OperatorIndex)~="number" or _OperatorIndex==0 then
		oShow = ""
	end
	if type(_TargetIndex)~="number" or _TargetIndex==0 then
		tShow = ""
	end
	if type(_Value)=="table" then
		_Value = table.concat(_Value, "|")
	end
	print("Log.oShow=" .. oShow .. " ,Log.tShow=" .. tShow)
	local tSql = "insert into "
	tSql = tSql .. "lua_guildlog (GuildID, Operator, Operation, Target, Value, LogTime) "
	tSql = tSql .. "values (" .. _GuildID .. ", '" .. oShow  .. "', '" .. _Operation .. "', '" .. tShow .. "', '" .. _Value .. "', " .. os.time() .. ");"
	SQL.Run(tSql)
end

function string.trim(s)
	local from = s:match"^%s*()"
	return from > table.getn(s) and "" or s:match(".*%S", from)
end

function string.trims(str)
	local trims = string.trims
	if str:sub(1,1)==" " then
		str = trims(str:sub(2, str:len()))
	end
	if str:sub(str:len(), str:len())==" " then
		str = trims(str:sub(1, str:len()-1))
	end
	if str:sub(1,2)=="　" then
		str = trims(str:sub(3, str:len()))
	end
	if str:sub(str:len()-1, str:len())=="　" then
		str = trims(str:sub(1, str:len()-2))
	end
	return str
end

function string.align(str, _Len, _Align)
--[[
参数一：传入的字符串
参数二：放置的空间长度
参数三：1：居左，2：居中，3：居右
]]--
	if string.len(str)>_Len then
		str = string.sub(str,1,_Len)
	end
	if(_Align == 3) then
		str_tmp=string.format("%".._Len.."s", str);
	elseif(_Align == 1) then
		str_tmp=string.format("%-".._Len.."s", str);
	elseif(_Align == 2) then
		local tmp_splace=math.floor((_Len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-".._Len.."s", str_tmp);
	end
	return str_tmp;
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="游民"
	JobTypeName[10]="剑士"
	JobTypeName[20]="战斧"
	JobTypeName[30]="骑士"
	JobTypeName[40]="弓手"
	JobTypeName[50]="士兵"
	JobTypeName[60]="传教"
	JobTypeName[70]="魔术"
	JobTypeName[80]="咒术"
	JobTypeName[90]="封印"
	JobTypeName[100]="饲养"
	JobTypeName[110]="驯兽"
	JobTypeName[120]="盗贼"
	JobTypeName[130]="巫师"
	JobTypeName[140]="格斗"
	JobTypeName[150]="忍者"
	JobTypeName[160]="舞者"
	JobTypeName[170]="骑士"
	JobTypeName[180]="魔剑"
	JobTypeName[200]="造剑"
	JobTypeName[210]="造斧"
	JobTypeName[220]="造枪"
	JobTypeName[230]="造弓"
	JobTypeName[240]="造杖"
	JobTypeName[250]="造回"
	JobTypeName[260]="造刀"
	JobTypeName[270]="造盔"
	JobTypeName[280]="造帽"
	JobTypeName[290]="造铠"
	JobTypeName[300]="造服"
	JobTypeName[310]="造袍"
	JobTypeName[320]="造靴"
	JobTypeName[330]="造鞋"
	JobTypeName[340]="造盾"
	JobTypeName[350]="厨师"
	JobTypeName[360]="药剂"
	JobTypeName[370]="武修"
	JobTypeName[380]="防修"
	JobTypeName[390]="鉴定"
	JobTypeName[400]="未知"
	JobTypeName[410]="侦探"
	JobTypeName[420]="仙人"
	JobTypeName[430]="护士"
	JobTypeName[440]="医师"
	JobTypeName[450]="伐木"
	JobTypeName[460]="猎人"
	JobTypeName[470]="矿工"
	JobTypeName[999]="GM"
	JobTypeName[170]="教骑"
	JobTypeName[500]="锻造"
	JobTypeName[510]="采集"
	if _TypeNo==0 then _TypeNo=1 end
	if _TypeNo==-1 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function string.align(str, _Len, _Align)
--[[
参数一：传入的字符串
参数二：放置的空间长度
参数三：1：居左，2：居中，3：居右
]]--
	if string.len(str)>_Len then
		str = string.sub(str,1,_Len)
	end
	if(_Align == 3) then
		str_tmp=string.format("%".._Len.."s", str);
	elseif(_Align == 1) then
		str_tmp=string.format("%-".._Len.."s", str);
	elseif(_Align == 2) then
		local tmp_splace=math.floor((_Len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-".._Len.."s", str_tmp);
	end
	return str_tmp;
end

function string.split(strTxt, strDelim, maxNb)   
    -- Eliminate bad cases...   
    if string.find(strTxt, strDelim) == nil then  
        return { strTxt }  
    end  
    if maxNb == nil or maxNb < 1 then  
        maxNb = 0    -- No limit   
    end  
    local result = {}
    local pat = "(.-)" .. strDelim .. "()"   
    local nb = 0  
    local lastPos   
    for part, pos in string.gfind(strTxt, pat) do  
        nb = nb + 1  
        result[nb] = part   
        lastPos = pos   
        if nb == maxNb then break end  
    end  
    -- Handle the last field   
    if nb ~= maxNb then  
        result[nb + 1] = string.sub(strTxt, lastPos)   
    end  
    return result   
end

function Char.ItemNumAdv(_PlayerIndex, _ItemID)
	local ItemNums = 0
	for Slot=8,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex, Slot)
		if tItemIndex>0 then
			local tItemID = Item.GetData(tItemIndex, 0)
			if tItemID==_ItemID then
				local tItemNum = Item.GetData(tItemIndex, 9)
				if tItemNum>1 then
					ItemNums = ItemNums + tItemNum
				else
					ItemNums = ItemNums + 1
				end
			end
		end
	end
	return ItemNums
end