KICKBOT_WINDOW_SEQUENCE_MAIN = 10000;
--验证间隔，毫秒
kickbot_interval = 1*1000*60*60; 
--验证地图，逗号隔开
kickbot_maplist = {33000,402,300,24039,24040,24041,24042,24043,24044,24045,24046,24047,100};
--动态地图
kickbot_dmaplist_l = 1;
kickbot_dmaplist_u = 2;
--忽略职业
kickbot_class = {451,452,453,454,461,462,463,464,471,472,473,474};

kickbot_codelist = {};
kickbot_flaglist = {};
kickbot_timelist = {};
function kickbot_initialize( _index_me)

	return true;
end

function kickbot_callback_loop( _index_me)
	local i;
	
	for i = 1, table.getn(kickbot_maplist) do
		local tbl_p = NLG.GetMapPlayer(0,kickbot_maplist[i]);
		if(type(tbl_p) == "table")then
		--	print("\nyes!table!\n"..table.getn(tbl_p).."\nbut"..NLG.GetMapPlayerNum(0,1000).."\n");
			if(tbl_p == nil)then
				print("table but nil!\n")
			end
			local j;
			for j = 1, table.getn(tbl_p) do
				local skipflag = false;
				local class = Char.GetData(tbl_p[j], %对象_职业%);
				local k;
				for k = 1, table.getn(kickbot_class) do
					if (class == kickbot_class[k]) then
						skipflag = true;
					end
				end
				--pk中不出现验证码
				if(VaildChar(tbl_p[j]))then
					local battleindexA = Char.GetBattleIndex(tbl_p[j]);
					if(Battle.GetType(battleindexA) == %战斗_PVP%)then
						skipflag = true;
					end
				end
				if( skipflag == false)then
					if(kickbot_codelist[tbl_p[j]]~=nil)then
						if(os.time() - kickbot_timelist[tbl_p[j]] > kickbot_interval/3/1000 and kickbot_flaglist[tbl_p[j]] == 0)then
						--NLG.TalkToCli(tbl_p[j],_index_me,"drop and " .. kickbot_flaglist[tbl_p[j]]);
							NLG.DropPlayer(tbl_p[j]);
						end
					end
					local code = math.ceil(math.random(0,9)) + math.ceil(math.random(0,9))*10 + math.ceil(math.random(0,9))*100 + math.ceil(math.random(0,9))*1000;
					local message = "防挂机验证启动，请输入以下数字："..code;
					local message_2 = "[玩家公告]防挂机验证启动，请输入以下数字："..code;
				--	NLG.ShowWindowTalked( tbl_p[j], _index_me, %窗口_输入框%, %按钮_确定%, 
				--		KICKBOT_WINDOW_SEQUENCE_MAIN, message);
					NLG.SystemMessage( tbl_p[j], message);
					NLG.SystemMessage( tbl_p[j], message_2);
					kickbot_codelist[tbl_p[j]] = code;
					kickbot_flaglist[tbl_p[j]] = 0;
					kickbot_timelist[tbl_p[j]] = os.time();
				--	print("\ncode"..code.."\n");
				end
			end
		end
	end

	for i = kickbot_dmaplist_l, kickbot_dmaplist_u do
		local tbl_p = NLG.GetMapPlayer(1,kickbot_dmaplist_l + i - 1);
		if(type(tbl_p) == "table")then
		--	print("\nyes!table!\n"..table.getn(tbl_p).."\nbut"..NLG.GetMapPlayerNum(0,1000).."\n");
			if(tbl_p == nil)then
				print("table but nil!\n")
			end
			local j;
			for j = 1, table.getn(tbl_p) do
				local skipflag = false;
				local class = Char.GetData(tbl_p[j], %对象_职业%);
				local k;
				for k = 1, table.getn(kickbot_class) do
					if (class == kickbot_class[k]) then
						skipflag = true;
					end
				end
				--pk中不出现验证码
				if(VaildChar(tbl_p[j]))then
					local battleindexA = Char.GetBattleIndex(tbl_p[j]);
					if(Battle.GetType(battleindexA) == %战斗_PVP%)then
						skipflag = true;
					end
				end
				if( skipflag == false)then
					if(kickbot_codelist[tbl_p[j]]~=nil)then
						if(os.time() - kickbot_timelist[tbl_p[j]] > kickbot_interval/3/1000 and kickbot_flaglist[tbl_p[j]] == 0)then
						--NLG.TalkToCli(tbl_p[j],_index_me,"drop and " .. kickbot_flaglist[tbl_p[j]]);
							NLG.DropPlayer(tbl_p[j]);
						end
					end
					local code = math.ceil(math.random(0,9)) + math.ceil(math.random(0,9))*10 + math.ceil(math.random(0,9))*100 + math.ceil(math.random(0,9))*1000;
					local message = "防挂机验证启动，请输入以下数字："..code;
					local message_2 = "[玩家公告]防挂机验证启动，请输入以下数字："..code;
				--	NLG.ShowWindowTalked( tbl_p[j], _index_me, %窗口_输入框%, %按钮_确定%, 
				--		KICKBOT_WINDOW_SEQUENCE_MAIN, message, math.random(0,9), %字体_大%);
					NLG.SystemMessage( tbl_p[j], message);
					NLG.SystemMessage( tbl_p[j], message_2);
					kickbot_codelist[tbl_p[j]] = code;
					kickbot_flaglist[tbl_p[j]] = 0;
					kickbot_timelist[tbl_p[j]] = os.time();
				--	print("\ncode"..code.."\n");
				end
			end
		end
	end
