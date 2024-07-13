Delegate.RegInit("minibank_Init");

function minibankNpc_Init(index)
	print("随身银行npc_index = " .. index);
	return 1;
end

function minibank_create() --声望查询
	tbl_minibankNpc = {};
	if (minibank_index == nil) then
		minibank_index = NL.CreateNpc("lua/Module/minibank.lua", "minibankNpc_Init");
		Char.SetData(minibank_index,%对象_形象%,10414);
		Char.SetData(minibank_index,%对象_原形%,10414);
		Char.SetData(minibank_index,%对象_X%,17);
		Char.SetData(minibank_index,%对象_Y%,28);
		Char.SetData(minibank_index,%对象_地图%,777);
		Char.SetData(minibank_index,%对象_方向%,4);
		Char.SetData(minibank_index,%对象_名字%,"bank");
		NLG.UpChar(minibank_index);
		--Char.SetTalkedEvent("lua/Module/minibank.lua", "BankAsYouGo_Talked", minibank_index);
		Char.SetWindowTalkedEvent("lua/Module/minibank.lua", "BankAsYouGo_WinTalked", minibank_index);
		tbl_minibankNpc["minibankNpc"] = tonumber(minibank_index);
	end
end


function minibank_Init()
	minibank_create();
	NL.RegItemString("lua/Module/minibank.lua","minibankcard_Event","LUA_useB2");
end


--function BankAsYouGo_Talked(me, tome)
--	NLG.Talked(0, me, tome);
--	return;
--end

function BankAsYouGo_WinTalked(me, tome, seq, select, data)
	NLG.WindowTalked(0, me, tome, seq, select, data);
	return;
end

function minibankcard_Event(charPointer,toPlayerPointer,slot)
	NLG.Talked(1, tonumber(tbl_minibankNpc["minibankNpc"]), charPointer);
	local _itemindex = Char.GetItemIndex(charPointer,slot);
	local lsnj = tonumber(Item.GetData(_itemindex,%道具_耐久%)) - 1;
	if(lsnj <= 0)then
		Item.Kill(charPointer, _itemindex, slot);
	else
		Item.SetData(_itemindex,%道具_耐久%,lsnj);
		Item.UpItem(charPointer, slot);
	end
	
	
	
	
	
	
end


