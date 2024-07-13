Delegate.RegInit("swjjc_Init");
Delegate.RegDelTalkEvent("swjjc_TalkEvent");


tbl_swjjc_goinfo = {};
tbl_win_user = {};			--当前场次胜利玩家的列表
tbl_swjjc_begin = {};
tbl_swjjc_time ={};


tbl_swjjc_setting =
{
	zt = 0;
	first_round_user_max = 40; 	--第一场次入选名额限制
	this_user_WinFunc = nil;
	WinFunc = nil;				--当前场次所有玩家战斗结束后的回调函数
};

function swjjc_Init()
	inittable_swjjcStartNpc();
end

function inityddltable_swjjcStartNpc_Init(index)
	return 1;
end


function inittable_swjjcStartNpc()
	if (swjjcStartNpc == nil) then
		swjjcStartNpc = NL.CreateNpc("lua/Module/swjjc.lua", "inityddltable_swjjcStartNpc_Init");
		Char.SetData(swjjcStartNpc,%对象_形象%,231088);
		Char.SetData(swjjcStartNpc,%对象_原形%,231088);
		Char.SetData(swjjcStartNpc,%对象_X%,47);
		Char.SetData(swjjcStartNpc,%对象_Y%,49);
		Char.SetData(swjjcStartNpc,%对象_地图%,777);
		Char.SetData(swjjcStartNpc,%对象_方向%,4);
		Char.SetData(swjjcStartNpc,%对象_原名%,"死亡竞技场员");
		NLG.UpChar(swjjcStartNpc);
		
		--这里是与Npc说话的时候,调用ChangePassMsg函数
		Char.SetLoopEvent("lua/Module/swjjc.lua","swjjcStartNpcLoopEvent", swjjcStartNpc,10); 
	end
	 
end


function swjjcStartNpcLoopEvent(index)
	
	if(tbl_swjjc_begin["Loopbegin"] == true)then
		return;
	end
	tbl_swjjc_begin["Loopbegin"] = true;
	if(tbl_swjjc_begin["begin"]  == false)then
		tbl_swjjc_begin["Loopbegin"] = false;
		return;
	end

   
   for i,v in ipairs(tbl_win_user) do
      if(Char.GetData(v,%对象_战斗状态%) ~= 0)then
		tbl_swjjc_begin["Loopbegin"] = false;
        return;   
      end
   
   end
  
   tbl_swjjc_begin["begin"] = false;
   --local timec = os.time() - tbl_swjjc_time["time"];
   --if(timec <= 10)then
	--	NLG.SystemMessage(-1,"死亡竞技赛下一回合即将开始，剩余 "..tostring(10 - timec).."秒。");
	--	tbl_swjjc_begin["Loopbegin"] = false;
	--	return;
   --end

   def_round_start(tbl_win_user,"wincallbackfunc");
   tbl_swjjc_begin["Loopbegin"] = false;
   return;
end




--test
function swjjc_TalkEvent(player,msg,color,range,size)
	
	
	if(msg=="[bm]") then
		tbl_swjjc_setting.zt = 1;
	end
	if(msg=="[start]") then 
		tbl_swjjc_setting.zt = 2;
		NLG.MapEffect(25290, 4, 0);

		local MapUser = NLG.GetMapPlayer(0,25290);
		
		for i,v in ipairs(MapUser)do
		--	NLG.SystemMessage(-1,Char.GetData(v,%对象_名字%));
		end
		--取消首战，即报名多少人，晋级则为一半名额
		tbl_swjjc_goinfo["round_count"] = 1;
		tbl_swjjc_goinfo["create_battle_count"] = 0;
		tbl_swjjc_goinfo["create_battle_count_bak"] = 0;
		
		setUser_WinFunc("user_WinFunc");
		tbl_swjjc_begin["begin"] = false;
		tbl_swjjc_begin["Loopbegin"] = false;
		--tbl_swjjc_time["time"] = os.time();
		def_round_start(MapUser,"wincallbackfunc");
		
	end
	
	if(msg=="[zt]") then 
		local MapUser = NLG.GetMapPlayer(0,25290);
		for i,v in ipairs(MapUser)do
		--	NLG.SystemMessage(-1,Char.GetData(v,%对象_名字%).." 战斗状态:"..Char.GetData(v,%对象_战斗状态%));
		end
	end
	
	if(msg=="[initnpc]") then 
		inittable_swjjcStartNpc();
	end
end



