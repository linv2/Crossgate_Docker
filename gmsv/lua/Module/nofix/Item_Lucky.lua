--[[
？	抽奖道具					LUA_useLuckyItem						6686	26220	0	26		0	1	0	93	1	1	0	1		1	1			0	0																																																				0	0					0	0	1			0	8000103	10515	100	0	0			0
]]


local PItemChar =PItemChar or {}
local NpcName = "道具抽奖"			--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 777, 21, 24}		--Npc地图坐标
local NpcImage =100500					--Npc图档104561
local NpcDir = 5						--Npc方向（0为左上，顺时针转）
local TianQi =TianQi or 0						--设置默认天气
local TianQiLastTime =10						--设置持续时间秒
local TianQiNowTime =TianQiNowTime or 0	--设置天气开始

---------------
luckyItem={}--特等奖道具
luckyItem["特等奖"]={}
luckyItem["特等奖"][1]={"鼠王的蛋","I|9700366|1",100}
luckyItem["特等奖"][2]={"零件随机包","I|9700350|1",100}
luckyItem["一等奖"] ={}--一等奖
luckyItem["一等奖"][1]={"宠物气功弹LV3技能卡","I|9700351|1",50}
luckyItem["一等奖"][2]={"宠物变身卡","I|9700294|1",150}
luckyItem["一等奖"][3]={"宠物变身卡","I|9700295|1",150}
luckyItem["一等奖"][4]={"宠物变身卡","I|9700296|1",150}
luckyItem["一等奖"][5]={"宠物变身卡","I|9700297|1",150}
luckyItem["一等奖"][6]={"水蓝鼠的蛋","I|9700367|1",100}
luckyItem["一等奖"][7]={"猫熊的蛋","I|9700368|1",100}
luckyItem["一等奖"][8]={"生锈的武器","I|18851|1",50}
luckyItem["一等奖"][9]={"生锈的武器","I|18852|1",50}
luckyItem["一等奖"][10]={"生锈的武器","I|18853|1",50}
luckyItem["一等奖"][11]={"生锈的武器","I|18854|1",100}
luckyItem["一等奖"][12]={"生锈的武器","I|18855|1",100}
luckyItem["一等奖"][13]={"破烂的防具","I|18858|1",100}
luckyItem["一等奖"][14]={"破烂的防具","I|18859|1",100}
luckyItem["一等奖"][15]={"破烂的防具","I|18860|1",100}
luckyItem["一等奖"][16]={"破烂的防具","I|18861|1",30}
luckyItem["一等奖"][17]={"破烂的防具","I|18862|1",30}
luckyItem["一等奖"][18]={"破烂的防具","I|18863|1",50}
luckyItem["一等奖"][19]={"破烂的防具","I|18864|1",100}
luckyItem["一等奖"][20]={"神秘的全开卷","I|9700309|1",100}
luckyItem["一等奖"][21]={"神秘的全开卷","I|9700310|1",100}
luckyItem["二等奖"]={}--2等奖
luckyItem["二等奖"][1]={"再生药水","I|45745|1",100}
luckyItem["二等奖"][2]={"11格技能栏增长卡","I|9700024|1",20}
luckyItem["二等奖"][3]={"12格技能栏增长卡","I|9700025|1",40}
luckyItem["二等奖"][4]={"13格技能栏增长卡","I|9700026|1",60}
luckyItem["二等奖"][5]={"14格技能栏增长卡","I|9700027|1",80}
luckyItem["二等奖"][6]={"15格技能栏增长卡","I|9700028|1",100}
luckyItem["二等奖"][7]={"改造血腥之刃设计图E","I|9700316|1",100}
luckyItem["二等奖"][8]={"改造火焰之刃设计图E","I|9700321|1",100}
luckyItem["二等奖"][9]={"改造多拉姆糖设计图E","I|9700326|1",100}
luckyItem["二等奖"][10]={"超改蜘蛛设计图E","I|9700333|1",100}
luckyItem["二等奖"][11]={"宠物变身卡（麒麟）","I|9700360|1",100}
luckyItem["二等奖"][12]={"7级宝石包","I|9700346|1",500}
luckyItem["二等奖"][13]={"8级宝石包","I|9700347|1",50}
luckyItem["二等奖"][14]={"诱魔香600步","I|9700252|1",150}
luckyItem["二等奖"][15]={"雏龙的蛋","I|9700327|1",50}
luckyItem["二等奖"][16]={"转职保证书","I|607686|1",50}
luckyItem["二等奖"][17]={"时间水晶L6","I|9700014|1",50}
luckyItem["三等奖"]={}--3等奖
luckyItem["三等奖"][1]={"白钥匙","I|16001|5",100}
luckyItem["三等奖"][2]={"黑钥匙","I|16002|5",100}
luckyItem["三等奖"][3]={"地的水晶","I|9201|1",100}
luckyItem["三等奖"][4]={"水的水晶","I|9202|1",100}
luckyItem["三等奖"][5]={"火的水晶","I|9203|1",100}
luckyItem["三等奖"][6]={"风的水晶","I|9204|1",100}
luckyItem["三等奖"][7]={"勾玉的碎片","I|18843|1",50}
luckyItem["三等奖"][8]={"万能洗档卷","I|9700254|1",10}
luckyItem["四等奖"]={}--4等奖
luckyItem["四等奖"][1]={"完美的安全帽","I|9700029|1",100}
luckyItem["四等奖"][2]={"钢骑之矿","I|18449|1",100}
luckyItem["四等奖"][3]={"魔族的水晶","I|18450|1",100}
luckyItem["四等奖"][4]={"誓言之证","I|18451|1",100}
-- luckyItem["四等奖"][8]={"时间水晶LV1","I|50050|1",50}
-- luckyItem["四等奖"][9]={"诱魔香L1","I|70282|1",50}
-- luckyItem["四等奖"][10]={"驱魔香（360步）","I|51194|1",50}
luckyItem["安慰奖"]={}--安慰奖
luckyItem["安慰奖"][1]={"魔币200","G|0|300",50}
luckyItem["安慰奖"][2]={"魔币100","G|0|100",100}
local Jiang={}	
Jiang[1]={"特等奖",0,1}
Jiang[2]={"一等奖",0,8}
Jiang[3]={"二等奖",0,20}
Jiang[4]={"三等奖",0,30}
Jiang[5]={"四等奖",0,40}
Jiang[6]={"安慰奖",0,80}
Jiang[7]={"谢谢惠顾",0,80}
function RandomGiveItem(ItemTab)--物品概率接口
	local 总概率=0
	for i =1,#ItemTab do
		总概率 =总概率+ItemTab[i][3]
	end
	local 随机ID = math.random(1,总概率);--jp总概率，toJP=总概率里面一个随机值
	local JP1=0
	local Num=0
	for b =1,#ItemTab do
		JP1=JP1+ ItemTab[b][3]
		if JP1>= 随机ID then
			Num= b
			break
		end
	end
	return Num
