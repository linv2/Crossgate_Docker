--日常任务    任务次数  物品奖励待修改   2017.3.24  长果老


Delegate.RegInit("routine_Init");
Delegate.RegDelTalkEvent("routine_talk");
	local tbl_routineinfo =
	{
		header = "0|0|0";
		target = {};
		temporary = {};
	}

function routine_talk(player,msg,color,range,size)
	if(msg == "jd") then
		routine_callback_command(player,msg,color,range,size);
	end
end

Delegate.RegDelBattleStartEvent("routine_BattleStart_Event");
Delegate.RegDelBattleOverEvent("routine_BattleOver_Event");

function routine_new_tbl_Event(_Player)
	local _tbl_routineinfo =
	{
		header = "0|0|0";
		target = {};
		temporary = {};
	}
	
	return _tbl_routineinfo;
	
end
function routine_BattleStart_Event(battleindex)
	routine_prebattle(battleindex);
end

function routine_BattleOver_Event(battleindex)
	for PwhI=0,4 do
		local PIndex = Battle.GetPlayer(battleindex,PwhI);
		
		if(VaildChar(PIndex)==true) then
			if(Char.GetData(PIndex,%对象_血%) ~= 0) then
				routine_postbattle(battleindex,PIndex);
			end
		end
	end
end

ROUTINE_TYPE = {"捕捉","猎杀","搜寻"};
routine_list = {};
routine_lvlist = {};

--目标列表这样写
--显示的名字,ID,数量|显示的名字,ID,数量|.......
--不要以|结尾
--可无限续接
--当类型为捕捉的时候，数量无效，即捕捉只能要求抓一只，但仍然要写上去
--当类型为猎杀的时候，ID无效，但仍然要写上随便一个数字

--奖励列表这样写
--金钱|声望|经验|奖励道具名字,ID,数量|......
--不要以|结尾
--道具可有可无，但前面三个一定要有


routine_list[1] = {};
routine_list[1].type = 3;
routine_list[1].target = "绿头盔,18195,1";
routine_list[1].reward = "0|0|0|日常任务积分,72010,1";

routine_list[2] = {};
routine_list[2].type = 3;
routine_list[2].target = "红头盔,18194,1";
routine_list[2].reward = "0|0|0|日常任务积分,72010,1";


routine_list[3] = {};
routine_list[3].type = 3;
routine_list[3].target = "阿尔卡迪亚古钱,18983,1";
routine_list[3].reward = "0|0|0|日常任务积分,72010,1";


routine_list[4] = {};
routine_list[4].type = 1;
routine_list[4].target = "哥布林,801,1";
routine_list[4].reward = "0|0|0|日常任务积分,72010,1";

routine_list[5] = {};
routine_list[5].type = 1;
routine_list[5].target = "树精,401,1";
routine_list[5].reward = "0|0|0|日常任务积分,72010,1";

routine_list[6] = {};
routine_list[6].type = 1;
routine_list[6].target = "黄蜂,314,1";
routine_list[6].reward = "0|0|0|日常任务积分,72010,1";

routine_list[7] = {};
routine_list[7].type = 1;
routine_list[7].target = "螳螂,321,1";
routine_list[7].reward = "0|0|0|日常任务积分,72010,1";

routine_list[8] = {};
routine_list[8].type = 1;
routine_list[8].target = "水龙蜥,722,1";
routine_list[8].reward = "0|0|0|日常任务积分,72010,1";

routine_list[9] = {};
routine_list[9].type = 2;
routine_list[9].target = "水龙蜥,722,1";
routine_list[9].reward = "0|0|0|日常任务积分,72010,1";
--等级限制列表
--ids内填写此等级范围内的任务ID
--分配任务组别的优先级按序号从小到大

routine_lvlist[1] = {};
routine_lvlist[1].max = 160;
routine_lvlist[1].min = 1;
routine_lvlist[1].ids = {1,2,3,4,5,6,7,8,9}


ROUTINE_WINDOW_SEQUENCE_MAIN = 10000;
ROUTINE_WINDOW_SEQUENCE_OFFER = 10001;
ROUTINE_WINDOW_SEQUENCE_CHECK = 10002;
ROUTINE_WINDOW_SEQUENCE_SUBMIT = 10003;
ROUTINE_WINDOW_SEQUENCE_CANCEL = 10004;
ROUTINE_WINDOW_SEQUENCE_ABANDON = 20000;

