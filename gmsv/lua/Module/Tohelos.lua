local NpcName = "��ʱ��ħ��"		--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 999, 16, 18}			--Npc��ͼ����
local NpcImage = 101022						--Npcͼ��101022
local NpcDir = 6							--Npc����0Ϊ���ϣ�˳ʱ��ת��
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�ϵͳ���á���������רҵ���������޸ģ�
------------------------------------------------------------------------------
--��ħ����Ʒ����
local TohelosItemID = 9700249
local TohelosItemName = "��ʱ��ħ�㣨10���ӣ�"
local TohelosTime = 10

local TohelosItemIDB = 9700248
local TohelosItemNameB = "��ʱ��ħ�㣨5���ӣ�"
local TohelosTimeB = 5

local TohelosItemIDC = 9700247
local TohelosItemNameC = "��ʱ��ħ�㣨2���ӣ�"
local TohelosTimeC = 2

local TohelosPlayer = {}
------------------------------------------------------------------------------

function TohelosNpc_Func(index)
	return 1;
end

Delegate.RegInit("TohelosNpc_Init");
function TohelosNpc_Init()
	local TohelosNpc = NL.CreateNpc("lua/Module/Tohelos.lua", "TohelosNpc_Func");
	Char.SetData( TohelosNpc, %����_����%, NpcImage);
	Char.SetData( TohelosNpc, %����_ԭ��%, NpcImage);
	Char.SetData( TohelosNpc, %����_��ͼ%, NpcMapPos[2]);
	Char.SetData( TohelosNpc, %����_X%, NpcMapPos[3]);
	Char.SetData( TohelosNpc, %����_Y%, NpcMapPos[4]);
	Char.SetData( TohelosNpc, %����_����%, NpcDir);
	Char.SetData( TohelosNpc, %����_����%, NpcName);
	NLG.UpChar(TohelosNpc)

	tbl_LuaNpcIndex = tbl_LuaNpcIndex or {}
	tbl_LuaNpcIndex["TohelosNpc"] = TohelosNpc

	Char.SetWindowTalkedEvent("lua/Module/Tohelos.lua", "TohelosNpc_WindowTalked", TohelosNpc)
end


Delegate.RegDelLogoutEvent("TohelosNpc_LogoutEvent");
function TohelosNpc_LogoutEvent(_PlayerIndex)
	TohelosNpc_ChangeStat(_PlayerIndex, 0)
	return 1
end


NL.RegItemString(nil, "TohelosNpc_ItemUse", "LUA_useTohelosQ");
function TohelosNpc_ItemUse(_PlayerIndex, _ToPlayerIndex, _Slot)
	local _itemindex = Char.GetItemIndex(_PlayerIndex,_Slot);
	local _itemID = Item.GetData(_itemindex,%����_��%);
	if (_itemID == TohelosItemID) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 10, 0, 0)
	end

	if (_itemID == TohelosItemIDB) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 20, 0, 0)
	end

	if (_itemID == TohelosItemIDC) then
	TohelosNpc_WindowTalked( tbl_LuaNpcIndex["TohelosNpc"], _PlayerIndex, 30, 0, 0)
	end
	return 1
end


function TohelosNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	--ȡ����ť
	if _Select==2 or _Seqno==99999 then
		return
	end

	if _Seqno==10 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
		local TohelosHour = math.floor((TohelosTime*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTime*TohelosItemNum, 60))
		local TohelosStat = "����"
		if Char.GetData(_PlayerIndex, %����_�����п���%)==0 then
			TohelosStat = "�ر�"
		end
		
		--Show WinTalk
		local TalkMsg = "������������������" .. NpcName .. "��" ..
						"\n" ..
						"\n��л���֧�֣���ǰϵͳ��Ϣ���£�" ..
						"\n" .. os.date("%X") ..
						"\n[��Ʒ����]��ÿ" .. TohelosTime .. "����1��" .. TohelosItemName .. "(�ȿ۳����ʱ)" ..
						"\n[ʣ������]��" .. TohelosItemName .. TohelosItemNum .. "��(��Լʹ��" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)" ..
						"\n[ʹ��״̬]��" .. TohelosStat .. "������(��[ȷ��]��ť�޸�״̬)" ..
						"\n" .. 
						"\n������ʾ��" .. 
						"\n��[ȷ��]������ħʹ��״̬���أ���[ȡ��]�رմ���"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 1, TalkMsg);
		return 1
	end

	if _Seqno==20 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
		local TohelosHour = math.floor((TohelosTimeB*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTimeB*TohelosItemNum, 60))
		local TohelosStat = "����"
		if Char.GetData(_PlayerIndex, %����_�����п���%)==0 then
			TohelosStat = "�ر�"
		end
		
		--Show WinTalk
		local TalkMsg = "������������������" .. NpcName .. "��" ..
						"\n" ..
						"\n��л���֧�֣���ǰϵͳ��Ϣ���£�" ..
						"\n" .. os.date("%X") ..
						"\n[��Ʒ����]��ÿ" .. TohelosTimeB .. "����1��" .. TohelosItemNameB .. "(�ȿ۳����ʱ)" ..
						"\n[ʣ������]��" .. TohelosItemNameB .. TohelosItemNum .. "��(��Լʹ��" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)" ..
						"\n[ʹ��״̬]��" .. TohelosStat .. "������(��[ȷ��]��ť�޸�״̬)" ..
						"\n" .. 
						"\n������ʾ��" .. 
						"\n��[ȷ��]������ħʹ��״̬���أ���[ȡ��]�رմ���"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 2, TalkMsg);
		return 1
	end

	if _Seqno==30 then
		--Get Stat
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
		local TohelosHour = math.floor((TohelosTimeC*TohelosItemNum)/60)
		local TohelosMinute = math.floor(math.fmod(TohelosTimeC*TohelosItemNum, 60))
		local TohelosStat = "����"
		if Char.GetData(_PlayerIndex, %����_�����п���%)==0 then
			TohelosStat = "�ر�"
		end
		
		--Show WinTalk
		local TalkMsg = "������������������" .. NpcName .. "��" ..
						"\n" ..
						"\n��л���֧�֣���ǰϵͳ��Ϣ���£�" ..
						"\n" .. os.date("%X") ..
						"\n[��Ʒ����]��ÿ" .. TohelosTimeC .. "����1��" .. TohelosItemNameC .. "(�ȿ۳����ʱ)" ..
						"\n[ʣ������]��" .. TohelosItemNameC .. TohelosItemNum .. "��(��Լʹ��" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)" ..
						"\n[ʹ��״̬]��" .. TohelosStat .. "������(��[ȷ��]��ť�޸�״̬)" ..
						"\n" .. 
						"\n������ʾ��" .. 
						"\n��[ȷ��]������ħʹ��״̬���أ���[ȡ��]�رմ���"

		NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 3, 3, TalkMsg);
		return 1
	end

	--��ȷ����
	if _Seqno==1 and _Select==1 then
		TohelosNpc_ChangeStat(_PlayerIndex)
		return 1
	end

	if _Seqno==2 and _Select==1 then
		TohelosNpc_ChangeStatB(_PlayerIndex)
		return 1
	end

	if _Seqno==3 and _Select==1 then
		TohelosNpc_ChangeStatC(_PlayerIndex)
		return 1
	end
end

function TohelosNpc_ChangeStat(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %����_�����п���%)==1) then
		Char.SetData(_PlayerIndex, %����_�����п���%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѹر�.")
		--NLG.UpChar(_PlayerIndex)
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %����_�����п���%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemID, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ���" .. TohelosItemName .. "�������㣬�޷�����.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_Loop", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %����_�����п���%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѿ�������ȫ��ɢ�����ø�ħ���������ζ...  " .. os.date("%X"))
		--NLG.UpChar(_PlayerIndex)
		return 1
	end
	
