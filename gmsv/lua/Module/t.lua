Delegate.RegInit("tInit");
Delegate.RegDelTalkEvent("tTalkEvent");
tbl_tnpc = tbl_tnpc or {};

function init_t_Init(index)
	return 1;
end

function tInit()
	if (tnpc == nil) then
		tnpc = NL.CreateNpc("lua/Module/t.lua", "init_t_Init");
		Char.SetData(tnpc,%对象_形象%,231088);
		Char.SetData(tnpc,%对象_原形%,231088);
		Char.SetData(tnpc,%对象_X%,84);
		Char.SetData(tnpc,%对象_Y%,84);
		Char.SetData(tnpc,%对象_地图%,777);
		Char.SetData(tnpc,%对象_方向%,4);
		Char.SetData(tnpc,%对象_原名%,"Tnpc");
		NLG.UpChar(tnpc);	
		Char.SetWindowTalkedEvent("lua/Module/t.lua","tnpcMsg", tnpc);
		tbl_tnpc["this"]=tonumber(tnpc);
	end
end


function tTalkEvent(player,msg,color,range,size)
	if( check_msg(msg,"/t")) then						
		local leader = Char.GetPartyMember(player,0);
		if(leader ~= player or leader == -1)then
			NLG.SystemMessage(player,"只有队长可以踢人。");
			return;
		else
			str_tWindow = "4|\\n\\n 			请问你要将谁踢出队伍？\\n	 					 \\n\\n";
			
		for i=1,4 do
			local this_player = Char.GetPartyMember(player,i);
			
			if(this_player == -1)then
				str_tWindow = str_tWindow .. " 			 			无人\\n";
			else
				local name = Char.GetData(this_player,%对象_原名%);
				str_tWindow = str_tWindow .. " 			 			"..name.."\\n";
			end
		end		
		NLG.ShowWindowTalked(player,tonumber(tbl_tnpc["this"]),%窗口_选择框%,%按钮_关闭%,0,str_tWindow);
		end	
	end
end


function tnpcMsg(npc,player,_seqno,_select,_data)	
	if ((_select == 0 or _select == "0") and (_data ~= "")) then		
		local selectitem = tonumber(_data); 		
		if (selectitem==nil or (selectitem~=nil and (selectitem > 4 or selectitem < 1))) then
				NLG.ShowWindowTalked(player,npc,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您所选择的位置不正常！");
				return;
		end
				
		
		local this_player = Char.GetPartyMember(player,selectitem);		
		if(this_player~=-1 and this_player~=nil)then
			Char.DischargeParty(this_player);
			local name = Char.GetData(this_player,%对象_原名%);
			NLG.SystemMessage(player,"已经"..name.."踢出了队伍。");
			NLG.SystemMessage(this_player,"您被队长踢出了队伍。");
		else
			NLG.SystemMessage(player,"这个位置沒有玩家。");
		end
		
	end
end	


