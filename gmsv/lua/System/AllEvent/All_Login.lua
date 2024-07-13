--玩家登录全局事件
function All_LoginEvent(player)
	for _,Func in ipairs(tbl_delegate_LoginEvent) do
    local f = loadstring(Func.."("..player..")");	
	if(f~=nil)then
		f();
	end
    end
	
	
	return;
end


--玩家离开全局事件
function All_DropEvent(player)

	for _,Func in ipairs(tbl_delegate_DropEvent) do
    local f = loadstring(Func.."("..player..")");	
	if(f~=nil)then
		f();
	end
    end
	All_AllOutEvent(player);
	return;
end

--玩家登出全局事件
function All_LogoutEvent(player)

	for _,Func in ipairs(tbl_delegate_LogoutEvent) do
    local f = loadstring(Func.."("..player..")");	
	if(f~=nil)then
		f();
	end
    end
	All_AllOutEvent(player);
	return;
end

--玩家登回城全局事件
function All_LoginGateEvent(player)

	for _,Func in ipairs(tbl_delegate_LoginGateEvent) do
    local f = loadstring(Func.."("..player..")");	
	if(f~=nil)then
		f();
	end
    end
	return;
end

--玩家离开事件
function All_AllOutEvent(player)

	for _,Func in ipairs(tbl_delegate_AllOutEvent) do
    local f = loadstring(Func.."("..player..")");	
	if(f~=nil)then
		f();
	end
    end
	return;
end

