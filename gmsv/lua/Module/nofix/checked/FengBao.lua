Delegate.RegInit("FengBao_Init");

function Init_FengBao(_index)
	return 1;
end

function DelS(s)
        assert(type(s)=="string")
        return s:match("^%s+(.-)%s+$")
end

function FengBao_Init()
	if (FengBao_index == nil) then
		FengBao_index = NL.CreateNpc("lua/Module/FengBao.lua", "Init_FengBao");
		Char.SetData(FengBao_index,%对象_形象%,10414);
		Char.SetData(FengBao_index,%对象_原形%,10414);
		Char.SetData(FengBao_index,%对象_X%,78);
		Char.SetData(FengBao_index,%对象_Y%,77);
		Char.SetData(FengBao_index,%对象_地图%,777);
		Char.SetData(FengBao_index,%对象_方向%,4);
		Char.SetData(FengBao_index,%对象_名字%,"封包NPC");
		NLG.UpChar(FengBao_index);
		Char.SetWindowTalkedEvent("lua/Module/FengBao.lua", "FengBao_WindowEvent", FengBao_index);
	end
	if (PetMarket_index == nil) then
		PetMarket_index = NL.CreateNpc("lua/Module/FengBao.lua", "Init_FengBao");
		Char.SetData(PetMarket_index,%对象_形象%,10414);
		Char.SetData(PetMarket_index,%对象_原形%,10414);
		Char.SetData(PetMarket_index,%对象_X%,78);
		Char.SetData(PetMarket_index,%对象_Y%,77);
		Char.SetData(PetMarket_index,%对象_地图%,777);
		Char.SetData(PetMarket_index,%对象_方向%,4);
		Char.SetData(PetMarket_index,%对象_名字%,"封包NPC");
		NLG.UpChar(PetMarket_index);
		Char.SetWindowTalkedEvent("lua/Module/FengBao.lua", "PetMarket_WindowEvent", PetMarket_index);
	end
	Protocol.OnRecv("lua/Module/FengBao.lua", "DropPet_Recv", %RECV_DP%);
	Protocol.OnRecv("lua/Module/FengBao.lua", "PickItem_Recv", %RECV_PI%);
	Protocol.OnRecv("lua/Module/FengBao.lua", "KN_Recv", %RECV_KN%);
	Protocol.OnRecv("lua/Module/FengBao.lua", "KS_Recv", %RECV_KS%);
end

function KS_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	for i=0,4 do
		local PetPtr = Char.GetPet(player,i);
		local PetName = Char.GetData(PetPtr,%对象_宠名%);
		if check_msg(PetName,"售-") or check_msg(PetName,"0") then
			NLG.SystemMessage(player,"这不是一个合法的宠物名字！");
			return 1;
		end
	end
	return 0;
end

function KN_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local SplitArray = Split(packet,":");
	local PetName = SplitArray[2];

--	if check_msg(PetName,"售-") or check_msg(PetName,"0") or check_msg(PetName,"-") then
--		NLG.SystemMessage(player,"这不是一个合法的宠物名字！");
--		return 1;
--	end
	
	return 0;
end

