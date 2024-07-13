Delegate.RegInit("Captcha_Init");

function Init_Captcha(_index)
	return 1;
end

local tbl_Codeinfo={};
function Code_new_tbl()
	local _tbl_Codeinfo =
	{
		Code = "";
		State = 1;
		Time = 0;
	}
	return _tbl_Codeinfo;
end

local QuestArr={};
QuestArr[1] = "456425";
QuestArr[2] = "543216";
QuestArr[3] = "153213";
QuestArr[4] = "354343";
QuestArr[5] = "642354";
QuestArr[6] = "026562";
QuestArr[7] = "265232";
QuestArr[8] = "956554";
QuestArr[9] = "656231";
QuestArr[10] = "056234";
QuestArr[11] = "123165";
QuestArr[12] = "565322";
QuestArr[13] = "415154";
QuestArr[14] = "132155";
QuestArr[15] = "032465";
QuestArr[16] = "643541";
QuestArr[17] = "313644";
QuestArr[18] = "133054";
QuestArr[19] = "123012";
QuestArr[20] = "231321";
QuestArr[21] = "444311";
QuestArr[22] = "132425";
QuestArr[23] = "956456";
QuestArr[24] = "003565";
QuestArr[25] = "154654";
QuestArr[26] = "455631";
QuestArr[27] = "986531";
QuestArr[28] = "785464";
QuestArr[29] = "446423";
QuestArr[30] = "113531";
local AnswerArr={};
AnswerArr[1] = "456425";
AnswerArr[2] = "543216";
AnswerArr[3] = "153213";
AnswerArr[4] = "354343";
AnswerArr[5] = "642354";
AnswerArr[6] = "026562";
AnswerArr[7] = "265232";
AnswerArr[8] = "956554";
AnswerArr[9] = "656231";
AnswerArr[10] = "056234";
AnswerArr[11] = "123165";
AnswerArr[12] = "565322";
AnswerArr[13] = "415154";
AnswerArr[14] = "132155";
AnswerArr[15] = "032465";
AnswerArr[16] = "643541";
AnswerArr[17] = "313644";
AnswerArr[18] = "133054";
AnswerArr[19] = "123012";
AnswerArr[20] = "231321";
AnswerArr[21] = "444311";
AnswerArr[22] = "132425";
AnswerArr[23] = "956456";
AnswerArr[24] = "003565";
AnswerArr[25] = "154654";
AnswerArr[26] = "455631";
AnswerArr[27] = "986531";
AnswerArr[28] = "785464";
AnswerArr[29] = "446423";
AnswerArr[30] = "113531";


function Captcha_WindowEvent( _index_me, _index_tome, _sequence, _select, _data)
	local _Player = Playerkey(_index_tome);
	if(tbl_Codeinfo[_Player] == nil) then
		tbl_Codeinfo[_Player] = Code_new_tbl();
	end
	if( _sequence == 500 )then
		if(_select == %��ť_ȷ��%) then
			if(_data == tbl_Codeinfo[_Player].Code) then
				tbl_Codeinfo[_Player].Time = os.time();
				tbl_Codeinfo[_Player].State = 0;
				NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 600, NLG.c("\\n\\n��֤��������ȷ!\\n\\n����δ����15�����ڽ�������Ҫ������֤�롣\\n\\n�����������¸�NPC�Ի�!"));
			else
				NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 601, NLG.c("\\n\\n��֤���������,����������!"));
			end
		end
	end
end

function Captcha_Init()
	if (Captcha_index == nil) then
		Captcha_index = NL.CreateNpc("lua/Module/Captcha.lua", "Init_Captcha");
		Char.SetData(Captcha_index,%����_����%,10414);
		Char.SetData(Captcha_index,%����_ԭ��%,10414);
		Char.SetData(Captcha_index,%����_X%,78);
		Char.SetData(Captcha_index,%����_Y%,77);
		Char.SetData(Captcha_index,%����_��ͼ%,777);
		Char.SetData(Captcha_index,%����_����%,4);
		Char.SetData(Captcha_index,%����_����%,"��֤��");
		NLG.UpChar(Captcha_index);
		--Char.SetTalkedEvent("lua/Module/Captcha.lua", "Captcha_Talk", Captcha_index);
		Char.SetWindowTalkedEvent("lua/Module/Captcha.lua", "Captcha_WindowEvent", Captcha_index);
	end
	Protocol.OnRecv("lua/Module/Captcha.lua", "Captcha_Recv", %RECV_WN%)
end

function Captcha_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local _Player = Playerkey(player);
	--��֤�����900�룬��15����
	if(tbl_Codeinfo[_Player] == nil) then
		tbl_Codeinfo[_Player] = Code_new_tbl();
	end
	if(os.time() - tbl_Codeinfo[_Player].Time > 900) then
		tbl_Codeinfo[_Player].State = 1;
		local SplitArray = Split(packet,":");
		if(SplitArray[3] == "5n") then
			local TempNum = math.random(1,5);
			tbl_Codeinfo[_Player].Code = AnswerArr[TempNum];
			checkStr = QuestArr[TempNum];
			local window_info="\\n\\n ����Ҫ�����Ұ��ź�ſ��Լ���ʹ�á�\\n\\n ��ǰ�İ����ǣ�"..checkStr.."�ݣ���λ���֣�\\n\\n ��������������ύ���ɣ�"
			NLG.ShowWindowTalked( player, Captcha_index, %����_�����%, %��ť_ȷ���ر�%, 500, window_info);
			return 1;
		end
	end

end