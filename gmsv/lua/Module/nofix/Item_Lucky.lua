--[[
��	�齱����					LUA_useLuckyItem						6686	26220	0	26		0	1	0	93	1	1	0	1		1	1			0	0																																																				0	0					0	0	1			0	8000103	10515	100	0	0			0
]]


local PItemChar =PItemChar or {}
local NpcName = "���߳齱"			--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 777, 21, 24}		--Npc��ͼ����
local NpcImage =100500					--Npcͼ��104561
local NpcDir = 5						--Npc����0Ϊ���ϣ�˳ʱ��ת��
local TianQi =TianQi or 0						--����Ĭ������
local TianQiLastTime =10						--���ó���ʱ����
local TianQiNowTime =TianQiNowTime or 0	--����������ʼ

---------------
luckyItem={}--�صȽ�����
luckyItem["�صȽ�"]={}
luckyItem["�صȽ�"][1]={"�����ĵ�","I|9700366|1",100}
luckyItem["�صȽ�"][2]={"��������","I|9700350|1",100}
luckyItem["һ�Ƚ�"] ={}--һ�Ƚ�
luckyItem["һ�Ƚ�"][1]={"����������LV3���ܿ�","I|9700351|1",50}
luckyItem["һ�Ƚ�"][2]={"�������","I|9700294|1",150}
luckyItem["һ�Ƚ�"][3]={"�������","I|9700295|1",150}
luckyItem["һ�Ƚ�"][4]={"�������","I|9700296|1",150}
luckyItem["һ�Ƚ�"][5]={"�������","I|9700297|1",150}
luckyItem["һ�Ƚ�"][6]={"ˮ����ĵ�","I|9700367|1",100}
luckyItem["һ�Ƚ�"][7]={"è�ܵĵ�","I|9700368|1",100}
luckyItem["һ�Ƚ�"][8]={"���������","I|18851|1",50}
luckyItem["һ�Ƚ�"][9]={"���������","I|18852|1",50}
luckyItem["һ�Ƚ�"][10]={"���������","I|18853|1",50}
luckyItem["һ�Ƚ�"][11]={"���������","I|18854|1",100}
luckyItem["һ�Ƚ�"][12]={"���������","I|18855|1",100}
luckyItem["һ�Ƚ�"][13]={"���õķ���","I|18858|1",100}
luckyItem["һ�Ƚ�"][14]={"���õķ���","I|18859|1",100}
luckyItem["һ�Ƚ�"][15]={"���õķ���","I|18860|1",100}
luckyItem["һ�Ƚ�"][16]={"���õķ���","I|18861|1",30}
luckyItem["һ�Ƚ�"][17]={"���õķ���","I|18862|1",30}
luckyItem["һ�Ƚ�"][18]={"���õķ���","I|18863|1",50}
luckyItem["һ�Ƚ�"][19]={"���õķ���","I|18864|1",100}
luckyItem["һ�Ƚ�"][20]={"���ص�ȫ����","I|9700309|1",100}
luckyItem["һ�Ƚ�"][21]={"���ص�ȫ����","I|9700310|1",100}
luckyItem["���Ƚ�"]={}--2�Ƚ�
luckyItem["���Ƚ�"][1]={"����ҩˮ","I|45745|1",100}
luckyItem["���Ƚ�"][2]={"11������������","I|9700024|1",20}
luckyItem["���Ƚ�"][3]={"12������������","I|9700025|1",40}
luckyItem["���Ƚ�"][4]={"13������������","I|9700026|1",60}
luckyItem["���Ƚ�"][5]={"14������������","I|9700027|1",80}
luckyItem["���Ƚ�"][6]={"15������������","I|9700028|1",100}
luckyItem["���Ƚ�"][7]={"����Ѫ��֮�����ͼE","I|9700316|1",100}
luckyItem["���Ƚ�"][8]={"�������֮�����ͼE","I|9700321|1",100}
luckyItem["���Ƚ�"][9]={"�������ķ�����ͼE","I|9700326|1",100}
luckyItem["���Ƚ�"][10]={"����֩�����ͼE","I|9700333|1",100}
luckyItem["���Ƚ�"][11]={"������������룩","I|9700360|1",100}
luckyItem["���Ƚ�"][12]={"7����ʯ��","I|9700346|1",500}
luckyItem["���Ƚ�"][13]={"8����ʯ��","I|9700347|1",50}
luckyItem["���Ƚ�"][14]={"��ħ��600��","I|9700252|1",150}
luckyItem["���Ƚ�"][15]={"�����ĵ�","I|9700327|1",50}
luckyItem["���Ƚ�"][16]={"תְ��֤��","I|607686|1",50}
luckyItem["���Ƚ�"][17]={"ʱ��ˮ��L6","I|9700014|1",50}
luckyItem["���Ƚ�"]={}--3�Ƚ�
luckyItem["���Ƚ�"][1]={"��Կ��","I|16001|5",100}
luckyItem["���Ƚ�"][2]={"��Կ��","I|16002|5",100}
luckyItem["���Ƚ�"][3]={"�ص�ˮ��","I|9201|1",100}
luckyItem["���Ƚ�"][4]={"ˮ��ˮ��","I|9202|1",100}
luckyItem["���Ƚ�"][5]={"���ˮ��","I|9203|1",100}
luckyItem["���Ƚ�"][6]={"���ˮ��","I|9204|1",100}
luckyItem["���Ƚ�"][7]={"�������Ƭ","I|18843|1",50}
luckyItem["���Ƚ�"][8]={"����ϴ����","I|9700254|1",10}
luckyItem["�ĵȽ�"]={}--4�Ƚ�
luckyItem["�ĵȽ�"][1]={"�����İ�ȫñ","I|9700029|1",100}
luckyItem["�ĵȽ�"][2]={"����֮��","I|18449|1",100}
luckyItem["�ĵȽ�"][3]={"ħ���ˮ��","I|18450|1",100}
luckyItem["�ĵȽ�"][4]={"����֤֮","I|18451|1",100}
-- luckyItem["�ĵȽ�"][8]={"ʱ��ˮ��LV1","I|50050|1",50}
-- luckyItem["�ĵȽ�"][9]={"��ħ��L1","I|70282|1",50}
-- luckyItem["�ĵȽ�"][10]={"��ħ�㣨360����","I|51194|1",50}
luckyItem["��ο��"]={}--��ο��
luckyItem["��ο��"][1]={"ħ��200","G|0|300",50}
luckyItem["��ο��"][2]={"ħ��100","G|0|100",100}
local Jiang={}	
Jiang[1]={"�صȽ�",0,1}
Jiang[2]={"һ�Ƚ�",0,8}
Jiang[3]={"���Ƚ�",0,20}
Jiang[4]={"���Ƚ�",0,30}
Jiang[5]={"�ĵȽ�",0,40}
Jiang[6]={"��ο��",0,80}
Jiang[7]={"лл�ݹ�",0,80}
function RandomGiveItem(ItemTab)--��Ʒ���ʽӿ�
	local �ܸ���=0
	for i =1,#ItemTab do
		�ܸ��� =�ܸ���+ItemTab[i][3]
	end
	local ���ID = math.random(1,�ܸ���);--jp�ܸ��ʣ�toJP=�ܸ�������һ�����ֵ
	local JP1=0
	local Num=0
	for b =1,#ItemTab do
		JP1=JP1+ ItemTab[b][3]
		if JP1>= ���ID then
			Num= b
			break
		end
	end
	return Num
