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
		Char.SetData(FengBao_index,%����_����%,10414);
		Char.SetData(FengBao_index,%����_ԭ��%,10414);
		Char.SetData(FengBao_index,%����_X%,78);
		Char.SetData(FengBao_index,%����_Y%,77);
		Char.SetData(FengBao_index,%����_��ͼ%,777);
		Char.SetData(FengBao_index,%����_����%,4);
		Char.SetData(FengBao_index,%����_����%,"���NPC");
		NLG.UpChar(FengBao_index);
		Char.SetWindowTalkedEvent("lua/Module/FengBao.lua", "FengBao_WindowEvent", FengBao_index);
	end
	if (PetMarket_index == nil) then
		PetMarket_index = NL.CreateNpc("lua/Module/FengBao.lua", "Init_FengBao");
		Char.SetData(PetMarket_index,%����_����%,10414);
		Char.SetData(PetMarket_index,%����_ԭ��%,10414);
		Char.SetData(PetMarket_index,%����_X%,78);
		Char.SetData(PetMarket_index,%����_Y%,77);
		Char.SetData(PetMarket_index,%����_��ͼ%,777);
		Char.SetData(PetMarket_index,%����_����%,4);
		Char.SetData(PetMarket_index,%����_����%,"���NPC");
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
		local PetName = Char.GetData(PetPtr,%����_����%);
		if check_msg(PetName,"��-") or check_msg(PetName,"0") then
			NLG.SystemMessage(player,"�ⲻ��һ���Ϸ��ĳ������֣�");
			return 1;
		end
	end
	return 0;
end

function KN_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local SplitArray = Split(packet,":");
	local PetName = SplitArray[2];

--	if check_msg(PetName,"��-") or check_msg(PetName,"0") or check_msg(PetName,"-") then
--		NLG.SystemMessage(player,"�ⲻ��һ���Ϸ��ĳ������֣�");
--		return 1;
--	end
	
	return 0;
end

