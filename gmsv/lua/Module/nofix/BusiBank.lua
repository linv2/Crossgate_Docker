------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本说明】】】
------------------------------------------------------------------------------
--商业银行Lua脚本-CSV版 For CGEX
--
--1、提供突破100W上限的存款服务，每日计算存款利息
--2、提供贷款服务（根据等级计算贷款额度），每日计算贷款利息
--3、超过时间不归还贷款，列入黑名单（黑名单未完成，请自行与其他脚本联动）
--
--by Duckyの復活
--in 2013.12.25
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【基础NPC设置】】】
------------------------------------------------------------------------------
local NpcName = "商业银行"					--Npc名称（同时也是脚本名称）
local NpcMapPos = {0, 777, 20, 21}		--Npc地图坐标
local NpcImage = 106602						--Npc图档101022
local NpcDir = 6							--Npc方向（0为左上，顺时针转）
local tbl_LuaNpcIndex = { }
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本常规设置】】】
------------------------------------------------------------------------------
--【使用限制】
local VipLimit = 0						--VIP限制
local LendingLvLimit = 50				--贷款等级限制
local DepositLvLimit = 10				--存款等级限制
local LendingLv = {1,40,60,80,100,120}		--按等级划分贷款上限（从低到高）
local LendingLvRates = {500,2000,3000,4000,5000,6000}		--每级可贷款金额（从低到高）
local PlayerGoldMax = 10000000			--人物身上金币上限
local LendingMaxLimit = 1000000			--贷款上限
local DepositMaxLimit = 20000000		--存款上限

--【银行设置】
local ClearingTime = 22				--结算时间（小时）
local FreeTime = 3						--免息贷款期限（天）
local DeadTime = 10					--惩罚期限（天）
local DepositLimit = 1					--贷款10天后过后，无法存款
local AutoOffset = 1					--免息期后，自动用存款抵消贷款
local LendingRates = 0.1				--贷款利率
local DepositRates = 0.01				--存款利率
local CreateAccount = 1				--是否需要开户
local CreateNeed = 20000			--开户所需资金
local CreateDeposit = 15000			--开户后初始存款数
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 【【【脚本系统设置】】】（非专业人事请勿修改）
------------------------------------------------------------------------------
--【系统参数】
local PlayerLending = 0
local PlayerDeposit = 0
local pathCGBusiBank = "./lua/CGBusiBank.csv"

local 常量 = {}
常量.对象 = {}
常量.对象.形象=1
常量.对象.原形=2
常量.对象.地图类型=3
常量.对象.地图=4
常量.对象.X=5
常量.对象.Y=6
常量.对象.方向=7
常量.对象.等级=8
常量.对象.金币=53
常量.对象.银行金币=54
常量.对象.原名=2000
常量.对象.账号=2002
------------------------------------------------------------------------------

Delegate.RegInit("BusiBankNpc_Init");
function BusiBankNpc_Init()
	local BusiBankNpc = NL.CreateNpc(nil, "BusiBankNpc_Myinit");
	Char.SetData( BusiBankNpc, 常量.对象.形象, NpcImage);
	Char.SetData( BusiBankNpc, 常量.对象.原形, NpcImage);
	Char.SetData( BusiBankNpc, 常量.对象.地图, NpcMapPos[2]);
	Char.SetData( BusiBankNpc, 常量.对象.X, NpcMapPos[3]);
	Char.SetData( BusiBankNpc, 常量.对象.Y, NpcMapPos[4]);
	Char.SetData( BusiBankNpc, 常量.对象.方向, NpcDir);
	Char.SetData( BusiBankNpc, 常量.对象.原名, NpcName);
	NLG.UpChar(BusiBankNpc)

	tbl_LuaNpcIndex["BusiBankNpc"] = BusiBankNpc
	
	Char.SetTalkedEvent(nil, "BusiBankNpc_Talked", BusiBankNpc)
	Char.SetWindowTalkedEvent(nil, "BusiBankNpc_WindowTalked", BusiBankNpc)
	Char.SetLoopEvent(nil,"BusiBankNpc_Loop",BusiBankNpc,60000)
	
	return true;
end

function BusiBankNpc_Myinit(index)
	return true
end

