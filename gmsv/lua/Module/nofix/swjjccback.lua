--[[ def_round_wincallback
	函数功能： 当前场次战斗结束后每个玩家胜利后的回调函数。
	当达到本场次结束标准时(第一场次为first_round_user_max个人胜利，其余场次为所有玩家战斗结束)，触发x强产生函数
	
	参数：1)number battleindex:表示战斗指针
	    
]]
function def_round_wincallback(battleindex)
	
	
	local winside = Battle.GetWinSide(battleindex);

	local sideM;

	tbl_swjjc_goinfo["create_battle_count"] = tbl_swjjc_goinfo["create_battle_count"] - 1;

	--获取胜利方
	if(winside == 0)then
		sideM = 0;
	else
		sideM = 10;
	end
	
	--获取胜利方的玩家指针，可能站在前方和后方
	local w1 = Battle.GetPlayer(battleindex, 0 + sideM); 
	local w2 = Battle.GetPlayer(battleindex, 5 + sideM);
	local ww = nil;

	--把胜利玩家加入列表
	if(VaildChar(w1) == true and Char.GetData(w1,%对象_登陆次数%) >= 1)then
		ww = w1;
	else
		ww = w2;
	end

	table.insert(tbl_win_user,tonumber(ww));
	
	-- 对胜利玩家进行通告
	if (tbl_swjjc_setting.this_user_WinFunc ~= nil)then
		local mc = 0;
		--local mc = math.abs(tbl_swjjc_goinfo["create_battle_count_bak"] - tbl_swjjc_goinfo["create_battle_count"]);
		-- this_user_WinFunc(playerindex,名次);
		local f1 = loadstring(tbl_swjjc_setting.this_user_WinFunc.."("..ww..","..mc..")");	
		f1();
	end
	
	
	
	--如果是首战
	if(tbl_swjjc_setting.round_count == 1)then
		--判断人数是否已达进入第二轮的要求
		if(tonumber(#tbl_win_user) == tbl_swjjc_setting.first_round_user_max)then
			local f2 = loadstring(tbl_swjjc_setting.WinFunc.."(tbl_win_user)");	
			f2();
		end
	else	
		--判断人数是否已达进入下一轮的要求
		if(tbl_swjjc_goinfo["create_battle_count"] == 0)then
			local f3 = loadstring(tbl_swjjc_setting.WinFunc.."(tbl_win_user)");	
			f3();
		end
	end
end