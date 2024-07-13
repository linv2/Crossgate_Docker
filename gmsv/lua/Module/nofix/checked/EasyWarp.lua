-----------------------------------------------------------------------------------
------练级匹配-------

--脚本配置
玩家已登记地点 =玩家已登记地点 or {}	----记录玩家现在登记的练级地点
PrtJiLu = PrtJiLu or {}			--窗口用临时指针
匹配人数=匹配人数 or  {}
玩家临时记录 = 玩家临时记录 or {}			--窗口用临时指针
玩家匹配创建表 = 玩家匹配创建表 or {}		--记录匹配列表，包含格式{地点,等级,人数,{玩家，玩家..}}
PlayerTime ={}					----玩家进入准备状态 = 0是答题准备 >0是等待状态
WarpPlayerNum=WarpPlayerNum or {}				--队伍人数记录{地点=数量} >=5则开始
新玩家匹配列表= {}
临时传送记录={}
local 世界之石id=123456
	--格式 名字|限制等级|收费|坐标  限制。如果限制传送点输入旗杆ID 。如果不限制输入0 如果限制道具则输入在道具ID前面加入 -。
local 开放传送地图表= {"灵堂|10|100|0,1538,16,7|0",
		"狗洞|10|300|0,100,589,47|96|亚留特传送",
		"深绿|10|700|0,33000,290,436|0",
		"雪山|30|800|0,402,83,193|102|阿巴尼斯村传送",
		"炎洞|40|800|0,15595,12,12|97|维诺亚村传送",
		"水洞|50|1000|0,15542,17,24|97|维诺亚村传送",
                "布朗山|70|800|0,36003,11,2|0",
                "火山|70|2000|0,48000,25,27|-16389|牺牲品之指轮",
                "沙滩|90|2000|0,30002,404,94|163|蕾欧娜传送",}

-----------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
local NpcName = "组队召唤管理员"					--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 1000, 236, 83}		--Npc地图坐标
local NpcImage = 106602					--Npc图档101022
local NpcDir = 4						--Npc方向（0为左上，顺时针转）
Delegate.RegInit("EasyWarpNPC_Init");
function EasyWarpNPC_Init()

	local 练级匹配NPC = CreateNpc("练级匹配NPC")
	Char.SetData( 练级匹配NPC, 常量.对象.形象, NpcImage);
	Char.SetData( 练级匹配NPC, 常量.对象.原形, NpcImage);
	Char.SetData( 练级匹配NPC, 常量.对象.地图类型, NpcMapPos[1]);
	Char.SetData( 练级匹配NPC, 常量.对象.地图, NpcMapPos[2]);
	Char.SetData( 练级匹配NPC, 常量.对象.X, NpcMapPos[3]);
	Char.SetData( 练级匹配NPC, 常量.对象.Y, NpcMapPos[4]);
	Char.SetData( 练级匹配NPC, 常量.对象.方向, NpcDir);
	Char.SetData( 练级匹配NPC, 常量.对象.原名, NpcName);
	NLG.UpChar(练级匹配NPC)
	Char.SetTalkedEvent(nil, "EasyWarpNPC_Talked", 练级匹配NPC)
	Char.SetWindowTalkedEvent(nil, "EasyWarpNPC_WindowTalked", 练级匹配NPC)
	Char.SetLoopEvent(nil, "Warp_LoopEvent", 练级匹配NPC,10);--30秒检测一次是否
	if #WarpPlayerNum==0 then
		WarpPlayerNum={}
		for i=1,#开放传送地图表 do
			WarpPlayerNum[i]={}
		end
	end
	return true;
end
function EasyWarpNPC_Talked( _MeIndex, _PlayerIndex, _Mode)
if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 1) == false) then--检查人物是否在面前
		return ;
	end 

	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2, 999,
			"5\n　　　　　　　　◆快速匹配练级◆" ..
			"\n" ..
			"\n欢迎使用[匹配练级]系统，系统说明如下：" ..
			"\n1、玩家可以选择练级地点，报名总人数" ..
			"\n2、人数凑齐后会发起通知" ..
			"\n　　　　　　　   『创建队列』" ..
			"\n　　　　　　　   『加入队列』" ..
			"\n　　　　　　　   『查询队友』" ..
			"\n　　　　　　　   『取消登记』" ..
			"\n");
		PrtJiLu[_PlayerIndex] = nil
	return ;
end