function BusiBankNpc_Loop(_MeIndex)
		local ATime = os.time();
		local ATimeH = os.date("%H",ATime);
		local ATimeM = os.date("%M",ATime);
		local ATimeS = os.date("%S",ATime);
		local ATimeS1 = tonumber(ATimeS);
		local ATimeM1 = tonumber(ATimeM);
		local ATimeH1 = tonumber(ATimeH);
		if ((ATimeH ~= nil and (ATimeH1 == tonumber(ClearingTime) or ATimeH1 == ClearingTime)) and (ATimeM ~= nil and (ATimeM1 == 00 or ATimeM1 == "00"))) then	
			local sTotalD = 0
			local sTotalL = 0
			local TM_BusiBankTab = EasyFile(pathCGBusiBank,'r')
			for i = 2,table.getn(TM_BusiBankTab) do
				--计算存款利息
				EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],3,math.floor(tonumber(TM_BusiBankTab[i][3])*(DepositRates+1)))
				if (tonumber(TM_BusiBankTab[i][4])>0) then 
					--增加贷款天数
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],5,math.floor(tonumber(TM_BusiBankTab[i][5])+1)) 
				else
					--贷款天数清零
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],5,0) 
				end

				if (tonumber(TM_BusiBankTab[i][5])>30) then
					--BadUser('a',TM_BusiBankTab[i][1],TM_BusiBankTab[i][2])
				elseif (tonumber(TM_BusiBankTab[i][5])>10) then
					--BadUser('a',TM_BusiBankTab[i][1],TM_BusiBankTab[i][2])
				elseif (tonumber(TM_BusiBankTab[i][5])>3) then
					--计算贷款利息
					EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],4,math.floor(tonumber(TM_BusiBankTab[i][4])*(LendingRates+1)))
				end
				local sTalk = "[商业银行][" .. TM_BusiBankTab[i][1] .. "]" .. TM_BusiBankTab[i][2] .. "：存款 " .. math.floor(tonumber(TM_BusiBankTab[i][3])) .. " G，存款利息 " .. math.floor(tonumber(TM_BusiBankTab[i][3])*(DepositRates+1)) .. " G，贷款 " .. math.floor(tonumber(TM_BusiBankTab[i][4])) .. " G，贷款利息 " .. math.floor(tonumber(TM_BusiBankTab[i][4])*(LendingRates+1)) .. " G。"
				Log(sTalk)
				sTotalD = sTotalD + math.floor(tonumber(TM_BusiBankTab[i][3]))
				sTotalL = sTotalL + math.floor(tonumber(TM_BusiBankTab[i][4]))
			end
			MSG("[商业银行]银行结算完毕，所有存款、贷款利息，已计算入个人账户中。截止至现时，我银行共有客户 " .. table.getn(TM_BusiBankTab)-1 .. " 名，共有存款 " .. sTotalD .. " G，共放出贷款 " .. sTotalL .." G。")
			Log("[商业银行]银行结算完毕，所有存款、贷款利息，已计算入个人账户中。截止至现时，我银行共有客户 " .. table.getn(TM_BusiBankTab)-1 .. " 名，共有存款 " .. sTotalD .. " G，共放出贷款 " .. sTotalL .." G。")
		end
	
	return true;
end

function BusiBankNpc_Talked( _MeIndex, _PlayerIndex)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 2) == false) then
		return ;
	end 

	local i;
	i = Char.GetData(_PlayerIndex, 7);
	if i >= 4 then 
		i = i - 4;
	else
		i = i + 4;		
	end
	Char.SetData(_MeIndex, 7,i);
	NLG.UpChar( _MeIndex);
	
	local GM_Talk = ""
	local Create_Talk = ""
	if (Char.GetData(_PlayerIndex,144)==1) then GM_Talk = "　　　　　　　　　　『查看清单』" end
	if (CreateAccount==1) then Create_Talk = "首次开户需收取" .. CreateNeed .. "G现金，其中" .. CreateNeed-CreateDeposit .. "G为手续费，其余" .. CreateDeposit .. "G存入个人账户。" end
	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 0, 1,
			"7\n　　　　　　　　　☆☆商业银行☆☆"..
			"\n"..
			"\n　系统说明：本系统支持存款、取款、贷款、还贷功能，" .. 
			"每天" .. ClearingTime .. "点结算，存款" .. DepositRates .. "利率，贷款" .. LendingRates .. "利率。" ..
			"免息贷款为" .. FreeTime .. "天，超过" .. DeadTime .. "天仍未还清，将列入黑名单" ..	
			"" .. Create_Talk ..
			"\n".. GM_Talk ..
			"\n　　　　　　　　　　『进入系统』"..
			"\n　　　　　　　　　　『　退出　』");

	return ;
