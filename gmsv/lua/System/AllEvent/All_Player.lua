function All_RightClickEvent(player1,player2)

	for _,Func in ipairs(tbl_delegate_RightClickEvent) do
		if(player1 == nil)then
			NLG.SystemMessage(player1,Func.."(nil)");
			return;
		end
	    local f = loadstring(Func.."("..player1..","..player2..")");	
		if(f~=nil)then
			f();
		end
    end
	return;
end

function All_LevelUpEvent(player)

	for _,Func in ipairs(tbl_delegate_LevelUpEvent) do
		if(player == nil)then
			NLG.SystemMessage(player,Func.."(nil)");
			return;
		end
	    local f = loadstring(Func.."("..player..")")();
		if(f~=nil)then
			f();
		end
    end
	return;
end