function PickItem_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local num, playertbl = NLG.GetFrontChar(player, %��������_��%);
	if (num == 0) then
		return;
	end
	local PetPtr = playertbl[1];
	local PetName = Char.GetData(PetPtr,%����_����%);

	local PetMoney = 0;
	local PetMoneyLen = 0;
	local PetMoneyType = "J";
	local PetCDK = "";
	local PlayerCDK = "";
	local PlayerName = "";
	local RealName = "";

	if check_msg(PetName,"��-") then
		local SplitArray = Split(PetName,"-");
		PetMoney = SplitArray[3];

		if check_msg(PetMoney,".") then
			return 0;
		end
		
		PetMoneyLen = tonumber(string.len(PetMoney))-1;
		PetMoneyType = string.sub(PetMoney,PetMoneyLen+1,PetMoneyLen+1);
		PetMoney = string.sub(PetMoney,1,PetMoneyLen);
	
		PetCDK = Char.GetData(PetPtr,%����_����CDK%);
		PlayerCDK = Char.GetData(player,%����_�˺�%);
		PlayerName = Char.GetData(player,%����_����%);
		RealName = Char.GetData(PetPtr,%����_����%);
		zhuren = Char.GetData(PetPtr,%����_��������%);
		
		if (PetCDK==PlayerCDK) then
			Char.SetData(PetPtr,%����_����%,PetMoney);
			return 0;
		end
	else
		if (PetCDK==PlayerCDK) then
			return 0;
		end
	end
	
	if check_msg(PetName,"��-") then

		local pet_indexA = PetPtr;

		local petIndex = Char.GetData(pet_indexA,1);
		local arr_rank1 = Pet.GetArtRank(pet_indexA,%�赵_���%);
		local arr_rank11 = Pet.FullArtRank(pet_indexA,%�赵_���%);
		local arr_rank2 = Pet.GetArtRank(pet_indexA,%�赵_����%);
		local arr_rank21 = Pet.FullArtRank(pet_indexA,%�赵_����%);
		local arr_rank3 = Pet.GetArtRank(pet_indexA,%�赵_ǿ��%);
		local arr_rank31 = Pet.FullArtRank(pet_indexA,%�赵_ǿ��%);
		local arr_rank4 = Pet.GetArtRank(pet_indexA,%�赵_����%);
		local arr_rank41 = Pet.FullArtRank(pet_indexA,%�赵_����%);
		local arr_rank5 = Pet.GetArtRank(pet_indexA,%�赵_ħ��%);
		local arr_rank51 = Pet.FullArtRank(pet_indexA,%�赵_ħ��%);
		local a1 = math.abs(arr_rank1 - arr_rank11);
		local a2 = math.abs(arr_rank2 - arr_rank21);
		local a3 = math.abs(arr_rank3 - arr_rank31);
		local a4 = math.abs(arr_rank4 - arr_rank41);
		local a5 = math.abs(arr_rank5 - arr_rank51);
		local a6 = a1 + a2+ a3+ a4+ a5;
		local OneLevel = Char.GetData(pet_indexA,52);
		local writestr = "";
		if (OneLevel > 1) then
			writestr = "Ұ�����ǣ�"
		else
			writestr = "Ұ������"
		end
		if(a6==0)then
			writestr = writestr.."��������"..RealName.."���ȼ���"..Char.GetData(PetPtr,%����_�ȼ�%).."\\n�ۼۣ�"..PetMoney..PetMoneyType..""
					.."\\n".."̯����"..zhuren.."\\n";
					local XZNum1 = Char.GetData(pet_indexA,%����_����%);
					local XZNum2 = Char.GetData(pet_indexA,%����_����%);
					local XZNum3 = Char.GetData(pet_indexA,%����_����%);
					local XZNum4 = Char.GetData(pet_indexA,%����_��ɱ%);	
					writestr = writestr.."����:"..XZNum1.."������:"..XZNum2.."������:"..XZNum3.."����ɱ:"..XZNum4.."\\n";
					XZNum1 = Char.GetData(pet_indexA,%����_����%);
					XZNum2 = Char.GetData(pet_indexA,%����_��˯%);
					XZNum3 = Char.GetData(pet_indexA,%����_��ʯ%);
					XZNum4 = Char.GetData(pet_indexA,%����_����%);	
					local XZNum5 = Char.GetData(pet_indexA,%����_����%);
					local XZNum6 = Char.GetData(pet_indexA,%����_����%);
					writestr = writestr.."��:"..XZNum1.."��˯:"..XZNum2.."��ʯ:"..XZNum3.."����:"..XZNum4.."����:"..XZNum5.."����:"..XZNum6.."\\n"
					.."\\n�ó����ܵ�����: ��["..a6.."]��\\n\\n�Ƿ���";
		else
			writestr = writestr.."��������"..RealName.."���ȼ���"..Char.GetData(PetPtr,%����_�ȼ�%).."\\n�ۼۣ�"..PetMoney..PetMoneyType..""
					.."\\n".."̯����"..zhuren.."\\n".."��������"..a1.."�ݵ�\\n"
					.."��������"..a2.."�ݵ�\\n��������"..a3.."�ݵ�\\n"
					.."���ݵ���"..a4.."�ݵ�\\nħ������"..a5.."�ݵ�\\n";
					local XZNum1 = Char.GetData(pet_indexA,%����_����%);
					local XZNum2 = Char.GetData(pet_indexA,%����_����%);
					local XZNum3 = Char.GetData(pet_indexA,%����_����%);
					local XZNum4 = Char.GetData(pet_indexA,%����_��ɱ%);	
					writestr = writestr.."����:"..XZNum1.."������:"..XZNum2.."������:"..XZNum3.."����ɱ:"..XZNum4.."\\n";
					XZNum1 = Char.GetData(pet_indexA,%����_����%);
					XZNum2 = Char.GetData(pet_indexA,%����_��˯%);
					XZNum3 = Char.GetData(pet_indexA,%����_��ʯ%);
					XZNum4 = Char.GetData(pet_indexA,%����_����%);	
					local XZNum5 = Char.GetData(pet_indexA,%����_����%);
					local XZNum6 = Char.GetData(pet_indexA,%����_����%);
					writestr = writestr.."��:"..XZNum1.."��˯:"..XZNum2.."��ʯ:"..XZNum3.."����:"..XZNum4.."����:"..XZNum5.."����:"..XZNum6.."\\n"
					.."�ó����ܵ�����: ��["..a6.."]��\\n\\n�Ƿ���";
		end
		NLG.ShowWindowTalked( player, PetMarket_index, %����_��Ϣ��%, %��ť_ȷ���ر�%, PetPtr, writestr);
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
	local PetName = Char.GetData(_Pet,%����_����%);
	local PetUserName = Char.GetData(_Pet,%����_����%);

	if check_msg(PetUserName,"��-") then
		NLG.SystemMessage(player,"���ȸ��ĳ���������ٷų���");
		return 1;
	end

	if tonumber(PetUserName)~=nil then
		local pet_indexA = _Pet;

		local petIndex = Char.GetData(pet_indexA,1);
		local arr_rank1 = Pet.GetArtRank(pet_indexA,%�赵_���%);
		local arr_rank11 = Pet.FullArtRank(pet_indexA,%�赵_���%);
		local arr_rank2 = Pet.GetArtRank(pet_indexA,%�赵_����%);
		local arr_rank21 = Pet.FullArtRank(pet_indexA,%�赵_����%);
		local arr_rank3 = Pet.GetArtRank(pet_indexA,%�赵_ǿ��%);
		local arr_rank31 = Pet.FullArtRank(pet_indexA,%�赵_ǿ��%);
		local arr_rank4 = Pet.GetArtRank(pet_indexA,%�赵_����%);
		local arr_rank41 = Pet.FullArtRank(pet_indexA,%�赵_����%);
		local arr_rank5 = Pet.GetArtRank(pet_indexA,%�赵_ħ��%);
		local arr_rank51 = Pet.FullArtRank(pet_indexA,%�赵_ħ��%);
		local a1 = math.abs(arr_rank1 - arr_rank11);
		local a2 = math.abs(arr_rank2 - arr_rank21);
		local a3 = math.abs(arr_rank3 - arr_rank31);
		local a4 = math.abs(arr_rank4 - arr_rank41);
		local a5 = math.abs(arr_rank5 - arr_rank51);
		local a6 = a1 + a2+ a3+ a4+ a5;

		local actural_price = math.floor(tonumber(PetUserName));
		
		if actural_price > 5000 then
		Char.SetData(_Pet,%����_����%,"��-"..a6.."D-"..tostring(actural_price).."G");
		-- Char.SetData(_Pet,%����_����%,"[��]"..a1..a2..a3..a4..a5.."-"..tostring(actural_price).."G");
		else
		Char.SetData(_Pet,%����_����%,"��-"..a6.."D-"..tostring(actural_price).."J");
		end

		NLG.SystemMessage(player,"��δ�۳�������72Сʱ�ڣ�3�죩��أ�������ｫ��ʧ��GMҲ�޷��һأ���");
	end

	return 0;
