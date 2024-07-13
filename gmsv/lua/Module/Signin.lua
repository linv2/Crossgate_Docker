Delegate.RegInit("Signin_Init");

SIGNIN_MAIN = 700;
SIGNIN_END = 701;

signInCountPrize = {1,2,3,4,5,6,7};

--======================================
sign_maxLv = 60; 

--第一天的奖励
signInPrize = {};
signInPrize[1] = {};
signInPrize[1].Prize = {}; --定义道具ID表
signInPrize[1].Prize[1] = 70144;	--50诱魔香
signInPrize[1].Prize[2] = 15607;	--生命力回复药（150）

signInPrize[1].Count = {}; --定义奖励数量表
signInPrize[1].Count[1] = 1;
signInPrize[1].Count[2] = 1;
signInPrize[1].Random = {}; --定义奖励几率表
signInPrize[1].Random[1] = 50;
signInPrize[1].Random[2] = 50;

--第二天的奖励
signInPrize[2] = {};
signInPrize[2].Prize = {}; --定义道具ID表
signInPrize[2].Prize[1] = 70107;	--100诱魔香
signInPrize[2].Prize[2] = 47819;	--卡时小闹钟-Mini

signInPrize[2].Count = {}; --定义奖励数量表
signInPrize[2].Count[1] = 1;
signInPrize[2].Count[2] = 1;

signInPrize[2].Random = {}; --定义奖励几率表
signInPrize[2].Random[1] = 30;
signInPrize[2].Random[2] = 30;


--第三天的奖励
signInPrize[3] = {};
signInPrize[3].Prize = {}; --定义道具ID表
signInPrize[3].Prize[1] = 70150;	--时间水晶Lv1
signInPrize[3].Prize[2] = 15203;	--法国面包


signInPrize[3].Count = {}; --定义奖励数量表
signInPrize[3].Count[1] = 1;
signInPrize[3].Count[2] = 1;

signInPrize[3].Random = {}; --定义奖励几率表
signInPrize[3].Random[1] = 30;
signInPrize[3].Random[2] = 30;


--第四天的奖励
signInPrize[4] = {};
signInPrize[4].Prize = {}; --定义道具ID表
signInPrize[4].Prize[1] = 16001;	--白钥匙*5
signInPrize[4].Prize[2] = 16002;	--黑钥匙*5
signInPrize[4].Prize[3] = 361000;	--小喇叭

signInPrize[4].Count = {}; --定义奖励数量表
signInPrize[4].Count[1] = 5;
signInPrize[4].Count[2] = 5;
signInPrize[4].Count[3] = 1;

signInPrize[4].Random = {}; --定义奖励几率表
signInPrize[4].Random[1] = 30;
signInPrize[4].Random[2] = 30;
signInPrize[4].Random[3] = 40;

--第五天的奖励
signInPrize[5] = {};
signInPrize[5].Prize = {}; --定义道具ID表
signInPrize[5].Prize[1] = 70150;	--时间水晶Lv1 *2
signInPrize[5].Prize[2] = 70211;	--诱魔香(200步)


signInPrize[5].Count = {}; --定义奖励数量表
signInPrize[5].Count[1] = 2;
signInPrize[5].Count[2] = 1;
signInPrize[5].Random = {}; --定义奖励几率表
signInPrize[5].Random[1] = 30;
signInPrize[5].Random[2] = 30;


--第六天的奖励
signInPrize[6] = {};
signInPrize[6].Prize = {}; --定义道具ID表
signInPrize[6].Prize[1] = 71731;	--坎村传送羽毛
signInPrize[6].Prize[2] = 71734;	--犹大传送羽毛
signInPrize[6].Prize[3] = 70211;	--诱魔香(200步)

signInPrize[6].Count = {}; --定义奖励数量表
signInPrize[6].Count[1] = 1;
signInPrize[6].Count[2] = 1;
signInPrize[6].Count[3] = 1;

signInPrize[6].Random = {}; --定义奖励几率表
signInPrize[6].Random[1] = 40;
signInPrize[6].Random[2] = 40;
signInPrize[6].Random[3] = 20;

--第七天的奖励
signInPrize[7] = {};
signInPrize[7].Prize = {}; --定义道具ID表
signInPrize[7].Prize[1] = 70211;	--诱魔香(200步)
signInPrize[7].Prize[2] = 70150;	--时间水晶Lv1 *3
signInPrize[7].Prize[3] = 18641;	--僵尸图纸A
signInPrize[7].Prize[4] = 18642;	--僵尸图纸b
signInPrize[7].Prize[5] = 18643;	--僵尸图纸c

