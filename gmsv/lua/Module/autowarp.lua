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

warp_map_name[2] = "��Ҷ�ݻ�԰";
warp_map_point[2] = {100,15,11};
warp_map_lvlimit[2] = 60;
warp_map_payfor[2] = 2000;

warp_map_name[3] = "�������ξ�";
warp_map_point[3] = {100,6,93};
warp_map_lvlimit[3] = 80;
warp_map_payfor[3] = 4000;

warp_map_name[4] = "����";
warp_map_point[4] = {100,41,94};
warp_map_lvlimit[4] = 100;
warp_map_payfor[4] = 1000;

warp_map_name[5] = "�޸�";
warp_map_point[5] = {100,18,39};
warp_map_lvlimit[5] = 110;
warp_map_payfor[5] = 1000;

Delegate.RegInit("initautowarpNpc");

function initautowarpNpc_Init(index)
	return 1;
end

function Time_Check(_obj) --�ж��Ƿ�һ��ʱ���ѹ�
	if (os.date("%d",_obj) ~= os.date("%d",os.time())) then 
		return true;
	end
	return false;
end

function Time_Out(playerindex) --ÿ��24��Ϊ�ж���ʱ
	local _obj = warp_map_daily_user[Playerkey(playerindex)];
	--����״ε�¼
	if (_obj == nil) then 
		warp_map_daily_user[Playerkey(playerindex)] = os.time();
		return true;
	else
		return Time_Check(_obj);
	end
end

function mykgold(_PlayerIndex,gold)
	local tjb = Char.GetData(_PlayerIndex,%����_���%);
	tjb = tjb - gold; 
	if(tjb >= 0)then
		Char.SetData(_PlayerIndex,%����_���%,tjb);
		NLG.UpChar(_PlayerIndex);
		NLG.SystemMessage(_PlayerIndex,"������"..gold.." Għ�ҡ�");
		return true;
	end
	return false;
end

function initautowarpNpc()
	if (autowarpNps == nil) then
		autowarpNps = NL.CreateNpc("lua/Module/autowarp.lua", "initautowarpNpc_Init");
		Char.SetData(autowarpNps,%����_����%,14520);
		Char.SetData(autowarpNps,%����_ԭ��%,14520);
		Char.SetData(autowarpNps,%����_X%,247);
		Char.SetData(autowarpNps,%����_Y%,90);
		Char.SetData(autowarpNps,%����_��ͼ%,1000);
		Char.SetData(autowarpNps,%����_����%,6);
		Char.SetData(autowarpNps,%����_ԭ��%,"��������Ա");
		NLG.UpChar(autowarpNps);
		Char.SetWindowTalkedEvent("lua/Module/autowarp.lua","autowarpA",autowarpNps);
		Char.SetTalkedEvent("lua/Module/autowarp.lua","autowarpMsg", autowarpNps);
	end
	if (autowarpNpsB == nil) then
		autowarpNpsB = NL.CreateNpc("lua/Module/autowarp.lua", "initautowarpNpc_Init");
		Char.SetData(autowarpNpsB,%����_����%,14566);
		Char.SetData(autowarpNpsB,%����_ԭ��%,14566);
		Char.SetData(autowarpNpsB,%����_X%,247);
		Char.SetData(autowarpNpsB,%����_Y%,92);
		Char.SetData(autowarpNpsB,%����_��ͼ%,100);
		Char.SetData(autowarpNpsB,%����_����%,6);
		Char.SetData(autowarpNpsB,%����_ԭ��%,"VIP����Ա");
		NLG.UpChar(autowarpNpsB);
		Char.SetWindowTalkedEvent("lua/Module/autowarp.lua","autowarpB",autowarpNpsB);
		Char.SetTalkedEvent("lua/Module/autowarp.lua","autowarpMsgB", autowarpNpsB);
	end
end

