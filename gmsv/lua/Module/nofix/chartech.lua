Delegate.RegInit("chartech_Init");

function chartechNpc_Init(index)
	print("TECH_index = " .. index);
	return 1;
end

function chartech_create()
	tbl_chartechNpc = {};
	if (chartech_index == nil) then
		chartech_index = NL.CreateNpc("lua/Module/chartech.lua", "chartechNpc_Init");
		Char.SetData(chartech_index,%����_����%,10414);
		Char.SetData(chartech_index,%����_ԭ��%,10414);
		Char.SetData(chartech_index,%����_X%,18);
		Char.SetData(chartech_index,%����_Y%,28);
		Char.SetData(chartech_index,%����_��ͼ%,777);
		Char.SetData(chartech_index,%����_����%,4);
		Char.SetData(chartech_index,%����_����%,"chartech");
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
	local TechId = Item.GetData(_itemindex,%����_�Ӳ�һ%);
	local joblv= Item.GetData(_itemindex,%����_�Ӳζ�%);
		if Char.HaveSkill(charPointer,TechId)>=0	 then
			NLG.SystemMessage(charPointer,"[ϵͳ]�Ѿ�ѧϰ���˼���");
			return;
		end	
		if Char.GetData(charPointer,%����_ְ��%)< joblv	 then
			NLG.SystemMessage(charPointer,"[ϵͳ]ְҵ�ȼ�����,���������ѧϰ�˼���");
			return;
		end
  	local reset=Char.AddSkill(charPointer,TechId);
  	if reset>=0 then
  		local _ItemNum=Item.GetData(_itemindex ,%����_�ѵ���%)
	if _ItemNum>1 then
		Item.SetData(_itemindex,%����_�ѵ���%,Item.GetData(_itemindex,%����_�ѵ���%)-1)
		Item.UpItem(charPointer, slot);
else
		Item.Kill(charPointer, _itemindex, slot);
	end
			NLG.UpChar(charPointer);
		NLG.SystemMessage(charPointer,"[ϵͳ]ѧϰ���ܳɹ�");
	  else
		NLG.SystemMessage(charPointer,"[ϵͳ]��ȷ���Ƿ��п��ü�����");
	end
	
	
	
	
	
	
end