end
function initLuckyItemNpc()
	if (LuckyItemNpc == nil) then
  local LuckyItemNpc = NL.CreateNpc("lua/Module/Item_Lucky.lua","LuckyItemNpc_Init");
	Char.SetData(LuckyItemNpc,%����_����%,NpcImage);
	Char.SetData(LuckyItemNpc,%����_ԭ��%,NpcImage);
	Char.SetData(LuckyItemNpc,%����_X%,NpcMapPos[3]);
	Char.SetData(LuckyItemNpc,%����_Y%,NpcMapPos[4]);
	Char.SetData(LuckyItemNpc,%����_��ͼ%,NpcMapPos[2]);
	Char.SetData(LuckyItemNpc,%����_����%,NpcDir);
	Char.SetData(LuckyItemNpc,%����_ԭ��%,NpcName);
	NLG.UpChar(LuckyItemNpc);
	Char.SetLoopEvent(nil, "LuckyItemNpcTime",LuckyItemNpc,1000);--20����һ���Ƿ�
	Char.SetWindowTalkedEvent(nil,"NPC_ItemNpcWTEvent",LuckyItemNpc);
  end
end

local TianQi =TianQi or 0						--����Ĭ������
local TianQiLastTime =10						--���ó���ʱ����
local TianQiNowTime =TianQiNowTime or 0	--����������ʼ
function LuckyItemNpcTime(MeIndex)
	if TianQi~= 0 then
		if tonumber(os.time())-TianQiNowTime >TianQiLastTime then
			TianQi = 0						--����Ĭ������
			TianQiNowTime = 0			--����������ʼ
			for k,v in pairs(Players) do
				toCdKey=k
			local MapID=Char.GetData(Players[toCdKey]["Index"],3);
			local FloorID=Char.GetData(Players[toCdKey]["Index"],4);
			NLG.MapEffect(MapID,FloorID,0,0);
			end
		end
	end
