local In_situ_login_on_off = "on" ; --�Ƿ񿪷�ԭ�ص�¼ on--����  off--������
local In_situ_login_Count = 20; --Ĭ�ϵ�ԭ�ص�¼��������npc��ȡ����
local In_situ_login_TimeOut =604800; --ԭ�ص�¼��ʱʱ�䣬��λΪ��
local In_situ_login_Limit = false; --�Ƿ񿪷����޴�ԭ�ص�¼

local NPCName = "ԭ�ص�¼��ȡԱ"; --������ȡԭ�ص�¼��NPC����
local NPCPoint = {106602,1000,247,91,6}; --ԭ�ص�¼��ȡԱ��ԭ�ͣ���ͼ��X���꣬Y���꣬����
--  ***************************************************************************************************** --


--ע���¼�ί��
Delegate.RegDelLoginEvent("MyLogin_LoginEvent");
Delegate.RegDelAllOutEvent("MyLogin_OutEvent");
Delegate.RegDelWarpEvent("MyLogin_WarpEvent");
Delegate.RegInit("MyLogin_Init");
-- Delegate.RegDelTalkEvent("MyLogin_TalkEvent");

--�洢������Ϣ
tbl_dropinfo = {};
tbl_In_situsetting =
{
    defcount = In_situ_login_Count;
    timeout = In_situ_login_TimeOut; 
    limit = In_situ_login_Limit; 
};

function new_tbl_dropinfoobject(player) 
	
	local lef = 0;
	if(tbl_dropinfo[Playerkey(player)] ~= nil)then
		lef = tbl_dropinfo[Playerkey(player)].leftCount;
	end
	
	local _tbl_dropinfo =
	{
		leftCount = lef;
		LoginCount = Char.GetData(player,%����_��½����%);
		
		MapType = Char.GetData(player,%����_MAP%);  
		MapId = Char.GetData(player,%����_��ͼ%);	
		X = Char.GetData(player,%����_X%);
		Y = Char.GetData(player,%����_Y%);
		
		DengonMapId = 0;
		DengonName = "";
		DengonX = 0;
		DengonY = 0;
		time = os.time();
		IsFeverTime = Char.IsFeverTime(player);
		
	};
	return _tbl_dropinfo;
end

function new_tbl_dropinfoobject_without_setting(player)
	
	local _tbl_dropinfo =
	{
		leftCount = 0;
		LoginCount = Char.GetData(player,%����_��½����%);
		
		MapType = tbl_dropinfo[Playerkey(player)].MapType;        
		MapId = tbl_dropinfo[Playerkey(player)].MapId;	
		X = tbl_dropinfo[Playerkey(player)].X;
		Y = tbl_dropinfo[Playerkey(player)].Y;
		
		DengonMapId = 0;
		DengonName = "";
		DengonX = 0;
		DengonY = 0;
		time = os.time();
		IsFeverTime = Char.IsFeverTime(player);
	};
	return _tbl_dropinfo;
end

function getdropinfofromdb(player)

	local dropinfo = Field.Get(player,"dropinfo");

	if(dropinfo == "") then
		return;
	end

	local dropinfoArray = Split(dropinfo,"_");

	local _tbl_dropinfo =
	{
		leftCount = tonumber(dropinfoArray[1]);
		LoginCount = tonumber(dropinfoArray[2]);
		
		MapType = tonumber(dropinfoArray[3]);
		MapId = tonumber(dropinfoArray[4]);
		X = tonumber(dropinfoArray[5]);
		Y = tonumber(dropinfoArray[6]);
		
		DengonMapId = tonumber(dropinfoArray[7]);
		DengonName = tonumber(dropinfoArray[8]);
		DengonX = tonumber(dropinfoArray[9]);
		DengonY = tonumber(dropinfoArray[10]);
		time = tonumber(dropinfoArray[11]);
		IsFeverTime = tonumber(dropinfoArray[12]);
		
	};

	return _tbl_dropinfo;
end

function savedropinfotodb(player)

	local dropinfostr = tbl_dropinfo[Playerkey(player)].leftCount.."_"..tbl_dropinfo[Playerkey(player)].LoginCount.."_"..tbl_dropinfo[Playerkey(player)].MapType.."_"..tbl_dropinfo[Playerkey(player)].MapId.."_"..tbl_dropinfo[Playerkey(player)].X.."_"..tbl_dropinfo[Playerkey(player)].Y.."_"..tbl_dropinfo[Playerkey(player)].DengonMapId.."_"..tbl_dropinfo[Playerkey(player)].DengonName.."_"..tbl_dropinfo[Playerkey(player)].DengonX.."_"..tbl_dropinfo[Playerkey(player)].DengonY.."_"..tbl_dropinfo[Playerkey(player)].time.."_"..tbl_dropinfo[Playerkey(player)].IsFeverTime;
	Field.Set(player,"dropinfo",""..dropinfostr);
	return;

end

