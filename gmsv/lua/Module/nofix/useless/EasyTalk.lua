--�ű�����
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
local laba_stopcount = 3		--��ֹ���ȴ���
local laba_stoptime = 60		--��ֹ����ʱ��
local battle_remotepk = -2
local battle_watchpkA = -2
local battle_watchpkB = -2
tbl_joinPlayer={};
pvp_watch_status=0;
local LuaTalkList = {
			{"/��ս������һ��ȫ����ս�������һ�α��˷����ȫ����ս", 0},
			}

--ע��ȫ��˵��ί��
Delegate.RegDelTalkEvent("EasyTalkEvent");

--
function EasyTalkEvent(_PlayerIndex,_msg,_color,_range,_size)
	

	print(Char.GetData(_PlayerIndex, %����_����%) .. Char.GetData(_PlayerIndex, %����_GM%) .. "��" .. _msg)
	--TalkMsg = string.sub(_msg,3)
	local TalkMsg = _msg
	local TalkColor = _color
	local TalkRange = _range
	local TalkSize = _size
	local toStr = ""
----------------------
--TalkSilenced Start--
----------------------
	if (Char.GetData(_PlayerIndex,%����_GM%)<100) then
		local tKey = getTabKey(_PlayerIndex)
		if tab_silencedtime[tKey]~=nil and tab_silencedtime[tKey]>=os.time() then
			NLG.TalkToCli(_PlayerIndex, nil, "[ϵͳ] ��˵��̫���ˣ�����Ϣ " .. tab_silencedtime[tKey]-os.time() .. " �롣", 4, 1);
			--NLG.TalkToCli(_PlayerIndex, nil, "[ϵͳ] ��˵��̫���ˣ�����Ϣһ�¡�", 4, 1);
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
		--5���ڣ�������4����ͬ�����ݣ�����60��
		--3���ڣ�����˵��4�Σ�����10��
		--1���ڣ�����˵��3����ͬ�����ݣ�����3��
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
	if TalkMsg=="/��������" then	
		local NpcName = "������ȡ"	--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
		local CreditsName = "����"			--�������ƣ���ֵ������
		local ItemName = "��"			--��Ʒ���ƣ����ֿ���
		NLG.ShowWindowTalked(_PlayerIndex, tbl_LuaNpcIndex["ExtractCreditsNpc"], 2, 2, 1,
				"7\n��������������������" .. NpcName .. "��" ..
				"\nϵͳ˵��" ..
				"\n�������߳�ֵ������ȡϵͳ������վ��ֵ�ɹ���" ..
				"\n�ɵ��˴���ѯ��ֵ��[" .. CreditsName .. "]���Լ�����ȡ��" ..
				"\n[" .. ItemName .. "]���������һ���ȡ������" ..
				"\n����ÿ����ȡǰ�����Ƚ���һ�β�ѯ��" ..
				"\n����ȷ����������1��������������������Ը���" ..
				"\n����������������������ѯ" .. ItemName .. "��" ..
				"\n����������������������ȡ" .. ItemName .. "��"
				);
		return 0
	end
--------------	
--LuaTalk End
--------------

end