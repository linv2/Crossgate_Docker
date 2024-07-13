Delegate.RegDelBattleOverEvent("NewbieBless_BattleOver");

--战斗结束全局事件
function NewbieBless_BattleOver(_battle)

	for i=0,9 do
		local player = Battle.GetPlayer(_battle,i);
		if(player>-1 and Char.GetData(player,%对象_等级%)<=20 and Char.GetData(player,%对象_血%)<Char.GetData(player,%对象_最大血%))then
			Char.SetData(player,%对象_血%,Char.GetData(player,%对象_最大血%));
			--Char.SetData(player,%对象_魔%,Char.GetData(player,%对象_最大魔%));
			NLG.UpChar(player);
			NLG.SystemMessage(player,"[天使庇护]"..Char.GetData(player,%对象_名字%).."受到了天使的祝福,生命值恢复全满.");
		end
		if(player>-1 and Char.GetData(player,%对象_战死%)==0 and Char.GetData(player,%对象_获得经验%)>1 and Battle.GetGainMode(_battle)==%战奖_普通% and Battle.GetType(_battle)==%战斗_普通%)then
			local battlePrize = math.random(1,100);
			if(battlePrize >=80 and battlePrize<=82 )then
				--Char.SetData(player,%对象_获得经验%,Char.GetData(player,%对象_获得经验%)*103/100);
				--NLG.UpChar(player);
				--NLG.SystemMessage(player,"[战神庇护]"..Char.GetData(player,%对象_名字%).."受到了战神的祝福,本场战斗经验值增加3%.");
			elseif(battlePrize >=97 and battlePrize<=99 )then
				--Char.SetData(player,%对象_获得经验%,Char.GetData(player,%对象_获得经验%)*106/100);
				--NLG.UpChar(player);
				--NLG.SystemMessage(player,"[战神庇护]"..Char.GetData(player,%对象_名字%).."受到了战神的祝福,本场战斗经验值增加6%.");
			elseif(battlePrize >=1 and battlePrize<=2 )then
				local battlePrizeGold = math.random(50,500);
				--Char.AddGold(player,battlePrizeGold);
				--NLG.SystemMessage(player,"[财神庇护]"..Char.GetData(player,%对象_名字%).."受到了财神的祝福,战斗获得"..battlePrizeGold.."金钱奖励.");
			elseif(battlePrize >=9 and battlePrize<=12 )then
				--Char.SetData(player,%对象_获得经验%,Char.GetData(player,%对象_获得经验%)*97/100);
				--NLG.UpChar(player);
				--NLG.SystemMessage(player,"[衰神庇护]"..Char.GetData(player,%对象_名字%).."受到了衰神的诅咒,本场战斗所得经验降低3%.");
			end
		end
	end

	return 1;
end