function MyLogin_LoginEvent(player)
	

	if(Char.GetData(player,%����_��½����%) == 999)then
		Char.SetData(player, %����_��½����% , 1);
	end
	

	local suss_link = false; --�Ƿ�ɹ�ԭ�ص�¼
	local suss_Message = "";
	local _playerkey = Playerkey(player);
	local Drop_list = getdropinfofromdb(player);

	if(Drop_list == nil) then
		tbl_dropinfo[_playerkey] = new_tbl_dropinfoobject(player);  --������״ε�¼�����Ŀǰ�����Ϣ��ֱ�ӷ���
		return;
	else
		tbl_dropinfo[_playerkey] = Drop_list;
	end

	if(tbl_In_situsetting.limit == true) then --����������޴�ԭ�ص�¼
		suss_Message = "Ŀǰ�������������޴�ԭ�ص�¼�����������Ѿ��ָ���";
		suss_link = true;
	end
	
	
	if (tonumber(Char.GetData(player,%����_��½����%)) - Drop_list.LoginCount <= 1 and Drop_list.leftCount > 0)then --�Ƿ�ʱ���Ƿ񻻹��ߣ�ԭ�ص�¼�����Ƿ����
	    tbl_dropinfo[_playerkey].leftCount = tbl_dropinfo[_playerkey].leftCount - 1; --����һ��
		--print("in is"..tbl_dropinfo[_playerkey].leftCount);
		suss_link = true;
	end
	
	--NLG.SystemMessage(player,(os.time() - Drop_list.time).." "..tbl_In_situsetting.timeout.." "..tonumber(Char.GetData(player,%����_��½����%)) - Drop_list.LoginCount.." "..Drop_list.leftCount);
	if(Drop_list.MapType ~= 0) then --��������Թ��ڵ���
		local Walkable = NLG.Walkable(1,Drop_list.DengonMapId,Drop_list.DengonX,Drop_list.DengonY);
		if (NLG.GetMapName(1,Drop_list.DengonMapId) == Drop_list.DengonName and Walkable == 1) then --����Թ���δ��ʧ�����ͻ��Թ�
			Drop_list.MapType = 1;
			Drop_list.MapId = Drop_list.DengonMapId;
			Drop_list.X = Drop_list.DengonX;
			Drop_list.Y = Drop_list.DengonY;
			
			suss_Message = "�Թ���δ��ʧ�����������Ѿ��ָ���";
		else --���ͻ��Թ���
			Drop_list.MapType = 0;
			suss_Message = "�Թ���ʧ�ˣ������͵��Թ���ڣ�";
		end
	
	else --����ڳ����ͼ�ڵ��߻��ߵǳ�
			suss_Message = "���������Ѿ��ָ���";
	end
	suss_Message = suss_Message.."ԭ�ص�¼����ʣ��:"..tbl_dropinfo[_playerkey].leftCount.."�Ρ�";
	if(In_situ_login_on_off == "on" and suss_link == true ) then
		--NLG.SystemMessage(player,Drop_list.MapType.." "..Drop_list.MapId.." "..Drop_list.X.." "..Drop_list.Y.." "..Drop_list.DengonName);
		Char.Warp(player,Drop_list.MapType,Drop_list.MapId,Drop_list.X,Drop_list.Y);
		if(tbl_dropinfo[_playerkey].IsFeverTime == 1) then
			Char.FeverStart(player);
		end
		NLG.SystemMessage(player,suss_Message);
	end
	--NLG.SystemMessage(player,Drop_list.MapType.." "..Drop_list.MapId.." "..Drop_list.X.." "..Drop_list.Y.." "..Drop_list.DengonName);
end

function MyLogin_OutEvent(player)

	local Playerinfo = new_tbl_dropinfoobject(player);
	if(Playerinfo.MapType == 0) then  --��������Թ��ڣ��򱣴泣���ͼ��Ϣ��
		Playerinfo.leftCount = tbl_dropinfo[Playerkey(player)].leftCount; --���浱ǰԭ�ص�¼����
		--print("key is "..Playerkey(player));
		--print("value is "..tbl_dropinfo[Playerkey(player)].leftCount);		
		tbl_dropinfo[Playerkey(player)] = Playerinfo; 
		savedropinfotodb(player);
		tbl_dropinfo[Playerkey(player)] = nil;
		return;
	end
	
	if(Playerinfo.MapType == 1) then --������Թ��ڣ��򱣴��Թ�����Ϣ
		local dropinfo = new_tbl_dropinfoobject_without_setting(player); 
		local MapName = NLG.GetMapName(1,Playerinfo.MapId); --��ȡ�Թ����֣�����Թ���ʧ��ص��Թ���
		dropinfo.MapType = 1;
		dropinfo.DengonMapId = Playerinfo.MapId;
		dropinfo.DengonName = MapName;
		dropinfo.DengonX = Playerinfo.X;
		dropinfo.DengonY = Playerinfo.Y;
		dropinfo.leftCount = tonumber(tbl_dropinfo[Playerkey(player)].leftCount); --���浱ǰԭ�ص�¼����
		tbl_dropinfo[Playerkey(player)] = dropinfo; 
		savedropinfotodb(player);
		tbl_dropinfo[Playerkey(player)] = nil;
	end
	
end


