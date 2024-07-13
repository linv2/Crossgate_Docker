local smoney=0;
local smoney1=0;
local num=0;
local everymoney=0;
local getmoneyplayer_list = {};
local everymoney_list = {};
local othermoney_list = {};
local getmoney_list = {};
local sendmoneyplayer = 0;
local M_status = 1;
local STime = 0;
local m = 1;
local n = 1;
local lastTime = os.time();
Delegate.RegInit("initmoneyNpc");

function initmoneyNpc()
	local moneyNpc = NL.CreateNpc("lua/Module/money.lua","Npc_Func");
	Char.SetData(moneyNpc,%对象_形象%,101003);
	Char.SetData(moneyNpc,%对象_原形%,101003);
	Char.SetData(moneyNpc,%对象_X%,19);
	Char.SetData(moneyNpc,%对象_Y%,19);
	Char.SetData(moneyNpc,%对象_地图%,777);
	Char.SetData(moneyNpc,%对象_方向%,4);
	Char.SetData(moneyNpc,%对象_原名%,"抢红包");
	NLG.UpChar(moneyNpc);
	Char.SetLoopEvent("lua/Module/money.lua", "moneyLoop", moneyNpc, 1000);
	return true;
end
function Npc_Func(index)
	return true
end

Delegate.RegDelTalkEvent("money_talk_Event");

function money_talk_Event(_PlayerIndex,msg)
		if(M_status==1)then
	  if string.find(msg, "/发红包 ")~=nil then
    sendmoneyplayer = _PlayerIndex;
	  local toStr = string.sub(msg,string.len("/发红包 ")+1);
		local toSplit = string.find(toStr,"mb ");
		local toSplit1 = string.find(toStr,"个");
        smoney = string.sub(toStr,1,toSplit-1);
        smoney1=tonumber(smoney);
        num = string.sub(toStr,toSplit+3,toSplit1-1);
        everymoney= math.floor(smoney / num);
      local money1 = Char.GetData(_PlayerIndex,%对象_金币%)-smoney;
			if money1 < 0 then
							NLG.SystemMessage(_PlayerIndex,"[系统] 身上魔币数量不足");
							return
		 end
		if everymoney >1 then
		Char.SetData(_PlayerIndex,%对象_金币%,money1);
				NLG.UpChar(_PlayerIndex);
				NLG.SystemMessage(_PlayerIndex,"[系统] 红包发送成功");
			  NLG.SystemMessage(-1,"☆玩家红包☆ 本轮抢红包格式为:/抢红包 ".._PlayerIndex..",手快不如运气好！");
				sendsmoney(_PlayerIndex);	
				n=1;
			  STime = os.time();
		    M_status=2;
		else
				NLG.SystemMessage(_PlayerIndex,"[系统] 红包总额太小");
		end
    end				
		end
	if(M_status==2)then
		if msg =="/抢红包 "..sendmoneyplayer then
		local money = Char.GetData(_PlayerIndex,%对象_金币%);
		if smoney1 >0 then
		  for m=1,num do
				if getmoneyplayer_list[m] ==_PlayerIndex then
				   NLG.SystemMessage(_PlayerIndex,"[系统] 已经抢过该轮红包");	
				   return 
        end
    	end
		     if getmoneyplayer_list[n] ==nil then
           getmoneyplayer_list[n] =_PlayerIndex;
         end
    local getgold = money+getmoney_list[n];
		Char.SetData(_PlayerIndex,%对象_金币%,getgold);
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(-1,"☆玩家红包☆ "..Char.GetData(_PlayerIndex,%对象_名字%).."抢到"..Char.GetData(sendmoneyplayer,%对象_名字%).."的红包"..getmoney_list[n].."金币");	
			smoney1=smoney1-getmoney_list[n];
			n=n+1;
		if smoney1 == 0 then
				STime = 0;
				getmoneyplayer_list = {};
				NLG.SystemMessage(-1,"☆玩家红包☆ "..Char.GetData(sendmoneyplayer,%对象_名字%).."的红包这么快就被抢完了");
				M_status = 1;
         end	
					end
				end
			end	
end
function sendsmoney(index)
		for k=1,num do
   everymoney_list[k] = math.random(1,everymoney);
   othermoney_list[k] = everymoney - everymoney_list[k];
   end
   	for k=1,num do
  local j = math.random(1,num);
  getmoney_list[k]= everymoney_list[k] + othermoney_list[j];
  smoney=smoney- getmoney_list[k];
  end
  getmoney_list[1]=getmoney_list[1]+ smoney;
  return getmoney_list;
end
function Init(index)
	return true;
end

function moneyLoop(index)
	GSTime = os.time();
	if(GSTime - lastTime >= 3600) then
			lastTime = os.time();
			NLG.SystemMessage(-1,"[系统] 玩家红包发送格式为/发红包 总金额mb 红包数量个 ,比如/发红包 1000mb 10个,代表发送总额为1000mb的10个红包,一分钟后没抢完的红包剩余金额退回原玩家.");
    end
		if(smoney1>0) then
     local nowTime = os.time();		
		if(nowTime -STime == 60) then
			M_status = 1;
			STime = 0;
			getmoneyplayer_list = {};
			NLG.SystemMessage(-1,"☆玩家红包☆ "..Char.GetData(sendmoneyplayer,%对象_名字%).."的红包竟然没抢完,剩余"..smoney1.."金币");
		if smoney1 > 0 then
	  local money1 = Char.GetData(sendmoneyplayer,%对象_金币%);
	  local getgold1 = money1+smoney1;
		Char.SetData(sendmoneyplayer,%对象_金币%,getgold1);
			NLG.UpChar(sendmoneyplayer);
		  NLG.SystemMessage(sendmoneyplayer,"[系统] 退回上个红包剩余的"..smoney1.."金币");
		  smoney1=0;	
		end		
		end
	end
end

