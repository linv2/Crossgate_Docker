tbl_daily = {};
local MakeItemJMXCallWord = "makeitemjmx"


function ScriptCall(npc, player, s)
	if(string.find(s,"getbanklimit"))then
		return tonumber(Char.GetData(player, %����_�����������%));
    end
	
	
	if(string.find(s,"setbanklimit40"))then
		Char.SetData(player, %����_�����������%,40);

		return 0;
    end

	if(string.find(s,"setbanklimit60"))then
		Char.SetData(player, %����_�����������%,60);

		return 0;
    end

	if(string.find(s,"setbanklimit80"))then
		Char.SetData(player, %����_�����������%,80);

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
		local tfame = tonumber(Char.GetData(player,%����_����%));
		Char.SetData(player,%����_����%,tfame + tonumber(sv));
		NLG.TalkToCli(player,-1,"����������:"..sv.."��.",%��ɫ_��ɫ%,%����_��%);
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
		local _zc1 = Item.GetData(_itemindex,%����_�Ӳ�һ%);
		local _zc2 = Item.GetData(_itemindex,%����_�Ӳζ�%);
--	    NLG.TalkToCli(player,-1,"��һ:".._zc1.."�ζ�:".._zc2.."λ��:"..wz.."index:".._itemindex,%��ɫ_��ɫ%,%����_��%);
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
			NLG.SystemMessage(player,"Ϩ���˾�ħ�㡣")
		else
			local jmxitemid = tonumber(string.sub(s,string.len(MakeItemJMXCallWord)+1,-1))
			if jmxitemid then
				JMXFootTable[player] = jmxitemid
				NLG.SystemMessage(player,"��ȼ�˾�ħ�㡣")
				Char.SetWalkPostEvent(nil,"JMXFootLoop",player)
			else
				NLG.SystemMessage(player,"�������ô���")
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
		
		Char.SetData(player,%����_����%,Char.GetData(npc, %����_����%));
		Char.SetData(player,%����_ԭ��%,Char.GetData(npc, %����_ԭ��%));
		Char.SetData(player,%����_ԭʼͼ��%,Char.GetData(npc, %����_ԭʼͼ��%));
		NLG.UpChar(player);
	end
	
	if(string.find(s,"petme"))then
		local petindex = Char.GetPet(player,0);
		if petindex >= 0 then
 			Char.SetData(petindex,%����_����%,Char.GetData(npc, %����_����%));
			Char.SetData(petindex,%����_ԭ��%,Char.GetData(npc, %����_ԭ��%));
			Char.SetData(petindex,%����_ԭʼͼ��%,Char.GetData(npc, %����_ԭʼͼ��%));
			Pet.UpPet(player, petindex);
			NLG.UpChar(player);
		end
	end
	
end




