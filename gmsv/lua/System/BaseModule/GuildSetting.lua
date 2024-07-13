------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--家族工会模块-设置
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