function PickItem_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local num, playertbl = NLG.GetFrontChar(player, %对象类型_宠%);
	if (num == 0) then
		return;
	end
	local PetPtr = playertbl[1];
	local PetName = Char.GetData(PetPtr,%对象_宠名%);

	local PetMoney = 0;
	local PetMoneyLen = 0;
	local PetMoneyType = "J";
	local PetCDK = "";
	local PlayerCDK = "";
	local PlayerName = "";
	local RealName = "";

	if check_msg(PetName,"售-") then
		local SplitArray = Split(PetName,"-");
		PetMoney = SplitArray[3];

		if check_msg(PetMoney,".") then
			return 0;
		end
		
		PetMoneyLen = tonumber(string.len(PetMoney))-1;
		PetMoneyType = string.sub(PetMoney,PetMoneyLen+1,PetMoneyLen+1);
		PetMoney = string.sub(PetMoney,1,PetMoneyLen);
	
		PetCDK = Char.GetData(PetPtr,%对象_主人CDK%);
		PlayerCDK = Char.GetData(player,%对象_账号%);
		PlayerName = Char.GetData(player,%对象_名字%);
		RealName = Char.GetData(PetPtr,%对象_名字%);
		zhuren = Char.GetData(PetPtr,%对象_主人名字%);
		
		if (PetCDK==PlayerCDK) then
			Char.SetData(PetPtr,%对象_宠名%,PetMoney);
			return 0;
		end
	else
		if (PetCDK==PlayerCDK) then
			return 0;
		end
	end
	
	if check_msg(PetName,"售-") then

		local pet_indexA = PetPtr;

		local petIndex = Char.GetData(pet_indexA,1);
		local arr_rank1 = Pet.GetArtRank(pet_indexA,%宠档_体成%);
		local arr_rank11 = Pet.FullArtRank(pet_indexA,%宠档_体成%);
		local arr_rank2 = Pet.GetArtRank(pet_indexA,%宠档_力成%);
		local arr_rank21 = Pet.FullArtRank(pet_indexA,%宠档_力成%);
		local arr_rank3 = Pet.GetArtRank(pet_indexA,%宠档_强成%);
		local arr_rank31 = Pet.FullArtRank(pet_indexA,%宠档_强成%);
		local arr_rank4 = Pet.GetArtRank(pet_indexA,%宠档_敏成%);
		local arr_rank41 = Pet.FullArtRank(pet_indexA,%宠档_敏成%);
		local arr_rank5 = Pet.GetArtRank(pet_indexA,%宠档_魔成%);
		local arr_rank51 = Pet.FullArtRank(pet_indexA,%宠档_魔成%);
		local a1 = math.abs(arr_rank1 - arr_rank11);
		local a2 = math.abs(arr_rank2 - arr_rank21);
		local a3 = math.abs(arr_rank3 - arr_rank31);
		local a4 = math.abs(arr_rank4 - arr_rank41);
		local a5 = math.abs(arr_rank5 - arr_rank51);
		local a6 = a1 + a2+ a3+ a4+ a5;
		local OneLevel = Char.GetData(pet_indexA,52);
		local writestr = "";
		if (OneLevel > 1) then
			writestr = "野生：是，"
		else
			writestr = "野生：否，"
		end
		if(a6==0)then
			writestr = writestr.."宠物名："..RealName.."，等级："..Char.GetData(PetPtr,%对象_等级%).."\\n售价："..PetMoney..PetMoneyType..""
					.."\\n".."摊主："..zhuren.."\\n";
					local XZNum1 = Char.GetData(pet_indexA,%对象_闪躲%);
					local XZNum2 = Char.GetData(pet_indexA,%对象_命中%);
					local XZNum3 = Char.GetData(pet_indexA,%对象_反击%);
					local XZNum4 = Char.GetData(pet_indexA,%对象_必杀%);	
					writestr = writestr.."闪躲:"..XZNum1.."，命中:"..XZNum2.."，反击:"..XZNum3.."，必杀:"..XZNum4.."\\n";
					XZNum1 = Char.GetData(pet_indexA,%对象_抗毒%);
					XZNum2 = Char.GetData(pet_indexA,%对象_抗睡%);
					XZNum3 = Char.GetData(pet_indexA,%对象_抗石%);
					XZNum4 = Char.GetData(pet_indexA,%对象_抗醉%);	
					local XZNum5 = Char.GetData(pet_indexA,%对象_抗乱%);
					local XZNum6 = Char.GetData(pet_indexA,%对象_抗忘%);
					writestr = writestr.."毒:"..XZNum1.."，睡:"..XZNum2.."，石:"..XZNum3.."，醉:"..XZNum4.."，乱:"..XZNum5.."，忘:"..XZNum6.."\\n"
					.."\\n该宠物总掉档数: 掉["..a6.."]档\\n\\n是否购买？";
		else
			writestr = writestr.."宠物名："..RealName.."，等级："..Char.GetData(PetPtr,%对象_等级%).."\\n售价："..PetMoney..PetMoneyType..""
					.."\\n".."摊主："..zhuren.."\\n".."体力掉［"..a1.."］档\\n"
					.."力量掉［"..a2.."］档\\n防御掉［"..a3.."］档\\n"
					.."敏捷掉［"..a4.."］档\\n魔法掉［"..a5.."］档\\n";
					local XZNum1 = Char.GetData(pet_indexA,%对象_闪躲%);
					local XZNum2 = Char.GetData(pet_indexA,%对象_命中%);
					local XZNum3 = Char.GetData(pet_indexA,%对象_反击%);
					local XZNum4 = Char.GetData(pet_indexA,%对象_必杀%);	
					writestr = writestr.."闪躲:"..XZNum1.."，命中:"..XZNum2.."，反击:"..XZNum3.."，必杀:"..XZNum4.."\\n";
					XZNum1 = Char.GetData(pet_indexA,%对象_抗毒%);
					XZNum2 = Char.GetData(pet_indexA,%对象_抗睡%);
					XZNum3 = Char.GetData(pet_indexA,%对象_抗石%);
					XZNum4 = Char.GetData(pet_indexA,%对象_抗醉%);	
					local XZNum5 = Char.GetData(pet_indexA,%对象_抗乱%);
					local XZNum6 = Char.GetData(pet_indexA,%对象_抗忘%);
					writestr = writestr.."毒:"..XZNum1.."，睡:"..XZNum2.."，石:"..XZNum3.."，醉:"..XZNum4.."，乱:"..XZNum5.."，忘:"..XZNum6.."\\n"
					.."该宠物总掉档数: 掉["..a6.."]档\\n\\n是否购买？";
		end
		NLG.ShowWindowTalked( player, PetMarket_index, %窗口_信息框%, %按钮_确定关闭%, PetPtr, writestr);
		return 1;
	else
		return 0;
	end