end


function BusiBankNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	local TM_BusiBankTab = EasyFile(pathCGBusiBank,'r')
	local TM_TabIndex = EasyTable(TM_BusiBankTab,'c',2,Char.GetData(_PlayerIndex,常量.对象.原名))

	if (Char.GetData(_PlayerIndex,144)==1) then
		--NLG.TalkToCli(_PlayerIndex, "Start", 4, 0, -1)
		--NLG.TalkToCli(_PlayerIndex, EasyTable(EasyFile(pathCGBusiBank, 'r'), 'r', 1), 4 , 0 , -1)
	end

	if (TM_TabIndex==-1 and CreateAccount==1) then
		--手动开户
		if (Char.GetData(_PlayerIndex,常量.对象.金币)<CreateNeed) then
			NLG.TalkToCli(_PlayerIndex,"你的现金不足[" .. CreateNeed .. "]G，无法开户！",0,0,-1)
			return false;
		else
			Char.SetData(_PlayerIndex,常量.对象.金币,Char.GetData(_PlayerIndex,常量.对象.金币)-CreateNeed)
			local TM_Data = {0,0,CreateDeposit,0,0}
			TM_Data[1] = Char.GetData(_PlayerIndex,常量.对象.账号)
			TM_Data[2] = Char.GetData(_PlayerIndex,常量.对象.原名)
			EasyFile(pathCGBusiBank,'a',TM_Data)
			NLG.UpChar(_PlayerIndex);
			NLG.TalkToCli(_PlayerIndex,_MeIndex,"开户成功！已收取[" .. CreateNeed .. "]G现金，其中[" .. CreateNeed-CreateDeposit .. "]G为手续费，其余[" .. CreateDeposit .. "]G已存入个人账户中。" ,4,0)
			Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. ":开户成功！")
		end
	elseif (TM_TabIndex==-1) then
		--自动开户
			local TM_Data = {0,0,0,0,0}
			TM_Data[1] = Char.GetData(_PlayerIndex,常量.对象.账号)
			TM_Data[2] = Char.GetData(_PlayerIndex,常量.对象.原名)
			EasyFile(pathCGBusiBank,'a',TM_Data)
			NLG.UpChar(_PlayerIndex);
			NLG.TalkToCli(_PlayerIndex,_MeIndex,"开户成功！",4,0)
			Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. ":开户成功！")
	end

	--if (Char.GetData(_PlayerIndex,144)==1) then	NLG.TalkToCli(_PlayerIndex, "Seqno[" ..  type(_Seqno) .. "]:" .. _Seqno .. "," .. "Select[" .. type(_Select) .. "]:" .. _Select .. "," .. "Data[" ..  type(_Data) .. "]:" .. _Data,4,0,-1) end
	
	if ((_Seqno==1 and _Data=='1') or (_Select == 32 and _Seqno>=99 and _Seqno<200)) then
		local TM_Tab = EasyFile(pathCGBusiBank,'r')
		local NumPage = 8
		local CurrPage = _Seqno-100+1
		if (_Seqno==1) then CurrPage = _Seqno end
		local MaxPage = math.ceil(table.getn(TM_Tab)/NumPage)
		local TM_Taba = EasyTable(TM_Tab,'Page',CurrPage,NumPage)
		local TalkMSG = ""
		local TalkButton = 50
		for i = 1,NumPage do
			if (TM_Taba[i]~=nil) then
				--local  t = TM_Taba[i][1] .. "," .. TM_Taba[i][2] .. "," .. TM_Taba[i][3] .. "," .. TM_Taba[i][4] .. "," .. TM_Taba[i][5]
				local  t = string.format("%9.9s",TM_Taba[i][1]) .. string.format("%12.12s",TM_Taba[i][2]) .. string.format("%11.10s",TM_Taba[i][3]) .. string.format("%11.10s",TM_Taba[i][4]) .. string.format("%3.2s",TM_Taba[i][5])
				TalkMSG = TalkMSG .. t
			end
		end
		if CurrPage == MaxPage then TalkButton=18 end
		if CurrPage == 1 then TalkButton=34 end
		if MaxPage == 1 then TalkButton=2 end
		NLG.ShowWindowTalked(_PlayerIndex ,_MeIndex, 2, TalkButton, CurrPage+100,"1\n　　　　　◆银行清单◆  (第" .. CurrPage .. "页，共" .. MaxPage .. "页)\n".. TalkMSG);
	elseif (_Select == 16 and _Seqno>=99 and _Seqno<200) then
		local TM_Tab = EasyFile(pathCGBusiBank,'r')
		local NumPage = 8
		local CurrPage = _Seqno-100-1
		local MaxPage = math.ceil(table.getn(TM_Tab)/NumPage)
		local TM_Taba = EasyTable(TM_Tab,'Page',CurrPage,NumPage)
		local TalkMSG = ""
		local TalkButton = 50
		for i = 1,NumPage do
			if (TM_Taba[i]~=nil) then
				--local  t = TM_Taba[i][1] .. "," .. TM_Taba[i][2] .. "," .. TM_Taba[i][3] .. "," .. TM_Taba[i][4] .. "," .. TM_Taba[i][5]
				local  t = string.format("%9.9s",TM_Taba[i][1]) .. string.format("%12.12s",TM_Taba[i][2]) .. string.format("%11.10s",TM_Taba[i][3]) .. string.format("%11.10s",TM_Taba[i][4]) .. string.format("%3.2s",TM_Taba[i][5])
				TalkMSG = TalkMSG .. t
			end
		end
		if CurrPage == MaxPage then TalkButton=18 end
		if CurrPage == 1 then TalkButton=34 end
		if MaxPage == 1 then TalkButton=2 end
		NLG.ShowWindowTalked(_PlayerIndex ,_MeIndex, 2, TalkButton, CurrPage+100,"1\n　　　　　◆银行清单◆  (第" .. CurrPage .. "页，共" .. MaxPage .. "页)\n".. TalkMSG);
	end
	
	PlayerDeposit = tonumber(TM_BusiBankTab[TM_TabIndex][3])
	PlayerLending = tonumber(TM_BusiBankTab[TM_TabIndex][4])
	local tGold = tonumber(Char.GetData(_PlayerIndex,常量.对象.金币))
	local tBank = tonumber(Char.GetData(_PlayerIndex,常量.对象.银行金币))
	local tDay = tonumber(TM_BusiBankTab[TM_TabIndex][5])

	if (_Seqno==1 and _Data=='2') then
		--『进入系统』
		NLG.ShowWindowTalked(_PlayerIndex,		_MeIndex, 2, 0, 2,
		"5\n　　　　　　　　　☆☆商业银行☆☆"..
		"\n个人账户信息：" ..
		"\n　　身上有现金[" .. tGold .. "]G,魔力银行存款[" .. tBank .. "]G。" ..
		"在商业银行已存款[" .. PlayerDeposit .. "]G," ..
		"在商业银行已贷款[" .. PlayerLending .. "]G,贷款天数[".. tDay .. "]天。" ..
		"\n　　　　　　　　　　『我要存款』"..
		"\n　　　　　　　　　　『领取存款』"..
		"\n　　　　　　　　　　『我要贷款』"..
		"\n　　　　　　　　　　『交还贷款』"..
		"\n　　　　　　　　　　『　退出　』");
	else
		--『　退出　』

	end
	
	if (_Seqno==2 and _Data=='1') then
		--『我要存款』
		local tMax = tGold
		if ((DepositMaxLimit-PlayerDeposit)<tMax) then tMax=DepositMaxLimit-PlayerDeposit end
		if (tMax<0) then tMax=0 end
		--NLG.TalkToCli(_PlayerIndex,DepositLimit .. "," .. tDay .. "," .. PlayerLending,0,0,-1)
		if (DepositLimit==1 and tDay>3 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆存款信息◆ " ..
																				"\n" ..
																				"\n商业银行通告：" ..
																				"\n" ..
																				"\n　　未还清贷款无法使用存款功能！",
																				  _MeIndex);
		else
			NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 1, 3, 11, "\n　　　　　　　　　　◆存款信息◆ " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n请输入需要存款的金额：" ..
																				"\n(最大值为" .. tMax .. ")");
		end
	elseif (_Seqno==2 and _Data=='2') then
		--『领取存款』
		local tMax = PlayerDeposit
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (DepositLimit==1 and tDay>3 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆取款信息◆ " ..
																				"\n" ..
																				"\n商业银行通告：" ..
																				"\n" ..
																				"\n　　未还清贷款无法使用取款功能！");
		else
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 12, "\n　　　　　　　　　　◆取款信息◆ " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n请输入需要取款的金额：" ..
																				"\n(最大值为" .. tMax .. ")");
		end
	elseif (_Seqno==2 and _Data=='3') then
		--『我要贷款』
		local tMax = LendingMaxLimit - PlayerLending
		local ttMax = 0
		local tLv = Char.GetData(_PlayerIndex,常量.对象.等级)
		for i = 1,table.getn(LendingLv) do
			if (tLv>=LendingLv[i]) then tMax = LendingLvRates[i]*tLv-PlayerLending end
		end
		ttMax = tMax
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tLv<LendingLvLimit) then tMax = 0 end
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 13, "\n　　　　　　　　　　◆贷款信息◆ " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n请输入需要贷款的金额：" ..
																				"\n(你的贷款总额上限为" .. ttMax .. "，当前可贷款最大值为" .. tMax .. ")");
	elseif (_Seqno==2 and _Data=='4') then
		--『交还贷款』
		local tMax = PlayerLending
		if (PlayerLending>tGold) then tMax=tGold end
		if (tMax<0) then tMax=0 end
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 1, 3, 14, "\n　　　　　　　　　　◆还贷信息◆ " ..
																				"\n" ..
																				"\n" ..
																				"\n" ..
																				"\n请输入需要还贷的金额：" ..
																				"\n(最大值为" .. tMax .. ")");
	else
		--『　退出　』
		
	end
	
	--EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[i][2],3,tonumber(TM_BusiBankTab[i][3])*(DepositRates+1))
	--PlayerDeposit = tonumber(TM_BusiBankTab[TM_TabIndex][3])
	--PlayerLending = tonumber(TM_BusiBankTab[TM_TabIndex][4])
	--local tGold = tonumber(Char.GetData(_PlayerIndex,常量.对象.金币))
	--local tBank = tonumber(Char.GetData(_PlayerIndex,常量.对象.银行金币))
	--local tDay = tonumber(TM_BusiBankTab[TM_TabIndex][5])
	
	if (_Seqno==11 and _Select==1 and tonumber(_Data)>0) then
		--『我要存款』
		local tMax = tGold
		if ((DepositMaxLimit-PlayerDeposit)<tMax) then tMax=DepositMaxLimit-PlayerDeposit end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (DepositLimit==1 and tDay>10 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆存款信息◆ " ..
														"\n" ..
														"\n商业银行通告：" ..
														"\n" ..
														"\n　　未还清贷款无法使用存款功能！");
		else
			Char.SetData(_PlayerIndex,常量.对象.金币,Char.GetData(_PlayerIndex,常量.对象.金币)-tMax)
			EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],3,tonumber(TM_BusiBankTab[TM_TabIndex][3])+tMax)
			NLG.UpChar(_PlayerIndex);
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆存款信息◆ " ..
														"\n" ..
														"\n商业银行通告：" ..
														"\n" ..
														"\n　　你已成功存入[" .. tMax .. "]G到个人账户！");
			Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. "：已成功存入[" .. tMax .. "]G到个人账户！")
		end
	elseif (_Seqno==12 and _Select==1 and tonumber(_Data)>0) then
		--『领取存款』
		local tMax = PlayerDeposit
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (DepositLimit==1 and tDay>10 and PlayerLending>0) then
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆取款信息◆ " ..
														"\n" ..
														"\n商业银行通告：" ..
														"\n" ..
														"\n　　未还清贷款无法使用取款功能！");
		else
			Char.SetData(_PlayerIndex,常量.对象.金币,Char.GetData(_PlayerIndex,常量.对象.金币)+tMax)
			EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],3,tonumber(TM_BusiBankTab[TM_TabIndex][3])-tMax)
			NLG.UpChar(_PlayerIndex);
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆取款信息◆ " ..
														"\n" ..
														"\n商业银行通告：" ..
														"\n" ..
														"\n　　你已成功从个人账户取出[" .. tMax .. "]G现金！");
			Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. "：已成功从个人账户取出[" .. tMax .. "]G现金！")
		end
	elseif (_Seqno==13 and _Select==1 and tonumber(_Data)>0) then
		--『我要贷款』
		local tMax = LendingMaxLimit - PlayerLending
		local tLv = Char.GetData(_PlayerIndex,常量.对象.等级)
		for i = 1,table.getn(LendingLv) do
			if (tLv>=LendingLv[i]) then tMax = LendingLvRates[i]*tLv-PlayerLending end
		end
		if ((PlayerGoldMax-tGold)<tMax) then tMax=PlayerGoldMax-tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		if (tLv<LendingLvLimit) then tMax = 0 end
		Char.SetData(_PlayerIndex,常量.对象.金币,Char.GetData(_PlayerIndex,常量.对象.金币)+tMax)
		EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],4,tonumber(TM_BusiBankTab[TM_TabIndex][4])+tMax)
		NLG.UpChar(_PlayerIndex);
		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆贷款信息◆ " ..
													"\n" ..
													"\n商业银行通告：" ..
													"\n" ..
													"\n　　你已成功从商业银行借贷出[" .. tMax .. "]G现金！");
		Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. "：已成功从商业银行借贷出[" .. tMax .. "]G现金！")
	elseif (_Seqno==14 and _Select==1 and tonumber(_Data)>0) then
		--『交还贷款』
		local tMax = PlayerLending
		if (PlayerLending>tGold) then tMax=tGold end
		if (tMax<0) then tMax=0 end
		if (tonumber(_Data)<tMax) then tMax=tonumber(_Data) end
		Char.SetData(_PlayerIndex,常量.对象.金币,Char.GetData(_PlayerIndex,常量.对象.金币)-tMax)
		EasyFile(pathCGBusiBank,'e',2,TM_BusiBankTab[TM_TabIndex][2],4,tonumber(TM_BusiBankTab[TM_TabIndex][4])-tMax)
		NLG.UpChar(_PlayerIndex);
		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 1, 999, "\n　　　　　　　　　　◆还贷信息◆ " ..
													"\n" ..
													"\n商业银行通告：" ..
													"\n" ..
													"\n　　你已成功在商业银行交还[" .. tMax .. "]G贷款！");
		Log("[商业银行][" .. Char.GetData(_PlayerIndex,常量.对象.账号) .. "]" .. Char.GetData(_PlayerIndex,常量.对象.原名) .. "：已成功在商业银行交还[" .. tMax .. "]G贷款！")
	else
		--『　退出　』
	end