function MyLogin_WarpEvent(player,x,y)
	--[[
	local dropinfo = new_tbl_dropinfoobject(player);  
	if(dropinfo.MapType == 0) then 
		dropinfo.leftCount = tonumber(tbl_dropinfo[Playerkey(player)].leftCount); 
		tbl_dropinfo[Playerkey(player)] = dropinfo; 
		
	end--]]
	local partyNum = Char.PartyNum(player); --�������ж�Ա�����Թ�ǰ��λ����Ϣ
		for i=0,partyNum do
			local this_player = Char.GetPartyMember(player,i);
			if(VaildChar(this_player))then
			   local dropinfo = new_tbl_dropinfoobject(this_player);  
				if(dropinfo.MapType == 0) then 
					tbl_dropinfo[Playerkey(this_player)] = dropinfo; 
					--NLG.SystemMessage(this_player,dropinfo.X);
				end
			end
		end
	
end


function inityddlNpc_Init(index)
	print("ԭ�ص�¼npc_index = " .. index);
	return 1;
end

function inityddlNpc()
	if (yddlnpc == nil) then
		yddlnpc = NL.CreateNpc("lua/Module/myLogin.lua", "inityddlNpc_Init");
		Char.SetData(yddlnpc,%����_����%,NPCPoint[1]);
		Char.SetData(yddlnpc,%����_ԭ��%,NPCPoint[1]);
		Char.SetData(yddlnpc,%����_X%,NPCPoint[3]);
		Char.SetData(yddlnpc,%����_Y%,NPCPoint[4]);
		Char.SetData(yddlnpc,%����_��ͼ%,NPCPoint[2]);
		Char.SetData(yddlnpc,%����_����%,NPCPoint[5]);
		Char.SetData(yddlnpc,%����_ԭ��%,NPCName);
		NLG.UpChar(yddlnpc);
		
		--��������Npc˵����ʱ��,����ChangePassMsg����
		Char.SetTalkedEvent("lua/Module/myLogin.lua","yddlnpcMsg", yddlnpc);
	end
	if (yddlnpc_1 == nil) then
		yddlnpc_1 = NL.CreateNpc("lua/Module/myLogin.lua", "inityddlNpc_Init");
		Char.SetData(yddlnpc_1,%����_����%,NPCPoint[1]);
		Char.SetData(yddlnpc_1,%����_ԭ��%,NPCPoint[1]);
		Char.SetData(yddlnpc_1,%����_X%,34);
		Char.SetData(yddlnpc_1,%����_Y%,35);
		Char.SetData(yddlnpc_1,%����_��ͼ%,777);
		Char.SetData(yddlnpc_1,%����_����%,4);
		Char.SetData(yddlnpc_1,%����_ԭ��%,NPCName);
		NLG.UpChar(yddlnpc_1);
		
		--��������Npc˵����ʱ��,����ChangePassMsg����
		Char.SetTalkedEvent("lua/Module/myLogin.lua","yddlnpcMsg", yddlnpc_1);
	end
end

function yddlnpcMsg(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		str_ChangeWindow = "\\n\\n ���ߣ�����ԭ�صǳ�����������Ϊ"..tbl_In_situsetting.defcount.."�Σ�\\n\\n �ǳ�����3�콫���ؼ�¼�㡣";
	    tbl_dropinfo[Playerkey(_tome)].leftCount = tbl_In_situsetting.defcount; 
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,str_ChangeWindow);
		return;
	end
end

function inityddltable_cleanNpc_Init(index)
	print("ԭ�ص�¼�ڴ����Աnpc_index = " .. index);
	return 1;
end

function inittable_cleanNpc()
	if (table_cleanNpc == nil) then
		table_cleanNpc = NL.CreateNpc("lua/Module/myLogin.lua", "inityddltable_cleanNpc_Init");
		Char.SetData(table_cleanNpc,%����_����%,231088);
		Char.SetData(table_cleanNpc,%����_ԭ��%,231088);
		Char.SetData(table_cleanNpc,%����_X%,47);
		Char.SetData(table_cleanNpc,%����_Y%,47);
		Char.SetData(table_cleanNpc,%����_��ͼ%,777);
		Char.SetData(table_cleanNpc,%����_����%,4);
		Char.SetData(table_cleanNpc,%����_ԭ��%,"�ڴ����Ա");
		NLG.UpChar(table_cleanNpc);
		
		--��������Npc˵����ʱ��,����ChangePassMsg����
		Char.SetLoopEvent("lua/Module/myLogin.lua","table_cleanNpcLoopEvent", table_cleanNpc,1800); --30����ִ��һ��table����
	end
end

function table_cleanNpcLoopEvent(index)
   
   --ԭ�ص�¼table�������
   --���ͣ������ʱ����ôֱ���������ش����drop��Ϣ��
   
   for i,v in pairs(tbl_dropinfo) do
      if(os.time() - v.time > tbl_In_situsetting.timeout )then
         tbl_dropinfo[i] = nil;
      
      end
   
   end
   
   --����
  
  
end



function MyLogin_Init()
	
	inityddlNpc();
	--inittable_cleanNpc();

end