function EasyWarpNPC_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
		local tName= Char.GetData(_PlayerIndex,%对象_原名%)
		local tLevel= Char.GetData(_PlayerIndex,%对象_等级%)
		local CdKey= Char.GetData(_PlayerIndex,2002)
	if _Select == 2 and _Seqno~=999 then ---二级界面退出
	NLG.ShowWindowTalked(_PlayerIndex,
			_MeIndex, 2, 2, 999,
			"5\n　　　　　　　　　◆快速匹配练级◆" ..
			"\n" ..
			"\n欢迎使用[匹配练级]系统，系统说明如下：" ..
			"\n1、玩家可以选择练级地点，报名总人数" ..
			"\n2、人数凑齐后会发起通知" ..
			"\n　　　　　　　   『创建队列』" ..
			"\n　　　　　　　   『加入队列』" ..
			"\n　　　　　　　   『查询队友』" ..
			"\n　　　　　　　   『取消登记』" ..
			"\n");
			PrtJiLu[_PlayerIndex] = nil
		return ;
	end
	-----界面
	if _Seqno == 999 then
		if _Data == "1" then--创建队伍
			if 玩家已登记地点[_PlayerIndex]==nil then
			PrtJiLu[_PlayerIndex] = 0
			玩家临时记录[_PlayerIndex]=1
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 34, PrtJiLu[_PlayerIndex],创建队伍窗口(_PlayerIndex,PrtJiLu[_PlayerIndex],开放传送地图表));
			---查看练级列表
			else
				NLG.SystemMessage(_PlayerIndex,"[系统]您当前已经登记过服务器匹配表，如要重新登录请取消登记")
			end
			return ;
		end
		if _Data == "2" then
			--查看现有队伍
			PrtJiLu[_PlayerIndex] = 0
			if #玩家匹配创建表==nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,String.Centering("\n\n\n\n当前没有登记传送记录！！"));
				return ;
			end
			新玩家匹配列表[_PlayerIndex]={}
			for k,v in pairs(玩家匹配创建表) do
				table.insert(新玩家匹配列表[_PlayerIndex],{k,v})
			end
			local tselect =34
			if #新玩家匹配列表[_PlayerIndex] < 6 then
				tselect=2
			end
			玩家临时记录[_PlayerIndex]=2
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],查看队伍窗口(_PlayerIndex,PrtJiLu[_PlayerIndex]));
			return ;
		end
		if _Data == "3" then
			--显示匹配队友
			if 玩家已登记地点[_PlayerIndex]~=nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2,888,获取匹配队友资料(_PlayerIndex));
			else
				玩家临时记录[_PlayerIndex]=2
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n并没有您的记录信息！！");
				NLG.SystemMessage(_PlayerIndex,"[系统]你并没有记录信息")
			end
			return ;
		end
		if _Data == "4" then 
			---清理本人记录
			if 玩家已登记地点[_PlayerIndex]==nil then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,String.Centering("\n\n\n\n你并没有记录地址！！"));
				NLG.SystemMessage(_PlayerIndex,"[系统]你并没有记录信息")
			else
				DelWarpPlayer(_PlayerIndex)
				return ;
			end
		end
	end

	
	if tonumber(_Seqno) ==888 and  tonumber(_Data)==1 then----------发出系统广播
		if GetGold(_PlayerIndex)> 500 then
			local 队长CdKey=玩家已登记地点[_PlayerIndex]
			local 地点=玩家匹配创建表[队长CdKey][1]
			local Warp = Split(开放传送地图表[地点],"|");
			local 传送收费 = tonumber(Warp[3]);
			local 要求等级= 玩家匹配创建表[队长CdKey][2]
			local 人数=玩家匹配创建表[队长CdKey][3]
			local 现有人数=#匹配人数[队长CdKey]
			local 地图名称 =Warp[1]
			Char.AddGold(_PlayerIndex,-500); 