end
function initLuckyItemNpc()
	if (LuckyItemNpc == nil) then
  local LuckyItemNpc = NL.CreateNpc("lua/Module/Item_Lucky.lua","LuckyItemNpc_Init");
	Char.SetData(LuckyItemNpc,%对象_形象%,NpcImage);
	Char.SetData(LuckyItemNpc,%对象_原形%,NpcImage);
	Char.SetData(LuckyItemNpc,%对象_X%,NpcMapPos[3]);
	Char.SetData(LuckyItemNpc,%对象_Y%,NpcMapPos[4]);
	Char.SetData(LuckyItemNpc,%对象_地图%,NpcMapPos[2]);
	Char.SetData(LuckyItemNpc,%对象_方向%,NpcDir);
	Char.SetData(LuckyItemNpc,%对象_原名%,NpcName);
	NLG.UpChar(LuckyItemNpc);
	Char.SetLoopEvent(nil, "LuckyItemNpcTime",LuckyItemNpc,1000);--20秒检测一次是否
	Char.SetWindowTalkedEvent(nil,"NPC_ItemNpcWTEvent",LuckyItemNpc);
  end
end

local TianQi =TianQi or 0						--设置默认天气
local TianQiLastTime =10						--设置持续时间秒
local TianQiNowTime =TianQiNowTime or 0	--设置天气开始
function LuckyItemNpcTime(MeIndex)
	if TianQi~= 0 then
		if tonumber(os.time())-TianQiNowTime >TianQiLastTime then
			TianQi = 0						--设置默认天气
			TianQiNowTime = 0			--设置天气开始
			for k,v in pairs(Players) do
				toCdKey=k
			local MapID=Char.GetData(Players[toCdKey]["Index"],3);
			local FloorID=Char.GetData(Players[toCdKey]["Index"],4);
			NLG.MapEffect(MapID,FloorID,0,0);
			end
		end
	end
end



	
function ChangeLuckyItem(_PlayerIndex,_ItemIndex,_itemslot)

	local Zc1= Item.GetData(_ItemIndex,%道具_子参一%);
	local Dur = Item.GetData(_ItemIndex,%道具_耐久%);
	local Zc2= Item.GetData(_ItemIndex,%道具_子参二%);
	if _ItemIndex == -1 then
		NLG.SystemMessage(_PlayerIndex,"道具使用参数错误")
		return
	end

	local _ItemNum=Item.GetData(_ItemIndex,%道具_堆叠数%)
	local _ItemDur=Item.GetData(_ItemIndex,%道具_耐久%)
