Delegate.RegInit("Click_Init");



Click_MeIndex = 0;


local tudiquanjuindex =  {}; --徒弟的index
local shifuquanjuindex =  {}; --师傅的index




function WindowsTmpNpc_Init()
	if(Click_MeIndex == nil)then
		Click_MeIndex = NL.CreateNpc("lua/Module/GM_Click.lua", "initClick_Init");
		Char.SetData(Click_MeIndex, 1, 105254);
		Char.SetData(Click_MeIndex, 2, 105254);
		Char.SetData(Click_MeIndex, 4,777);
		Char.SetData(Click_MeIndex, 5, 14);
		Char.SetData(Click_MeIndex, 6, 13);
		Char.SetData(Click_MeIndex, 7, 5);
		Char.SetData(Click_MeIndex, 2000, "ClickNpc");
			NLG.UpChar(Click_MeIndex)
		if (Char.SetWindowTalkedEvent(nil, "RCVal_Talked", Click_MeIndex) < 0) then
			print("RCVal_Talked 注册事件失败。");
			return false;
		end
		--NpcIndex = Click_MeIndex;
	end
	return true;
end
function RCVal_Talked(_MeIndex, _TalkIndex, _Seqno, _Select, _Data)

	--local Me_Account = Char.GetData(_TalkIndex,2002);

	--NLG.SystemMessage(tudiquanjuindex[_TalkIndex], "徒弟这里显示");
	--NLG.SystemMessage(shifuquanjuindex[_TalkIndex], "师傅这里显示");
	-- NLG.SystemMessage(_TalkIndex, "查询结果自己的窗口才显示 _Seqno=".._Seqno.."  _Select=".._Select.."  _Data=".._Data);

	
	if (_Seqno==1 and _Data=='1') then
		RC_cdkey = Char.GetData(shifuquanjuindex[_TalkIndex],2002);
		local tudishuliangchaxun = SQL.Run("select count(*) from shituxitong where shifucdkey = '"..RC_cdkey.."' and shifumingzi = '"..Char.GetData(shifuquanjuindex[_TalkIndex],%对象_原名%).."'and zhuangtai = 2;");
		local tudishuliang = 0 ;
		if tudishuliangchaxun ~= nil then
			tudishuliang = tonumber(tudishuliangchaxun["0_0"]);
		end
		
		RC_Str = "  名字："..Char.GetData(shifuquanjuindex[_TalkIndex],%对象_原名%).."　等级："..Char.GetData(shifuquanjuindex[_TalkIndex],%对象_等级%).."\n\n徒弟人数："..tudishuliang;
		
		NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 100, RC_Str);
		return;
	elseif (_Seqno==1 and _Data=='2') then
		local tudi_cdkey = Char.GetData(_TalkIndex,2002);
		local tudi_mingzi = Char.GetData(_TalkIndex,%对象_原名%);
		local tudi_dengji = Char.GetData(_TalkIndex,%对象_等级%);
		
		local shifu_cdkey = Char.GetData(shifuquanjuindex[_TalkIndex],2002);
		local shifu_mingzi = Char.GetData(shifuquanjuindex[_TalkIndex],%对象_原名%);
		local shifu_dengji = Char.GetData(shifuquanjuindex[_TalkIndex],%对象_等级%);
--		local itemIndex = Char.FindItemId(shifuquanjuindex[_TalkIndex],900001);
--		local shituzigezheng = Item.GetData(itemIndex, %道具_已鉴定%);
		-- NLG.SystemMessage(_TalkIndex,itemIndex);
		
		
		
		if tudi_dengji > 20 then
			NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,"\n\n\t你已经超过20级了,不能拜师了");
			
			return ;
		end
		if shifu_dengji < 120  then
			NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,"\n\n\t对方等级不到120级,还不能收徒弟");
			
			return ;
		end
				
		local shifu = SQL.Run("select shifumingzi,zhuangtai from shituxitong where tudimingzi = '"..tudi_mingzi.."' order by zhuangtai DESC;;");