signInPrize[7].Count = {}; --定义奖励数量表
signInPrize[7].Count[1] = 1;
signInPrize[7].Count[2] = 3;
signInPrize[7].Count[3] = 1;
signInPrize[7].Count[4] = 1;
signInPrize[7].Count[5] = 1;

signInPrize[7].Random = {}; --定义奖励几率表
signInPrize[7].Random[1] = 40;
signInPrize[7].Random[2] = 10;
signInPrize[7].Random[3] = 40;
signInPrize[7].Random[4] = 10;
signInPrize[7].Random[5] = 10;

function IsInTable(a1,a2)
	for k=1,#a2 do
		if(a2[k] == a1)then
			return a1;
		end
	end
	return -1;
end




function Signin_Init()
	signin_create();
end

function signin_InitNpc()
	return true;
end

function signin_create() --每日签到
	if(SigninNPC == nil)then
		SigninNPC = NL.CreateNpc("lua/Module/Signin.lua", "signin_InitNpc");
		Char.SetData(SigninNPC,%对象_形象%,14602);
		Char.SetData(SigninNPC,%对象_原形%,14602);
		Char.SetData(SigninNPC,%对象_X%,247);
		Char.SetData(SigninNPC,%对象_Y%,85);
		Char.SetData(SigninNPC,%对象_地图%,1000);
		Char.SetData(SigninNPC,%对象_方向%,6);
		Char.SetData(SigninNPC,%对象_名字%,"每日签到活动");
		NLG.UpChar(SigninNPC);
		Char.SetWindowTalkedEvent("lua/Module/Signin.lua","SigninNPCWinTalked",SigninNPC);
		Char.SetTalkedEvent("lua/Module/Signin.lua","SigninNPCTalked", SigninNPC);
	end
end

function canSignin(_tome)
	local times = tonumber(Field.Get(_tome,"SigninCount"));
	local signinTime = tonumber(Field.Get(_tome,"SigninTime"));
	local signble = 0;
	
	if(times == nil and signinTime == nil )then
		signble = 1;
	end

	if(times ~= nil and signinTime ~= nil)then
		local nowTime = os.time();
		local CTimeM = os.date("%m",signinTime);
		local CTimeD = os.date("%d",signinTime);
		local BTimeM = os.date("%m",nowTime);
		local BTimeD = os.date("%d",nowTime);
		if(CTimeM == BTimeM and CTimeD == BTimeD)then
			--已经签到过了
			signble = 0;
			return signble,times;
		end
		if(CTimeM ~= BTimeM or CTimeD ~= BTimeD)then		
			local signintimediff = os.difftime(nowTime,signinTime);
			if(signintimediff > 86400 and signintimediff < 172800)then
			--可以连续签到
				signble = 1;
			end
			if(signintimediff >= 172800)then
			--可以连续签到,但签到次数归零
				signble = 1;
				Field.Set(_tome,"SigninCount","0");
				times = 0;
			end
		end
	end
	return signble,times;

end

function SigninNPCTalked(_me,_tome)

	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	local myStr = "";
	local signble,times = canSignin(_tome);
	
	if(signble == 0 or signble == nil)then
		myStr = "\\n"..(Char.GetData(_tome,%对象_名字%)).."你好，欢迎您来到法兰城！\\n\\n".."....我是负责给大家记名签到的\\n\\n今天你已经签到过了呢，再接再厉噢！\\n\\n\\n目前您已经连续签到了 "..times.." 天了！\\n";
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,SIGNIN_END,myStr);
		return;
	end

	if (times == nil)then
		myStr = ""..(Char.GetData(_tome,%对象_名字%)).."你好，欢迎您来到法兰城！\\n\\n".."....我是负责给大家记名签到的\\n\\n今天是您第一天签到的呢！当您连续签到几天后就会获得不同的奖励，最多可以帮您登记七天噢！\\n注意：当您连续签到七天后就会重新变为第一天！\\n\\n请问您想现在就签到（领取礼物）吗？";
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_是否%,SIGNIN_MAIN,myStr);
		return;
	end
	if(signble == 1 and times > 0)then
		myStr = "\\n"..(Char.GetData(_tome,%对象_名字%)).."你好，欢迎您来到法兰城！\\n\\n".."....我是负责给大家记名签到的\\n\\n您已经连续领取了 "..times.." 天了哦！\\n\\n\\n请问您想现在就签到（领取礼物）吗？";
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_是否%,SIGNIN_MAIN,myStr);
		return;
	end
	if(signble == 1 and times == 0)then
		myStr = ""..(Char.GetData(_tome,%对象_名字%)).."你好，欢迎您法兰城！\\n\\n".."....我是负责给大家记名签到的\\n\\n您似乎有一段时间都没有来过就上魔力了呢！不知道您近来过得可好呢？不管如何，希望您在就上魔力能愉快的玩耍！\\n\\n请问您想现在就签到（领取礼物）吗？";
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_是否%,SIGNIN_MAIN,myStr);
		return;
	end