return ;
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, List, Page
function EasyTable(strTable, intMode, intSub, intValue, intEditSub, intEditValue)
	if (strTable==nil) then return -1 end
	if (string.lower(intMode)=='read' or string.lower(intMode)=='r' or intMode=='读取') then
		local TM_buff = ''
		local TM_link = ''
		if (intSub==1) then TM_buff = TM_buff .. "{" end
		--[[
		for i=1,table.getn(strTable) do
			if (type(strTable[i])=='table') then
				TM_buff = TM_buff .. EasyTable(strTable[i],'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. strTable[i]
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		--]]
		for k,v in pairs(strTable) do
			if (type(v)=='table') then
				TM_buff = TM_buff .. EasyTable(v,'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. v
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		if (intSub==1) then 
			TM_buff = TM_buff .. "}"
		elseif (intValue=='Sub') then 
			TM_buff = TM_buff .. "\n"
		end
		return TM_buff
	elseif (string.lower(intMode)=='list' or string.lower(intMode)=='l' or intMode=='列表') then
		--EasyTable(sTable, "List", "Table")
		local TM = ""
		local sTitle = intSub
		if (sTitle=="" or sTitle==nil) then sTitle="Table" end
		for Key,Value in pairs(strTable) do
			if intValue=="" or intValue=="." or intValue==nil then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "." .. Key, intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "." .. Key .. "\n"
				else
					TM =  TM .. sTitle .. "." .. Key .. "=" .. Value .. "\n"
				end
			elseif intValue=="[" or intValue=="]" or intValue=="[]" or intValue==1 then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "[" .. Key .. "]", intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "\n"
				else
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "=" .. Value .. "\n"
				end
			end
		end
		return TM
	elseif (string.lower(intMode)=='check' or string.lower(intMode)=='c' or intMode=='查询') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return i;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='sort' or string.lower(intMode)=='s' or intMode=='排序') then
		if (intValue==1) then
			table.sort(strTable,function (a, b) return (a[intSub] > b[intSub]) end);
		else
			table.sort(strTable,function (a, b) return (a[intSub] < b[intSub]) end);
		end
		return 1;
	elseif (string.lower(intMode)=='get' or string.lower(intMode)=='g' or intMode=='获取') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return strTable[i][intEditSub];
			end
		end
		return -1;
	elseif (string.lower(intMode)=='edit' or string.lower(intMode)=='e' or intMode=='修改') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				strTable[i][intEditSub]=intEditValue;
				return 1;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='add' or string.lower(intMode)=='a' or intMode=='添加') then
		--[[
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return -1;
			end
		end
		--]]
		if (type(intSub)=='table') then
			table.insert(strTable,intSub);
		else
			local TM_Table = {};
			for i = 1,tonumber(intSub) do
				table.insert(TM_Table,-1);
			end
			TM_Table[1]=intValue;
			table.insert(strTable,TM_Table);
		end
		return table.getn(strTable);
	elseif (string.lower(intMode)=='del' or string.lower(intMode)=='d' or intMode=='删除') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return table.remove(strTable,i);
			end
		end
		return -1;
	elseif (string.lower(intMode)=='page' or string.lower(intMode)=='p' or intMode=='分页') then
		--EasyTable(strTable, 'Page', [第几页=1], [每页个数=6])
		if (type(intSub)~='number' or intSub<=0) then intSub=1 end
		if (type(intValue)~='number' or intValue<=0) then intValue=6 end
		local TM_Table = {}
		local tStartPage = ((intSub-1)*intValue)+1
		local tEndPage = tStartPage + intValue - 1
		if (tEndPage>table.getn(strTable)) then tEndPage=table.getn(strTable) end
		for i = tStartPage,tEndPage do
			EasyTable(TM_Table,'a',strTable[i])
		end
		return TM_Table;
	end
	return;
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, Clear
function EasyFile(strFile, strMode, intSub, intValue, intEditSub, intEditValue)
	if (strFile=="" or strFile==nil) then return "File Error" end
	local tabFile={}
	local tmpFile=""
	if (string.lower(strMode)=='read' or string.lower(strMode)=='r' or strMode=='读取') then
		local mfile = io.open(strFile,"r")
		for line in mfile:lines() do
			if (intSub=="" or intSub==nil) then
				EasyTable(tabFile,'Add',Split(line,","))
			elseif (intSub>0) then
				tabFile=Split(line,",")
				if (tabFile[intSub]==intValue) then break end
			elseif (string.lower(intSub)=="txt") then
				tmpFile = tmpFile .. line .. "\n"
			end
		end
		mfile:close()
		if (intSub=="" or intSub==nil or intSub>0) then
			return tabFile
		elseif (string.lower(intSub)=="txt") then
			return tmpFile
		end
	elseif (string.lower(strMode)=='sort' or string.lower(strMode)=='s' or strMode=='排序') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'sort',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='edit' or string.lower(strMode)=='e' or strMode=='修改') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'edit',intSub,intValue,intEditSub,intEditValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='del' or string.lower(strMode)=='d' or strMode=='删除') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'del',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='check' or string.lower(strMode)=='c' or strMode=='查询') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'check',intSub,intValue)
	elseif (string.lower(strMode)=='get' or string.lower(strMode)=='g' or strMode=='获取') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'get',intSub,intValue)
	elseif (string.lower(strMode)=='write' or string.lower(strMode)=='w' or strMode=='写入') then
		local mfile = io.open(strFile,"w")
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='add' or string.lower(strMode)=='a' or strMode=='追加') then
		local mfile = io.open(strFile,"a")
		if (type(intSub)=='table') then intSub=EasyTable(intSub,'r',nil,'Sub') end
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='clear' or string.lower(strMode)=='cl' or strMode=='清空') then
		local mfile = io.open(strFile,"w")
		mfile:write("")
		mfile:close()
		return "Success"
	end
end

function Log(strTxt,_Mode)
	local LogFile = "./lua/lua,log"
	local file = io.open(LogFile,"a")
	if _Mode==1 then
		file:write(strTxt,"\r\n")
	else
		file:write(os.date("%Y年%m月%d日%X："),strTxt,"\r\n")
	end
	file:close()
end
function table.getn(x) 
local ret=0; 
for i in pairs(x) do 
ret=ret+1 
end 
return ret 
end