end

function DropPet_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local SplitArray = Split(packet,":");
	local PetSlot = tonumber(SplitArray[3]);
	local _Pet = Char.GetPet(player,PetSlot);
	local PetName = Char.GetData(_Pet,%对象_名字%);
	local PetUserName = Char.GetData(_Pet,%对象_宠名%);

	if check_msg(PetUserName,"售-") then
		NLG.SystemMessage(player,"请先更改宠物的名字再放出！");
		return 1;
	end

	if tonumber(PetUserName)~=nil then
		local pet_indexA = _Pet;

		local petIndex = Char.GetData(pet_indexA,1);
		local arr_rank1 = Pet.GetArtRank(pet_indexA,%宠档_体成%);
		local arr_rank11 = Pet.FullArtRank(pet_indexA,%宠档_体成%);
		local arr_rank2 = Pet.GetArtRank(pet_indexA,%宠档_力成%);
		local arr_rank21 = Pet.FullArtRank(pet_indexA,%宠档_力成%);
		local arr_rank3 = Pet.GetArtRank(pet_indexA,%宠档_强成%);
		local arr_rank31 = Pet.FullArtRank(pet_indexA,%宠档_强成%);
		local arr_rank4 = Pet.GetArtRank(pet_indexA,%宠档_敏成%);
		local arr_rank41 = Pet.FullArtRank(pet_indexA,%宠档_敏成%);
		local arr_rank5 = Pet.GetArtRank(pet_indexA,%宠档_魔成%);
		local arr_rank51 = Pet.FullArtRank(pet_indexA,%宠档_魔成%);
		local a1 = math.abs(arr_rank1 - arr_rank11);
		local a2 = math.abs(arr_rank2 - arr_rank21);
		local a3 = math.abs(arr_rank3 - arr_rank31);
		local a4 = math.abs(arr_rank4 - arr_rank41);
		local a5 = math.abs(arr_rank5 - arr_rank51);
		local a6 = a1 + a2+ a3+ a4+ a5;

		local actural_price = math.floor(tonumber(PetUserName));
		
		if actural_price > 5000 then
		Char.SetData(_Pet,%对象_宠名%,"售-"..a6.."D-"..tostring(actural_price).."G");
		-- Char.SetData(_Pet,%对象_宠名%,"[售]"..a1..a2..a3..a4..a5.."-"..tostring(actural_price).."G");
		else
		Char.SetData(_Pet,%对象_宠名%,"售-"..a6.."D-"..tostring(actural_price).."J");
		end

		NLG.SystemMessage(player,"如未售出，请于72小时内（3天）领回，否则宠物将消失（GM也无法找回）！");
	end

	return 0;