end

function PetMarket_WindowEvent( _index_me, _index_tome, _sequence, _select, _data)	
	if (Pet.IsPet(_sequence) and _select == %��ť_ȷ��%) then
		local PetPtr = _sequence;
		local PlayerName = Char.GetData(_index_tome,%����_����%);
		local PlayerCDK = Char.GetData(_index_tome,%����_�˺�%);
		local RealName = Char.GetData(PetPtr,%����_����%);
		local PetName = Char.GetData(PetPtr,%����_����%);
		local PetOwner = Char.GetData(PetPtr,%����_����CDK%);
		local buyerlevel = math.abs(Char.GetData(_index_tome,%����_�ȼ�%));--��ȡ��ҵȼ�
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
			NLG.SystemMessage(_index_tome,"���Ľ�Կ�ײ�����");
			return
		end
		if (Char.DelItem(_index_tome,888888,PetMoney)==0) then
			NLG.SystemMessage(_index_tome,"���Ľ�Կ�ײ�����");
			return
		end

		local query = "Update tbl_user Set PetMoney=PetMoney+"..PetMoney.." Where CdKey='"..PetOwner.."'";
		local Result = SQL.Run(query);
		end

		if PetMoneyType == "G" then
		local PlayerMoney = Char.GetData(_index_tome,%����_���%);
		if (PlayerMoney<PetMoney or PetMoney<1) then
			NLG.SystemMessage(_index_tome,"����ħ�Ҳ�����");
			return
		end

		Char.SetData(_index_tome,%����_���%,PlayerMoney-PetMoney);
		NLG.UpChar(_index_tome);

		local query = "Update tbl_user Set PetMB=PetMB+"..PetMoney.." Where CdKey='"..PetOwner.."'";
		local Result = SQL.Run(query);
		end

		Char.SetData(PetPtr,%����_����CDK%,PlayerCDK);
		Char.SetData(PetPtr,%����_�˺�%,PlayerCDK);
		Char.SetData(PetPtr,%����_����%,RealName);
		Char.SetData(PetPtr,%����_����%,RealName);
		
		NLG.SystemMessage(_index_tome,RealName.."����ɹ������ٴε���ó�����������");
		return;
		else 
		NLG.SystemMessage(_index_tome,"������ã����ĵȼ������Թ���������ȥ�����ɣ�");
	end
	end
	
end