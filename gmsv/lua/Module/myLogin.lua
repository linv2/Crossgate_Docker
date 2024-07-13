local In_situ_login_on_off = "on" ; --是否开放原地登录 on--开放  off--不开放
local In_situ_login_Count = 20; --默认的原地登录次数，和npc领取后补满
local In_situ_login_TimeOut =604800; --原地登录超时时间，单位为秒
local In_situ_login_Limit = false; --是否开放无限次原地登录

local NPCName = "原地登录领取员"; --设置领取原地登录的NPC名字
local NPCPoint = {106602,1000,247,91,6}; --原地登录领取员的原型，地图，X坐标，Y坐标，方向
--  ***************************************************************************************************** --


--注册事件委托
Delegate.RegDelLoginEvent("MyLogin_LoginEvent");
Delegate.RegDelAllOutEvent("MyLogin_OutEvent");
Delegate.RegDelWarpEvent("MyLogin_WarpEvent");
Delegate.RegInit("MyLogin_Init");
-- Delegate.RegDelTalkEvent("MyLogin_TalkEvent");

--存储掉线信息
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
		LoginCount = Char.GetData(player,%对象_登陆次数%);
		
		MapType = Char.GetData(player,%对象_MAP%);  
		MapId = Char.GetData(player,%对象_地图%);	
		X = Char.GetData(player,%对象_X%);
		Y = Char.GetData(player,%对象_Y%);
		
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
		LoginCount = Char.GetData(player,%对象_登陆次数%);
		
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
	

	if(Char.GetData(player,%对象_登陆次数%) == 999)then
		Char.SetData(player, %对象_登陆次数% , 1);
	end
	

	local suss_link = false; --是否成功原地登录
	local suss_Message = "";
	local _playerkey = Playerkey(player);
	local Drop_list = getdropinfofromdb(player);

	if(Drop_list == nil) then
		tbl_dropinfo[_playerkey] = new_tbl_dropinfoobject(player);  --如果是首次登录，获得目前玩家信息，直接返回
		return;
	else
		tbl_dropinfo[_playerkey] = Drop_list;
	end

	if(tbl_In_situsetting.limit == true) then --如果开放无限次原地登录
		suss_Message = "目前服务器开放无限次原地登录，您的连线已经恢复，";
		suss_link = true;
	end
	
	
	if (tonumber(Char.GetData(player,%对象_登陆次数%)) - Drop_list.LoginCount <= 1 and Drop_list.leftCount > 0)then --是否超时，是否换过线，原地登录次数是否充足
	    tbl_dropinfo[_playerkey].leftCount = tbl_dropinfo[_playerkey].leftCount - 1; --减掉一次
		--print("in is"..tbl_dropinfo[_playerkey].leftCount);
		suss_link = true;
	end
	
	--NLG.SystemMessage(player,(os.time() - Drop_list.time).." "..tbl_In_situsetting.timeout.." "..tonumber(Char.GetData(player,%对象_登陆次数%)) - Drop_list.LoginCount.." "..Drop_list.leftCount);
	if(Drop_list.MapType ~= 0) then --如果是在迷宫内掉线
		local Walkable = NLG.Walkable(1,Drop_list.DengonMapId,Drop_list.DengonX,Drop_list.DengonY);
		if (NLG.GetMapName(1,Drop_list.DengonMapId) == Drop_list.DengonName and Walkable == 1) then --如果迷宫还未消失，传送回迷宫
			Drop_list.MapType = 1;
			Drop_list.MapId = Drop_list.DengonMapId;
			Drop_list.X = Drop_list.DengonX;
			Drop_list.Y = Drop_list.DengonY;
			
			suss_Message = "迷宫尚未消失，您的连线已经恢复，";
		else --传送回迷宫口
			Drop_list.MapType = 0;
			suss_Message = "迷宫消失了，将传送到迷宫入口，";
		end
	
	else --如果在常规地图内掉线或者登出
			suss_Message = "您的连线已经恢复，";
	end
	suss_Message = suss_Message.."原地登录次数剩余:"..tbl_dropinfo[_playerkey].leftCount.."次。";
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
	if(Playerinfo.MapType == 0) then  --如果不在迷宫内，则保存常规地图信息。
		Playerinfo.leftCount = tbl_dropinfo[Playerkey(player)].leftCount; --保存当前原地登录次数
		--print("key is "..Playerkey(player));
		--print("value is "..tbl_dropinfo[Playerkey(player)].leftCount);		
		tbl_dropinfo[Playerkey(player)] = Playerinfo; 
		savedropinfotodb(player);
		tbl_dropinfo[Playerkey(player)] = nil;
		return;
	end
	
	if(Playerinfo.MapType == 1) then --如果在迷宫内，则保存迷宫内信息
		local dropinfo = new_tbl_dropinfoobject_without_setting(player); 
		local MapName = NLG.GetMapName(1,Playerinfo.MapId); --获取迷宫名字，如果迷宫消失则回到迷宫口
		dropinfo.MapType = 1;
		dropinfo.DengonMapId = Playerinfo.MapId;
		dropinfo.DengonName = MapName;
		dropinfo.DengonX = Playerinfo.X;
		dropinfo.DengonY = Playerinfo.Y;
		dropinfo.leftCount = tonumber(tbl_dropinfo[Playerkey(player)].leftCount); --保存当前原地登录次数
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
	local partyNum = Char.PartyNum(player); --保存所有队员进入迷宫前的位置信息
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
	print("原地登录npc_index = " .. index);
	return 1;