end

function PetMarket_WindowEvent( _index_me, _index_tome, _sequence, _select, _data)	
	if (Pet.IsPet(_sequence) and _select == %按钮_确定%) then
		local PetPtr = _sequence;
		local PlayerName = Char.GetData(_index_tome,%对象_名字%);
		local PlayerCDK = Char.GetData(_index_tome,%对象_账号%);
		local RealName = Char.GetData(PetPtr,%对象_名字%);
		local PetName = Char.GetData(PetPtr,%对象_宠名%);
		local PetOwner = Char.GetData(PetPtr,%对象_主人CDK%);
		local buyerlevel = math.abs(Char.GetData(_index_tome,%对象_等级%));--获取买家等级
		local petlevel = math.abs(Char.GetData(PetPtr,8));
		local SplitArray = Split(PetName,"-");
		local PetMoney = SplitArray[3];
		local PetMoneyLen = tonumber(string.len(PetMoney))-1;
		local PetMoneyType = string.sub(PetMoney,PetMoneyLen+1,PetMoneyLen+1);
		PetMoney = string.sub(PetMoney,1,PetMoneyLen);
		PetMoney = tonumber(PetMoney);
		
	if (buyerlevel >= petlevel) then
		
		if PetMoneyType == "J" then
		if (Char.ItemNum(_index_tome,888888)<PetMoney or PetMoney<1) then
			NLG.SystemMessage(_index_tome,"您的金钥匙不够！");
			return
		end
		if (Char.DelItem(_index_tome,888888,PetMoney)==0) then
			NLG.SystemMessage(_index_tome,"您的金钥匙不够！");
			return
		end

		local query = "Update tbl_user Set PetMoney=PetMoney+"..PetMoney.." Where CdKey='"..PetOwner.."'";
		local Result = SQL.Run(query);
		end

		if PetMoneyType == "G" then
		local PlayerMoney = Char.GetData(_index_tome,%对象_金币%);
		if (PlayerMoney<PetMoney or PetMoney<1) then
			NLG.SystemMessage(_index_tome,"您的魔币不够！");
			return
		end

		Char.SetData(_index_tome,%对象_金币%,PlayerMoney-PetMoney);
		NLG.UpChar(_index_tome);

		local query = "Update tbl_user Set PetMB=PetMB+"..PetMoney.." Where CdKey='"..PetOwner.."'";
		local Result = SQL.Run(query);
		end

		Char.SetData(PetPtr,%对象_主人CDK%,PlayerCDK);
		Char.SetData(PetPtr,%对象_账号%,PlayerCDK);
		Char.SetData(PetPtr,%对象_名字%,RealName);
		Char.SetData(PetPtr,%对象_宠名%,RealName);
		
		NLG.SystemMessage(_index_tome,RealName.."购买成功！请再次点击该宠物领走它！");
		return;
		else 
		NLG.SystemMessage(_index_tome,"玩家您好，您的等级不足以购买他！快去练级吧！");
	end
	end
	
end