function getitemnum(_index,_id)
	local count = 0;
	for i = 8, 27 do
		local index = Char.GetItemIndex(_index,i)
		if index ~= -1 and index ~= -2 and index ~= -3 then
			if Item.GetData(index,%道具_序%) == _id then
				count = count + 1;
			end
		end
	end
	return count;
end

function getdata( _flag, _source)
	local a,b;
	a, b = string.find( _source, _flag.."=");
	if( a == nil or b == nil)then
		return nil;
	end
	a = string.find( _source, "|", b);
	local ret = tonumber(string.sub( _source, b+1, a-1));
	if ret == nil then
		ret = 0
	end
	return ret;
end
	
function gendata( _flag, _source, _newdata)
	local data = getdata( _flag, _source);
	local ns;	
	if( data == nil)then
		ns = _source.._flag.."=".._newdata.."|";
	else
		ns = string.gsub( _source, _flag.."="..data.."|", _flag.."=".._newdata.."|",1);
	end
	return ns;
end

function splitdata(szFullString, szSeparator)
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

function genpdata_t(_data)
	local tdata = splitdata(_data,"|");
	local tn = #tdata;
	local pdata = {};
	for i = 1, tn do
		local ttdata = splitdata(tdata[i],",");
		pdata[i] = {ttdata[1],tonumber(ttdata[2]),tonumber(ttdata[3])}
	end
	return pdata;
end

function genpdata_r(_data)
	local rdata = splitdata(_data,"|");
	local rn = #rdata;
	local pdata = {};
	pdata[1] = rdata[1];
	pdata[2] = rdata[2];
	pdata[3] = rdata[3];
	for i = 4, rn do
		local rrdata = splitdata(rdata[i],",");
		pdata[i] = {rrdata[1],tonumber(rrdata[2]),tonumber(rrdata[3])}
	end
	return pdata;
end

function routine_create()
	if(routine_index == nil)then
		routine_index = NL.CreateNpc("lua/Module/routine_too.lua","routine_init")
		Char.SetData(routine_index,%对象_形象%,100975);
		Char.SetData(routine_index,%对象_原形%,100975);
		Char.SetData(routine_index,%对象_X%,247);
		Char.SetData(routine_index,%对象_Y%,86);
		Char.SetData(routine_index,%对象_地图%,1000);
		Char.SetData(routine_index,%对象_方向%,6);
		Char.SetData(routine_index,%对象_名字%,"日常任务");
		NLG.UpChar(routine_index);
		Char.SetTalkedEvent("lua/Module/routine_too.lua", "routine_callback_talk", routine_index);
		Char.SetWindowTalkedEvent("lua/Module/routine_too.lua", "routine_callback_window", routine_index);
	end
end

function routine_Init()
	routine_create();
end

--function routine_initialize(_index_me)
--	return true;
--end

function routine_init(_index)
	return true;
end


