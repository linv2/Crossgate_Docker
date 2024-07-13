Delegate.RegInit("phb_Init");

local zdm = {"DuelPoint","Gold","LV","Fame"};
local zdm_name = {"战绩","魔币","等级","声望"};
local ts_limit = "50";
tbl_phb_player = {};

function phb_npc_init(index)
	return 1;
end

function phb_Init()
     if(phbSelectNPC == nil)then
		phbSelectNPC = NL.CreateNpc("lua/Module/phb.lua", "phb_npc_init");
		Char.SetData(phbSelectNPC,%对象_形象%,11424);
		Char.SetData(phbSelectNPC,%对象_原形%,11424);
		Char.SetData(phbSelectNPC,%对象_X%,247);
		Char.SetData(phbSelectNPC,%对象_Y%,76);
		Char.SetData(phbSelectNPC,%对象_地图%,1000);
		Char.SetData(phbSelectNPC,%对象_方向%,4);
		Char.SetData(phbSelectNPC,%对象_原名%,"玩家排行榜");
		NLG.UpChar(phbSelectNPC);
		Char.SetWindowTalkedEvent("lua/Module/phb.lua","phbSelectWTalked",phbSelectNPC);
		Char.SetTalkedEvent("lua/Module/phb.lua","phbSelectTalked", phbSelectNPC);
	end
end


function phbSelectTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end

	local message = "3"..
			"\\n★★★★★★★★★★排行榜★★★★★★★★★★"..
			"\\n---------------------------------------------"..
			"\\n"..
			"\\n                [战 绩 排 行]"..
			"\\n                [魔 币 排 行]"..
			"\\n                [等 级 排 行]"..
			"\\n                [声 望 排 行]"..
			"\\n";
	NLG.ShowWindowTalked(_tome,_me,%窗口_选择框%,%按钮_确定%,0,message);


end

function phbSelectWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end

	--点击取消，则返回
    if (tonumber(_select) == 2)then
        return; 
    end
	
	
	local t_se = 0;
	
    --点击上一步
    if (tonumber(_select) == 16)then
		t_se = tbl_phb_player[_tome];
      if(tonumber(_seqno) ~= 0)then 
       _seqno=_seqno - 1;
      end

    --点击下一步
    elseif (tonumber(_select) == 32)then
		t_se = tbl_phb_player[_tome];
        _seqno=_seqno + 1;  
    else
		t_se = tonumber(_data) - 1;
		tbl_phb_player[_tome] = t_se;
	end
    
    local page=_seqno + 1;

	
	
	if(zdm[t_se] == nil)then
		return;
	end
	local showtext = "";
	showtext = showtext .. "          ★★★★★★★★"..zdm_name[t_se].."排行榜★★★★★★★";
    showtext = showtext .. "\\n---------------------------第"..page.."页---------------------------";
	showtext = showtext .. "\\n   玩家名字                                 "..zdm_name[t_se].."       ";
    showtext = showtext .. "\\n-----------------------------------------------------------";	
    local query = "select name,"..zdm[t_se].." from tbl_character order by "..zdm[t_se].." desc limit "..ts_limit..";";
	local ret = SQL.Run(query);

    local row=_seqno * 19;
    for i=row,row+19,1 do   

		if(type(ret)=="table" and ret[i.."_0"]~=nil)then
			local e_len = (16 - string.len(ret[i.."_0"]));
			local kbwb = "";
			for i=0,e_len do
				kbwb = kbwb .." ";
			end
		  showtext=showtext.."\\n["..tostring(i+1).."]"..ret[i.."_0"].."                        "..kbwb..ret[i.."_1"];
        end
    end
	NLG.ShowWindowTalked(_tome,_me,%窗口_巨信息框%,%按钮_上下取消%,_seqno,showtext);
	return;
	

end