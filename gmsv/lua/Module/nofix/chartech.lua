Delegate.RegInit("chartech_Init");

function chartechNpc_Init(index)
	print("TECH_index = " .. index);
	return 1;
end

function chartech_create()
	tbl_chartechNpc = {};
	if (chartech_index == nil) then
		chartech_index = NL.CreateNpc("lua/Module/chartech.lua", "chartechNpc_Init");
		Char.SetData(chartech_index,%对象_形象%,10414);
		Char.SetData(chartech_index,%对象_原形%,10414);
		Char.SetData(chartech_index,%对象_X%,18);
		Char.SetData(chartech_index,%对象_Y%,28);
		Char.SetData(chartech_index,%对象_地图%,777);
		Char.SetData(chartech_index,%对象_方向%,4);
		Char.SetData(chartech_index,%对象_名字%,"chartech");
		NLG.UpChar(chartech_index);
		tbl_chartechNpc["chartechNpc"] = tonumber(chartech_index);
	end
end


function chartech_Init()
	chartech_create();
	NL.RegItemString("lua/Module/chartech.lua","chartechcard_Event","LUA_usechartech");
end



function chartechcard_Event(charPointer,toPlayerPointer,slot)
	local _itemindex = Char.GetItemIndex(charPointer,slot);
	local TechId = Item.GetData(_itemindex,%道具_子参一%);
	local joblv= Item.GetData(_itemindex,%道具_子参二%);
		if Char.HaveSkill(charPointer,TechId)>=0	 then
			NLG.SystemMessage(charPointer,"[系统]已经学习过此技能");
			return;
		end	
		if Char.GetData(charPointer,%对象_职阶%)< joblv	 then
			NLG.SystemMessage(charPointer,"[系统]职业等级不足,请晋级后再学习此技能");
			return;
		end
  	local reset=Char.AddSkill(charPointer,TechId);
  	if reset>=0 then
  		local _ItemNum=Item.GetData(_itemindex ,%道具_堆叠数%)
	if _ItemNum>1 then
		Item.SetData(_itemindex,%道具_堆叠数%,Item.GetData(_itemindex,%道具_堆叠数%)-1)
		Item.UpItem(charPointer, slot);
else
		Item.Kill(charPointer, _itemindex, slot);
	end
			NLG.UpChar(charPointer);
		NLG.SystemMessage(charPointer,"[系统]学习技能成功");
	  else
		NLG.SystemMessage(charPointer,"[系统]请确认是否有空置技能栏");
	end
	
	
	
	
	
	
end


