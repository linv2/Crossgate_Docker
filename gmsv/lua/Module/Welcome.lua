local announceflg = true; --���״ν�����Ϸ���ȫ������
local useloginpoint = false; --�Ƿ���������Զ����½��,������cgmsv.cf������,����Ĭ�Ϲر�
local WelcomeMessage = {};--��ӭ��
table.insert(WelcomeMessage,"��ӭʹ��cgmsv����");
table.insert(WelcomeMessage,"�Զ��延ӭ��Ϣ,����gmsv\\lua\\Module\\Welcome.lua���޸�!");


Delegate.RegDelLoginEvent("Welcome_LoginEvent");

function Welcome_LoginEvent(player)
	if (WelcomeMessage ~= nil) then --��ӭ��
		for _,text in ipairs(WelcomeMessage) do
		      NLG.TalkToCli(player,-1,text,%��ɫ_��ɫ%,%����_��%);
		end
		if (announceflg == true and Char.GetData(player,%����_��½����%) == 1) then
			NLG.SystemMessage(-1,"��ӭ["..Char.GetData(player,%����_ԭ��%).."]��������Ϸ.")
		end
	end

	if (useloginpoint == true and Char.EndEvent(player,0) == 0) then
		Char.Warp(player,0,1530,15,6);
	end

	local szBuffer ="\\n            ������ﻶӭʹ��cgmsv����������"..
					"\\n\\n�Զ��延ӭ��Ϣ,����gmsv\\lua\\Module\\Welcome.lua���޸�!"..
	NLG.ShowWindowTalked(player,player, 10, 2, 44, szBuffer);
end