function All_WarpEvent(player,x,y)

	for _,Func in ipairs(tbl_delegate_WarpEvent) do
	    local f = loadstring(Func.."("..player..","..x..","..y..")");		
		if(f~=nil)then
			f();
		end
    end
	return;
end

function All_AfterWarpEvent(player,mapid,floor,x,y,aftermapid,afterfloor,afterx,aftery)

	for _,Func in ipairs(tbl_delegate_AfterWarpEvent) do
    local f = loadstring(Func.."("..player..","..mapid..","..floor..","..x..","..y..","..aftermapid..","..afterfloor..","..afterx..","..aftery..")");		
		if(f~=nil)then
			f();
		end
    end
	return;
end