end

function TohelosNpc_Loop(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %����_�����п���%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTime*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemID)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemID, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemName .. "��ȫ�����꣬ϵͳ�Զ��ر�  " .. os.date("%X"))
				TohelosNpc_ChangeStat(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTime*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTime*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemName .. "��ʣ" .. TohelosItemNum-1 .. "��(��Լ" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)  " .. os.date("%X"))
		end
	end
	return 1
end

function TohelosNpc_ChangeStatB(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %����_�����п���%)==1) then
		Char.SetData(_PlayerIndex, %����_�����п���%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѹر�.")
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %����_�����п���%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDB, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ���" .. TohelosItemNameB .. "�������㣬�޷�����.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_LoopB", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %����_�����п���%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѿ�������ȫ��ɢ�����ø�ħ���������ζ...  " .. os.date("%X"))
		return 1
	end
	
end

function TohelosNpc_LoopB(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %����_�����п���%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTimeB*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDB)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDB, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemNameB .. "��ȫ�����꣬ϵͳ�Զ��ر�  " .. os.date("%X"))
				TohelosNpc_ChangeStatB(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTimeB*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTimeB*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemNameB .. "��ʣ" .. TohelosItemNum-1 .. "��(��Լ" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)  " .. os.date("%X"))
		end
	end
	return 1
end

function TohelosNpc_ChangeStatC(_PlayerIndex, _Stat)
	local tKey = _PlayerIndex
	if _Stat==0 or (Char.GetData(_PlayerIndex, %����_�����п���%)==1) then
		Char.SetData(_PlayerIndex, %����_�����п���%, 0)
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		TohelosPlayer[tKey] = 0
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѹر�.")
		return 0
	elseif _Stat==1 or (Char.GetData(_PlayerIndex, %����_�����п���%)==0) then
		local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
		if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDC, 1)<1 then
			NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ���" .. TohelosItemNameC .. "�������㣬�޷�����.")
			return -1
		end
		Char.SetLoopEvent(nil, nil, _PlayerIndex, 0)
		Char.SetLoopEvent(nil, "TohelosNpc_LoopC", _PlayerIndex, 1000)
		Char.SetData(_PlayerIndex, %����_�����п���%, 1)
		TohelosPlayer[tKey] = os.time()
		NLG.SystemMessage(_PlayerIndex,"[" .. NpcName .. "] ʹ��״̬�ѿ�������ȫ��ɢ�����ø�ħ���������ζ...  " .. os.date("%X"))
		return 1
	end
	
end

function TohelosNpc_LoopC(_PlayerIndex)
	if Char.GetData(_PlayerIndex, %����_�����п���%)==1 then
		local tKey = _PlayerIndex
		TohelosPlayer[tKey] = tonumber(TohelosPlayer[tKey]) or 0
		if (os.time()-TohelosPlayer[tKey])>(TohelosTimeC*60) then
			local TohelosItemNum = Char.ItemNum(_PlayerIndex, TohelosItemIDC)
			if TohelosItemNum<1 or Char.DelItem(_PlayerIndex, TohelosItemIDC, 1)<1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemNameC .. "��ȫ�����꣬ϵͳ�Զ��ر�  " .. os.date("%X"))
				TohelosNpc_ChangeStatC(_PlayerIndex, 0)
				return -1
			end
			local TohelosHour = math.floor((TohelosTimeC*TohelosItemNum)/60)
			local TohelosMinute = math.floor(math.fmod(TohelosTimeC*TohelosItemNum, 60))
			TohelosPlayer[tKey] = os.time()
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���" .. TohelosItemNameC .. "��ʣ" .. TohelosItemNum-1 .. "��(��Լ" .. TohelosHour .. "Сʱ" .. TohelosMinute .. "����)  " .. os.date("%X"))
		end
	end
	return 1
end