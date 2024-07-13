
function All_BattleSkillExpEvent(playerindex, skill, exp)
	
	local expcount = 0;
	local changeflg = 0;
	for _,Func in ipairs(tbl_delegate_BattleSkillExpEvent) do
	    local f = loadstring("return "..Func.."("..playerindex..","..skill..","..exp..")");	
		local total = 0;
		if(f~=nil)then
			total = f();
		end
		expcount = expcount + total;
		changeflg = 1;
    end
	
	if(changeflg == 0) then
		return exp;
	else
		return expcount;
	end
end


function All_ProductSkillExpEvent(playerindex, skill, exp)
	
	local expcount = 0;
	local changeflg = 0;
	for _,Func in ipairs(tbl_delegate_ProductSkillExpEvent) do
	    local f = loadstring("return "..Func.."("..playerindex..","..skill..","..exp..")");	
		local total = 0;
		if(f~=nil)then
			total = f();
		end
		expcount = expcount + total;
		changeflg = 1;
    end
	
	if(changeflg == 0) then
		return exp;
	else
		return expcount;
	end
end


function All_GetExpEvent(playerindex, exp)
	
	local expcount = 0;
	local changeflg = 0;
	for _,Func in ipairs(tbl_delegate_GetExpEvent) do
	    local f = loadstring("return "..Func.."("..playerindex..","..exp..")");	
		local total = 0;
		if(f~=nil)then
			total = f();
		end
		expcount = expcount + total;
		changeflg = 1;
    end
	
	if( changeflg == 0) then
		return exp;
	else
		return expcount;
	end
	
	
end