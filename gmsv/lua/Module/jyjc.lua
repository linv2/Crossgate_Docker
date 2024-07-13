local expitem = 1;
local skillexpitem = 1;
local ADD_EXP_RATE = 0;
local ADD_B_SKILL_RATE = 0;

Delegate.RegDelGetExpEvent("ExpSettingGetExpEvent");
Delegate.RegDelTalkEvent("ExpSettingTalkEvent");

function pequipitem(index,itemid)
      
 for k=0,7 do
     local itemindex = Char.GetItemIndex(index,k);
     if(itemindex > 0) then
	     if(itemid == Item.GetData(itemindex, %道具_ID%))then
	        return true;
	     end
     end
 end
 return false;

end




function ExpSettingGetExpEvent(index, exp)


	


	if(Char.GetData(index,%对象_序%) == %对象类型_人%)then
		if(pequipitem(index,expitem))then
			exp = exp * (1 + 3);
		end
	end

	--if(Char.GetData(index,%对象_序%) == %对象类型_宠%)then
	--	local player = Pet.GetOwner(index);
	--	if(pequipitem(player,70421))then
	--		exp = exp * (1 + 0.5);
	--	end
	--end	


	if(ADD_EXP_RATE > 0) then
		exp = exp * (1 + ADD_EXP_RATE/100);
	end

	return exp;
end


Delegate.RegDelBattleSkillExpEvent("ExpSettingBattleSkillExpEvent");
function ExpSettingBattleSkillExpEvent(index, skill, exp)

	if(Char.GetData(index,%对象_序%) == %对象类型_人%)then
		if(pequipitem(index,skillexpitem))then
			exp = exp * (1 + 1);

		end
	end



	if(ADD_B_SKILL_RATE>0) then
		exp = exp * (1 + ADD_B_SKILL_RATE/100);
	end
	return math.floor(exp);
end




function ExpSettingTalkEvent(player, msg, color, range, size)

	if(check_msg(msg,"smml exp ")) then
		for token in string.gmatch(msg, "[%d]+") do
		   if(tonumber(token)~=nil) then
				ADD_EXP_RATE = tonumber(token);
				NLG.SystemMessage(player,"系统调整了战斗经验加成，目前总经验附加了"..ADD_EXP_RATE.."%");
				return 0;
			end
		end
		return 0;
	end
	
end