function autowarpMsgA(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		local PlayerLevel = tonumber(Char.GetData(_tome,%����_�ȼ�%));
		
		if (PlayerLevel < 20) then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n�ȵ���20�������ɣ�"));
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
			local PlayerLevel = tonumber(Char.GetData(_tome,%����_�ȼ�%));
			local PlayerExp = tonumber(Char.GetData(_tome,%����_����%));
			Char.SetData(_tome,%����_����%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n���ĺã�������Ӧ�õģ�"));
			return;
		end
		if (Char.HaveItem(_tome,51270) ~= -1) then
			Char.DelItem(_tome,51270,1);
			Char.GiveItem(_tome, 51268, 1);
			local PlayerLevel = tonumber(Char.GetData(_tome,%����_�ȼ�%));
			local PlayerExp = tonumber(Char.GetData(_tome,%����_����%));
			Char.SetData(_tome,%����_����%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n���ĺã�������Ӧ�õģ���Ը������ҽ���Щ�������͵�ʥ��³������"));
			return;
		end
		if (Char.HaveItem(_tome,51269) ~= -1) then
			Char.DelItem(_tome,51269,1);
			Char.GiveItem(_tome, 51267, 1);
			local PlayerLevel = tonumber(Char.GetData(_tome,%����_�ȼ�%));
			local PlayerExp = tonumber(Char.GetData(_tome,%����_����%));
			Char.SetData(_tome,%����_����%,PlayerExp+PlayerLevel*PlayerLevel*10);
			NLG.UpChar(_tome);
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n���ĺã�������Ӧ�õģ���Ը������ҽ���Щ�������͵������ش���"));
			return;
		end

		if (warp_map_daily_user_count[1][Playerkey(_tome)] == 1) then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n���������ɣ�"));
			return;
		end

		Char.GiveItem(_tome, 51266, 1);
		warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,1,NLG.c("\\n\\n\\n��Ը������ҽ���Щ�������͵���������"));
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

		str_ChangeWindow = "4|\\n\\n 			���!���Ǹ�������Ա.\\n	 			������Ҫȥ��!...\\n\\n";
		for i=2,3 do
			local tcount = warp_map_daily_user_count[i][Playerkey(_tome)];
			if(tcount == nil)then
				tcount = 1;
			
			else
				tcount = 1 - tcount;
			end
			str_ChangeWindow = str_ChangeWindow .. "<"..warp_map_payfor[i].."G>".." "..warp_map_name[i].." ʣ��".."<"..tcount..">��".."\\n";

		end
		NLG.ShowWindowTalked(_tome,_me,%����_ѡ���%,%��ť_�ر�%,1,str_ChangeWindow);
	end
	return;
end


function autowarpA(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	if ((_select == 0 or _select == "0") and (_data ~= "")) then
		local selectitem = tonumber(_data)+1;
		

		if (selectitem==nil or (selectitem~=nil and (selectitem > 5 or selectitem <= 0))) then
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n����ѡ���λ�ò�����!");
				return;
		end

		local getlvlit = warp_map_lvlimit[selectitem];
		if(getlvlit > Char.GetData(_PlayerIndex,%����_�ȼ�%))then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n���ĵȼ���������Ҫ"..getlvlit.."�ſɽ��롣");
			return;

		end
		local getcountless = warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)];
		if(getcountless ==nil)then
			getcountless = 0;
			warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)] = 0;
		end
		
		
		if (getcountless >= 1)then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n���Ĵ����Ѿ������ˡ�");
			return;

		end

		if(Char.PartyNum(_PlayerIndex) > 1)then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n���ɢ���顣");
			return;
		end

		if(mykgold(_PlayerIndex,warp_map_payfor[selectitem]))then
			warp_map_daily_user_count[selectitem][Playerkey(_PlayerIndex)] = getcountless + 1;
			Char.DischargeParty(_PlayerIndex)
			Char.Warp(_PlayerIndex,0,warp_map_point[selectitem][1],warp_map_point[selectitem][2],warp_map_point[selectitem][3]);
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,1,"\\n\\n\\n����ħ�Ҳ�����");
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
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������ȡ�ɣ�"));
			return;
		end
		if (Char.HaveItem(_tome,51125) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 30;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+500);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
		if (Char.HaveItem(_tome,51126) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 60;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+1000);
			local KaShi = Char.GetData(_tome,%����_��ʱ%);
			Char.SetData(_tome,%����_��ʱ%,KaShi+900);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
		if (Char.HaveItem(_tome,51127) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 90;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+1500);
			local KaShi = Char.GetData(_tome,%����_��ʱ%);
			Char.SetData(_tome,%����_��ʱ%,KaShi+1800);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
		if (Char.HaveItem(_tome,51128) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 120;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+2000);
			local KaShi = Char.GetData(_tome,%����_��ʱ%);
			Char.SetData(_tome,%����_��ʱ%,KaShi+2700);
			NLG.UpChar(_tome);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
		if (Char.HaveItem(_tome,51129) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 150;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+2500);
			local KaShi = Char.GetData(_tome,%����_��ʱ%);
			Char.SetData(_tome,%����_��ʱ%,KaShi+3600);
			NLG.UpChar(_tome);
			Char.GiveItem(_tome, 51043, 1);
			Char.GiveItem(_tome, 51027, 1);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
		if (Char.HaveItem(_tome,51131) ~= -1) then
			if(Char.ItemSlot(_tome)>19)then
				NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n����������1������λ�ã�"));
				return;
			end
			local PlayerFame = Char.GetData(_tome,%����_����%);
			PlayerFame = PlayerFame + 180;
			Char.SetData(_tome,%����_����%,PlayerFame);
			local money = Char.GetData(_tome,%����_���%);
			Char.SetData(_tome,%����_���%,money+3000);
			local KaShi = Char.GetData(_tome,%����_��ʱ%);
			Char.SetData(_tome,%����_��ʱ%,KaShi+3600);
			NLG.UpChar(_tome);
			Char.GiveItem(_tome, 51043, 1);
			Char.GiveItem(_tome, 51027, 1);
			warp_map_daily_user_count[1][Playerkey(_tome)] = 1;
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,1,NLG.c("\\n\\n\\n���պý���Ľ�������"));
		end
	end
	return;
end