------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--在线充值提取Lua脚本 For GA
--
--从数据库查询对应字段，并在游戏里兑换为积分道具
--
--by Duckyの復活
--in 2013.8.9
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
local NpcName = "代金卡提取"			--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 5, 26, 42}		--Npc地图坐标
local NpcImage = 14205					--Npc图档104561
local NpcDir = 6							--Npc方向（0为左上，顺时针转）
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【积分提取设置】】】
------------------------------------------------------------------------------
local CreditsName = "点数"		--积分名称（充值点数）
local ItemName = "代金卡"			--物品名称（积分卡）
local ItemID = 50006			--物品ID（积分卡ID）
local ItemStack = 10000			--物品堆叠数（积分卡堆叠数，用于计算可提取数量）
local ExchangeNum = 1			--每点积分可领取的代金卡数量
local CheckCountDown = 30		--每次查询冷却时间（间隔时间，单位：秒）
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【数据表设置】】】
------------------------------------------------------------------------------
local SqlTable = "tbl_user"
local SqlField = "money"
local SqlCdKey = "cdkey"
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
if type(PlayerCredits)~="table" then PlayerCredits={} end
if type(PlayerTotal)~="table" then PlayerTotal={} end
if type(tbl_LuaNpcIndex)~="table" then tbl_LuaNpcIndex={} end
local PlayerCheckCD = {}
------------------------------------------------------------------------------

--金币物品id
R_ItemID = 50006;
R_buro = 1;
-- 注意，只能设置6个赠送比例，不能增加或者删除，如果不需要那么多，金额请填写9999999
-- 不需要的倍率可以写0
-- 下面是达到金额
R_ZV =
{
	[1] = 100;
	[2] = 500;
	[3] = 1000;
	[4] = 2000;	
	[5] = 5000;	
	[6] = 99999;
	[7] = 999999
};

-- 下面是设置赠送百分比,不支持小数点
R_ZV_S =
{
	[1] = 5;
	[2] = 10;
	[3] = 15;
	[4] = 20;
	[5] = 25;	
	[6] = 30
};

Delegate.RegInit("ExtractCreditsNpc_Init");

function ExtractCreditsNpc_Init()
	local ExtractCreditsNpc = NL.CreateNpc(nil, "ExtractCreditsNpc_Func");
	Char.SetData( ExtractCreditsNpc, %对象_形象%, NpcImage);
	Char.SetData( ExtractCreditsNpc, %对象_原形%, NpcImage);
	Char.SetData( ExtractCreditsNpc, %对象_MAP%, NpcMapPos[1]);
	Char.SetData( ExtractCreditsNpc, %对象_地图%, NpcMapPos[2]);
	Char.SetData( ExtractCreditsNpc, %对象_X%, NpcMapPos[3]);
	Char.SetData( ExtractCreditsNpc, %对象_Y%, NpcMapPos[4]);
	Char.SetData( ExtractCreditsNpc, %对象_方向%, NpcDir);
	Char.SetData( ExtractCreditsNpc, %对象_原名%, NpcName);
	NLG.UpChar( ExtractCreditsNpc)

	tbl_LuaNpcIndex["ExtractCreditsNpc"] = ExtractCreditsNpc
	
	Char.SetTalkedEvent(nil, "ExtractCreditsNpc_Talked", ExtractCreditsNpc)
	Char.SetWindowTalkedEvent(nil, "ExtractCreditsNpc_WindowTalked", ExtractCreditsNpc)
	
	return true;
end

function ExtractCreditsNpc_Func(index)
	return true
end

function ExtractCreditsNpc_Talked( _MeIndex, _PlayerIndex, _Mode)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 2) == false and _Mode~=1) then
		return ;
	end 

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 1,
			"5|\n在支付宝自助充值系统，在支付宝充值成功后，" ..
			"\n可到此处领取充值的[" .. CreditsName .. "]" ..
			"\n并领取相应的vip首饰。" ..
			"\n【每次提取前，请先进行一次查询】" ..
			"\n请确保身上至少1个空余道具栏，否则后果自负" ..
			"\n　　　　『赞助总点数及剩余点数查询』" ..
			"\n　　　　『提取代金卡』" ..
			"\n　　　　『领取VIP头饰』" 
			);

	return ;
end

function ExtractCreditsNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	
	--取消按钮
	if _Select==2 then
		return
	end

	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--查询
		if PlayerSelect==1 then
			local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
			local tName = Char.GetData(_PlayerIndex, %对象_名字%)
			PlayerCheckCD[tCdKey] = PlayerCheckCD[tCdKey] or 0
			if PlayerCheckCD[tCdKey]+CheckCountDown>os.time() then
				local TalkBuf =	"\n　　　　　　　　　◆" .. NpcName .. "◆\n\n\n" ..
								"\n错误：" ..
								"\n　　　　　　查询冷却中，请" .. PlayerCheckCD[tCdKey]+CheckCountDown-os.time() .. "秒后重试。"
				NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
				return
			end
			local tSQL = "select " .. SqlCdKey .. "," .. SqlField .. ",TotalMoney from " .. SqlTable .. " where " .. SqlCdKey .. "='" .. tCdKey .. "';"
			local RS = SQL.Run(tSQL)
			PlayerCredits[tCdKey] = tonumber(RS["0_1"] or 0)
			PlayerTotal[tCdKey] = tonumber(RS["0_2"] or 0)
			local tSQL = "select CDK,TotalMoney,XiaoFei from tbl_char where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
			local RS = SQL.Run(tSQL)
			local TotalMoney = tonumber(RS["0_1"] or 0)
			local XiaoFei = tonumber(RS["0_2"] or 0)
			local TalkBuf =	"\n　　　　　　　　　◆" .. NpcName .. "◆\n\n\n\n" ..
								"你共有[" .. PlayerCredits[tCdKey] .. "]张" .. ItemName .. "未提取！\\n该角色已累积提取充值金额[" .. TotalMoney .. "]元！\\n该角色已累积兑换代金卡[" .. XiaoFei .. "]张！"
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
			PlayerCheckCD[tCdKey] = os.time()
			return
		end

		--输入数量
		if PlayerSelect==2 then
			if(NLG.CanTalk(_MeIndex, _PlayerIndex)==false)then
				return;
			end
	
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex,%窗口_输入框%,%按钮_确定%,2,"\\n\\n您好,欢迎使用领取点券系统，请输入您支付宝流水号的后6位数字！");
			return;
		end

		if PlayerSelect==3 then
			local tCdKey = Char.GetData(_PlayerIndex, %对象_账号%)
			local tName = Char.GetData(_PlayerIndex, %对象_名字%)
			local tSQL = "select CDK,TotalMoney,VipLevel,XiaoFei from tbl_char where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
			local RS = SQL.Run(tSQL)
			local TotalMoney = tonumber(RS["0_1"] or 0)
			local VipLevel = tonumber(RS["0_2"] or 0)
			local TotalXiaoFei = tonumber(RS["0_3"] or 0)
			local VipMoneyArr = {100,300,500,1000,2000,5000}
			local VipNameArr = {"青铜","白银","黄金","白金","钻石","最强王者"}
			local VipGiftArr = {51125,51126,51127,51128,51129,51131}
			if (VipLevel<10) then
				if (TotalMoney+math.floor(TotalXiaoFei/10)>=VipMoneyArr[VipLevel+1]) then
				Char.GiveItem(_PlayerIndex, VipGiftArr[VipLevel+1], 1)
				TalkBuf =	"\n领取头饰成功！恭喜你成为"..VipNameArr[VipLevel+1].."！";
				local tSQL = "update tbl_char set VipLevel=VipLevel+1 where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
				local RS = SQL.Run(tSQL)
				else
					local TouShiIndex=Char.HaveItem(_PlayerIndex,VipGiftArr[VipLevel]);
					if(TouShiIndex == -1 and VipLevel>0)then
						Char.GiveItem(_PlayerIndex, VipGiftArr[VipLevel], 1);
					end
				TalkBuf = "\n再充值"..tostring(VipMoneyArr[VipLevel+1]-TotalMoney).."元即可到达"..VipNameArr[VipLevel+1].."！"
				end
				NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
			end
			return
		end
	end

	if _Seqno==2 then
		if(Char.ItemSlot(_PlayerIndex) >= 18)then
			NLG.SystemMessage(_PlayerIndex,"[失败]为了避免您领取失败，请先空出道具栏三个位置以上的空格。");
			return;			
		end
		if(string.len(_Data) ~= 6 or tonumber(_Data) == nil or tonumber(_Data) == 0)then
			NLG.SystemMessage(_PlayerIndex,"[失败]您输入的流水号后6位错误！");
			return;
		end
		local query = "SELECT * from `tbl_alipay` WHERE `autoid2`='".._Data.."'";
		local mysql = SQL.Run(query);
		if(type(mysql)~="table")then
			NLG.SystemMessage(_PlayerIndex,"[失败]流水号不存在，或者已经充过值。");	
			return;
		end
		local autoid1 = mysql["0_0"];
		--NLG.SystemMessage(_PlayerIndex,autoid1);
		local jinbi = tonumber(mysql["0_1"]);
		local ischange = nil;
		ischange = tonumber(mysql["0_2"]);
		if(ischange == 1 or ischange == nil)then
			NLG.SystemMessage(_PlayerIndex,"[失败]流水号不存在，或者已经充过值。");	
			return;
		end
		--local query1 = "UPDATE `tbl_user` SET cash= cash + "..jinbi.." WHERE `CdKey`='"..Char.GetData(_PlayerIndex,%对象_账号%).."'";	
		--SQL.Run(query1);
		local query2 = "UPDATE `tbl_alipay` SET ischange= '1',cdkey = '"..Char.GetData(_PlayerIndex,%对象_账号%).."' WHERE `autoid`='"..autoid1.."'";	
		SQL.Run(query2);
		local tSQL = "update tbl_char set TotalMoney=TotalMoney+" .. jinbi .. " where CDK='" .. Char.GetData(_PlayerIndex,%对象_账号%) .. "'"
		local RS = SQL.Run(tSQL)
		if(jinbi >= tonumber(R_ZV[1]) and jinbi < tonumber(R_ZV[2]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[1]) / 100));
		elseif(jinbi >= tonumber(R_ZV[2]) and jinbi < tonumber(R_ZV[3]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[2]) / 100));
		elseif(jinbi >= tonumber(R_ZV[3]) and jinbi < tonumber(R_ZV[4]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[3]) / 100));
		elseif(jinbi >= tonumber(R_ZV[4]) and jinbi < tonumber(R_ZV[5]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[4]) / 100));
		elseif(jinbi >= tonumber(R_ZV[5]) and jinbi < tonumber(R_ZV[6]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[5]) / 100));
		elseif(jinbi >= tonumber(R_ZV[6]) and jinbi < tonumber(R_ZV[7]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[6]) / 100));
		end
		jinbi = jinbi * R_buro;
		Char.GiveItem(_PlayerIndex,R_ItemID,jinbi);

		NLG.SystemMessage(_PlayerIndex,"[成功]您充值数量为["..jinbi.."]已经到账！");	
	end

	return
end