end

function makeSignin(_me,_tome,times)
	if(Char.GetData(_tome,%对象_等级%) < sign_maxLv) then
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,SIGNIN_END,"\\n\\n\\n对不起，您的等级低于"..sign_maxLv.."级，无法为您提供签到服务，请继续努力噢！\\n");
		return;
	end
	local myStr = "\\n\\n\\n恭喜你签到成功！\\n\\n祝您游戏愉快！\\n\\n";
	local prizeCount = IsInTable(times,signInCountPrize);
	if(prizeCount ~= -1)then
		if(signInPrize[prizeCount] == nil) then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,SIGNIN_END,"\\n\\n\\n获取奖励时出现了错误...\\n错误信息: signInPrize[prizeCount] == nil \\n请将此错误报告给客服,已便我们修复此BUG!");
			return;
		end
		if(Char.ItemSlot(_tome)>19)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,SIGNIN_END,"\\n\\n你的背包似乎装不下奖励了哦!\\n\\n快去清理下吧!");
			return;
		end
		local PrizeFlg = 0;
		for i = 1,#(signInPrize[prizeCount].Prize) do
			if(NLG.Rand(0,100) <= signInPrize[prizeCount].Random[i]) then
				PrizeFlg = i;
				break;
			end
		end
		if(PrizeFlg == 0) then
			PrizeFlg = NLG.Rand(1,#(signInPrize[prizeCount].Prize));
		end
		local ArrayFlg = 0;
		if(type(signInPrize[prizeCount].Prize[PrizeFlg]) == "table") then
			for i = 1,#(signInPrize[prizeCount].ArrayRand[PrizeFlg]) do
				if(NLG.Rand(0,100) <= signInPrize[prizeCount].ArrayRand[PrizeFlg][i]) then
					ArrayFlg = i;
					break;
				end
			end
			if(ArrayFlg == 0) then
				ArrayFlg = NLG.Rand(1,#(signInPrize[prizeCount].Prize[PrizeFlg]));
			end
		end
		if(ArrayFlg == 0) then
			Char.GiveItem(_tome,signInPrize[prizeCount].Prize[PrizeFlg],signInPrize[prizeCount].Count[PrizeFlg]);
		else
			local ArrRand = NLG.Rand(1,#signInPrize[prizeCount].Prize[PrizeFlg][ArrayFlg]);
			Char.GiveItem(_tome,signInPrize[prizeCount].Prize[PrizeFlg][ArrayFlg][ArrRand],signInPrize[prizeCount].Count[PrizeFlg][ArrayFlg][ArrRand]);
		end
		myStr = myStr .. "您的奖励已经发放，请注意查收哦！\\n";
	end
	local t = os.time();
	local m = os.date("%m" ,t);
	local d = os.date("%d" ,t);
	local Y = os.date("%Y" ,t);
	local tt = {year = Y, month = m, day = d, hour = 0};
	Field.Set(_tome,"SigninTime",""..os.time(tt));
	Field.Set(_tome,"SigninCount",""..times);
	NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,SIGNIN_END,myStr);
end

function SigninNPCWinTalked(_me,_tome,_seqno,_select,_data)
	if(_seqno == SIGNIN_MAIN) then
		if(NLG.CanTalk(_me,_tome) == false)then
			return;
		end
		if(_select == %按钮_是% or _select == ""..%按钮_是%)then
			local signble,times = canSignin(_tome);
			if(times == nil)then
				times = 0;
				signble = 1;
			end
			if(signble==1)then
				times = times + 1;
				if(times > 7) then
					times = 1;
				end
				makeSignin(_me,_tome,times);
			end
		end
	end
end