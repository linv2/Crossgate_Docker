--声望查询

Delegate.RegInit("fram_Init");

function initframNpc_Init(index)
	print("声望查询npc_index = " .. index);
	return 1;
end


function fram_create() --声望查询
	if (fram_index == nil) then
		fram_index = NL.CreateNpc("lua/Module/fram.lua", "initframNpc_Init");
		Char.SetData(fram_index,%对象_形象%,10414);
		Char.SetData(fram_index,%对象_原形%,10414);
		Char.SetData(fram_index,%对象_X%,229);
		Char.SetData(fram_index,%对象_Y%,83);
		Char.SetData(fram_index,%对象_地图%,1000);
		Char.SetData(fram_index,%对象_方向%,4);
		Char.SetData(fram_index,%对象_名字%,"阿蒙的声望查询牌");
		NLG.UpChar(fram_index);
		Char.SetTalkedEvent("lua/Module/fram.lua", "FramTalk", fram_index);
		Char.SetWindowTalkedEvent("lua/Module/fram.lua", "FramEvent", fram_index);
	end
end


function FramTalk(_NpcIndex,_PlayerIndex)
	if (NLG.CanTalk(_NpcIndex,_PlayerIndex) == true) then
		WindowMsg = "3\\n\\n      你来找我有什么事情吗？\\n\\n       Hi,我想查查我现在有多少声望啦!\\n\\n      ……点错了……";
		NLG.ShowWindowTalked(_PlayerIndex,_NpcIndex,%窗口_选择框%,%按钮_关闭%,1,WindowMsg);
	end
	return;
end

function FramEvent(_NpcIndex,_PlayerIndex,_SqeNo,_select,_data)
	if ((_select == 0 or _select == "0") and (_data ~= "")) then
		local selectitem = tonumber(_data) -1;
		if (selectitem == 0) then
			Msg = "\\n\\n   你现在已经有"..Char.GetData(_PlayerIndex,%对象_声望%).."点声望噢!\\n\\n   没达到目标的话不要灰心,继续努力噢";
			NLG.ShowWindowTalked(_PlayerIndex,_NpcIndex,%窗口_信息框%,%按钮_关闭%,1,Msg);
		end
		if (selectitem == 2) then
			NLG.ShowWindowTalked(_PlayerIndex,_NpcIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n   好的,再见!");
		end
	end
end


function fram_Init()
	fram_create();
	
end