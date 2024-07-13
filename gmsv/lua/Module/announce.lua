Delegate.RegInit("announce_Init");

function announce_initialize(_MeIndex)
	return true;
end

function announce_create() --宣传大使
	if (announce_index == nil) then
		announce_index = NL.CreateNpc("lua/Module/announce.lua", "announce_initialize");
		Char.SetData(announce_index,%对象_形象%,106602);
		Char.SetData(announce_index,%对象_原形%,106602);
		Char.SetData(announce_index,%对象_X%,242);
		Char.SetData(announce_index,%对象_Y%,88);
		Char.SetData(announce_index,%对象_地图%,1000);
		Char.SetData(announce_index,%对象_方向%,4);
		Char.SetData(announce_index,%对象_名字%,"cgmsv引擎宣传员");
		NLG.UpChar(announce_index);
		Char.SetTalkedEvent("lua/Module/announce.lua", "Server_AnMsg", announce_index);
		Char.SetWindowTalkedEvent("lua/Module/announce.lua", "Server_AnTalk", announce_index);
	end
	--注册事件
	Char.SetLoopEvent("lua/Module/announce.lua", "serverLoop", announce_index, 10000);
end

--定义一个随机数种子,这样取的随机数每次都会不一样
math.randomseed(os.time());
local LastAnTime = 0;
local Anon1 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Anon2 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Anon3 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Anon4 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Anon5 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Anon6 = {"感谢使用cgmsv引擎,请在lua/Module/announce.lua中修改本文本."};
local Server_Anon = {Anon1,Anon2,Anon3,Anon4,Anon5,Anon6};
local An_State = 1;

function StartAtAnnounce()
	An_State = 1;
end

function StopAtAnnounce()
	An_State = 0;
end

function serverLoop(_MeIndex)
	--取一个0-7的随机数,代表NPC移动的方向
	local dir= math.random(0, 7);
	--设置NPC状态为走路
	local walk = 1;
	NLG.SetAction(_MeIndex,walk);
	--让NPC走一步
	NLG.WalkMove(_MeIndex,dir);
	if(Char.GetData(_MeIndex,%对象_X%) < 225 or Char.GetData(_MeIndex,%对象_X%) > 249) then
		Char.SetData(_MeIndex,%对象_X%,242);
		NLG.UpChar(_MeIndex);
	end
	if(Char.GetData(_MeIndex,%对象_Y%) < 80 or Char.GetData(_MeIndex,%对象_Y%) > 99) then
		Char.SetData(_MeIndex,%对象_Y%,88);
		NLG.UpChar(_MeIndex);
	end
	if(os.time() - LastAnTime >= 2700 and An_State == 1) then
		LastAnTime = os.time();
		NLG.SystemMessage(-1,"[cgmsv引擎]"..Server_Anon[math.random(1,6)][1].."");
	end
end

function Server_AnMsg(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		local str_caller = "3\\n\\n请选择你想要咨询的问题...\\n\\n1.如何防止帐号被盗\\n2.如何联系客服\\n3.如何赞助游戏";
		NLG.ShowWindowTalked(_tome,_me,%窗口_选择框%,%按钮_关闭%,1,str_caller);
	end
end

function Server_AnTalk(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	if (_seqno == 1) then
		if ((_select == 0 or _select == "0") and (_data ~= "")) then
			local selectitem = tonumber(_data);
			if (selectitem == 1) then
				local Server_str = "\\n\\n1、请不要随意将帐号等信息与其他玩家分享..\\n2、请安装正版杀毒软件,以保障您的帐号以及信息安全\\n3、注意每隔一段时间进行一次密码修改哦\\n4、建议您密码不要使用纯数字组合\\n5、当发现帐号被盗时,请第一时间联系客服进行";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,10,Server_str);
			end
			if (selectitem == 2) then
				local Server_str = "\\n\\nQQ群:3191578760\\n\\n官方网站:www.cgmsv.com";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,10,Server_str);
			end
			if (selectitem == 3) then
				local Server_str = "\\n1、微信转帐，请联系GM\\n\\n2、支付宝，请联系客服QQ索取支付宝帐号\\n\\n3、官方网站:www.cgmsv.com\\n\\n";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%窗口_信息框%,%按钮_关闭%,10,Server_str);
			end
		end
	end
end

function announce_Init()
	announce_create();
end