Delegate.RegDelBattleOverEvent("packagesort");

function packagesort(_battle)

	for i=0,9 do
		local player = Battle.GetPlayer(_battle,i);
		if(VaildChar(player)==true and Char.GetData(player,%����_����%) == %��������_��%)then
			NLG.SortItem(player);
			NLG.SystemMessage(player,"����������ϡ�");
		end
	end
	return 1;
end