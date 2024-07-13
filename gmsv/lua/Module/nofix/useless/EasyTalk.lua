--脚本配置
if type(Players)~="table" then Players={} end
if type(tab_laba)~="table" then tab_laba={} end
if type(tab_siliao)~="table" then tab_siliao={} end
if type(tab_msg)~="table" then tab_msg={} end
if type(tab_return)~="table" then tab_return={} end
if type(tab_fastlaba)~="table" then tab_fastlaba={} end
if type(tab_stoplaba)~="table" then tab_stoplaba={} end
if type(tab_talkhistory)~="table" then tab_talkhistory={} end
if type(tab_silencedtime)~="table" then tab_silencedtime={} end
if type(tab_battlehelp)~="table" then tab_battlehelp={} end
local laba_stopcount = 3		--禁止喇叭次数
local laba_stoptime = 60		--禁止喇叭时间
local battle_remotepk = -2
local battle_watchpkA = -2
local battle_watchpkB = -2
tbl_joinPlayer={};
pvp_watch_status=0;
local LuaTalkList = {
			{"/对战：发起一次全服挑战，或参与一次别人发起的全服挑战", 0},
			}

--注册全局说话委托
Delegate.RegDelTalkEvent("EasyTalkEvent");

--
function EasyTalkEvent(_PlayerIndex,_msg,_color,_range,_size)
	

	print(Char.GetData(_PlayerIndex, %对象_名字%) .. Char.GetData(_PlayerIndex, %对象_GM%) .. "：" .. _msg)
	--TalkMsg = string.sub(_msg,3)
	local TalkMsg = _msg
	local TalkColor = _color
	local TalkRange = _range
	local TalkSize = _size
	local toStr = ""
----------------------
--TalkSilenced Start--
----------------------
	if (Char.GetData(_PlayerIndex,%对象_GM%)<100) then
		local tKey = getTabKey(_PlayerIndex)
		if tab_silencedtime[tKey]~=nil and tab_silencedtime[tKey]>=os.time() then
			NLG.TalkToCli(_PlayerIndex, nil, "[系统] 你说话太快了，请休息 " .. tab_silencedtime[tKey]-os.time() .. " 秒。", 4, 1);
			--NLG.TalkToCli(_PlayerIndex, nil, "[系统] 你说话太快了，请休息一下。", 4, 1);
			return 0
		end
		if type(tab_talkhistory[tKey])~="table" then tab_talkhistory[tKey]={} end
		tab_talkhistory[tKey].TalkD = tab_talkhistory[tKey].TalkC
		tab_talkhistory[tKey].TimeD = tab_talkhistory[tKey].TimeC
		tab_talkhistory[tKey].TalkC = tab_talkhistory[tKey].TalkB
		tab_talkhistory[tKey].TimeC = tab_talkhistory[tKey].TimeB
		tab_talkhistory[tKey].TalkB = tab_talkhistory[tKey].TalkA
		tab_talkhistory[tKey].TimeB = tab_talkhistory[tKey].TimeA
		tab_talkhistory[tKey].TalkA = TalkMsg
		tab_talkhistory[tKey].TimeA = os.time()
		--5秒内，连续发4次相同的内容，禁言60秒
		--3秒内，连续说话4次，禁言10秒
		--1秒内，连续说话3次相同的内容，禁言3秒
		if tab_talkhistory[tKey].TimeB~=nil and os.time()-tab_talkhistory[tKey].TimeB<=1 and tab_talkhistory[tKey].TalkA==TalkMsg and tab_talkhistory[tKey].TalkB==TalkMsg then
			tab_silencedtime[tKey] = os.time() + 3
		elseif tab_talkhistory[tKey].TimeC~=nil and os.time()-tab_talkhistory[tKey].TimeC<=3 then
			tab_silencedtime[tKey] = os.time() + 10
		elseif tab_talkhistory[tKey].TimeC~=nil and os.time()-tab_talkhistory[tKey].TimeC<=5 and tab_talkhistory[tKey].TalkA==TalkMsg and tab_talkhistory[tKey].TalkB==TalkMsg and  tab_talkhistory[tKey].TalkC==TalkMsg then
			tab_silencedtime[tKey] = os.time() + 60
		end
	end
--------------------
--TalkSilenced End--
--------------------	
	
-----------------
--LuaTalk Start--
-----------------
	if TalkMsg=="/积分提现" then	
		local NpcName = "代金卡提取"	--Npc名称（同时也是脚本名称）
		local CreditsName = "点数"			--积分名称（充值点数）
		local ItemName = "金卡"			--物品名称（积分卡）
		NLG.ShowWindowTalked(_PlayerIndex, tbl_LuaNpcIndex["ExtractCreditsNpc"], 2, 2, 1,
				"7\n　　　　　　　　　◆" .. NpcName .. "◆" ..
				"\n系统说明" ..
				"\n　　在线充值自助领取系统，在网站充值成功后，" ..
				"\n可到此处查询充值的[" .. CreditsName .. "]，以及可领取的" ..
				"\n[" .. ItemName .. "]数量，并兑换提取出来。" ..
				"\n　　每次提取前，请先进行一次查询。" ..
				"\n（请确保身上至少1个空余道具栏，否则后果自负）" ..
				"\n　　　　　　　　　『查询" .. ItemName .. "』" ..
				"\n　　　　　　　　　『提取" .. ItemName .. "』"
				);
		return 0
	end
--------------	
--LuaTalk End
--------------

end