--NPC全局践踏事件
function Npc_WalkOverEvent(npc_index, player_index)
	for _,Func in ipairs(tbl_delegate_WalkOverEvent) do
	    local f =loadstring(Func.."("..npc_index..",\""..player_index..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end

--NPC全局践踏事件
function Npc_WalkPostEvent(npc_index, player_index)
	for _,Func in ipairs(tbl_delegate_WalkPostEvent) do
	    local f =loadstring(Func.."("..npc_index..",\""..player_index..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end

--NPC全局践踏事件
function Npc_WalkPreEvent(npc_index)
	for _,Func in ipairs(tbl_delegate_WalkPreEvent) do
	    local f = loadstring(Func.."("..npc_index..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end

--NPC全局说话事件
function Npc_TalkedEvent(npc_index, player_index)
	for _,Func in ipairs(tbl_delegate_TalkedEvent) do
	    local f =loadstring(Func.."("..npc_index..",\""..player_index..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end

--NPC全局对话反馈事件
function Npc_WindowTalkedEvent(npc_index, player_index, _Seqno, _Select, _Data)
	for _,Func in ipairs(tbl_delegate_WindowTalkedEvent) do
	    local f =loadstring(Func.."("..npc_index..",\""..player_index.."\",".._Seqno..",".._Select..",".._Data..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end

--NPC全局循环
function Npc_LoopEvent(npc_index)
	for _,Func in ipairs(tbl_delegate_LoopEvent) do
	    local f = loadstring(Func.."("..npc_index..")");
		if(f~=nil)then
			f();
		end
    end
	-- end
	return;
end