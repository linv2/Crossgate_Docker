Delegate.RegInit("Boss_Init");
local bossID = {}
bossID[1] = {"������",100454,0,1000,168,21,"��ʥ�ø���",10000} ---��ͼ����BOSS���󣬵�ͼ���ͣ���ͼ��ţ������ϣ�BOSS������ʾ��ս����š�����encount��--����븴����� ���������


local BOSS������ = 1   ----�������ˢ�µ�����BOSS
function Myinit(_MeIndex)
	return true;
end
function Boss_referee()
	if (que_referee == nil) then
		que_referee = NL.CreateNpc("lua/Module/WorldBOSS.lua", "Myinit");
		Char.SetData(que_referee,%����_����%,101003);
		Char.SetData(que_referee,%����_ԭ��%,101003);
		Char.SetData(que_referee,%����_X%,20);
		Char.SetData(que_referee,%����_Y%,20);
		Char.SetData(que_referee,%����_��ͼ%,777);
		Char.SetData(que_referee,%����_����%,4);
		Char.SetData(que_referee,%����_����%,"boss");
		NLG.UpChar(que_referee);
		Char.SetLoopEvent("lua/Module/WorldBOSS.lua", "Boss", que_referee, 5000);
	end
end
function Boss_Init()
	Boss_referee();
end

local Openweek = {0,1,2,3,4,5,6}  --���ڼ�����
local Opening = {2,4,6,8,10,12,14,16,18,20,22} --���㿪��
local MinuteK = 0  ---���ŷ���
local Recovery = {3,5,7,9,11,13,15,17,19,21,23} --�������
local MinuteH = 0  ---���շ���
----------BOSS�ı�ż�¼-----ˢ�¼��������ü���--------
BOSS001 = 0
-------------------------------------------------------
BOSSSX = 0
--BOSSYD = 0

function Boss(_index)
	local tWeek = tonumber(os.date("%w", os.time()))
	local tHour = tonumber(os.date("%H", os.time()))
	local tMin = tonumber(os.date("%M", os.time()))
	local tS = tonumber(os.date("%S", os.time()))
	if Boss_CheckInTable(Openweek,tWeek)==true then
		if BOSSSX == 0 then	
			if Boss_CheckInTable(Opening,tHour)==true and tMin == MinuteK then
				Refresh_boss (_index)
				return
			end
		else
			if Boss_CheckInTable(Recovery,tHour)==true and tMin == MinuteH then
				Recoveryofboss (_index)
				return
			end
		end
	end
--	if BOSSYD == 1 then
--		local dir= math.random(0,7);
--		NLG.WalkMove(BOSS001,dir);
--		return
--	end
	return
end
function Refresh_boss (_index)
	if BOSSSX == 0 then	
		local SXJL =NLG.Rand(1,BOSS������);
		local A = bossID[SXJL][1]
		local B = bossID[SXJL][2]
		local C = bossID[SXJL][3]
		local D = bossID[SXJL][4]
		local E = bossID[SXJL][5]
		local F = bossID[SXJL][6]
		local G = bossID[SXJL][7]
		local H = bossID[SXJL][8]
		local NPC = NL.CreateArgNpc("WalkEnemy","1|1000|1|1000|0|0||||||||9999999|"..H.."|||||||||","����BOSS",B,C,D,E,F,1);
		BOSS001 = NPC
		BOSSSX = 1
		--BOSSYD = 1
		NLG.SystemMessage(-1, "[ϵͳ]��"..G.."������������BOSS���������ȥ����");
		return
	else
		NLG.SystemMessage(_index, "[ϵͳ]����ǰboss�Ѿ���ħ�����������ң��뾡������");
		return
	end	
end
function Recoveryofboss (_index)
	if BOSSSX == 1 then	
		Char.Warp(BOSS001, 0, 555, 10, 10)
		BOSSSX = 0
		--BOSSYD = 0
		NLG.SystemMessage(-1, "[ϵͳ]����������BOSS������ս���о����Ǻ���Ȥ��ĬĬ����ʧ�ˡ�");
		return
	else
		NLG.SystemMessage(_index, "[ϵͳ]����ǰû�п��Ի��յ�BOSS��");
		return
	end		
end
Delegate.RegDelTalkEvent("Boss_TalkEvent")
function Boss_TalkEvent(player,msg,color,range,size)
	local GM = Char.GetData(player,%����_GM%);
	if(msg == "/BOSS") then
		if GM >= 1 then
			Refresh_boss (_index)
		else
			NLG.SystemMessage(_index, "[ϵͳ]�����ǹ���Ա�޷�ʹ�á�����")
		end
	end
	if(msg == "/BOSS1") then
		if GM >= 1 then
			Recoveryofboss (_index)
		else
			NLG.SystemMessage(_index, "[ϵͳ]�����ǹ���Ա�޷�ʹ�á�����")
		end
	end
end
function Boss_CheckInTable(_idTab, _idVar) ---ѭ������
	for k,v in pairs(_idTab) do
		if v==_idVar then
			return true
		end
	end
	return false
end