end

function kickbot_callback_talk(_index,_msg)
	if(kickbot_flaglist[_index] == nil or kickbot_flaglist[_index] ~= 0 or kickbot_codelist[_index] == nil or kickbot_timelist[_index] == nil or kickbot_flaglist[_index] == -1)then
		return;
	end
	if(kickbot_flaglist[_index] == 0)then
		if( _msg == tostring(kickbot_codelist[_index]) )then
			NLG.TalkToCli(_index,-1,"验证回答成功。", math.random(0,9), %字体_大%);
			NLG.SystemMessage(_index,"[玩家公告]验证回答成功。");
			kickbot_flaglist[_index] = 1;
		else
			if(os.time() - kickbot_timelist[_index] <= kickbot_interval/3/1000)then
				--NLG.TalkToCli(_index,0,"not drop");
				return;
			else
				NLG.DropPlayer(_index);
				--NLG.TalkToCli(_index,0,"drop");
				kickbot_flaglist[_index] = -1;
			end
		end
	end
	
end

function kickbot_callback_window( _index_me, _index_tome, _sequence, _select, _data)
--	NLG.TalkToCli( _index_tome, _index_me, "kickbot_codelist[_index_tome]:"..kickbot_codelist[_index_tome].." data:".._data.." _select:".._select);
	if( tostring(kickbot_codelist[_index_tome]) == _data)then
	--	NLG.TalkToCli(_index_tome,_index_me,"okok");
		kickbot_codelist[_index_tome] = nil;
	else
	--	NLG.TalkToCli(_index_tome,_index_me,"drop");
		NLG.DropPlayer(_index_tome);
	end
end

Delegate.RegInit("kickbot_Init");
Delegate.RegDelTalkEvent("kickbot_TalkEvent");

function kickbot_create() --防挂机验证
	if(kickbot_index == nil)then
		kickbot_index = NL.CreateNpc("lua/Module/kickbot.lua","kickbot_initialize")
		Char.SetData(kickbot_index,%对象_形象%,14588);
		Char.SetData(kickbot_index,%对象_原形%,14588);
		Char.SetData(kickbot_index,%对象_X%,18);
		Char.SetData(kickbot_index,%对象_Y%,63);
		Char.SetData(kickbot_index,%对象_地图%,777);
		Char.SetData(kickbot_index,%对象_方向%,6);
		Char.SetData(kickbot_index,%对象_名字%,"kickbot");
		NLG.UpChar(kickbot_index);
		Char.SetWindowTalkedEvent("lua/Module/kickbot.lua", "kickbot_callback_window", kickbot_index);
		Char.SetTalkedEvent("lua/Module/kickbot.lua", "kickbot_callback_talk", kickbot_index);
		Char.SetLoopEvent("lua/Module/kickbot.lua", "kickbot_callback_loop", kickbot_index, kickbot_interval);

	end
end

function kickbot_TalkEvent(player,msg,color,range,size)
	kickbot_callback_talk(player,msg);
	return 0;
end

function kickbot_Init()
	kickbot_create();
end