--			NLG.ShowWindowTalked( _TalkIndex,_MeIndex,0,1,11,shifu);
		if( shifu ~= 0 and shifu["0_0"] == shifu_mingzi and tonumber(shifu["0_1"]) == 2 )then
			NLG.ShowWindowTalked( _TalkIndex,_MeIndex,0,1,11,"他已经是你师傅了！！！");
			return;
		end
		if( shifu ~= 0 and tonumber(shifu["0_1"]) == 2 )then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex,0,1,11,"你已经有一个师傅了，师傅是："..shifu["0_0"]);
			return;
		end
		local tudi = SQL.Run("select tudimingzi,zhuangtai from shituxitong where shifumingzi = '"..tudi_mingzi.."' order by zhuangtai DESC;;");
		if( tudi ~= 0 and tudi["0_0"] == shifu_mingzi and tonumber(tudi["0_1"]) == 2 )then
			NLG.ShowWindowTalked( _TalkIndex,_MeIndex,0,1,11,"不能向徒弟拜师！！！");
			return;
		end
	
		
		
		  
		
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n\t申请拜师成功,请等待对方确认");
		
		SQL.Run("delete from shituxitong where tudicdkey = '"..tudi_cdkey.."' and zhuangtai = 1;");
		--NLG.SystemMessage(_TalkIndex, "insert into shituxitong(tudicdkey,tudimingzi,shifucdkey,shifumingzi,zhuangtai) values ('"..tudi_cdkey.."','"..tudi_mingzi.."','"..shifu_cdkey.."','"..shifu_mingzi.."',1);");
		SQL.Run("insert into shituxitong(tudicdkey,tudimingzi,shifucdkey,shifumingzi,zhuangtai) values ('"..tudi_cdkey.."','"..tudi_mingzi.."','"..shifu_cdkey.."','"..shifu_mingzi.."',1);")
		
		
		NLG.ShowWindowTalked(shifuquanjuindex[_TalkIndex],_MeIndex, 0, 12, 100,"\n\n\t"..Char.GetData(_TalkIndex,%对象_原名%).."打算拜你为师,收下这个弟子吗?");
		----NLG.SystemMessage(shifuquanjuindex[_TalkIndex], "有人要拜师,当前发起对话框的人是");
		return;
	end
	
	
	
	if (_Seqno==100 and _Select==4) then
	local shifu_cdkey = Char.GetData(shifuquanjuindex[_TalkIndex],2002);
	local shifu_mingzi = Char.GetData(shifuquanjuindex[_TalkIndex],%对象_原名%);
	local tempchaxun = SQL.Run("select tudimingzi from shituxitong where shifucdkey = '"..shifu_cdkey.."' and shifumingzi = '"..shifu_mingzi.."' and zhuangtai = 1;");
	
	local tudi_mingzi= tempchaxun["0_0"];
	
	
	
	
	
	SQL.Run("update shituxitong set zhuangtai = 2 where shifucdkey = '"..shifu_cdkey.."' and shifumingzi = '"..shifu_mingzi.."' and zhuangtai = 1 and tudimingzi = '"..tudi_mingzi.."';");
	
	
	NLG.ShowWindowTalked(shifuquanjuindex[_TalkIndex],_MeIndex, 0, 1, 999,"\n\n\t恭喜你新收徒弟一名");
	
	NLG.ShowWindowTalked(tudiquanjuindex[_TalkIndex],_MeIndex, 0, 1, 999,"\n\n\t恭喜你拜师成功");
	----NLG.SystemMessage(shifuquanjuindex[_TalkIndex], "已经收下这个徒弟");
	
	NLG.SystemMessage(-1, tudi_mingzi.." 拜 "..shifu_mingzi.." 为师,还没有拜师的请来法兰城");
	
	
	end
	
	
	if (_Seqno==100 and _Select==8) then
	local shifu_cdkey = Char.GetData(shifuquanjuindex[_TalkIndex],2002);
	local shifu_mingzi = Char.GetData(shifuquanjuindex[_TalkIndex],%对象_原名%);
	local tudi_mingzi = SQL.Run("select tudimingzi from shituxitong where shifucdkey = '"..shifu_cdkey.."' and shifumingzi = '"..shifu_mingzi.."' and zhuangtai = 1;")["0_0"];
	SQL.Run("update shituxitong set zhuangtai = 3 where shifucdkey = '"..shifu_cdkey.."' and shifumingzi = '"..shifu_mingzi.."' and zhuangtai = 1 and tudimingzi = '"..tudi_mingzi.."';");
	
	NLG.ShowWindowTalked(shifuquanjuindex[_TalkIndex],_MeIndex, 0, 1, 999,"\n\n\t已经拒绝了"..tudi_mingzi.."的拜师请求");
	NLG.ShowWindowTalked(tudiquanjuindex[_TalkIndex],_MeIndex, 0, 1, 999,"\n\n\t"..shifu_mingzi.."拒绝了你的拜师请求");
	NLG.SystemMessage(tudiquanjuindex[_TalkIndex], shifu_mingzi.."拒绝了你的拜师请求");
	
	end
	
	
	
	
	