end

function inityddlNpc()
	if (yddlnpc == nil) then
		yddlnpc = NL.CreateNpc("lua/Module/myLogin.lua", "inityddlNpc_Init");
		Char.SetData(yddlnpc,%对象_形象%,NPCPoint[1]);
		Char.SetData(yddlnpc,%对象_原形%,NPCPoint[1]);
		Char.SetData(yddlnpc,%对象_X%,NPCPoint[3]);
		Char.SetData(yddlnpc,%对象_Y%,NPCPoint[4]);
		Char.SetData(yddlnpc,%对象_地图%,NPCPoint[2]);
		Char.SetData(yddlnpc,%对象_方向%,NPCPoint[5]);
		Char.SetData(yddlnpc,%对象_原名%,NPCName);
		NLG.UpChar(yddlnpc);
		
		--这里是与Npc说话的时候,调用ChangePassMsg函数
		Char.SetTalkedEvent("lua/Module/myLogin.lua","yddlnpcMsg", yddlnpc);
	end
	if (yddlnpc_1 == nil) then
		yddlnpc_1 = NL.CreateNpc("lua/Module/myLogin.lua", "inityddlNpc_Init");
		Char.SetData(yddlnpc_1,%对象_形象%,NPCPoint[1]);
		Char.SetData(yddlnpc_1,%对象_原形%,NPCPoint[1]);
		Char.SetData(yddlnpc_1,%对象_X%,34);
		Char.SetData(yddlnpc_1,%对象_Y%,35);
		Char.SetData(yddlnpc_1,%对象_地图%,777);
		Char.SetData(yddlnpc_1,%对象_方向%,4);
		Char.SetData(yddlnpc_1,%对象_原名%,NPCName);
		NLG.UpChar(yddlnpc_1);
		
		--这里是与Npc说话的时候,调用ChangePassMsg函数
		Char.SetTalkedEvent("lua/Module/myLogin.lua","yddlnpcMsg", yddlnpc_1);
	end
end

function yddlnpcMsg(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		str_ChangeWindow = "\\n\\n 勇者，您的原地登出次数已重置为"..tbl_In_situsetting.defcount.."次！\\n\\n 登出超过3天将返回记录点。";
	    tbl_dropinfo[Playerkey(_tome)].leftCount = tbl_In_situsetting.defcount; 
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,str_ChangeWindow);
		return;
	end
end

function inityddltable_cleanNpc_Init(index)
	print("原地登录内存回收员npc_index = " .. index);
	return 1;
end

function inittable_cleanNpc()
	if (table_cleanNpc == nil) then
		table_cleanNpc = NL.CreateNpc("lua/Module/myLogin.lua", "inityddltable_cleanNpc_Init");
		Char.SetData(table_cleanNpc,%对象_形象%,231088);
		Char.SetData(table_cleanNpc,%对象_原形%,231088);
		Char.SetData(table_cleanNpc,%对象_X%,47);
		Char.SetData(table_cleanNpc,%对象_Y%,47);
		Char.SetData(table_cleanNpc,%对象_地图%,777);
		Char.SetData(table_cleanNpc,%对象_方向%,4);
		Char.SetData(table_cleanNpc,%对象_原名%,"内存回收员");
		NLG.UpChar(table_cleanNpc);
		
		--这里是与Npc说话的时候,调用ChangePassMsg函数
		Char.SetLoopEvent("lua/Module/myLogin.lua","table_cleanNpcLoopEvent", table_cleanNpc,1800); --30分钟执行一次table清理。
	end
end

function table_cleanNpcLoopEvent(index)
   
   --原地登录table清理相关
   --解释：如果超时，那么直接清理掉相关此玩家drop信息。
   
   for i,v in pairs(tbl_dropinfo) do
      if(os.time() - v.time > tbl_In_situsetting.timeout )then
         tbl_dropinfo[i] = nil;
      
      end
   
   end
   
   --结束
  
  
end



function MyLogin_Init()
	
	inityddlNpc();
	--inittable_cleanNpc();

end
