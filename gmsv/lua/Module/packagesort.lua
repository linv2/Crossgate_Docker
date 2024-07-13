Delegate.RegDelBattleOverEvent("packagesort");

function packagesort(_battle)

	for i=0,9 do
		local player = Battle.GetPlayer(_battle,i);
		if(VaildChar(player)==true and Char.GetData(player,%对象_类型%) == %对象类型_人%)then
			NLG.SortItem(player);
			NLG.SystemMessage(player,"背包整理完毕。");
		end
	end
	return 1;
end