--	local _ItemPos=Char.GetItemPos(_PlayerIndex,_ItemIndex)
	if _ItemNum>1 then
		Item.SetData(_ItemIndex,%道具_堆叠数%,_ItemNum-1)
		Item.UpItem(_PlayerIndex,_itemslot);
	else 
    Item.Kill(_PlayerIndex,_ItemIndex,_itemslot)
	end
	--Char.DelItemByIndex(_PlayerIndex,_ItemIndex)
	local YYNum = RandomGiveItem(Jiang)
	local LuckyNum =Jiang[YYNum][1]
	local RandomNum=math.random(0,1000)
	--[[local RandomNum=math.random(0,1000)
	if RandomNum==1 then
		LuckyNum="特等奖"
	elseif RandomNum>=990 then
		LuckyNum="一等奖"
	elseif RandomNum>=950 then
		LuckyNum="二等奖"
	elseif RandomNum>=850 then
		LuckyNum="三等奖"	
	elseif RandomNum>=600 then
		LuckyNum="四等奖"	
	elseif RandomNum>=400 then
		LuckyNum="安慰奖"	
	end]]
	
	
	local LuckyGiveItem
	if LuckyNum ~= "谢谢惠顾" then
		LuckyGiveItem = RandomGiveItem(luckyItem[LuckyNum])
--		Char.GiveItem(_PlayerIndex,luckyItem[LuckyNum][LuckyGiveItem][2])
		EasyGive(_PlayerIndex,luckyItem[LuckyNum][LuckyGiveItem][2])
			end
	if LuckyNum=="一等奖" or LuckyNum=="特等奖" or LuckyNum=="二等奖" then
		NLG.SystemMessage(-1,"[梦想彩票] 恭喜玩家"..Char.GetData(_PlayerIndex,%对象_原名%).."抽到"..LuckyNum..luckyItem[LuckyNum][LuckyGiveItem][1].."！")	
		TianQi = 1						--设置默认天气
		TianQiNowTime = tonumber(os.time())	
		for k,v in pairs(Players) do
			toCdKey=k
			local MapID=Char.GetData(Players[toCdKey]["Index"],3);
			local FloorID=Char.GetData(Players[toCdKey]["Index"],4);
			NLG.MapEffect(MapID,FloorID,4,6);
		end	
	elseif LuckyNum=="三等奖" or LuckyNum=="四等奖"   then
		NLG.SystemMessage(_PlayerIndex,"[梦想彩票] 恭喜玩家"..Char.GetData(_PlayerIndex,%对象_原名%).."抽中"..LuckyNum..luckyItem[LuckyNum][LuckyGiveItem][1])	--得到奖励！
	elseif  LuckyNum=="安慰奖" then
		NLG.SystemMessage(_PlayerIndex,"[梦想彩票] 很遗憾，你抽中的是："..LuckyNum);
	else
		NLG.SystemMessage(_PlayerIndex,"[梦想彩票] 很遗憾，你并没有猜中此次大奖"..LuckyNum);
	end
end

Delegate.RegInit("LuckyItem_Init");

function LuckyItemNpc_Init(index)
	print("LuckyItem SUCCESS");
	return 1;
end

function LuckyItem_Init()
	initLuckyItemNpc();
	NL.RegItemString("lua/Module/Item_Lucky.lua","LuckyItem","LUA_useLuckyItem");
end

function LuckyItem(_PlayerIndex,_ItemIndex,_itemslot)
	PItemChar[_PlayerIndex] = nil
	local _ItemIndex = Char.GetItemIndex(_PlayerIndex,_itemslot);
	local ItemType=Item.GetData(_ItemIndex,2007)
	if ItemType == "LUA_useLuckyItem" then
		ChangeLuckyItem(_PlayerIndex,_ItemIndex,_itemslot);
		return 1
	end
	return 0;
end
	
function EasyGive(_PlayerIndex,GiveStr)
	local TM_Give = Split(GiveStr,"|")
	TM_Give[2] = tonumber(TM_Give[2])
	TM_Give[3] = tonumber(TM_Give[3])
	local TM_RT = ""
	if (TM_Give[1]=="G") then
		Char.SetData(_PlayerIndex,%对象_金币%,Char.GetData(_PlayerIndex,%对象_金币%)+TM_Give[3]);
		TM_RT = "[金币]" .. TM_Give[3] .. "G"
			NLG.SystemMessage(_PlayerIndex,"金币获得" .. TM_Give[3] .. "G");	
	elseif (TM_Give[1]=="I") then
		if Char.ItemSlot(_PlayerIndex) == 20 then
		
			TM_RT = "[道具]领取操作失败，道具栏不足!"
		else
			Char.GiveItem(_PlayerIndex,TM_Give[2],TM_Give[3])
			TM_RT = "[道具]*" .. TM_Give[3] .. "个，"
		end
	elseif (TM_Give[1]=="P") then
		if Char.PetNum(_PlayerIndex)==5 then
			TM_RT = "[宠物]领取操作失败，宠物栏不足!"
		else
			if tonumber(TM_Give[3])>=1 then TM_Give[3]=1 end
			local PetIndex=NLG.GivePet(_PlayerIndex,TM_Give[2],TM_Give[3])
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

	