--		local money = Char.GetData(_PlayerIndex,%对象_金币%);
--			Char.SetData(_PlayerIndex,%对象_金币%,money-500);
--			NLG.UpChar(player);			
			local EventName="无 "
				if tonumber(Warp[5])~=0 then
					 EventName=Warp[6]
				 end
			NLG.SystemMessage(-1,"[匹配] 玩家【"..tName.."."..tLevel.."级】正在招募"..要求等级.."级以上队友前往"..地图名称.."练级要求人数"..现有人数.."/"..人数)
			NLG.SystemMessage(-1,"[匹配] 前置要求："..EventName)
		else
			NLG.SystemMessage(_PlayerIndex,"[系统]魔币不足500无法发出广播")
		end
		return ;
	end
	if tonumber(_Seqno) ==888 and  tonumber(_Data)==2 then----------发出系统广播
			if 匹配人数[CdKey]~=nil and  临时传送记录[CdKey]==nil and #匹配人数[CdKey]>1 then
				for i=1,#匹配人数[CdKey] do		----删除满的1-5号玩家
					NLG.ShowWindowTalked(匹配人数[CdKey][i],_MeIndex, 0, 0,997,确认匹配队友资料(_PlayerIndex).."\n请在输入框发出 2  \n三十秒内没输入取消登录");
					NLG.SystemMessage(匹配人数[CdKey][i],"[练级匹配] 队长已经要求开车，确认请输入 2 ")
					--添加玩家时间点记录		
				end
				PlayerTime[CdKey]=Num(os.time())
				临时传送记录[CdKey]={}
			else
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n只有队长才能开启启动公告！！队伍不得小于2人");
			end
		return
	end
	if tonumber(_Seqno) ==PrtJiLu[_PlayerIndex] and  tonumber(_Data)<0 then
		local tselect =50
		if _Select == 16 then ---窗口上一步按钮
			PrtJiLu[_PlayerIndex] = tonumber(PrtJiLu[_PlayerIndex])-1
			if PrtJiLu[_PlayerIndex]==0 then--第一页
				tselect =34
			end
		elseif _Select == 32 then ---窗口下一步按钮
			PrtJiLu[_PlayerIndex] =  tonumber(PrtJiLu[_PlayerIndex])+1
			if 玩家临时记录[_PlayerIndex]==1 then
				local Max_Seqno=math.floor(#开放传送地图表/6)
				if PrtJiLu[_PlayerIndex] >= Max_Seqno or PrtJiLu[_PlayerIndex]*6==#开放传送地图表 then
					tselect =18
				end
			else
				local Max_Seqno=math.floor(#玩家匹配创建表/6)
				if PrtJiLu[_PlayerIndex] >= Max_Seqno or PrtJiLu[_PlayerIndex]*6==#玩家匹配创建表 then
					tselect =18
				end
			end
		end
		if 玩家临时记录[_PlayerIndex]==1 then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],创建队伍窗口(_PlayerIndex,PrtJiLu[_PlayerIndex],开放传送地图表));
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, tselect, PrtJiLu[_PlayerIndex],查看队伍窗口(_PlayerIndex,PrtJiLu[_PlayerIndex]));
		end
		return ;
	end
	------------------------------------------
	if 玩家临时记录[_PlayerIndex]==3 and tonumber(_Seqno) ==899 then
		local ToNumber= PrtJiLu[_PlayerIndex]
		local Warp = Split(开放传送地图表[ToNumber],"|");
		local 地图名称 =Warp[1]
		local 要求等级 = tonumber(Warp[2]);
		if tonumber(_Data)== nil  then
			_Data=要求等级
		end	
		if tonumber(_Data)< 要求等级  or tonumber(_Data) >150 then
			_Data=要求等级
		end	
		玩家临时记录[_PlayerIndex] =tonumber(_Data)
		NLG.ShowWindowTalked(_PlayerIndex,
																				_MeIndex, 1, 3, 898, "\n　　　　　　　　　　◆练级登记◆ " ..
																				"\n" ..
																				"\n当前选择练级点：" ..地图名称..
																				"\n" ..
																				"\n请输入需求玩家数量：" ..
																				"\n(最低为2最大值为5，默认为5)");
		return ;
	end
	if tonumber(_Seqno) ==898 then
		if tonumber(_Data)== nil  then
			_Data=5
		end	
		if tonumber(_Data)< 2  or tonumber(_Data) >5 then
			_Data=5
		end	
		local ToNumber= PrtJiLu[_PlayerIndex]
		local 要求等级= 玩家临时记录[_PlayerIndex]
		local Warp = Split(开放传送地图表[ToNumber],"|");
		local 地图名称 =Warp[1]
		local 传送收费 = tonumber(Warp[3]);
		local EventName="无 "
		if  tonumber(Warp[5])~=0 then
			 EventName=Warp[6]
		 end
		if 判断条件登记条件(_PlayerIndex,玩家临时记录[_PlayerIndex],ToNumber) == 0 then
     Char.AddGold(_PlayerIndex,-传送收费); 
		--local money = Char.GetData(_PlayerIndex,%对象_金币%);
			--Char.SetData(_PlayerIndex,%对象_金币%,money-传送收费);
			--NLG.UpChar(player);	
				---包含格式{地点,等级,人数,{玩家，玩家..}}
				匹配人数[CdKey]={_PlayerIndex}
				玩家匹配创建表[CdKey]={ToNumber,玩家临时记录[_PlayerIndex],tonumber(_Data)}
				--table.insert(玩家匹配创建表, {ToNumber,玩家临时记录[_PlayerIndex],tonumber(_Data),{_PlayerIndex}})
				玩家已登记地点[_PlayerIndex]=CdKey
				NLG.SystemMessage(-1,"[匹配练级提示] 玩家【"..tName.."."..tLevel.."级】正在招募"..要求等级.."级以上队友前往"..地图名称.."练级，前置要求："..EventName)
		end
		return ;
	end
	if _Seqno ~=999 and _Seqno < 100 and tonumber(_Data)>0 then --创建匹配练级
		if 玩家已登记地点[_PlayerIndex]~= nil then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n您当前已经记录过登记点，如需重新登记请先取消登记点！！");
			return
		end	
		if 玩家临时记录[_PlayerIndex]==1 then
			local ToNumber=PrtJiLu[_PlayerIndex]*6+tonumber(_Data)
			local Warp = Split(开放传送地图表[ToNumber],"|");
			local 地图名称 =Warp[1]
			local 要求等级 = tonumber(Warp[2]);
			local 传送收费 = tonumber(Warp[3]);
			local Map = Split(Warp[4],",");
			local MapID =Map[2]
			local MapX =Map[3]
			local MapY =Map[4]
			local Event =tonumber(Warp[5])
			local EventName=Warp[6]
			NLG.ShowWindowTalked(_PlayerIndex,
																				  _MeIndex, 1, 3, 899, "\n　　　　　　　　　　◆练级登记◆ " ..
																				"\n" ..
																				"\n目前练级点：" ..地图名称..
																				"\n" ..
																				"\n请输入需求等级：" ..
																				"\n(最低为"..要求等级.."最大值为150)");
			玩家临时记录[_PlayerIndex]=3
			 PrtJiLu[_PlayerIndex]=tonumber(ToNumber)
			return
		end	
		if 玩家临时记录[_PlayerIndex]==2 then
			if 玩家已登记地点[_PlayerIndex]~=nil then
				NLG.SystemMessage(_PlayerIndex,"[系统]您当前已经登记过服务器匹配表")
				return ;
			end
			local ToNumber=新玩家匹配列表[_PlayerIndex][PrtJiLu[_PlayerIndex]*6+tonumber(_Data)]
			local 登记地点=ToNumber[2][1]
			local Warp = Split(开放传送地图表[登记地点],"|");
			local 地图名称 =Warp[1]
			local 要求等级 = tonumber(Warp[2]);
			local 传送收费 = tonumber(Warp[3]);
			local Level=ToNumber[2][2]
			local 数量=ToNumber[2][3]
			local 队长CdKey=ToNumber[1]
			if 判断条件登记条件(_PlayerIndex,Level,登记地点) == 0 then
				if 临时传送记录[队长CdKey]~=nil then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n 该练级点目前正在传送中请稍候！！");
					return
				end
				if 数量 ==#匹配人数[队长CdKey] then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n 该练级点目前正在传送中请稍候！！");
					return
				end
				玩家已登记地点[_PlayerIndex]=队长CdKey
				Char.AddGold(_PlayerIndex,-传送收费); 
