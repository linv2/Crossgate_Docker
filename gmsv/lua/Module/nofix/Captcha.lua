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
		if(_select == %按钮_确定%) then
			if(_data == tbl_Codeinfo[_Player].Code) then
				tbl_Codeinfo[_Player].Time = os.time();
				tbl_Codeinfo[_Player].State = 0;
				NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 600, NLG.c("\\n\\n验证码输入正确!\\n\\n您在未来的15分钟内将不再需要输入验证码。\\n\\n现在请您重新跟NPC对话!"));
			else
				NLG.ShowWindowTalked( _index_tome, _index_me, %窗口_信息框%, %按钮_关闭%, 601, NLG.c("\\n\\n验证码输入错误,请重新输入!"));
			end
		end
	end
end

function Captcha_Init()
	if (Captcha_index == nil) then
		Captcha_index = NL.CreateNpc("lua/Module/Captcha.lua", "Init_Captcha");
		Char.SetData(Captcha_index,%对象_形象%,10414);
		Char.SetData(Captcha_index,%对象_原形%,10414);
		Char.SetData(Captcha_index,%对象_X%,78);
		Char.SetData(Captcha_index,%对象_Y%,77);
		Char.SetData(Captcha_index,%对象_地图%,777);
		Char.SetData(Captcha_index,%对象_方向%,4);
		Char.SetData(Captcha_index,%对象_名字%,"验证码");
		NLG.UpChar(Captcha_index);
		--Char.SetTalkedEvent("lua/Module/Captcha.lua", "Captcha_Talk", Captcha_index);
		Char.SetWindowTalkedEvent("lua/Module/Captcha.lua", "Captcha_WindowEvent", Captcha_index);
	end
	Protocol.OnRecv("lua/Module/Captcha.lua", "Captcha_Recv", %RECV_WN%)
end

function Captcha_Recv(fd,head,packet)
	local player = Protocol.GetCharByFd(fd);
	local _Player = Playerkey(player);
	--验证间隔是900秒，即15分钟
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
			local window_info="\\n\\n 您需要告诉我暗号后才可以继续使用。\\n\\n 当前的暗号是［"..checkStr.."］（六位数字）\\n\\n 请在下面输入后提交即可！"
			NLG.ShowWindowTalked( player, Captcha_index, %窗口_输入框%, %按钮_确定关闭%, 500, window_info);
			return 1;
		end
	end

end