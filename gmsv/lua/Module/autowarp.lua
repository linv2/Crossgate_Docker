warp_map_name = {};
warp_map_point = {};
warp_map_lvlimit = {};
warp_map_payfor = {};
warp_map_daily_user = {};
warp_map_daily_user_count = {};
warp_map_daily_user_count[1] = {};
warp_map_daily_user_count[2] = {};
warp_map_daily_user_count[3] = {};
warp_map_daily_user_count[4] = {};
warp_map_daily_user_count[5] = {};
warp_map_daily_user_count[6] = {};

warp_map_name[2] = "四叶草花园";
warp_map_point[2] = {100,15,11};
warp_map_lvlimit[2] = 60;
warp_map_payfor[2] = 2000;

warp_map_name[3] = "树精的梦境";
warp_map_point[3] = {100,6,93};
warp_map_lvlimit[3] = 80;
warp_map_payfor[3] = 4000;

warp_map_name[4] = "改了";
warp_map_point[4] = {100,41,94};
warp_map_lvlimit[4] = 100;
warp_map_payfor[4] = 1000;

warp_map_name[5] = "修改";
warp_map_point[5] = {100,18,39};
warp_map_lvlimit[5] = 110;
warp_map_payfor[5] = 1000;

Delegate.RegInit("initautowarpNpc");

function initautowarpNpc_Init(index)
	return 1;
end

function Time_Check(_obj) --判定是否一天时间已过
	if (os.date("%d",_obj) ~= os.date("%d",os.time())) then 
		return true;
	end
	return false;
end

function Time_Out(playerindex) --每日24点为判定超时
	local _obj = warp_map_daily_user[Playerkey(playerindex)];
	--如果首次登录
	if (_obj == nil) then 
		warp_map_daily_user[Playerkey(playerindex)] = os.time();
		return true;
	else
		return Time_Check(_obj);
	end
end

function mykgold(_PlayerIndex,gold)
	local tjb = Char.GetData(_PlayerIndex,%对象_金币%);
	tjb = tjb - gold; 
	if(tjb >= 0)then
		Char.SetData(_PlayerIndex,%对象_金币%,tjb);
		NLG.UpChar(_PlayerIndex);
		NLG.SystemMessage(_PlayerIndex,"交出了"..gold.." G魔币。");
		return true;
	end
	return false;
end

function initautowarpNpc()
	if (autowarpNps == nil) then
		autowarpNps = NL.CreateNpc("lua/Module/autowarp.lua", "initautowarpNpc_Init");
		Char.SetData(autowarpNps,%对象_形象%,14520);
		Char.SetData(autowarpNps,%对象_原形%,14520);
		Char.SetData(autowarpNps,%对象_X%,247);
		Char.SetData(autowarpNps,%对象_Y%,90);
		Char.SetData(autowarpNps,%对象_地图%,1000);
		Char.SetData(autowarpNps,%对象_方向%,6);
		Char.SetData(autowarpNps,%对象_原名%,"副本管理员");
		NLG.UpChar(autowarpNps);
		Char.SetWindowTalkedEvent("lua/Module/autowarp.lua","autowarpA",autowarpNps);
		Char.SetTalkedEvent("lua/Module/autowarp.lua","autowarpMsg", autowarpNps);
	end
	if (autowarpNpsB == nil) then
		autowarpNpsB = NL.CreateNpc("lua/Module/autowarp.lua", "initautowarpNpc_Init");
		Char.SetData(autowarpNpsB,%对象_形象%,14566);
		Char.SetData(autowarpNpsB,%对象_原形%,14566);
		Char.SetData(autowarpNpsB,%对象_X%,247);
		Char.SetData(autowarpNpsB,%对象_Y%,92);
		Char.SetData(autowarpNpsB,%对象_地图%,100);
		Char.SetData(autowarpNpsB,%对象_方向%,6);
		Char.SetData(autowarpNpsB,%对象_原名%,"VIP发放员");
		NLG.UpChar(autowarpNpsB);
		Char.SetWindowTalkedEvent("lua/Module/autowarp.lua","autowarpB",autowarpNpsB);
		Char.SetTalkedEvent("lua/Module/autowarp.lua","autowarpMsgB", autowarpNpsB);
	end
end