--		local money = Char.GetData(_PlayerIndex,%对象_金币%);
--			Char.SetData(_PlayerIndex,%对象_金币%,money-传送收费);
--			NLG.UpChar(player);	
				---包含格式{地点,等级,人数,{玩家，玩家..}}
				table.insert(匹配人数[队长CdKey], _PlayerIndex)
			end
			if 数量 ==#匹配人数[队长CdKey] then
				for i=1,#匹配人数[队长CdKey] do		----删除满的1-5号玩家
					NLG.ShowWindowTalked(匹配人数[队长CdKey][i],_MeIndex, 0, 0,997,确认匹配队友资料(_PlayerIndex).."\n请在输入框发出 2  \n三十秒内没输入取消登录");
					NLG.SystemMessage(匹配人数[队长CdKey][i],"[匹配] 累积已满"..数量 .."个玩家【"..tName.."."..tLevel.."级】已经登记"..要求等级.."级以上队友前往"..地图名称.."练级，确认请输入 2 ")
					--添加玩家时间点记录		
				end
				PlayerTime[队长CdKey]=Num(os.time())
				临时传送记录[队长CdKey]={}
			else
				for i=1,#匹配人数[队长CdKey] do
					NLG.SystemMessage(匹配人数[队长CdKey][i],"[匹配] 玩家【"..tName.."."..tLevel.."级】已经登记您登记点，目前组员"..#匹配人数[队长CdKey])
				end
			end
		end
	end
end
function 判断条件登记条件(_PlayerIndex,Level,ToNumber)
		local _MeIndex=IntNpc["练级匹配NPC"]
		local Warp = Split(开放传送地图表[ToNumber],"|");
		local 地图名称 =Warp[1]
		local 要求等级 =Level
		local 传送收费 = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Event =tonumber(Warp[5])
		local EventName=Warp[6]
		local tName= Char.GetData(_PlayerIndex,%对象_原名%)
		local tLevel= Char.GetData(_PlayerIndex,%对象_等级%)
		if  Event~=0 then 
			if Event> 0 then
				if Char.NowEvent(_PlayerIndex,Event) ~= 1 then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n您无法使用练级点，条件是"..EventName.."！！");
					--NLG.SystemMessage(_PlayerIndex,"[系统] 您无开启"..地图名称.."传送无法,直接传送。");
					return -1
				end	
			else
				if Char.ItemNum(_PlayerIndex,Event*-1) < 1 then
					NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n您无法使用练级点，条件是拥有道具："..EventName.."！！");
					--NLG.SystemMessage(_PlayerIndex,"[系统] 您无开启"..地图名称.."传送无法,直接传送。");
					return -1
				end
			end	
		end
		if (Char.GetData(_PlayerIndex,%对象_金币%)<传送收费) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n  你身上的魔币不够，收费"..传送收费.."G！！");
			--NLG.SystemMessage(_PlayerIndex,"[系统] 你的魔币不够，无法使用此练级地点,传送收费"..传送收费)
			return -1
		elseif (Char.GetData(_PlayerIndex,%对象_等级%)<Level) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 2, 0,"\n\n\n\n 你的等级不够，无法使用此练级地点，传送需要"..要求等级.."级！！");
			--NLG.SystemMessage(_PlayerIndex,"[系统] 你的等级不够，无法使用此练级地点，传送需要"..要求等级.."级")
			return -1
		end
		return 0