function routine_offer( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = Field.Get(_index_tome,"routine_header");
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	local message = "";
	local nowtime = tonumber(os.date("%d",os.time()));
	local lv = Char.GetData(_index_tome, %对象_等级%)
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	if flag == 0 or time ~= nowtime then
		local seed = 0;
		for i = 1, #routine_lvlist do
			if lv <= routine_lvlist[i].max and lv >= routine_lvlist[i].min then
				local ids2 = routine_lvlist[i].ids;
				seed = routine_lvlist[i].ids[math.random(1,#ids2)]
				break;
			end
		end
		if seed == 0 then
			seed = math.random(1,#routine_list);
		end
		local tpdata = genpdata_t(routine_list[seed].target);
		local rpdata = genpdata_r(routine_list[seed].reward);
		local message = "\\n任务已接受"..
				"\\n"..
				"\\n"..
				"\\n任务类型："..ROUTINE_TYPE[routine_list[seed].type]..
				"\\n任务要求：";
		for i = 1, #tpdata do
			message = message .. tpdata[i][1] .. "×" .. tpdata[i][3] .. " ";
		end
		message = message .. "\\n任务奖励： ";
		for i = 4, #rpdata do
			message = message .. rpdata[i][1] .. "×" .. rpdata[i][3] .. " ";
		end
		NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_确定%, ROUTINE_WINDOW_SEQUENCE_OFFER, message);
		local nheader = "1|" .. nowtime .. "|" .. seed;
		tbl_routineinfo[_Player].header = nheader;
		--Field.Set(_index_tome,"routine_header",nheader);
		if routine_list[seed].type == 2 then
			local tpdata = genpdata_t(routine_list[seed].target);
			for i = 1, #tpdata do
				tbl_routineinfo[_Player].target[i] = 0;
				tbl_routineinfo[_Player].temporary[i] = 0;
				--Field.Set(_index_tome,"routine_target_"..i,0)
				--Field.Set(_index_tome,"routine_target_temporary_"..i,0)
			end
		end
	else
		local message = "\\n";
		if flag == 1 then
			message = "\\n今天的日常任务正在进行中，请加油。"
		end
		if flag == 2 then
			message = "\\n今天的日常任务你已经放弃喽，请明天再来。"
		end
		if flag == 3 then
			message = "\\n今天的日常任务你已经完成喽，请明天再来。"
		end
		NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_确定%, ROUTINE_WINDOW_SEQUENCE_OFFER, message);
	end

end


function routine_check( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = tbl_routineinfo[_Player].header;
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 then
		message = "\\n你还没开始今天的日常任务。";
	elseif flag == 1 then
		local tpdata = genpdata_t(routine_list[seed].target);
		local rpdata = genpdata_r(routine_list[seed].reward);

		message = "\\n任务已接受"..
				"\\n"..
				"\\n"..
				"\\n任务类型："..ROUTINE_TYPE[routine_list[seed].type]..
				"\\n任务要求：";
		for i = 1, #tpdata do
			message = message .. tpdata[i][1] .. "×" .. tpdata[i][3] .. " ";
		end
		message = message .. "\\n任务奖励： ";
		for i = 4, #rpdata do
			message = message .. rpdata[i][1] .. "×" .. rpdata[i][3] .. " ";
		end
	elseif flag == 2 then
		message = "\\n你已经放弃今天的日常任务，请明天再来。";
	elseif flag == 3 then
		message = "\\n你已经完成了今天的日常任务，请明天再来。";
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_确定%, ROUTINE_WINDOW_SEQUENCE_CHECK, message);

end

function routine_submit( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = tbl_routineinfo[_Player].header;
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 then
		message = "\\n你还没开始今天的日常任务。";
	elseif flag == 1 then
		local tpdata = genpdata_t(routine_list[seed].target);
		local type = routine_list[seed].type;
		if type == 1 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"身上的道具太多了。")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local id = tpdata[i][2];
				if Char.HavePet(_index_tome,id) == -1 then
					clear = false;
				end
				if clear == false then
					break;
				end
			end
			if clear == false then
				message = "\\n你还没有完成今天的日常任务，请加油。";
			else
				for i = 1, #tpdata do
					local id = tpdata[i][2];
					NLG.SystemMessage(_index_tome,"交出"..tpdata[i][1].."。");
					Char.DelSlotPet(_index_tome,Char.HavePet(_index_tome,id));
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				--Char.AddGold( _index_tome, gold);
				local tgold = Char.GetData(_index_tome,%对象_金币%);
				if(tgold + gold <= 1000000)then
					Char.SetData(_index_tome,%对象_金币%,tgold + gold);
				end
				Char.SetData( _index_tome, %对象_声望%, Char.GetData( _index_tome,%对象_声望%)+fame);
				Char.SetData( _index_tome, %对象_经验%, Char.GetData( _index_tome,%对象_经验%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n获得奖励： ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "×" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--local header = tbl_routineinfo[_Player].header;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		elseif type == 2 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"身上的道具太多了。")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local tcount = tonumber(tbl_routineinfo[_Player].target[i]);
				--local tcount = tonumber(Field.Get(_index_tome,"routine_target_"..i));
				if tcount == nil then
					tcount = 0;
				end
				if tcount < tpdata[i][3] then
					clear = false;
				end
				if clear == false then
					break;
				end
			end

			if clear == false then
				message = "\\n你还没有完成今天的日常任务，请加油。";
			else
				for i = 1, #tpdata do
					tbl_routineinfo[_Player].target[i] = 0;
					tbl_routineinfo[_Player].temporary[i] = 0;
					--Field.Set(_index_tome,"routine_target_"..i,0)
					--Field.Set(_index_tome,"routine_target_temporary_"..i,0)
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				--Char.AddGold( _index_tome, gold);		
				local tgold = Char.GetData(_index_tome,%对象_金币%);
				if(tgold + gold <= 1000000)then
					Char.SetData(_index_tome,%对象_金币%,tgold + gold);
				end
				Char.SetData( _index_tome, %对象_声望%, Char.GetData( _index_tome,%对象_声望%)+fame);
				Char.SetData( _index_tome, %对象_经验%, Char.GetData( _index_tome,%对象_经验%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n获得奖励： ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "×" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		elseif type == 3 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"身上的道具太多了。")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local id = tpdata[i][2];
				local num = tpdata[i][3];
				if num > Char.ItemNum(_index_tome,id) then
					clear = false;
				end
				if clear == false then
					break;
				end
			end
			if clear == false then
				message = "\\n你还没有完成今天的日常任务，请加油。";
			else
				for i = 1, #tpdata do
					local id = tpdata[i][2];
					local num = tpdata[i][3]
					Char.DelItem(_index_tome,id,num);
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				Char.AddGold( _index_tome, gold);
				Char.SetData( _index_tome, %对象_声望%, Char.GetData( _index_tome,%对象_声望%)+fame);
				Char.SetData( _index_tome, %对象_经验%, Char.GetData( _index_tome,%对象_经验%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n获得奖励： ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "×" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		end
	elseif flag == 2 then
		message = "\\n你已经放弃今天的日常任务，请明天再来。";
	elseif flag == 3 then
		message = "\\n你已经完成了今天的日常任务，请明天再来。";
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 
			ROUTINE_WINDOW_SEQUENCE_SUBMIT, message);	
end

function routine_cancel( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = tbl_routineinfo[_Player].header;
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 or flag == 2 or flag == 3 then
		message = "\\n你没有正在进行的日常任务。";
	elseif flag == 1 then
		message = "\\n你确认要放弃今天的日常任务吗?"..
		"\\n一旦放弃,需要等到明天才能再接噢!";
		NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_是否%,ROUTINE_WINDOW_SEQUENCE_ABANDON,message);
--		message = "\\n你今日的日常任务已放弃，需要等明天才能再接喔。";
--		Field.Set(_index_tome,"routine_header","2|"..time.."|0");
--		Field.Set(_index_tome,"routine_header","0|0|0")
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 
			ROUTINE_WINDOW_SEQUENCE_CANCEL, message);
end

function routine_prebattle(_index_battle)
	for pos = 0, 4 do
		local index = Battle.GetPlayer( _index_battle, pos);
		if( VaildChar(index) == true)then
			local _Player = Playerkey(index);
			local header = nil;
			--local header = Field.Get(index,"routine_header");
			--if header == nil then
			if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
				header = tbl_routineinfo[_Player].header;
			end
			if header == nil then
				header = "0|0|0";
			else
				header = tbl_routineinfo[_Player].header;
			end
			local pheader = splitdata(header,"|");
			local flag = tonumber(pheader[1]);
			local seed = tonumber(pheader[3]);
			if flag == 1 and routine_list[seed].type == 2 then
				local tpdata = genpdata_t(routine_list[seed].target);
				for oppos = 10, 19 do
					local opindex = Battle.GetPlayer( _index_battle, oppos);
					if( VaildChar(opindex) == true)then
						for i = 1, #tpdata do
							if( Char.GetData( opindex, %对象_名字%) == tpdata[i][1])then
								if(tonumber(tbl_routineinfo[_Player].target[i]) < tpdata[i][3]) then
								--if( tonumber( Field.Get( index, "routine_target_"..i)) < tpdata[i][3])then
									tbl_routineinfo[_Player].temporary[i] = tbl_routineinfo[_Player].temporary[i] + 1;
									--Field.Set( index, "routine_target_temporary_"..i, tostring( tonumber( Field.Get( index, "routine_target_temporary_"..i))+1));
								end
							end
						end
					end
				end
			end
		end
	end

end

function routine_postbattle( _index_battle, _index_me)
	local _Player = Playerkey(_index_me);
		
	--local header = Field.Get(_index_me,"routine_header")
	--if header == nil then
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end

	if header == nil then
		header = "0|0|0";
	else
		header = tbl_routineinfo[_Player].header;
	end
	local pheader = splitdata(header,"|")
	local flag = tonumber(pheader[1])
	local seed = tonumber(pheader[3])
	if flag == 1 and routine_list[seed].type == 2 then
		local tpdata = genpdata_t(routine_list[seed].target)
		for i = 1, #tpdata do
			precount = tbl_routineinfo[_Player].temporary[i];
			count = tbl_routineinfo[_Player].target[i];
			--precount = tonumber( Field.Get( _index_me, "routine_target_temporary_"..i));
			--count = tonumber( Field.Get( _index_me, "routine_target_"..i));
			if( precount == nil)then
				precount = 0;
			end
			if( count == nil)then
				count = 0;
			end
			
			count = count + precount;
			tbl_routineinfo[_Player].target[i] = count;
			tbl_routineinfo[_Player].temporary[i] = 0;
			--Field.Set( _index_me, "routine_target_"..i, tostring( count));
			--Field.Set( _index_me, "routine_target_temporary_"..i, 0)
		end
	end
end

function routine_callback_talk( _index_me, _index_tome)
	local message = "5"..
			"\\n★★★★★★★★日常任务领取处★★★★★★★"..
			"\\n注意：放弃任务后当日无法再重新接任务"..
			"\\n注意：提交捕捉任务的时候请不要把自己的与任务"..
			"\\n目标相同的宠物带在身上，否则可能会被收走哦。"..
			"\\n"..
			"\\n接受日常任务"..
			"\\n查看当前任务完成进度"..
			"\\n提交任务"..
			"\\n放弃任务";
	NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_选择框%, %按钮_关闭%, 
			ROUTINE_WINDOW_SEQUENCE_MAIN, message);	
end

function routine_callback_window( _index_me, _index_tome, _sequence, _select, _data)
	local _Player = Playerkey(_index_tome);
	if(tbl_routineinfo[_Player] == nil) then
		tbl_routineinfo[_Player] = routine_new_tbl_Event(_index_tome);
	end
	if( _sequence == ROUTINE_WINDOW_SEQUENCE_MAIN)then
		argument = tonumber( _data);
--		if( argument == 1)then
--			routine_offer( _index_me, _index_tome);
		if( argument == 1)then
			if(Char.GetData(_index_tome,%对象_等级%) <=59)then
				NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 
				ROUTINE_WINDOW_SEQUENCE_CANCEL, "您的等级小于60级，无法接任务。");
				return;
			end
			routine_offer( _index_me, _index_tome)

		end
		if( argument == 2)then
			routine_check( _index_me, _index_tome);
		end
		--if( argument == 2)then
				--NLG.SystemMessage(_index_tome,"请在聊天框输入 jd 查询日常任务的完成度。");
			--routine_check( _index_me, _index_tome);
		--end
		if( argument == 3)then
			routine_submit( _index_me, _index_tome);
		end
		if( argument == 4)then
			routine_cancel( _index_me, _index_tome);
		end
	end
	if ( _sequence ==  ROUTINE_WINDOW_SEQUENCE_ABANDON ) then
		if ( _select == %按钮_是%) then
			local _Player = Playerkey(_index_tome);
			local header = nil;
			if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
				header = tbl_routineinfo[_Player].header;
			end

			--local header = tbl_routineinfo[_Player].header;	
			--local header = Field.Get(_index_tome,"routine_header");
			local message = "";
			if header == nil then
				header = "0|0|0";
			end
			local pheader = splitdata(header,"|");
			local flag = tonumber(pheader[1]);
			local time = tonumber(pheader[2]);
			local seed = tonumber(pheader[3]);
			message = "\\n你今日的日常任务已放弃，需要等明天才能再接喔。";
			nheader = "2|"..time.."|0";
			tbl_routineinfo[_Player].header = nheader;
			--Field.Set(_index_tome,"routine_header","2|"..time.."|0");
			--Field.Set(_index_tome,"routine_header","0|0|0");
			NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 
				ROUTINE_WINDOW_SEQUENCE_CANCEL, message);
		end
	end 
end

function routine_callback_command( _index, _message, _color, _range, _size)
	local _Player = Playerkey(_index);
	--local header;
	--local header = Field.Get(_index,"routine_header")
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	if header == nil then
		header = "0|0|0";
	else
		header = tbl_routineinfo[_Player].header;
	end
	local pheader = splitdata(header,"|")
	local flag = tonumber(pheader[1])
	local seed = tonumber(pheader[3])
	local message = "[日常任务]";
	if flag == 1 and routine_list[seed].type == 2 then
		local tpdata = genpdata_t(routine_list[seed].target)
		for i = 1, #tpdata do
			message = message .. tpdata[i][1].."("..tbl_routineinfo[_Player].target[i].."/".. tpdata[i][3]..") "
			--message = message .. tpdata[i][1].."("..Field.Get(_index,"routine_target_"..i).."/".. tpdata[i][3]..") "
		end
	else
		message = message .. "没有可以查询的内容。"
	end
	NLG.SystemMessage(_index,message)
end