function autowarpMsgA(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		local PlayerLevel = tonumber(Char.GetData(_tome,%对象_等级%));
		
		if (PlayerLevel < 20) then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n先到达20级再来吧！"));
			return;
		end

		if(Time_Out(_tome))then
			warp_map_daily_user[Playerkey(_tome)] = os.time();
			for i=1,6 do
				warp_map_daily_user_count[i][Playerkey(_tome)] = nil;
			end
		end
		if (Char.HaveItem(_tome,51271) ~= -1) then
			Char.DelItem(_tome,51271,1)
			local PlayerLevel = tonumber(Char.GetData(_tome,%对象_等级%));
			local PlayerExp = tonumber(Char.GetData(_tome,%对象_经验%));
			Char.SetData(_tome,%对象_经验%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n做的好，这是你应得的！"));
			return;
		end
		if (Char.HaveItem(_tome,51270) ~= -1) then
			Char.DelItem(_tome,51270,1);
			Char.GiveItem(_tome, 51268, 1);
			local PlayerLevel = tonumber(Char.GetData(_tome,%对象_等级%));
			local PlayerExp = tonumber(Char.GetData(_tome,%对象_经验%));
			Char.SetData(_tome,%对象_经验%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n做的好，这是你应得的！你愿意帮助我将这些物资运送到圣拉鲁卡村吗？"));
			return;
		end
		if (Char.HaveItem(_tome,51269) ~= -1) then
			Char.DelItem(_tome,51269,1);
			Char.GiveItem(_tome, 51267, 1);
			local PlayerLevel = tonumber(Char.GetData(_tome,%对象_等级%));
			local PlayerExp = tonumber(Char.GetData(_tome,%对象_经验%));
			Char.SetData(_tome,%对象_经验%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n做的好，这是你应得的！你愿意帮助我将这些物资运送到亚留特村吗？"));
			return;
		end

		if (warp_map_daily_user_count[1][Playerkey(_tome)] == 1) then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n明天再来吧！"));
			return;
		end

		Char.GiveItem(_tome, 51266, 1);
		warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,1,NLG.c("\\n\\n\\n你愿意帮助我将这些物资运送到伊尔村吗？"));
	end
	return;
end



function autowarpMsg(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		if(Time_Out(_tome))then
			warp_map_daily_user[Playerkey(_tome)] = os.time();
			for i=1,6 do
				warp_map_daily_user_count[i][Playerkey(_tome)] = nil;
			end
		end

		str_ChangeWindow = "4|\\n\\n 			你好!我是副本管理员.\\n	 			请问你要去哪!...\\n\\n";
		for i=2,3 do
			local tcount = warp_map_daily_user_count[i][Playerkey(_tome)];
			if(tcount == nil)then
				tcount = 1;
			
			else
				tcount = 1 - tcount;
			end
			str_ChangeWindow = str_ChangeWindow .. "<"..warp_map_payfor[i].."G>".." "..warp_map_name[i].." 剩余".."<"..tcount..">次".."\\n";

		end
		NLG.ShowWindowTalked(_tome,_me,%窗口_选择框%,%按钮_关闭%,1,str_ChangeWindow);
	end
	return;
end


function autowarpA(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	if ((_select == 0 or _select == "0") and (_data ~= "")) then
		local selectitem = tonumber(_data)+1;
		

		if (selectitem==nil or (selectitem~=nil and (selectitem > 5 or selectitem <= 0))) then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您所选择的位置不正常!");
				return;
		end

		local getlvlit = warp_map_lvlimit[selectitem];
		if(getlvlit > Char.GetData(_PlayerIndex,%对象_等级%))then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您的等级不够，需要"..getlvlit.."才可进入。");
			return;

		end
		local getcountless = warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)];
		if(getcountless ==nil)then
			getcountless = 0;
			warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)] = 0;
		end
		
		
		if (getcountless >= 1)then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您的次数已经用完了。");
			return;

		end

		if(Char.PartyNum(_PlayerIndex) > 1)then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n请解散队伍。");
			return;
		end

		if(mykgold(_PlayerIndex,warp_map_payfor[selectitem]))then
			warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)] = getcountless + 1;
			Char.DischargeParty(_PlayerIndex)
			Char.Warp(_PlayerIndex,0,warp_map_point[selectitem][1],warp_map_point[selectitem][2],warp_map_point[selectitem][3]);
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,1,"\\n\\n\\n您的魔币不够。");
			return;
		end
	end
end

function autowarpMsgB(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		if(Time_Out(_tome))then
			warp_map_daily_user[Playerkey(_tome)] = os.time();
			for i=1,5 do
				warp_map_daily_user_count[i][Playerkey(_tome)] = nil;
			end
		end
		if (warp_map_daily_user_count[1][Playerkey(_tome)] == 1) then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n明天再来领取吧！"));
			return;
		end
		if (Char.HaveItem(_tome,51125) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 30;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+500);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
		if (Char.HaveItem(_tome,51126) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 60;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+1000);
			local KaShi = Char.GetData(_tome,%对象_卡时%);
			Char.SetData(_tome,%对象_卡时%,KaShi+900);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
		if (Char.HaveItem(_tome,51127) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 90;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+1500);
			local KaShi = Char.GetData(_tome,%对象_卡时%);
			Char.SetData(_tome,%对象_卡时%,KaShi+1800);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
		if (Char.HaveItem(_tome,51128) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 120;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+2000);
			local KaShi = Char.GetData(_tome,%对象_卡时%);
			Char.SetData(_tome,%对象_卡时%,KaShi+2700);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
		if (Char.HaveItem(_tome,51129) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 150;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+2500);
			local KaShi = Char.GetData(_tome,%对象_卡时%);
			Char.SetData(_tome,%对象_卡时%,KaShi+3600);
			NLG.UpChar(_tome);
			Char.GiveItem(_tome, 51043, 1);
			Char.GiveItem(_tome, 51027, 1);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
		if (Char.HaveItem(_tome,51131) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请至少留出1个背包位置！"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%对象_声望%);
			PlayerFame = PlayerFame + 180;
			Char.SetData(_tome,%对象_声望%,PlayerFame);
			local money = Char.GetData(_tome,%对象_金币%);
			Char.SetData(_tome,%对象_金币%,money+3000);
			local KaShi = Char.GetData(_tome,%对象_卡时%);
			Char.SetData(_tome,%对象_卡时%,KaShi+3600);
			NLG.UpChar(_tome);
			Char.GiveItem(_tome, 51043, 1);
			Char.GiveItem(_tome, 51027, 1);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,1,NLG.c("\\n\\n\\n请收好今天的奖励！！"));
		end
	end
	return;
end