end





function Rightclick(p1,p2)
	if p1 == p2 then
		return; 
	end
	local p1x = Char.GetData(p1,%对象_X%);
	local p1y = Char.GetData(p1,%对象_Y%);
	
	local p2x = Char.GetData(p2,%对象_X%);
	local p2y = Char.GetData(p2,%对象_Y%);
	local jiange = 0;
	if p1x-p2x > 1 or p1x-p2x < -1 or p1y-p2y > 1 or p1y-p2y < -1 then
		jiange = 1;
	end
	
	local Cdkey = Char.GetData(p1,2002);
	
	local query1 = "SELECT `Debugger` FROM `tbl_character` WHERE `cdkey`='"..Cdkey.."' and Name = '"..Char.GetData(p1,%对象_原名%).."';";
	local myresult1 = SQL.Run(query1); --领取级别
	if(myresult1 == nil)then
		----NLG.SystemMessage(_PlayerIndex, myresult1["0_0"]);
		
		return;
	end
	local debugger = tonumber(myresult1["0_0"]);
	
	if debugger == 1 then

		tudiquanjuindex[p1] = p1;
		shifuquanjuindex[p1] = p2;
		tudiquanjuindex[p2] = p1;
		shifuquanjuindex[p2] = p2;
		
		
		

	end
		
		
		
	
	if debugger == 0 then
		if jiange == 1 then
			--NLG.SystemMessage(_PlayerIndex, "角色没有挨着");
			
			return ;
		end
	
		tudiquanjuindex[p1] = p1;
		shifuquanjuindex[p1] = p2;
		
		tudiquanjuindex[p2] = p1;
		shifuquanjuindex[p2] = p2;
		
		
		NLG.ShowWindowTalked(p1 ,Click_MeIndex,2, 2, 1, 
			"3\n\n          请选择对["..Char.GetData(p2,%对象_原名%).."]该玩家的操作："..
			"\n\n　　　　　　　　　『查看信息』"..
			"\n　　　　　　　　　『拜他为师』");
	end
		
		
    return; 
end
function Click_Init()
	Click_MeIndex = nil;
	NL.RegRightClickEvent(nil,"Rightclick");
	WindowsTmpNpc_Init();
end
function initClick_Init(index)
	return 1;
end
function split(str, split_char)
    local sub_str_tab = {};
    while (true) do
		local pos = string.find(str, split_char);
		if (not pos) then
			sub_str_tab[#sub_str_tab + 1] = str;
			break;
		end
		local sub_str = string.sub(str, 1, pos - 1); 
		sub_str_tab[#sub_str_tab + 1] = sub_str;
		str = string.sub(str, pos + 1, #str);
    end
    return sub_str_tab;
end