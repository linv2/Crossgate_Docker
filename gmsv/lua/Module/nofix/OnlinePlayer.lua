table_laba={};
table_dlcs={};
tbl_player={};
tbl_playername={};
tbl_hanging={}
if type(Players)~="table" then Players={} end
if type(tab_laba)~="table" then tab_laba={} end
if type(tab_siliao)~="table" then tab_siliao={} end
if type(tab_msg)~="table" then tab_msg={} end

Delegate.RegDelLoginEvent("OnlinePlayer_LoginEvent");
Delegate.RegDelDropEvent("OnlinePlayer_DropEvent");
Delegate.RegDelLogoutEvent("OnlinePlayer_LogoutEvent");
Delegate.RegDelLoginGateEvent("OnlinePlayer_LoginGateEvent");

--��¼ȫ���¼�
function OnlinePlayer_LoginEvent(_PlayerIndex)
	local Name = Char.GetData(_PlayerIndex, %����_����%)
	local Lv = Char.GetData(_PlayerIndex, %����_�ȼ�%)
	--NLG.SystemMessage(-1, "[����ħ������]��ӭ " .. Name .. "(Lv." .. Lv .. ") ������Ϸ��");
	--NLG.SystemMessage(_PlayerIndex,  "[����ħ������]���� /help ָ��鿴��ǰ����LuaTalkָ��");
	
	--��������б�
	All_Online(_PlayerIndex)

	return 1
end

--����뿪ȫ���¼�
function OnlinePlayer_DropEvent(_PlayerIndex)

	--��������б�
	All_Offline(_PlayerIndex)

	return 1
end

--��ҵǳ�ȫ���¼�������߲��ᴥ�����¼������Ҫ����������ݣ���д��All_DropEvent��
function OnlinePlayer_LogoutEvent(_PlayerIndex)

	--��������б�
	All_Offline(_PlayerIndex)

	Field.Set(_PlayerIndex, "yd_warp", Char.GetData(_PlayerIndex, %����_MAP%) .. "|" .. Char.GetData(_PlayerIndex, %����_��ͼ%) .. "|" .. Char.GetData(_PlayerIndex, %����_X%) .. "|" .. Char.GetData(_PlayerIndex, %����_Y%))

	return 1
end

--��ҵǳ�ȫ���¼�
function OnlinePlayer_LoginGateEvent(_PlayerIndex)

	return 1;
end

--------------------
--OnlineList Start--
--------------------
function All_Online(Index)
	local tPlayer = {
							CdKey = Char.GetData(Index, %����_�˺�%),
							Name = Char.GetData(Index, %����_����%),
							Index = Index,
							LoginTime = os.time()
							}
    Players[tPlayer.CdKey] = tPlayer;
	tab_laba[tPlayer.CdKey] = Index
	tab_siliao[tPlayer.CdKey] = Index
	tab_msg[tPlayer.CdKey] = Index
	return
end

function All_Offline(Index)
	local CdKey = Char.GetData(Index,2002)
	All_OfflineCdKey(CdKey)
	return
end

function All_OfflineCdKey(CdKey)
	Players[CdKey] = nil
	tab_laba[CdKey] = nil
	tab_siliao[CdKey] = nil
	tab_msg[CdKey] = nil
	if battle_remotepk==CdKey then battle_remotepk=-2 end
	return
end
------------------
--OnlineList End--
------------------