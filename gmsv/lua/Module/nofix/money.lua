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
	Char.SetData(moneyNpc,%����_����%,101003);
	Char.SetData(moneyNpc,%����_ԭ��%,101003);
	Char.SetData(moneyNpc,%����_X%,19);
	Char.SetData(moneyNpc,%����_Y%,19);
	Char.SetData(moneyNpc,%����_��ͼ%,777);
	Char.SetData(moneyNpc,%����_����%,4);
	Char.SetData(moneyNpc,%����_ԭ��%,"�����");
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
	  if string.find(msg, "/����� ")~=nil then
    sendmoneyplayer = _PlayerIndex;
	  local toStr = string.sub(msg,string.len("/����� ")+1);
		local toSplit = string.find(toStr,"mb ");
		local toSplit1 = string.find(toStr,"��");
        smoney = string.sub(toStr,1,toSplit-1);
        smoney1=tonumber(smoney);
        num = string.sub(toStr,toSplit+3,toSplit1-1);
        everymoney= math.floor(smoney / num);
      local money1 = Char.GetData(_PlayerIndex,%����_���%)-smoney;
			if money1 < 0 then
							NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ����ħ����������");
							return
		 end
		if everymoney >1 then
		Char.SetData(_PlayerIndex,%����_���%,money1);
				NLG.UpChar(_PlayerIndex);
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ������ͳɹ�");
			  NLG.SystemMessage(-1,"����Һ���� �����������ʽΪ:/����� ".._PlayerIndex..",�ֿ첻�������ã�");
				sendsmoney(_PlayerIndex);	
				n=1;
			  STime = os.time();
		    M_status=2;
		else
				NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ����ܶ�̫С");
		end
    end				
		end
	if(M_status==2)then
		if msg =="/����� "..sendmoneyplayer then
		local money = Char.GetData(_PlayerIndex,%����_���%);
		if smoney1 >0 then
		  for m=1,num do
				if getmoneyplayer_list[m] ==_PlayerIndex then
				   NLG.SystemMessage(_PlayerIndex,"[ϵͳ] �Ѿ��������ֺ��");	
				   return 
        end
    	end
		     if getmoneyplayer_list[n] ==nil then
           getmoneyplayer_list[n] =_PlayerIndex;
         end
    local getgold = money+getmoney_list[n];
		Char.SetData(_PlayerIndex,%����_���%,getgold);
			NLG.UpChar(_PlayerIndex);
			NLG.SystemMessage(-1,"����Һ���� "..Char.GetData(_PlayerIndex,%����_����%).."����"..Char.GetData(sendmoneyplayer,%����_����%).."�ĺ��"..getmoney_list[n].."���");	
			smoney1=smoney1-getmoney_list[n];
			n=n+1;
		if smoney1 == 0 then
				STime = 0;
				getmoneyplayer_list = {};
				NLG.SystemMessage(-1,"����Һ���� "..Char.GetData(sendmoneyplayer,%����_����%).."�ĺ����ô��ͱ�������");
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
			NLG.SystemMessage(-1,"[ϵͳ] ��Һ�����͸�ʽΪ/����� �ܽ��mb ��������� ,����/����� 1000mb 10��,�������ܶ�Ϊ1000mb��10�����,һ���Ӻ�û����ĺ��ʣ�����˻�ԭ���.");
    end
		if(smoney1>0) then
     local nowTime = os.time();		
		if(nowTime -STime == 60) then
			M_status = 1;
			STime = 0;
			getmoneyplayer_list = {};
			NLG.SystemMessage(-1,"����Һ���� "..Char.GetData(sendmoneyplayer,%����_����%).."�ĺ����Ȼû����,ʣ��"..smoney1.."���");
		if smoney1 > 0 then
	  local money1 = Char.GetData(sendmoneyplayer,%����_���%);
	  local getgold1 = money1+smoney1;
		Char.SetData(sendmoneyplayer,%����_���%,getgold1);
			NLG.UpChar(sendmoneyplayer);
		  NLG.SystemMessage(sendmoneyplayer,"[ϵͳ] �˻��ϸ����ʣ���"..smoney1.."���");
		  smoney1=0;	
		end		
		end
	end
end