end
function 创建队伍窗口(_PlayerIndex,_Seqno,Tabtpy)
		local Max_Seqno=getIntPart(#Tabtpy/6) --现最大窗口
		local Num=6
		if _Seqno == Max_Seqno then
			Num=#Tabtpy - Max_Seqno*6
		end

		local buf = "3\n　　　　　　◆请选择练级地点◆" ..
		"\n"..string.format("%12.12s","地点") .. string.format("%8.8s","等级") .. string.format("%8.8s","收费")..string.format("%8.8s","要求").."\n"..
		"-------------------------------------------\n"
		for i = _Seqno*6+1,_Seqno*6+Num do
			local Warp = Split(Tabtpy[i],"|");
			local 地图名称 =Warp[1]
			local 要求等级 = tonumber(Warp[2]);
			local 传送收费 = tonumber(Warp[3]);
			local 传送要求 = Warp[6] or "无"
			local 间隔="%8.8s"
			if 传送要求 ~= "无" then
				间隔="%15.15s"
			end
			local Map = Split(Warp[4],",");
			local MapID =Map[2]
			local MapX =Map[3]
			local MapY =Map[4]
			buf = buf .. string.format("%12.12s",地图名称) .. string.format("%8.8s",要求等级) .. string.format("%8.8s",传送收费)..string.format(间隔,传送要求).."\n"
		end
	return buf
end
function 查看队伍窗口(_PlayerIndex,_Seqno)
		--包含格式{地点,等级,人数,{玩家，玩家..}}
		local Max_Seqno=getIntPart(#新玩家匹配列表[_PlayerIndex]/6) --现最大窗口
		local Num=6
		if _Seqno == Max_Seqno then
			Num=#新玩家匹配列表[_PlayerIndex]- Max_Seqno*6
		end
		local buf = "3\n　　　　　◆请选择加入练级地点◆" ..
		"\n".. string.format("%8.8s","队长名字")..string.format("%12.12s","地点") .. string.format("%8.8s","等级") .. string.format("%8.8s","收费")..string.format("%8.8s","人数").."\n"..
		"-------------------------------------------\n"
		for i = _Seqno*6+1,_Seqno*6+Num do
			local 地点=新玩家匹配列表[_PlayerIndex][i][2][1]
			local Warp = Split(开放传送地图表[地点],"|");
			local 地图名称 =Warp[1]
			local 要求等级 = tonumber(新玩家匹配列表[_PlayerIndex][i][2][2]);
			local 传送收费 = tonumber(Warp[3]);
			local 登记人数= 0
			if 匹配人数[新玩家匹配列表[_PlayerIndex][i][1]]~=nil then
				登记人数 = #匹配人数[新玩家匹配列表[_PlayerIndex][i][1]]
			end
			if 新玩家匹配列表[_PlayerIndex]~=nil then	
				if Players[新玩家匹配列表[_PlayerIndex][i][1]]~=nil then
				local 队长名字=Char.GetData(Players[新玩家匹配列表[_PlayerIndex][i][1]].Index,%对象_原名%)
				local 人数=登记人数.."/"..tonumber(新玩家匹配列表[_PlayerIndex][i][2][3])
				buf = buf .. string.format("%8.8s",队长名字)..string.format("%12.12s",地图名称) .. string.format("%8.8s",要求等级) .. string.format("%8.8s",传送收费)..string.format("%8.8s",人数).."\n"
				end
			end
		end
	return buf
end

Delegate.RegDelTalkEvent("练级匹配随身窗");
function 练级匹配随身窗( _PlayerIndex, _msg, _color, _range, _size)
	local Name = Char.GetData(_PlayerIndex,%对象_原名%)	
--	TalkMsg = string.sub(_msg,3)
--	TalkMsg = string.gsub(TalkMsg,"]","")
	if  _msg=="/匹配练级" or _msg=="/7" then	
	NLG.ShowWindowTalked(_PlayerIndex,IntNpc["练级匹配NPC"], 2, 2, 999,
			"5\n　　　　　　　　　◆快速匹配练级◆" ..
			"\n" ..
			"\n欢迎使用[匹配练级]系统，系统说明如下：" ..
			"\n1、玩家可以选择练级地点，报名总人数" ..
			"\n2、人数凑齐后会发起通知" ..
			"\n　　　　　　　   『创建队列』" ..
			"\n　　　　　　　   『加入队列』" ..
			"\n　　　　　　　   『查询队友』" ..
			"\n　　　　　　　   『取消登记』" ..
			"\n");
	end
	if  string.sub(_msg,3)=="2" then	
		local 队长CdKey=玩家已登记地点[_PlayerIndex]
		if PlayerTime[队长CdKey]~=nil then
			table.insert(临时传送记录[队长CdKey],_PlayerIndex)
		--等待其他玩家确认
			local 玩家记录=玩家匹配创建表[队长CdKey]
			local 传送地点=玩家记录[1]
			local 人数上限=玩家记录[3]
			if #临时传送记录[队长CdKey] ==人数上限 or #临时传送记录[队长CdKey] == #匹配人数[队长CdKey] then
				for i=1,#匹配人数[队长CdKey] do
					TWarpPlayer(匹配人数[队长CdKey][i])

					NLG.SystemMessage(匹配人数[队长CdKey][i],"[系统]已传送至记录练级地点。")
				end
				
				PlayerTime[队长CdKey]=nil
				临时传送记录[队长CdKey]=nil
				玩家匹配创建表[队长CdKey]=nil
				匹配人数[队长CdKey]=nil
			else
				NLG.SystemMessage(_PlayerIndex,"[系统]您已确认,等待其他玩家确认")
			end
		end
	end
	if  TalkMsg =="/清理内存" then
		PrtJiLu = {}		--窗口用临时指针
		匹配人数= {}
		玩家临时记录 =  {}			--窗口用临时指针
		玩家匹配创建表 = {}		--记录匹配列表，包含格式{地点,等级,人数,{玩家，玩家..}}
		PlayerTime ={}					----玩家进入准备状态 = 0是答题准备 >0是等待状态
		WarpPlayerNum=WarpPlayerNum or {}				--队伍人数记录{地点=数量} >=5则开始
		新玩家匹配列表= {}
		临时传送记录={}
	end
end
function 确认匹配队友资料(_PlayerIndex)
		local  CdKey=玩家已登记地点[_PlayerIndex]
		local 玩家记录=玩家匹配创建表[CdKey]
		---包含格式{地点,等级,人数}
		local 目前匹配人数=匹配人数[CdKey]
		local ToNumber=玩家记录[1]
		local Warp = Split(开放传送地图表[ToNumber],"|");
		local WName =Warp[1]
		local 要求等级 = tonumber(Warp[2]);
		local 传送收费 = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Msg =" 　　　　　◆快速匹配练级◆" ..
		"\\n当前登记练级点是：【"..WName.."】\\n要求人数是："..玩家记录[3]..
		"\\n".. string.format("%10.10s","名字") .. string.format("%15.15s","职业")..string.format("%8.8s","等级").."\\n"
		for i=1,#目前匹配人数 do	
			local tName= Char.GetData(目前匹配人数[i],%对象_原名%)
			local tJob=GetJobName(Char.GetData(目前匹配人数[i],%对象_职类ID%))
			local tLevel= Char.GetData(目前匹配人数[i],%对象_等级%)
			Msg=Msg..string.format("%10.10s",tName) .. string.format("%15.15s",tJob)..string.format("%8.8s",tLevel).."\\n"
		end
	return Msg
end
function 获取匹配队友资料(_PlayerIndex)
		local  CdKey=玩家已登记地点[_PlayerIndex]
		local 玩家记录=玩家匹配创建表[CdKey]
		---包含格式{地点,等级,人数}
		local 目前匹配人数=匹配人数[CdKey]
		local ToNumber=玩家记录[1]
		local Warp = Split(开放传送地图表[ToNumber],"|");
		local WName =Warp[1]
		local 要求等级 = tonumber(Warp[2]);
		local 传送收费 = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
		local Num=3+tonumber(#目前匹配人数)
		local Msg =Num.."\\n　　　　　　　　◆快速匹配练级◆" ..
		"\\n当前登记练级点是["..WName.."] 要求["..玩家记录[3].."]人"..
		"\\n".. string.format("%14.14s","名字") .. string.format("%15.15s","职业")..string.format("%8.8s","等级").."\\n"
		for i=1,#目前匹配人数 do	
			local tName= Char.GetData(目前匹配人数[i],%对象_原名%)
			local tJob=GetJobName(Char.GetData(目前匹配人数[i],%对象_职类ID%))
			local tLevel= Char.GetData(目前匹配人数[i],%对象_等级%)
			Msg=Msg..string.format("%14.14s",tName) .. string.format("%15.15s",tJob)..string.format("%8.8s",tLevel).."\\n"
		end
		Msg=Msg.."重新发出广播(500魔币/次)".."\\n强行开车通知队友开车"
	return Msg
end

function Warp_LoopEvent(_MeIndex) ----循环事件
	for k,v in pairs(PlayerTime) do
		if Num(os.time())-v>=30 then 
			local 队长CdKey=k
			local 玩家记录=玩家匹配创建表[队长CdKey]
			local 人数上限=玩家记录[3]
			local 目前匹配人数=#匹配人数[队长CdKey]
			local 传送地点=玩家记录[1]
			for i=1,#匹配人数[队长CdKey] do
				local 判断记录=0
				for b=1,#临时传送记录[队长CdKey] do
					if 玩家已登记地点[匹配人数[队长CdKey][i]]~= nil then
						if 匹配人数[队长CdKey][i]==临时传送记录[队长CdKey][b] then
							NLG.SystemMessage(匹配人数[队长CdKey][i],"[系统]你的队友操作超时，队伍需要重新组成，请等待其他玩家报名。")
							判断记录=1
							break
						end
					end
				end
				if 判断记录==0 then
					if 玩家已登记地点[匹配人数[队长CdKey][i]]~= nil then
						NLG.SystemMessage(匹配人数[队长CdKey][i],"[系统]你操作超时，视为放弃匹配任务，队伍需要重新组成,您需要重新登记。")
						DelWarpPlayer(匹配人数[队长CdKey][i])
					end
				end
			end
			临时传送记录[队长CdKey]=nil
			PlayerTime[队长CdKey]=nil
		end
	end
end

Delegate.RegDelLogoutEvent("WarpOutEvent"); --登出离线事件
function WarpOutEvent(_PlayerIndex)
	if 玩家已登记地点[_PlayerIndex]~= nil then
		DelWarpPlayer(_PlayerIndex)
	end
end
function DelWarpPlayer(_PlayerIndex)---清理玩家登陆信息
	local 队长CdKey=玩家已登记地点[_PlayerIndex]
	玩家已登记地点[_PlayerIndex]=nil
	local CdKey = Char.GetData(_PlayerIndex,2002)
	local 名字 = Char.GetData(_PlayerIndex,%对象_原名%)
	local 地点=玩家匹配创建表[队长CdKey][1]
	local Warp = Split(开放传送地图表[地点],"|");
	local 传送收费 = tonumber(Warp[3]);
	Char.AddGold(_PlayerIndex,传送收费*0.8); 
	if CdKey~=队长CdKey then
		local 玩家记录=玩家匹配创建表[队长CdKey]
		---包含格式{地点,等级,人数}
		for k,v in pairs(匹配人数[队长CdKey]) do
			NLG.SystemMessage(v,"[系统]"..名字.."取消登记，离开队伍")
			if v==_PlayerIndex then
				table.remove(匹配人数[队长CdKey],k)
			end
		end
	else
		if #匹配人数[CdKey] ==1 then
			匹配人数[CdKey] =nil
			玩家匹配创建表[CdKey]=nil
			NLG.SystemMessage(_PlayerIndex,"[系统]取消登记成功")
			return ;
		end
		local 新纪录表={}
		for k,v in pairs(匹配人数[队长CdKey]) do
			if v~=_PlayerIndex then
				table.insert(新纪录表,v)
			end
		end
		local NewCdKey=Char.GetData(新纪录表[1],2002	)
		NLG.SystemMessage(新纪录表[1],"[系统]你已经获得队长身份")
		匹配人数[NewCdKey]=新纪录表
		玩家匹配创建表[NewCdKey]={玩家匹配创建表[CdKey][1],玩家匹配创建表[CdKey][2],玩家匹配创建表[CdKey][3]}
		玩家匹配创建表[CdKey]=nil
		for k,v in pairs(玩家已登记地点) do
			if v==CdKey then
				玩家已登记地点[k]=NewCdKey
			end
		end
		NLG.SystemMessage(_PlayerIndex,"[系统]已经取消登录信息并且队长转移他人")
	end		
end
function CWarpPlayer(_PlayerIndex)---清理练级点，返回值是传送费用
	local ret =0
	if 玩家已登记地点[_PlayerIndex]~=nil then
		DelWarpPlayer(_PlayerIndex)
		NLG.SystemMessage(_PlayerIndex,"[系统]本人练级登记已清除，传送费用返还")
	else
		NLG.SystemMessage(_PlayerIndex,"[系统]本人练级登记清理失败")
	end
	return ret
end
function TWarpPlayer(_PlayerIndex)---清理练级点，传送
		local 队长CdKey=玩家已登记地点[_PlayerIndex]
		local CdKey = Char.GetData(_PlayerIndex,2002	)
		local 名字 = Char.GetData(_PlayerIndex,%对象_原名%)
		local 地点=玩家匹配创建表[队长CdKey][1]
		local Warp = Split(开放传送地图表[地点],"|");
		local WName =Warp[1]
		local 要求等级 = tonumber(Warp[2]);
		local 传送收费 = tonumber(Warp[3]);
		local Map = Split(Warp[4],",");
		local MapID =Map[2]
		local MapX =Map[3]
		local MapY =Map[4]
	----------------------------传送并且消除玩家记录
		NLG.DischargeParty(_PlayerIndex)
		NLG.Warp(_PlayerIndex,0,MapID,MapX,MapY);
		if CdKey~=队长CdKey then
			Char.JoinParty(_PlayerIndex,Players[队长CdKey].Index)
		end
		玩家已登记地点[_PlayerIndex]=nil
	return
end

function GetJobName(_TypeNo)
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
	if _TypeNo==0 then _TypeNo=1 end
	if JobTypeName[_TypeNo] == nil then
		JobTypeName[_TypeNo] = "未知职业"
	end
	return JobTypeName[_TypeNo]
end



