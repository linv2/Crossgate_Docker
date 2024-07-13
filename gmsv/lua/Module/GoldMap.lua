Delegate.RegInit("GoldMap_Init");
local PItemChar =PItemChar or {}
local GoldMapTable = {} --藏宝地点库
local 村子宝箱 ={} --道具名，奖品类型|道具ID|数量 ， 概率
村子宝箱[1]={"魔族的水晶","I|18450|3",1}
村子宝箱[2]={"钢骑之矿","I|18449|2",1}
村子宝箱[3]={"代金币","I|999999|3",1}
村子宝箱[4]={"傲慢的罪书","I|16440|1",1}
村子宝箱[5]={"嫉妒的罪书","I|16441|1",1}
村子宝箱[6]={"暴食的罪书","I|16442|1",1}
村子宝箱[7]={"色欲的罪书","I|16443|1",1}
村子宝箱[8]={"怠惰的罪书","I|16444|1",1}
村子宝箱[9]={"贪欲的罪书","I|16445|1",1}
村子宝箱[10]={"愤怒的罪书","I|16446|1",1}

GoldMapTable= {} --第一组设置
--GoldMapTable[1] = {"法兰城",1000,200,210,80,90} --第1组坐标范围 mapname,mapid,xmin,xmax,ymin,ymax
--GoldMapTable[2] = {"弗莱娅",100,100,300,40,80}
--GoldMapTable[3] = {"索契亚",300,100,300,40,80}
----
GoldMapTable[1] = {"伊尔村",2000,33,44,30,35}
GoldMapTable[2] = {"伊尔村",2000,39,48,36,46}
GoldMapTable[3] = {"圣拉鲁卡村",2300,30,34,50,60}
GoldMapTable[4] = {"圣拉鲁卡村",2300,30,34,79,89}
GoldMapTable[5] = {"亚留特村",2400,43,54,37,46}
GoldMapTable[6] = {"亚留特村",2400,33,43,74,78}
GoldMapTable[7] = {"维诺雅村",2100,44,65,42,48}
GoldMapTable[8] = {"维诺雅村",2100,18,31,37,41}
GoldMapTable[9] = {"乌克兰",2200,53,61,15,23}
GoldMapTable[10] = {"乌克兰",2200,43,49,37,45}
GoldMapTable[11] = {"奇利村",3200,54,62,46,56}
GoldMapTable[12] = {"奇利村",3200,71,76,68,84}
GoldMapTable[13] = {"加纳村",3000,40,52,66,74}
GoldMapTable[14] = {"加纳村",3000,36,50,46,56}
GoldMapTable[15] = {"杰诺瓦镇",4000,25,36,36,48}
GoldMapTable[16] = {"杰诺瓦镇",4000,45,50,53,72}
GoldMapTable[17] = {"蒂娜村",4200,25,31,22,30}
GoldMapTable[18] = {"蒂娜村",4200,29,43,43,51}
GoldMapTable[19] = {"阿巴尼斯村",4300,36,42,54,68}
GoldMapTable[20] = {"阿巴尼斯村",4300,49,54,33,54}

local GoldMapGiveTable = {} --奖励库70274
GoldMapGiveTable[1] = {0,"仔细搜索了地下也没有任何发现。写着字泛黄的纸消失，得不到奖励。",15}
GoldMapGiveTable[2] = {1,{},70}
GoldMapGiveTable[3] = {2,{500,2500,5000,10000},40}
GoldMapGiveTable[4] = {3,{{611,612,613,614,615,616},{10,20,30,40}},20}
--{type,id/gold,pro}
--type 奖励类型 0：无奖励 1：道具 2：魔币 3：战斗
--id/gold 0："事件对话" 1：{ItemID1,itemnum1,ItemID2,itemnum2} 2：{goldmin,goldmax} 3：{{EnemyIdAr},{BaseLevelAr}}
--pro 概率累加 如分别为25 50 75 100 就表示一共100概率 分别25
--------------------高级设置--------------------------------

local 地图信息 = %道具_攻击% --记录地图信息
local X坐标 = %道具_防御% --记录地图x坐标
local Y坐标 = %道具_敏捷%--记录地图Y坐标

--------------------设置结束--------------------------------
function BoxGiveItem(TJBX_item)--宝箱物品概率接口{"完全结晶体的红宝石",13679,5}
	local JP=0
	for i =1,#TJBX_item do
		JP =JP+TJBX_item[i][3]
	end
	local toJP = math.random(1,JP);--jp总概率，toJP=总概率里面一个随机值
	local JP1=0
	local Num=0
	for b =1,#TJBX_item do
		JP1=JP1+ TJBX_item[b][3]
		if JP1 >= toJP then
			Num= b
			break
		end
	end
	return Num
	--return false;
