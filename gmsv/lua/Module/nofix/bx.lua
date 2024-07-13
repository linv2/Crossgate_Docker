function str_format(str,str_len,str_type)
	if(str_type == 1) then
		str_tmp=string.format("%"..str_len.."s", str);
	elseif(str_type == 2) then
		str_tmp=string.format("%-"..str_len.."s", str);
	elseif(str_type == 3) then
		local tmp_splace=math.floor((str_len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-"..str_len.."s", str_tmp);
	end
	return str_tmp;
end

function ItemFarm_func(_PlayerIndex, _ItemPos,yudilv,yudibushu)
	if Char.PartyNum(_PlayerIndex) ~=1 then
		if Char.GetPartyMember(_PlayerIndex,0) ~= _PlayerIndex then
			NLG.SystemMessage(_PlayerIndex,"组队状态下必须由队长使用喔。");
			return
		end
	end
	local getXiangVar1 = Char.GetData(_PlayerIndex,%对象_香步数%);
	local getXiangVar2 = Char.GetData(_PlayerIndex,%对象_香上限%);
	if getXiangVar1 ~=0 then
		NLG.SystemMessage(_PlayerIndex,"您已经使用了诱魔香，无法叠加使用了。");
		return;
	end
	local ItemIndex_tmp=Char.GetItemIndex(_PlayerIndex, _ItemPos);
	--[[for i=0,100 do
		print( i..":"..Item.GetData(ItemIndex_tmp,i));
	end
	if(1)then
		return;
	end--]]
	local duidie = Item.GetData(ItemIndex_tmp,%道具_堆叠数%);
	if duidie == 1 then 
		Item.Kill(_PlayerIndex, ItemIndex_tmp, _ItemPos);
		Item.UpItem(_PlayerIndex, _ItemPos);
	else
		Item.SetData(ItemIndex_tmp,%道具_堆叠数%,duidie-1);
		Item.UpItem(_PlayerIndex, _ItemPos);
	end
	--local getXiangVar1 = Char.GetData(_PlayerIndex,%对象_香步数%);
	--local getXiangVar2 = Char.GetData(_PlayerIndex,%对象_香上限%);
	if getXiangVar1 ~=0 then
		NLG.SystemMessage(_PlayerIndex,"点香系统已经将你的香状态叠加。");
	end
	if (getXiangVar1 == nil) then
		getXiangVar1 = 0;
	end
	
	Char.SetData(_PlayerIndex,%对象_香步数%,getXiangVar1 + yudibushu);
	Char.SetData(_PlayerIndex,%对象_香上限%,yudilv);
	--Char.SetData(_PlayerIndex,%对象_香下限%,yudilv);
	--NLG.TalkToCli(_PlayerIndex,-1,"步:"..Char.GetData(_PlayerIndex,%对象_香步数%).."率:"..Char.GetData(_PlayerIndex,%对象_香上限%).."率2:"..Char.GetData(_PlayerIndex,%对象_香下限%),%颜色_黄色%,%字体_中%);
	
	
	getXiangVar1 = Char.GetData(_PlayerIndex,%对象_香步数%);
	getXiangVar2 = Char.GetData(_PlayerIndex,%对象_香上限%);
		if(getXiangVar1~=nil and getXiangVar2~=nil)then
			if(getXiangVar1==0)then
				Field.Set(_PlayerIndex, "xiang_use", 0);
				Field.Set(_PlayerIndex, "xiang_foot", 0);
				Field.Set(_PlayerIndex, "xiang_max", 0);
			else
				Field.Set(_PlayerIndex, "xiang_use", 1);
				Field.Set(_PlayerIndex, "xiang_foot", getXiangVar1);
				Field.Set(_PlayerIndex, "xiang_max", getXiangVar2);
			end
		end
		NLG.SystemMessage(_PlayerIndex,"服务器已经记录了您的诱魔香步数。");
		NLG.SystemMessage(_PlayerIndex,"诱魔香已经开始生效。");
end

Delegate.RegDelLoginEvent("bx_LoginEvent");

function bx_LoginEvent(player)
	
	local xiang_use=tonumber(Field.Get(player, "xiang_use"));
	local xiang_foot=tonumber(Field.Get(player, "xiang_foot"));
	local xiang_max=tonumber(Field.Get(player, "xiang_max"));
	if 	(xiang_use == 1 and xiang_foot > 0) then
		Char.SetData(player,%对象_香步数%,xiang_foot);
		Char.SetData(player,%对象_香上限%,xiang_max);
		NLG.SystemMessage(player,"您上次下线时诱魔香有剩余步数，系统自动为您恢复使用。");
	end


end

Delegate.RegDelBattleStartEvent("bx_BattleStart_Event");

function bx_BattleStart_Event(battle)
	
	local _PlayerIndex = Battle.GetPlayer(battle,0);
	if(VaildChar(_PlayerIndex)==true) then
		local getXiangVar1 = Char.GetData(_PlayerIndex,%对象_香步数%);
	    local getXiangVar2 = Char.GetData(_PlayerIndex,%对象_香上限%);
		if(getXiangVar1~=nil and getXiangVar2~=nil)then
			if(getXiangVar1 <= 10)then
				Field.Set(_PlayerIndex, "xiang_use", 0);
				Field.Set(_PlayerIndex, "xiang_foot", 0);
				Field.Set(_PlayerIndex, "xiang_max", 0);
			else
				Field.Set(_PlayerIndex, "xiang_use", 1);
				Field.Set(_PlayerIndex, "xiang_foot", getXiangVar1);
				Field.Set(_PlayerIndex, "xiang_max", getXiangVar2);
			end
		end
		
			
	end
	
end

Delegate.RegDelAllOutEvent("bx_OutEvent");

function bx_OutEvent(player)
	
		local getXiangVar1 = Char.GetData(player,%对象_香步数%);
	    local getXiangVar2 = Char.GetData(player,%对象_香上限%);
		if(getXiangVar1~=nil and getXiangVar2~=nil)then
			if(getXiangVar1 <= 10)then
				Field.Set(player, "xiang_use", 0);
				Field.Set(player, "xiang_foot", 0);
				Field.Set(player, "xiang_max", 0);
			else
				Field.Set(player, "xiang_use", 1);
				Field.Set(player, "xiang_foot", getXiangVar1);
				Field.Set(player, "xiang_max", getXiangVar2);
			end
		end		
	
end
