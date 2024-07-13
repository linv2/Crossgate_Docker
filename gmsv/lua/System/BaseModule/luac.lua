tbl_daily = {};
local MakeItemJMXCallWord = "makeitemjmx"


function ScriptCall(npc, player, s)
	if(string.find(s,"getbanklimit"))then
		return tonumber(Char.GetData(player, %对象_银行最大物数%));
    end
	
	
	if(string.find(s,"setbanklimit40"))then
		Char.SetData(player, %对象_银行最大物数%,40);

		return 0;
    end

	if(string.find(s,"setbanklimit60"))then
		Char.SetData(player, %对象_银行最大物数%,60);

		return 0;
    end

	if(string.find(s,"setbanklimit80"))then
		Char.SetData(player, %对象_银行最大物数%,80);

		return 0;
    end

	if(string.find(s,"getdefcount"))then
		if(tbl_dropinfo[Playerkey(player)].leftCount == nil)then
			return 0;
		end
		return tbl_dropinfo[Playerkey(player)].leftCount;
	end

	if(string.find(s,"adddefcount"))then	
		
		if(tbl_dropinfo[Playerkey(player)] == nil)then
			tbl_dropinfo[Playerkey(player)].leftCount = 0;
		else
			tbl_dropinfo[Playerkey(player)].leftCount = tonumber(tbl_dropinfo[Playerkey(player)].leftCount) + 1;
		end
		return 1;
	end
	
	if(string.find(s,"addfame"))then
		local sv = string.gsub(s, "addfame", "");
		local tfame = tonumber(Char.GetData(player,%对象_声望%));
		Char.SetData(player,%对象_声望%,tfame + tonumber(sv));
		NLG.TalkToCli(player,-1,"声望增加了:"..sv.."点.",%颜色_黄色%,%字体_中%);
	end
	
	if(string.find(s,"enstart"))then
		
		local sv = string.gsub(s, "enstart", "");
		local _itemindex = Char.HaveItem(player,tonumber(sv));
		local wz = 0;
		for i=8,27 do
			local ls_itemindex = Char.GetItemIndex(player,i);
			if(_itemindex == ls_itemindex)then
				wz = i;
				break;
			end
		end
		if(wz == 0)then
			return;
		end
		local _zc1 = Item.GetData(_itemindex,%道具_子参一%);
		local _zc2 = Item.GetData(_itemindex,%道具_子参二%);
--	    NLG.TalkToCli(player,-1,"参一:".._zc1.."参二:".._zc2.."位置:"..wz.."index:".._itemindex,%颜色_黄色%,%字体_中%);
		ItemFarm_func(player, wz,_zc1,_zc2);
	end
	
	if(string.find(s,"daily"))then
		local sv = string.gsub(s, "daily", "");	
		local playerkeyname = Playerkey(player)..sv;
		if(tbl_daily[playerkeyname] == nil)then
			tbl_daily[playerkeyname] = os.time();
			return 1;
		end
						
		if (os.date("%d",tbl_daily[playerkeyname]) ~= os.date("%d",os.time())) then 
			tbl_daily[playerkeyname] = os.time();
			return 1;
		end
		
		return 0;
	end
	
	if(string.find(s,"setnpass"))then
		kickbot_NpassTime[player] = os.time();
	end
	
	if(string.find(s,"getswjjczt"))then
		return tonumber(tbl_swjjc_setting.zt);
		
	end
	
	if(string.find(s,"diywarp"))then
		return rb_checkuser(player);
		
	end
	
	if string.sub(s,1,string.len(MakeItemJMXCallWord)) == MakeItemJMXCallWord then
		if JMXFootTable[player] then
			JMXMainTable[player] = nil
			JMXFootTable[player] = nil
			NLG.SystemMessage(player,"熄灭了聚魔香。")
		else
			local jmxitemid = tonumber(string.sub(s,string.len(MakeItemJMXCallWord)+1,-1))
			if jmxitemid then
				JMXFootTable[player] = jmxitemid
				NLG.SystemMessage(player,"点燃了聚魔香。")
				Char.SetWalkPostEvent(nil,"JMXFootLoop",player)
			else
				NLG.SystemMessage(player,"道具设置错误。")
				return 1
			end
		end
	end

	if(string.find(s,"daily"))then
		local sv = string.gsub(s, "daily", "");	
		local playerkeyname = Playerkey(player)..sv;
		if(tbl_daily[playerkeyname] == nil)then
			tbl_daily[playerkeyname] = os.time();
			return 1;
		end
						
		if (os.date("%d",tbl_daily[playerkeyname]) ~= os.date("%d",os.time())) then 
			tbl_daily[playerkeyname] = os.time();
			return 1;
		end
		
		return 0;
	end
		

	if(string.find(s,"setdy"))then
		local sv = string.gsub(s, "setdy", "");	
		local playerkeyname = Playerkey(player)..sv;
		tbl_daily[playerkeyname] = tonumber(os.date("%d",os.time()));
		return 1;
	end

	
	if(string.find(s,"setskilllv"))then	
		local sv = string.gsub(s, "setskilllv", "");
		if(sv~=nil and sv~=0)then
			local svA =Split(sv,",");			
			local skillid = tonumber(svA[1]);
			local setexp = tonumber(svA[2]);
			local level = tonumber(svA[3]);
			local skillpos = Char.HaveSkill(player,skillid);
			if(skillpos == -1)then
				Char.AddSkill(player,skillid,setexp);
				local skillpos2 = Char.HaveSkill(player,skillid);
				if(skillpos2 == -1)then
					return 0;
				end
				Char.SetSkillLevel(player,skillpos2, level)
				NLG.UpChar(player);
				return 1;
			end
			return 0;
		end
	end

	if(string.find(s,"getflg"))then
		local get = NLG.GetString(s,"getflg",0);
		local ret = EventExpandCheckFlgCall(player,get);
		return ret;
	end
	

	if(string.find(s,"setflg"))then
		local get = NLG.GetString(s,"setflg",0);
		local ret = EventExpandSetFlgCall(player,get);
		return ret;
	end
	

	if(string.find(s,"delflg"))then
		local get = NLG.GetString(s,"setflg",0);
		local ret = EventExpandClsFlgCall(player,get);
		return ret;
	end
	
	if(string.find(s,"likeme"))then
		
		Char.SetData(player,%对象_形象%,Char.GetData(npc, %对象_形象%));
		Char.SetData(player,%对象_原形%,Char.GetData(npc, %对象_原形%));
		Char.SetData(player,%对象_原始图档%,Char.GetData(npc, %对象_原始图档%));
		NLG.UpChar(player);
	end
	
	if(string.find(s,"petme"))then
		local petindex = Char.GetPet(player,0);
		if petindex >= 0 then
 			Char.SetData(petindex,%对象_形象%,Char.GetData(npc, %对象_形象%));
			Char.SetData(petindex,%对象_原形%,Char.GetData(npc, %对象_原形%));
			Char.SetData(petindex,%对象_原始图档%,Char.GetData(npc, %对象_原始图档%));
			Pet.UpPet(player, petindex);
			NLG.UpChar(player);
		end
	end
	
end




