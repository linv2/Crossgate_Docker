local GMCDKEY = "shiluodegirl" --�����ʺ�
local NpcMetamo = 100452 --ǩ��npc����
local NpcMap = 1000 --ǩ��npc��ͼ
local Npcposx = 225 --ǩ��Npcx����
local Npcposy = 83 --ǩ��Npcy����
local NpcDir = 4 --ǩ��Npc����
local NpcName = "ǩ������Ա" --ǩ��npc����
local Npcmsg = "�������ǩ����ÿ��ǩ�����Եõ�������" --ǩ��˵��
local NpcChangeDays = "����ʱ�䵽������ǩ�������ѱ������" --���պ���
local VipEndEvent = 198 --�ж��Ƿ�vip��endevent���
local SignGiveItem = {} --ǩ������ĵ���
SignGiveItem[10] = {520026,520027} --SignGiveItem[level] = {item1,item2} �ȼ�Ϊlevelʱ��ͨ���õ�1��item1��vip�õ�1��item2
SignGiveItem[40] = {520028,520029}
SignGiveItem[70] = {520030,520031}
SignGiveItem[100] = {520032,520033}
SignGiveItem[130] = {520034,520035}
--*ע�⣺����ڷ������ر�ʱ���ڿ��� ���ڿ���ǰ�ֶ�ɾ��./lua/Module/Ŀ¼��MySignTemp.txt�ļ������򽫵��¹ط�ǰǩ�����޷�����ǩ����
--�����������򿪡��ƶ����޸Ļ�ɾ�����ļ������򽫵���ǩ����Ϣ��ʧ��
----------------------------------------------------------
local MySignValue1
for i = 1,999 do
	if SignGiveItem[i] == nil then
		SignGiveItem[i] = MySignValue1
	else
		MySignValue1 = SignGiveItem[i]
	end
end

function MySignValue2(npc)
	Char.SetData(npc,(%����_����%),NpcMetamo)
	Char.SetData(npc,%����_ԭ��%,NpcMetamo)
	Char.SetData(npc,%����_��ͼ%,NpcMap)
	--Char.SetData(npc,%����_X%,Npcposx)
	Char.SetData(npc,%����_X%,Npcposx)
	Char.SetData(npc,%����_Y%,Npcposy)
	Char.SetData(npc,%����_����%,NpcDir)
	Char.SetData(npc,%����_ԭ��%,NpcName)
	Char.SetTalkedEvent(nil, "MySignValue3",npc)
	Char.SetWindowTalkedEvent(nil,"MySignValue6",npc)
	Char.SetLoopEvent(nil,"MySignValue7",npc,1000)
	NLG.UpChar(npc)
	return true
end

function MySignValue3(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local MySignValue4 = "3\n��ѡ������Ҫ�ķ���\n\n\n1.ǩ��˵��\n2.����ǩ��"
		local MySignValue5 = Char.GetData(player,%����_CDK%)
		if MySignValue5 == GMCDKEY then
			MySignValue4 = MySignValue4.."\n3.��������ǩ��"
		end
		NLG.ShowWindowTalked(player,npc,2,2,0,MySignValue4)
	end
end

function MySignValue6(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					NLG.ShowWindowTalked(player,npc,0,2,2,Npcmsg)
				elseif tonumber(Data) == 2 then
					MySignValue8(player)
				elseif tonumber(Data) == 3 then
					local MySignValue5 = Char.GetData(player,%����_CDK%)
					if MySignValue5 == GMCDKEY then
						MySignValue17 = os.time()
						SignInReset()
					end
				end
			end
		end
	end	
end

function MySignValue7(npc)
	if os.date("%x",MySignValue17) ~= os.date("%x",os.time()) then
		MySignValue17 = os.time()
		SignInReset()
		if type(NpcChangeDays) == "string" then
			NLG.SystemMessage(-1,NpcChangeDays)
		end
	end
end

function MySignValue8(player)
	local MySignValue5 = Char.GetData(player,%����_CDK%)
	local MySignValue9  = Char.GetData(player,%����_�ȼ�%)
	local MySignValue10  = Char.EndEvent(player,VipEndEvent)
	if Char.ItemSlot(player) <= 19 then
		if MySignValue16[MySignValue5] == nil then
			MySignValue16[MySignValue5] = 1
			local MySignValue11 = io.open("./lua/Module/MySignTemp.txt","a")
			MySignValue11:write(MySignValue5.."\n")
			MySignValue11:close()
			Char.GiveItem(player,SignGiveItem[MySignValue9][1+MySignValue10],1)
			NLG.SystemMessage(player,"ǩ���ɹ���")
		else
			NLG.SystemMessage(player,"���Ѿ�ǩ�����ˡ�")
		end
	else
		NLG.SystemMessage(player,"��Ķ���̫���ˡ�")
	end
end

function SignInReset(key)
	if key ~= nil and key == 1 then
		local MySignValue12 = io.open("./lua/Module/MySignTemp.txt","r")
		if MySignValue12 ~= nil then
			for line in MySignValue12:lines() do
				MySignValue16[line] = 1
			end
			MySignValue12:close()
		else
			local MySignValue13 = io.open("./lua/Module/MySignTemp.txt","w")
			MySignValue13:close()
		end
	else
		local MySignValue14 = io.open("./lua/Module/MySignTemp.txt","w")
		MySignValue14:close()
		MySignValue16 = {}
	end
end

if MySignValue15 == nil or MySignValue15 < 0 then
	MySignValue15 = NL.CreateNpc(nil,"MySignValue2")
end

if type(MySignValue16) ~= "table" then
	MySignValue16 = {}
	SignInReset(1)
	MySignValue17 = os.time()
end
