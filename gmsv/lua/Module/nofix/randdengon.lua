Delegate.RegInit("rd_Init");

local tbl_rd_maps = {};



tbl_rd_user_setting = {};


function setuser(player)
	
	
	local tbl_rd_user =
	{
		count = 0;
	};
	
	
	if(tbl_rd_user_setting[Playerkey(player)] == nil)then
		tbl_rd_user.count = 0;
		tbl_rd_user_setting[Playerkey(player)] = tbl_rd_user;
		
	else
		local s = tbl_rd_user_setting[Playerkey(player)];
		tbl_rd_user.count = s.count + 1;
		tbl_rd_user_setting[Playerkey(player)] = tbl_rd_user;
		
		
	end
	
	--NLG.SystemMessage(player,"次数a3:"..tbl_rd_user_setting[Playerkey(player)].count);
end


function getuser(player)
	
	local ret = 0;
	local tbl_rd_user =
	{
		count = 0;
	};
	
	
	if(tbl_rd_user_setting[Playerkey(player)] == nil)then
		tbl_rd_user.count = 0;
		tbl_rd_user_setting[Playerkey(player)] = tbl_rd_user;
		
	else
		local s = tbl_rd_user_setting[Playerkey(player)];
		ret = s.count;
	end

	--NLG.SystemMessage(player,"次数a4:"..tbl_rd_user_setting[Playerkey(player)].count);
	return ret;
end




local tbl_rd_setting =
{
	tdate = os.date("%d",os.time());
};


function new_map(_mapid,_minlv,_maxlv)
	
	local tbl_rd_map_setting =
	{
		mapid = _mapid;
		minlv = _minlv;
		maxlv = _maxlv;
		timeout = 2400;
		this_time = 0;
		ts = 0;
	};
	table.insert(tbl_rd_maps,tbl_rd_map_setting);
	
end


--设置---------------------------------------------------------------
local tbl_interwarpseting =
{
	x = 116;
	y = 123;

};


local tbl_timeoutwarpseting =
{
	mapid = 1000;
	x = 241;
	y = 88;

};



new_map(65011,70,120);
new_map(65012,70,120);
new_map(65013,70,120);
new_map(65014,70,120);
new_map(65015,70,120);
new_map(65016,70,120);
new_map(65017,70,120);
new_map(65018,70,120);
new_map(65019,70,120);
new_map(65020,70,120);


------------------------------------------------------------------


function init_timeoutNpc_Init(index)
	return 1;
end


function inittimeoutNpc()
	if (timeoutNpc == nil) then
		timeoutNpc = NL.CreateNpc("lua/Module/randdengon.lua", "init_timeoutNpc_Init");
		Char.SetData(timeoutNpc,%对象_形象%,231088);
		Char.SetData(timeoutNpc,%对象_原形%,231088);
		Char.SetData(timeoutNpc,%对象_X%,47);
		Char.SetData(timeoutNpc,%对象_Y%,50);
		Char.SetData(timeoutNpc,%对象_地图%,777);
		Char.SetData(timeoutNpc,%对象_方向%,4);
		Char.SetData(timeoutNpc,%对象_原名%,"tiemout");
		NLG.UpChar(timeoutNpc);
		
		--这里是与Npc说话的时候,调用ChangePassMsg函数
		Char.SetLoopEvent("lua/Module/randdengon.lua","timeoutNpcNpcLoopEvent", timeoutNpc,20); 
	end
end


function timeoutNpcNpcLoopEvent(index)
	
	-- 过了指定时间，把玩家传送出去
	for i=1,#tbl_rd_maps do
		local tbl_rd_one = tbl_rd_maps[i];
		
		if(tbl_rd_one.this_time ~= 0)then
			if(os.time() - tbl_rd_one.this_time >= tonumber(tbl_rd_one.timeout - 300) and tbl_rd_one.ts == 0)then
				tbl_rd_one.ts = 1;
				local MapUser = NLG.GetMapPlayer(0,tbl_rd_one.mapid);
					for _,tuser in pairs(MapUser) do
						NLG.SystemMessage(tuser,"还有5分钟就被传送出去了。");
				end						
			end
			
			
			if(os.time() - tbl_rd_one.this_time >= tbl_rd_one.timeout)then
				local MapUser = NLG.GetMapPlayer(0,tbl_rd_one.mapid);
					for _,tuser in pairs(MapUser) do
						--Battle.ExitBattle(tuser);
						Char.Warp(tuser,0,tbl_timeoutwarpseting.mapid,tbl_timeoutwarpseting.x,tbl_timeoutwarpseting.y);
						NLG.SystemMessage(tuser,"您的时间已到，被传送出去了。");
					end			
				tbl_rd_one.this_time = 0;
				tbl_rd_one.ts = 0;
			end
		end
			
	end
	
	-- 过了一天，全部清空
	if (tbl_rd_setting.tdate ~= os.date("%d",os.time())) then 
		
		tbl_rd_setting.tdate = os.date("%d",os.time());
		tbl_rd_user_setting = {};
		
	end
	
	
end

function rb_checkuser(player)
	
	local obj_count = 0;
	local min_lv = Char.GetData(player,%对象_等级%);
	local max_lv = Char.GetData(player,%对象_等级%);
	
	
	--obj_count = getuser(player);
	
	
	for i = 0,4 do
			local tuser = Char.GetPartyMember(player,i);
			
			
			
			if(VaildChar(tuser))then
				local tcount = getuser(tuser);
				if(tcount >= obj_count)then
					obj_count = tcount;
				end
				
				local t_lv = Char.GetData(player,%对象_等级%);
				if(t_lv < min_lv)then
					min_lv = t_lv;
				end
				if(t_lv > max_lv)then
					max_lv = t_lv;
				end
			end
			
			
			
	end
	
	--NLG.SystemMessage(player,"次数a1:"..obj_count);
	
	if(obj_count >= 3)then
		--队伍中有任一玩家已经进入超过3次
		return 1;
		
	end
	
	local bx_map = {}; --备选地图
	
	--开始选地图
	for i=1,#tbl_rd_maps do
		local tbl_rd_one = tbl_rd_maps[i];
		
		if(tbl_rd_one.this_time == 0)then --如果地图没有被占领
			if(min_lv >= tbl_rd_one.minlv and max_lv <= tbl_rd_one.maxlv)then --如果玩家等级符合地图条件
				table.insert(bx_map,tbl_rd_one);

			end
			
		end
		
	end
	
	if(#bx_map <= 0 or bx_map ==nil )then
		return 2;
	end
	
	
	local tmap = NLG.Rand(1,#bx_map);
	bx_map[tmap].this_time =os.time();
	Char.Warp(player,0,bx_map[tmap].mapid,tbl_interwarpseting.x,tbl_interwarpseting.y);
	
	
	for i = 0,4 do
		local tuser = Char.GetPartyMember(player,i);
		if(VaildChar(tuser))then
			setuser(tuser);
			--NLG.SystemMessage(player,"次数a2:"..getuser(player));
		end
	end
	
	
	return 0;
	
	
	
	
end


function rd_Init()
	inittimeoutNpc();
end
	





