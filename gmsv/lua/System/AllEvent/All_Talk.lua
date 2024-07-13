 --说话全局事件
function All_TalkEvent(player,msg,color,range,size)
    local talkret = 1;
	for _,Func in pairs(tbl_delegate_TalkEvent) do	
	    local f =loadstring("return "..Func.."("..player..",\""..msg.."\","..color..","..range..","..size..")");	
		if(f~=nil)then
			if(f() == 0) then
				talkret = 0;
			end
		end
    end
	return talkret;
end