end
--Delegate.RegDelUseItemEvent("GqLuaItme_Event")
function GqLuaItme_Event(_PlayerIndex,_toPlayerIndex,_ItemPos)
	local _ItemIndex=Char.GetItemIndex(_PlayerIndex,_ItemPos)
	local ItemType=Item.GetData(_ItemIndex,2003)
	local Zc1 = Item.GetData(_ItemIndex,46)
	local Zc2= Item.GetData(_ItemIndex,47)
	local tItemID = Item.GetData(_ItemIndex,0)
	PItemChar[_PlayerIndex] = nil
	if ItemType == "GoldMap"  then
		local ItemMap = Item.GetData(_ItemIndex,地图信息)
		if ItemMap > 0 then --已经登记地图的藏宝图
			local mapid =GoldMapTable[ItemMap][2]
			local mapposx = Item.GetData(_ItemIndex,X坐标)
			local mapposy = Item.GetData(_ItemIndex,Y坐标)
			local _PlayerIndexmap = Char.GetData(_PlayerIndex,%对象_地图%)
			local _PlayerIndexposx = Char.GetData(_PlayerIndex,%对象_X%)
			local _PlayerIndexposy = Char.GetData(_PlayerIndex,%对象_Y%)
			if (mapid == _PlayerIndexmap) and (_PlayerIndexposx > (mapposx-3) and _PlayerIndexposx < (mapposx+3)) and (_PlayerIndexposy > (mapposy-3) and _PlayerIndexposy < (mapposy+3)) then
				local rdm1
				local rdmMAx=0
				for b=1,#GoldMapGiveTable do
					rdmMAx= rdmMAx + GoldMapGiveTable[b][3]
				end
				local givetype=math.random(1,rdmMAx)
				local Num=0
				for i = 1,#GoldMapGiveTable do
					Num=Num+GoldMapGiveTable[i][3]
					if givetype <= Num then
						givetype = i
						break
					end	
				end
				Char.DelItem(_PlayerIndex,tItemID,1)
				if GoldMapGiveTable[givetype][1] == 0 then --空气
					NLG.SystemMessage(_PlayerIndex,GoldMapGiveTable[givetype][2])
				elseif GoldMapGiveTable[givetype][1] == 1 then --道具
					local 奖品 = BoxGiveItem(村子宝箱)
					EasyGive(_PlayerIndex,村子宝箱[奖品][2])
					local ItemBoxName=村子宝箱[奖品][1]
					NLG.SystemMessage(_PlayerIndex,"[系统] 恭喜你挖到宝藏！"..ItemBoxName);
					--EasyGive(_PlayerIndex,GoldMapGiveTable[givetype][2][rdm2])
				elseif GoldMapGiveTable[givetype][1] == 2 then --魔币奖励
					local rdm2
					for i = 1,10 do
						rdm2 = math.random(GoldMapGiveTable[givetype][2][1],GoldMapGiveTable[givetype][2][2])
					end
					Char.SetGold(_PlayerIndex,rdm2)
				elseif GoldMapGiveTable[givetype][1] == 3 then --创建战斗
					Enemy={GoldMapGiveTable[givetype][2][1][math.random(1,5)]}
					EnemyLevel={math.random(1,50)}
					local tName = Char.GetData(_MePtr, 常量.对象.原名)
					local BattleIndex= Battle.PVE(_PlayerIndex, IntNpc["GoldMapNpc"], nil, Enemy, EnemyLevel);
					--NLG.CreateBattle(_PlayerIndex,IntNpc["GoldMapNpc"], nil,Enemy,EnemyLevel);
				end
			else
				NLG.SystemMessage(_PlayerIndex,"泛黄的纸上写着"..GoldMapTable[ItemMap][1].."("..mapposx..","..mapposy..")附近。")
				return 0
			end
		else
			local rdm1
			local rdm2
			local rdm3
			for i = 1,10 do
				rdm1 = math.random(1,#GoldMapTable)
				rdm2 = math.random(GoldMapTable[rdm1][3],GoldMapTable[rdm1][4])
				rdm3 = math.random(GoldMapTable[rdm1][5],GoldMapTable[rdm1][6])
			end
			Item.SetData(_ItemIndex,地图信息,rdm1)
			Item.SetData(_ItemIndex,X坐标,rdm2)
			Item.SetData(_ItemIndex,Y坐标,rdm3)
			NLG.SystemMessage(_PlayerIndex,"泛黄的纸的字迹逐渐浮现出来，好像是"..GoldMapTable[rdm1][1].."("..rdm2..","..rdm3..")附近的样子。")
			Item.UpItem(_PlayerIndex,_ItemPos)
			return 0
		end		
	end

	if ItemType == "GoldMapWarp"  then
		for tItemPos= 8,27 do
			local _tItemPosIndex = Char.GetItemIndex(_PlayerIndex,tItemPos)
			if _tItemPosIndex > 0 then
				local PosType=Item.GetData(_tItemPosIndex,常量.道具.双击效果)
				if PosType == "GoldMap" and tonumber(Item.GetData(_tItemPosIndex,地图信息))>0 then
					local ItemMap = Item.GetData(_tItemPosIndex,地图信息)
					local mapposx = Item.GetData(_tItemPosIndex,X坐标)
					local mapposy = Item.GetData(_tItemPosIndex,Y坐标)
					local mapid = GoldMapTable[ItemMap][2]
					Char.DelItem(_PlayerIndex,tItemID,1)
					Char.DischargeParty(_PlayerIndex)
					Char.Warp(_PlayerIndex,0,mapid,mapposx,mapposy)
					NLG.SystemMessage(_PlayerIndex,"[雷达]您已经被传送至位置了。")
					return 0
				end
			end
		end
		NLG.SystemMessage(_PlayerIndex,"[出错]您没有对应的藏宝图。")
		return 0
	end
end
function GoldMap_Init()
	NL.RegItemString("lua/Module/GoldMap.lua","GqLuaItme_Event","LUA_useBT"); --注册诱魔香
end
---------------道具范本--------------
--藏宝图？	藏宝图	GoldMap			LUA_useBT						23658	1002969	0	43		0	1	0	72	1	1	1	1	0																																																																0	0	0			0	70203	70203	100	0	0	0		
--藏宝图雷达？	藏宝图雷达	GoldMapWarp			LUA_useBT						23659	1002969	0	43		0	1	0	72	1	1	1	1	0																																																																0	0	0			0	70203	70203	100	0	0	0		
