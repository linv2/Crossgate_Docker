--===========================================
--�������޸���������
--������Ʒ���
local ObjectCount = 9700427

--������Ʒ��������
local ObjectMax = 20

--���ʼ��ʣ��ٷֱȣ���ǰ���ʼ���Ϊ5%��
local Eqmax = 2
--���ʼʱ��
local funStime = 20
local funEtime = 23

--�����Ʒ�����ʾ
local tip = "���Կ�װ�һ����"

--===========================================



--===========================================
--���������벻Ҫ�޸�
local tmax;
--ע���ʼ���¼�
Delegate.RegInit("jp_Init");
function jp_Init()
	tmax = ObjectMax;
end

--ע��ս�������¼�
Delegate.RegDelBattleOverEvent("jp_BattleOver_Event");


function jp_BattleOver_Event(battle)
	
	for PwhI=0,9 do
		local PIndex = Battle.GetPlayer(battle,PwhI);
		if(PIndex >= 0) then
			if(Char.GetData(PIndex,%����_��%) == %��������_��%)then
				get_object(PIndex);
			end
		end
	end
end


function get_object(player)
	--�Ƿ��ڻʱ����
	if(tonumber(os.date("%H",os.time()))>= funStime and tonumber(os.date("%H",os.time())) < funEtime)then
		--�����Ʒ�Ѿ�����
		if(tmax <= 0)then
			return;
		end
		--��ȡ��ǰ����
		local thisEq = NLG.Rand(1,Eqmax);
		
		--��ʼ����
		local PlayerEq = NLG.Rand(1,100);
		local playermingzi = Char.GetData(player,%����_����%);
		if(PlayerEq <= thisEq)then  --��ý�Ʒ
			Char.GiveItem(player,ObjectCount,1);
			tmax = tmax - 1;
			NLG.SystemMessage(-1, "��ϲ���"..playermingzi..tip.."Կ�װ���ʣ��"..tmax.."��");
		end
	else
		--���佱Ʒ
		tmax = ObjectMax;

	end
end

