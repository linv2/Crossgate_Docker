Delegate.RegInit("item_Init");
Delegate.RegDelLoginEvent("item_LoginEvent");
Delegate.RegDelLogoutEvent("item_LogoutEvent");
Delegate.RegDelLoginGateEvent("item_LoginGateEvent");

JpackTable = {10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,12800,12801,12802,12803,12804,12805,12806,12807,12808,12809,12006,12102,12400,11219,12401,12402,12403,12404,11200,11201,11203,12100,12101,12407,12408,12409,12000,12002,12003,11601,11600,12001,12005,11205,11311,11306,11309,12410,12411,12412,12406,12406,11202,11226,12416,12417,12418,12419,12405,15201,15202,15203,15204,15205,15205,15205,15208,15209,15209,15211,15212,15213,15214,15215,15216,15217,15218,15219,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,9600,9601,9602,9603,9604,9605,9606,9607,9608,9609,9611,9612,9613,9614,9615,9616,9617,9618,9619,9620};

function Playerkey2(player)
	local cdkey = Char.GetData(player,%对象_账号%);
	local regnumber = Char.GetData(player,%对象_RegistNumber%);
	return cdkey.."_LS_"..regnumber;

end


function GetItemNum(_player,_ItemId)
	local Count = 0;
	for i = 0,27 do
		local ItemIndex = Char.GetItemIndex(_player,i);
		if(ItemIndex >= 0) then
			if(Item.GetData(ItemIndex,%道具_ID%) == _ItemId) then
				Count = Count + Item.GetData(ItemIndex,%道具_堆叠数%);
			end
		end
	end
	return Count;
end

function item_LoginEvent(player)
	Char.SetWalkPostEvent("lua/Module/item.lua","PostWalkEvent",player);
end
function item_LoginGateEvent(player)
	if(tbl_bx[Playerkey2(player)] ~= nil) then
		tbl_bx[Playerkey2(player)] = nil;
		Char.SetData(player,%对象_香步数%,0);
		Char.SetData(player,%对象_香上限%,0);
		NLG.SystemMessage(player,"检测到您已登回城内记录点,诱魔香状态我们已为您暂停...如要继续,请重新使用..");
	end
end
function item_LogoutEvent(player)
	if(tbl_bx[Playerkey2(player)] ~= nil) then
		tbl_bx[Playerkey2(player)] = nil;
	end
end	
function CheckItem(player,itemindex)
	for i=8,27 do
		if(Char.GetItemIndex(player,i) == itemindex) then
			return i;
		end
	end
	return -1;
end

function PostWalkEvent(player)
	if(tbl_bx[Playerkey2(player)] ~= nil) then
		local ItemSlot = CheckItem(player,tbl_bx[Playerkey2(player)]);
		if(ItemSlot == -1) then
			Item.SetData(tbl_bx[Playerkey2(player)],%道具_耐久%,Item.GetData(tbl_bx[Playerkey2(player)],%道具_耐久%) -1);
			tbl_bx[Playerkey2(player)] = nil;
			Char.SetData(player,%对象_香步数%,0);
			Char.SetData(player,%对象_香上限%,0);
			NLG.SystemMessage(player,"诱魔香已经烧完了...");
		else
			local Rem = Item.GetData(tbl_bx[Playerkey2(player)],%道具_耐久%);
			if(Rem - 1 <= 0) then
				Item.Kill(player,tbl_bx[Playerkey2(player)],ItemSlot);
				tbl_bx[Playerkey2(player)] = nil;
				Char.SetData(player,%对象_香步数%,0);
				Char.SetData(player,%对象_香上限%,0);
				NLG.SystemMessage(player,"诱魔香已经烧完了...");
			else
				Item.SetData(tbl_bx[Playerkey2(player)],%道具_耐久%,Rem -1);
				Item.UpItem(player,ItemSlot);
			end
		end
	end
end

function InTohelos(_meIndex,_toIndex,_itemslot)
	local _itemindex = Char.GetItemIndex(_meIndex,_itemslot);
	if(CheckItem(_meIndex,_itemindex) == -1) then
		NLG.SystemMessage(_meIndex,"道具使用参数错误");
		return;
	end
	if(Item.GetData(_itemindex,%道具_耐久%) <= 0) then
		Item.Kill(_meIndex,_itemindex,_itemslot);
		NLG.SystemMessage(_meIndex,"诱魔香已经烧完了...");
		return;
	end
	if(tbl_bx[Playerkey2(_meIndex)] == nil) then
		tbl_bx[Playerkey2(_meIndex)] = _itemindex;
		Char.SetData(_meIndex,%对象_香步数%,Item.GetData(_itemindex,%道具_耐久%));
		Char.SetData(_meIndex,%对象_香上限%,999);
		NLG.SystemMessage(_meIndex,"诱魔香已经生效了..您在随后的"..Item.GetData(_itemindex,%道具_耐久%).."步内将会步步遇敌!");
	else
		tbl_bx[Playerkey2(_meIndex)] = nil;
		Char.SetData(_meIndex,%对象_香步数%,0);
		Char.SetData(_meIndex,%对象_香上限%,0);
		NLG.SystemMessage(_meIndex,"诱魔香已经暂停了..");
	end
end


function item_Init()

	NL.RegItemString("lua/Module/item.lua","InTohelos","LUA_useInTohelos"); --注册诱魔香
end