end



	
function ChangeLuckyItem(_PlayerIndex,_ItemIndex,_itemslot)

	local Zc1= Item.GetData(_ItemIndex,%����_�Ӳ�һ%);
	local Dur = Item.GetData(_ItemIndex,%����_�;�%);
	local Zc2= Item.GetData(_ItemIndex,%����_�Ӳζ�%);
	if _ItemIndex == -1 then
		NLG.SystemMessage(_PlayerIndex,"����ʹ�ò�������")
		return
	end

	local _ItemNum=Item.GetData(_ItemIndex,%����_�ѵ���%)
	local _ItemDur=Item.GetData(_ItemIndex,%����_�;�%)
--	local _ItemPos=Char.GetItemPos(_PlayerIndex,_ItemIndex)
	if _ItemNum>1 then
		Item.SetData(_ItemIndex,%����_�ѵ���%,_ItemNum-1)
		Item.UpItem(_PlayerIndex,_itemslot);
	else 
    Item.Kill(_PlayerIndex,_ItemIndex,_itemslot)
	end
	--Char.DelItemByIndex(_PlayerIndex,_ItemIndex)
	local YYNum = RandomGiveItem(Jiang)
	local LuckyNum =Jiang[YYNum][1]
	local RandomNum=math.random(0,1000)
	--[[local RandomNum=math.random(0,1000)
	if RandomNum==1 then
		LuckyNum="�صȽ�"
	elseif RandomNum>=990 then
		LuckyNum="һ�Ƚ�"
	elseif RandomNum>=950 then
		LuckyNum="���Ƚ�"
	elseif RandomNum>=850 then
		LuckyNum="���Ƚ�"	
	elseif RandomNum>=600 then
		LuckyNum="�ĵȽ�"	
	elseif RandomNum>=400 then
		LuckyNum="��ο��"	
	end]]
	
	
	local LuckyGiveItem
	if LuckyNum ~= "лл�ݹ�" then
		LuckyGiveItem = RandomGiveItem(luckyItem[LuckyNum])
--		Char.GiveItem(_PlayerIndex,luckyItem[LuckyNum][LuckyGiveItem][2])
		EasyGive(_PlayerIndex,luckyItem[LuckyNum][LuckyGiveItem][2])
			end
	if LuckyNum=="һ�Ƚ�" or LuckyNum=="�صȽ�" or LuckyNum=="���Ƚ�" then
		NLG.SystemMessage(-1,"[�����Ʊ] ��ϲ���"..Char.GetData(_PlayerIndex,%����_ԭ��%).."�鵽"..LuckyNum..luckyItem[LuckyNum][LuckyGiveItem][1].."��")	
		TianQi = 1						--����Ĭ������
		TianQiNowTime = tonumber(os.time())	
		for k,v in pairs(Players) do
			toCdKey=k
			local MapID=Char.GetData(Players[toCdKey]["Index"],3);
			local FloorID=Char.GetData(Players[toCdKey]["Index"],4);
			NLG.MapEffect(MapID,FloorID,4,6);
		end	
	elseif LuckyNum=="���Ƚ�" or LuckyNum=="�ĵȽ�"   then
		NLG.SystemMessage(_PlayerIndex,"[�����Ʊ] ��ϲ���"..Char.GetData(_PlayerIndex,%����_ԭ��%).."����"..LuckyNum..luckyItem[LuckyNum][LuckyGiveItem][1])	--�õ�������
	elseif  LuckyNum=="��ο��" then
		NLG.SystemMessage(_PlayerIndex,"[�����Ʊ] ���ź�������е��ǣ�"..LuckyNum);
	else
		NLG.SystemMessage(_PlayerIndex,"[�����Ʊ] ���ź����㲢û�в��д˴δ�"..LuckyNum);
	end