function wincallbackfunc(winuser)
	
	-- 如果没产生冠军
	
	--if(tonumber(#winuser) == 3)then
	--	NLG.SystemMessage(-1,"死亡竞技赛三强争霸赛即将开始，三强名单:");
	--	for i,v in ipairs(winuser)do
	--		NLG.SystemMessage(-1,Char.GetData(v,%对象_名字%));	
	--	end
	--	NLG.SystemMessage(-1,"=======================================");
	--end
	
	if(tonumber(#winuser) > 1)then
		
		
		for i,v in ipairs(winuser)do
			if(VaildChar(v) == false)then
				table.remove(winuser,i);
			end
		end
		
		
		--飞走所有失败的玩家，可怜呀-----------------------------
		local MapUser = NLG.GetMapPlayer(0,25290);
		warpfailuser(MapUser,winuser,0,1000,93,102);
		-------------------------------------------------------
		--继续轮回咯
		tbl_win_user = {};
		tbl_win_user = winuser;
		tbl_swjjc_begin["begin"] = true;
		tbl_swjjc_begin["Loopbegin"] = false;
		--tbl_swjjc_time["time"] = os.time();
		--def_round_start(winuser,"wincallbackfunc");
		return;
	end
	
	-- 直到n次轮回过后，最终胜利一名玩家
	if(tonumber(#winuser) <= 1)then
		
		--飞走第二名玩家，可怜呀-----------------------------
		local MapUser = NLG.GetMapPlayer(0,25290);
		warpfailuser(MapUser,winuser,0,1000,162,130);
		-----------------------------------------------------
		
		NLG.MapEffect(25290, 4, 2);
		for _,v in pairs(winuser) do
			
			Char.GiveItem(v,520090,1);
			NLG.SystemMessage(-1,"恭喜玩家:"..Char.GetData(v,%对象_名字%).."获得本次死亡竞技赛冠军。");
			Char.Warp(v,0,1000,162,130);
		end
		tbl_swjjc_setting.zt = 0;
	end
end

function user_WinFunc(player,mc)
	NLG.SystemMessage(player,"恭喜您获胜，请耐心等待其他玩家结束战斗。");

end


function setUser_WinFunc(winfuncname)
	tbl_swjjc_setting.this_user_WinFunc = winfuncname;
end


--	函数功能：飞走失败的玩家
function warpfailuser(MapUser,winuser,floor,mapid,x,y)
	
	local failuser = delfailuser(MapUser,winuser);
	for _,tuser in pairs(failuser) do
		Battle.ExitBattle(tuser);
		Char.Warp(tuser,floor,mapid,x,y);
		NLG.SystemMessage(tuser,"您输了，感谢参与！");
	end
	
end


--	函数功能：获取战斗失败的玩家
function delfailuser(MapUser,winuser)
	for _,v in pairs(winuser)do
		for i,w in pairs(MapUser)do
			if(v == w)then
				MapUser[i] = nil;
			end
		end
	end
	
	return MapUser;
end


--	函数功能：打乱玩家列表(未完成)
function tablereset(_table)
	return  _table;
end



--[[ def_round_start
	函数功能： 每一回合的开始，第一回合不限制报名人数，前first_round_user_max名胜利者晋级，后面回合均所有战斗结束后晋级。
	如果有落单者，则直接晋级
	参数1)usertable:表示参与玩家的列表
	    2)funcallback:当函数结束后执行的回调函数，即产生x强之后触发
	    **funtcion callback(
		 参数一:table 参与的玩家
		)
]]
function def_round_start(usertable,callback)
	
	NLG.SystemMessage(-1,"死亡竞技赛 第："..tbl_swjjc_goinfo["round_count"].."场开始。");
	-- 目前战斗场次自加
	tbl_swjjc_goinfo["round_count"] = tbl_swjjc_goinfo["round_count"] + 1;

	-- 打乱玩家阵列
	usertable = tablereset(usertable); 
	-- 设置x强产生后的回调函数
	tbl_swjjc_setting.WinFunc = callback;
	-- 开始为玩家配对战斗
	
	--NLG.SystemMessage(-1,"====参与玩家====");
	--for i,v in ipairs(usertable)do
	--	NLG.SystemMessage(-1,Char.GetData(v,%对象_名字%));	
	--end
	
	--NLG.SystemMessage(-1,"================");
	
	
	local tbl_UpIndex = {};
	local tbl_DownIndex = {};
	-- 分出上下组
	for i = 1,tonumber(#usertable),2 do
	--	NLG.SystemMessage(-1,"i:"..i);
		table.insert(tbl_UpIndex,usertable[i]);
		if(i + 1 > tonumber(#usertable))then
			table.insert(tbl_DownIndex,-1);
		else
			table.insert(tbl_DownIndex,usertable[i + 1]);
		end
	--	NLG.SystemMessage(-1,"xxxxx=======");
	--	NLG.SystemMessage(-1,Char.GetData(usertable[i],%对象_名字%));
	--	NLG.SystemMessage(-1,Char.GetData(usertable[i+1],%对象_名字%));
	end
	-- 清空胜利玩家列表	
	tbl_win_user = {};
	
	--开始战斗
	for j = 1,tonumber(#tbl_UpIndex) + 1,1 do
		--如果双方都掉线，则什么都不做，直接跳过
		if(VaildChar(tbl_UpIndex[j]) == false and VaildChar(tbl_DownIndex[j]) == false)then
		   --do nothing		
		--如果上方落单队员产生，则直接给予下方队员晋级
		elseif(VaildChar(tbl_UpIndex[j]) == false)then
			table.insert(tbl_win_user,tbl_DownIndex[j]);
			NLG.SystemMessage(tbl_DownIndex[j],"无人和你配对，你将直接晋级，请等待别人战斗结束。");
		--如果下方落单队员产生，则直接给予上方队员晋级
		elseif(VaildChar(tbl_DownIndex[j]) == false)then
			table.insert(tbl_win_user,tbl_UpIndex[j]);
			NLG.SystemMessage(tbl_UpIndex[j],"无人和你配对，你将直接晋级，请等待别人战斗结束。");
		--开战
		else
			--NLG.SystemMessage(-1,"pk:"..Char.GetData(tbl_UpIndex[j],%对象_名字%).." VS "..Char.GetData(tbl_DownIndex[j],%对象_名字%));
		
		
			local battleindex = Battle.PVP(tbl_UpIndex[j], tbl_DownIndex[j]);
			
		
			-- 当前场次创建战斗总计次，用于判断是否已经达到结束标准
			tbl_swjjc_goinfo["create_battle_count"] = tbl_swjjc_goinfo["create_battle_count"] + 1;
			Battle.SetWinEvent("lua/Module/swjjccback.lua", "def_round_wincallback", battleindex);


		end
		
		
	end
	tbl_swjjc_goinfo["create_battle_count_bak"] = tbl_swjjc_goinfo["create_battle_count"];
end




