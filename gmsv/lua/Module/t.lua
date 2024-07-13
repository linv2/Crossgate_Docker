Delegate.RegInit("tInit");
Delegate.RegDelTalkEvent("tTalkEvent");
tbl_tnpc = tbl_tnpc or {};

function init_t_Init(index)
	return 1;
end

function tInit()
	if (tnpc == nil) then
		tnpc = NL.CreateNpc("lua/Module/t.lua", "init_t_Init");
		Char.SetData(tnpc,%����_����%,231088);
		Char.SetData(tnpc,%����_ԭ��%,231088);
		Char.SetData(tnpc,%����_X%,84);
		Char.SetData(tnpc,%����_Y%,84);
		Char.SetData(tnpc,%����_��ͼ%,777);
		Char.SetData(tnpc,%����_����%,4);
		Char.SetData(tnpc,%����_ԭ��%,"Tnpc");
		NLG.UpChar(tnpc);	
		Char.SetWindowTalkedEvent("lua/Module/t.lua","tnpcMsg", tnpc);
		tbl_tnpc["this"]=tonumber(tnpc);
	end
end


function tTalkEvent(player,msg,color,range,size)
	if( check_msg(msg,"/t")) then						
		local leader = Char.GetPartyMember(player,0);
		if(leader ~= player or leader == -1)then
			NLG.SystemMessage(player,"ֻ�жӳ��������ˡ�");
			return;
		else
			str_tWindow = "4|\\n\\n 			������Ҫ��˭�߳����飿\\n	 					 \\n\\n";
			
		for i=1,4 do
			local this_player = Char.GetPartyMember(player,i);
			
			if(this_player == -1)then
				str_tWindow = str_tWindow .. " 			 			����\\n";
			else
				local name = Char.GetData(this_player,%����_ԭ��%);
				str_tWindow = str_tWindow .. " 			 			"..name.."\\n";
			end
		end		
		NLG.ShowWindowTalked(player,tonumber(tbl_tnpc["this"]),%����_ѡ���%,%��ť_�ر�%,0,str_tWindow);
		end	
	end
end


function tnpcMsg(npc,player,_seqno,_select,_data)	
	if ((_select == 0 or _select == "0") and (_data ~= "")) then		
		local selectitem = tonumber(_data); 		
		if (selectitem==nil or (selectitem~=nil and (selectitem > 4 or selectitem < 1))) then
				NLG.ShowWindowTalked(player,npc,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n����ѡ���λ�ò�������");
				return;
		end
				
		
		local this_player = Char.GetPartyMember(player,selectitem);		
		if(this_player~=-1 and this_player~=nil)then
			Char.DischargeParty(this_player);
			local name = Char.GetData(this_player,%����_ԭ��%);
			NLG.SystemMessage(player,"�Ѿ�"..name.."�߳��˶��顣");
			NLG.SystemMessage(this_player,"�����ӳ��߳��˶��顣");
		else
			NLG.SystemMessage(player,"���λ�Û]����ҡ�");
		end
		
	end
end	