end

Delegate.RegInit("LuckyItem_Init");

function LuckyItemNpc_Init(index)
	print("LuckyItem SUCCESS");
	return 1;
end

function LuckyItem_Init()
	initLuckyItemNpc();
	NL.RegItemString("lua/Module/Item_Lucky.lua","LuckyItem","LUA_useLuckyItem");
end

function LuckyItem(_PlayerIndex,_ItemIndex,_itemslot)
	PItemChar[_PlayerIndex] = nil
	local _ItemIndex = Char.GetItemIndex(_PlayerIndex,_itemslot);
	local ItemType=Item.GetData(_ItemIndex,2007)
	if ItemType == "LUA_useLuckyItem" then
		ChangeLuckyItem(_PlayerIndex,_ItemIndex,_itemslot);
		return 1
	end
	return 0;
end
	
function EasyGive(_PlayerIndex,GiveStr)
	local TM_Give = Split(GiveStr,"|")
	TM_Give[2] = tonumber(TM_Give[2])
	TM_Give[3] = tonumber(TM_Give[3])
	local TM_RT = ""
	if (TM_Give[1]=="G") then
		Char.SetData(_PlayerIndex,%����_���%,Char.GetData(_PlayerIndex,%����_���%)+TM_Give[3]);
		TM_RT = "[���]" .. TM_Give[3] .. "G"
			NLG.SystemMessage(_PlayerIndex,"��һ��" .. TM_Give[3] .. "G");	
	elseif (TM_Give[1]=="I") then
		if Char.ItemSlot(_PlayerIndex) == 20 then
		
			TM_RT = "[����]��ȡ����ʧ�ܣ�����������!"
		else
			Char.GiveItem(_PlayerIndex,TM_Give[2],TM_Give[3])
			TM_RT = "[����]*" .. TM_Give[3] .. "����"
		end
	elseif (TM_Give[1]=="P") then
		if Char.PetNum(_PlayerIndex)==5 then
			TM_RT = "[����]��ȡ����ʧ�ܣ�����������!"
		else
			if tonumber(TM_Give[3])>=1 then TM_Give[3]=1 end
			local PetIndex=NLG.GivePet(_PlayerIndex,TM_Give[2],TM_Give[3])
			if PetIndex>=0 then
				PetName=Char.GetData(PetIndex,%����_ԭ��%)
				if TM_Give[3]==0 then
					TM_RT = "[����]" .. PetName.. "*1ֻ��"
				else
					TM_RT = "[��������]" .. PetName.. "*1ֻ��"
				end
			end
		end
	elseif (TM_Give[1]=="T") then
	if Char.IsFeverTime(_PlayerIndex)==1 then Char.FeverTimeStop(_PlayerIndex) end--GP�����ùرմ����ӿ�ʱ
		Char.SetData(_PlayerIndex,153,Char.GetData(_PlayerIndex,153)+TM_Give[3])
		local TM_FeverTime = tonumber(TM_Give[3])
		TM_RT = "[��ʱ]" .. TM_FeverTime .. "�룬"
	elseif (TM_Give[1]=="E") then
		Char.SetData(_PlayerIndex,%����_����%,Char.GetData(_PlayerIndex,%����_����%)+TM_Give[3])
		TM_RT = "[����]" .. TM_Give[3] .. "�㣬"
	elseif (TM_Give[1]=="F") then
		Char.SetData(_PlayerIndex,%����_����%,Char.GetData(_PlayerIndex,%����_����%)+TM_Give[3])
		TM_RT = "[����]" .. TM_Give[3] .. "�㣬"
	elseif (TM_Give[1]=="A") then
		Char.SetData(_PlayerIndex,TM_Give[2],Char.GetData(_PlayerIndex,Give[2])+TM_Give[3])
		TM_RT = "[��������" .. TM_Give[2] .. "]" .. TM_Give[3] .. "�㣬"
	elseif (TM_Give[1]=="S") then
		Char.SetData(_PlayerIndex,%����_������%,Char.GetData(_PlayerIndex,%����_������%+TM_Give[3]))
		TM_RT = "[����������]"..TM_Give[3].."��"
	end
	NLG.UpChar(_PlayerIndex);
	return TM_RT
end

	
