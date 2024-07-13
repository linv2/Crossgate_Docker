--[[
  
		EasyLuaFunc����ģ�� Ver 1.4         By Ducky�Ώͻ�

		�˽ű���������Ѱ�CG_GMSV_EXPANTION
���£�
		���EasyItem��������������ߣ�δ��ɣ�
		���Log�����������־�ļ�
		���EasyFile�������ɶ��ⲿ�ļ�������
		�Ż�EasyTable����������Զ�άtable�Ĳ�����
		�޸�MSG������֧�ֶ��ض���ͼ�㲥��
���ã�
		����10���Դ��������򻯷��ӵ�Lua�ű�������
		MSG��Wait��Warp��ShopItemSplit��Split��EasySQL��WalkToPos��EasyTable��EasyFile��EasyItem
�÷���
		�����ļ�������init.lua��ͬĿ¼������init.lua�����������ݣ�
		require("./data/lua/EasyLuaFunc");   --ע����������ļ���׺".lua"
������
		�ų��˽ű�ֻΪ��ש����ϣ�����и����˽Ӵ���Lua���о�Lua����ͬ����һ����һ����ħ����
		CG_GMSV_EXPANTIONĿǰ�����Ǻ����ƣ��ܶ��޷�ʵ�ֵĹ��ܣ�����˵�ǲ�ȱ�Ĺ��ܣ���Ҫ������˹�ͬŬ��ȥ��������
		��ӭ�Ȱ�ħ�����Ȱ����о�����һ����д���򡢱�д�ű��ĸ��ֱ��������ۣ�

GMSV Lua QQȺ��14583019

By Ducky�Ώͻ� (QQ:462363)
In 2012.11.26

	require("./data/lua/EasyLuaFunc");
	
--]]

function EasyLua_init()
	EasyLua = {
						MSG = MSG,
						Wait = Wait,
						Warp = Warp,
						Shop = ShopItemSplit,
						Split = Split,
						SQL = EasySQL,
						Walk = WalkToPos,
						Table = EasyTable,
						File = EasyFile,
						Log = Log,
						Check = CheckLuaFunc
						};
	Log("EasyLua_init OK");
end

function MSG(strMSG, intMap, intColor, intSize, intTalkPtr)
	if (strMSG=='' or strMSG==nil) then
		return;
	end
	if (intColor=='' or intColor==nil) then
		intColor=4
	elseif (intColor=='��ɫ' or string.lower(intColor)=='white') then
		intColor=0
	elseif (intColor=='��ɫ' or string.lower(intColor)=='blue') then
		intColor=1
	elseif (intColor=='��ɫ' or string.lower(intColor)=='purple') then
		intColor=2
	elseif (intColor=='��ɫ' or string.lower(intColor)=='skyblue') then
		intColor=3
	elseif (intColor=='��ɫ' or string.lower(intColor)=='yellow') then
		intColor=4
	elseif (intColor=='��ɫ' or string.lower(intColor)=='green') then
		intColor=5
	elseif (intColor=='��ɫ' or string.lower(intColor)=='red') then
		intColor=6
	elseif (intColor=='��ɫ' or string.lower(intColor)=='gray') then
		intColor=7
	elseif (intColor=='����ɫ' or string.lower(intColor)=='navyblue') then
		intColor=8
	elseif (intColor=='����ɫ ' or string.lower(intColor)=='darkgreen') then
		intColor=9
	--elseif (intColor>-1 and intColor<10) then
	else
		intColor=intColor
	end
	if (intSize=='' or intSize==nil) then
		intSize=1
	elseif (intSize=='��' or string.lower(intSize)=='big') then
		intSize=3
	elseif (intSize=='��' or string.lower(intSize)=='middle') then
		intSize=2
	elseif (intSize=='С' or string.lower(intSize)=='small') then
		intSize=1
	--elseif (intSize=>1 and intSize<=3) then
	else
		intSize=intSize
	end
	if (intTalkPtr==nil or intTalkPtr=='') then intTalkPtr=-1 end
	
	if (intMap==0 or intMap==nil or intMap=="") then
		for k,v in pairs(tab_msg) do
			--NLG.TalkToCli(v, strMSG, intColor, intSize, intTalkPtr)
			NLG.TalkToCli(v, -1, strMSG, 4)
		end
	elseif (intMap>0) then
		NLG.TalkToCli(0,intMap,-1,Msg,intColor,intSize)
	end

	return ;
end

function Wait(intTime)
	local TM_Time = os.time()
	if (intTime==0 or intTime==nil) then return 'intTime Error' end
	while ((os.time()-TM_Time)<intTime) do end
	return intTime;
end

function Warp(strTxt, rtSub)
	if (strTxt=='' or strTxt==nil or rtSub=='' or rtSub==nil) then
		return "Error Map Pos";
	end
		strTxt=string.gsub(strTxt,"��",",")
		local TM_SuperWarpPos = Split(strTxt,",");
		if (table.getn(TM_SuperWarpPos)~=3) then
			return "Error Map Pos";
		end
		if (string.lower(rtSub)=='map' or string.lower(rtSub)=='m' or rtSub=='��ͼ') then
			return TM_SuperWarpPos[1];
		elseif (string.lower(rtSub)=='x' or rtSub=='��') then
			return TM_SuperWarpPos[2];
		elseif (string.lower(rtSub)=='y' or rtSub=='��') then
			return TM_SuperWarpPos[3];
		elseif (tonumber(rtSub)>=0) then
			local SuperWarpSuccess = false
			SuperWarpSuccess = NLG.Warp(tonumber(rtSub), 0, tonumber(TM_SuperWarpPos[1]), tonumber(TM_SuperWarpPos[2]), tonumber(TM_SuperWarpPos[3]));
			return SuperWarpSuccess;
		end
end

function ShopItemSplit(strTxt, rtSub)
	if (strTxt=='' or strTxt==nil or rtSub=='' or rtSub==nil) then
		return "Error Shop Data";
	end
	local TM_ShopItem = Split(strTxt,"|")
	local TM_ShopItemID = {}
	local TM_ShopItemNum = {}
	for i,v in pairs(TM_ShopItem) do
		if (math.mod(i,2)==1) then
			TM_ShopItemID[table.getn(TM_ShopItemID)+1]=v
		else
			TM_ShopItemNum[table.getn(TM_ShopItemNum)+1]=v
		end
	end
	if (string.lower(rtSub)=='item' or string.lower(rtSub)=='i' or rtSub=='��Ʒ') then
		return TM_ShopItemID;
	elseif (string.lower(rtSub)=='num' or string.lower(rtSub)=='n' or rtSub=='����') then
		return TM_ShopItemNum
	elseif (string.lower(rtSub)=='quantity' or string.lower(rtSub)=='q' or rtSub=='����') then
		return table.getn(TM_ShopItemID);
	else
		return {TM_ShopItemID,TM_ShopItemNum,table.getn(TM_ShopItemID)};
	end
end

function EasySQL(strDB, strField, strWhere, strWrite)
	if (strDB=='' or strDB==nil) then
		return "Error SQL Data";
	end
	if (strWhere=='' or strWhere==nil) then
		strWhere=' ';
	else
		strWhere = "WHERE " .. strWhere;
	end
	if ((strField=='' or strField==nil) and (strWhere==' ')) then
		local TM_strSQL = "SELECT * FROM " .. strDB .. ";"
		print("TM_strSQL��" ..TM_strSQL);
		local TM_tabRS = SQL.Run(TM_strSQL);
		if (type(TM_tabRS)=="table") then
			--return TM_tabRS["0_0"];
			local tTab = {}
			for i = 0, TM_tabRS.row-1 do
				local mTab = {}
				for o = 0, TM_tabRS.field-1 do
					table.insert(mTab, TM_tabRS[i .. "_" .. o])
				end
				table.insert(tTab,mTab)
			end
			return tTab
		else
			return NL.GetErrorStr();
		end
	elseif (strWrite=='' or strWrite==nil) then
		local TM_strSQL = "SELECT " ..strDB.. "." ..strField.. " from `" ..strDB.. "` " ..strWhere..  " limit 1;";
		print("TM_strSQL��" ..TM_strSQL);
		local TM_tabRS = SQL.Run(TM_strSQL);
		if (type(TM_tabRS)=="table") then
			return TM_tabRS["0_0"];
		else
			return NL.GetErrorStr();
		end
	else
		local TM_strSQL = "UPDATE " ..strDB.. " SET " ..strDB.. "." ..strField.. "=" ..strWrite.. " " ..strWhere..  " limit 1;";
		local TM_tabRS = SQL.Run(TM_strSQL);
		if (type(TM_tabRS)=="table") then
			return "Successful";
		else
			return NL.GetErrorStr();
		end
	end
end

function WalkToPos(intMePtr, intPosX, intPosY)
	if (intPosX<0 or intPosX==nil or intPosY<0 or intPosY==nil) then
		return "Error Pos";
	end
	
	local mePosMap = Char.GetData(intMePtr, 4);
	local mePosX = Char.GetData(intMePtr, 5);
	local mePosY = Char.GetData(intMePtr, 6);
	local TM_Dir = -1;
	
	if (string.lower(rtSub)=='distance' or rtSub=='����') then
		return math.abs(math.floor(math.sqrt((mePosX-intPosX)*(mePosX-intPosX)+(mePosY-intPosY)*(mePosY-intPosY))));
	end
	
	if (mePosX==intPosX and mePosY>intPosY) then
		TM_Dir = 0;
	elseif (mePosX<intPosX and mePosY>intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))>2) then
		TM_Dir = 2;
	elseif (mePosX<intPosX and mePosY>intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))<-2) then
		TM_Dir = 0;
	elseif (mePosX<intPosX and mePosY>intPosY) then
		TM_Dir = 1;
	elseif (mePosX<intPosX and mePosY==intPosY) then
		TM_Dir = 2;
	elseif (mePosX<intPosX and mePosY<intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))>2) then
		TM_Dir = 2;
	elseif (mePosX<intPosX and mePosY<intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))<-2) then
		TM_Dir = 4;
	elseif (mePosX<intPosX and mePosY<intPosY) then
		TM_Dir = 3;
	elseif (mePosX==intPosX and mePosY<intPosY) then
		TM_Dir = 4;
	elseif (mePosX>intPosX and mePosY<intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))>2) then
		TM_Dir = 4;
	elseif (mePosX>intPosX and mePosY<intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))<-2) then
		TM_Dir = 6;
	elseif (mePosX>intPosX and mePosY<intPosY) then
		TM_Dir = 5;
	elseif (mePosX>intPosX and mePosY==intPosY) then
		TM_Dir = 6;
	elseif (mePosX>intPosX and mePosY>intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))>2) then
		TM_Dir = 6;
	elseif (mePosX>intPosX and mePosY>intPosY and (math.abs(mePosX-intPosX)-math.abs(mePosY-intPosY))<-2) then
		TM_Dir = 0
	elseif (mePosX>intPosX and mePosY>intPosY) then
		TM_Dir = 7;
	elseif (mePosX==intPosX and mePosY==intPosY) then
		TM_Dir = -1;
	end
	
	if (string.lower(rtSub)=='dir' or rtSub=='����') then
		return TM_Dir;
	elseif (string.lower(rtSub)=='walk' or rtSub=='�߶�') then
		NLG.WalkMove(intMePtr,TM_Dir);
	elseif (string.lower(rtSub)=='warp' or rtSub=='˲��') then
		NLG.Warp(intMePtr, 0, mePosMap, intPosX, intPosY);
	end
	
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, List, Page
function EasyTable(strTable, intMode, intSub, intValue, intEditSub, intEditValue)
	if (strTable==nil) then return -1 end
	if (string.lower(intMode)=='read' or string.lower(intMode)=='r' or intMode=='��ȡ') then
		local TM_buff = ''
		local TM_link = ''
		if (intSub==1) then TM_buff = TM_buff .. "{" end
		--[[
		for i=1,table.getn(strTable) do
			if (type(strTable[i])=='table') then
				TM_buff = TM_buff .. EasyTable(strTable[i],'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. strTable[i]
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		--]]
		for k,v in pairs(strTable) do
			if (type(v)=='table') then
				TM_buff = TM_buff .. EasyTable(v,'read',intSub,'Sub')
			else
				TM_buff = TM_buff .. v
			end
			if (i==table.getn(strTable)) then
				TM_link = '';
			else
				if (intValue=='Sub' or intSub==1) then TM_link = ',' end
			end
			TM_buff = TM_buff .. TM_link;
		end
		if (intSub==1) then 
			TM_buff = TM_buff .. "}"
		elseif (intValue=='Sub') then 
			TM_buff = TM_buff .. "\n"
		end
		return TM_buff
	elseif (string.lower(intMode)=='list' or string.lower(intMode)=='l' or intMode=='�б�') then
		--EasyTable(sTable, "List", "Table")
		local TM = ""
		local sTitle = intSub
		if (sTitle=="" or sTitle==nil) then sTitle="Table" end
		for Key,Value in pairs(strTable) do
			if intValue=="" or intValue=="." or intValue==nil then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "." .. Key, intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "." .. Key .. "\n"
				else
					TM =  TM .. sTitle .. "." .. Key .. "=" .. Value .. "\n"
				end
			elseif intValue=="[" or intValue=="]" or intValue=="[]" or intValue==1 then
				if type(Value)=="table" then
					TM = TM .. EasyTable(Value, sTitle .. "[" .. Key .. "]", intValue)
				elseif type(Value)=="function" then
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "\n"
				else
					TM =  TM .. sTitle .. "[" .. Key .. "]" .. "=" .. Value .. "\n"
				end
			end
		end
		return TM
	elseif (string.lower(intMode)=='check' or string.lower(intMode)=='c' or intMode=='��ѯ') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return i;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='sort' or string.lower(intMode)=='s' or intMode=='����') then
		if (intValue==1) then
			table.sort(strTable,function (a, b) return (a[intSub] > b[intSub]) end);
		else
			table.sort(strTable,function (a, b) return (a[intSub] < b[intSub]) end);
		end
		return 1;
	elseif (string.lower(intMode)=='get' or string.lower(intMode)=='g' or intMode=='��ȡ') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return strTable[i][intEditSub];
			end
		end
		return -1;
	elseif (string.lower(intMode)=='edit' or string.lower(intMode)=='e' or intMode=='�޸�') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				strTable[i][intEditSub]=intEditValue;
				return 1;
			end
		end
		return -1;
	elseif (string.lower(intMode)=='add' or string.lower(intMode)=='a' or intMode=='���') then
		--[[
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return -1;
			end
		end
		--]]
		if (type(intSub)=='table') then
			table.insert(strTable,intSub);
		else
			local TM_Table = {};
			for i = 1,tonumber(intSub) do
				table.insert(TM_Table,-1);
			end
			TM_Table[1]=intValue;
			table.insert(strTable,TM_Table);
		end
		return table.getn(strTable);
	elseif (string.lower(intMode)=='del' or string.lower(intMode)=='d' or intMode=='ɾ��') then
		for i=1,table.getn(strTable) do
			if (strTable[i][intSub]==intValue) then
				return table.remove(strTable,i);
			end
		end
		return -1;
	elseif (string.lower(intMode)=='page' or string.lower(intMode)=='p' or intMode=='��ҳ') then
		--EasyTable(strTable, 'Page', [�ڼ�ҳ=1], [ÿҳ����=6])
		if (type(intSub)~='number' or intSub<=0) then intSub=1 end
		if (type(intValue)~='number' or intValue<=0) then intValue=6 end
		local TM_Table = {}
		local tStartPage = ((intSub-1)*intValue)+1
		local tEndPage = tStartPage + intValue - 1
		if (tEndPage>table.getn(strTable)) then tEndPage=table.getn(strTable) end
		for i = tStartPage,tEndPage do
			EasyTable(TM_Table,'a',strTable[i])
		end
		return TM_Table;
	end
	return;
end

function GiveItemAdv(_PlayerIndex, _ItemID, _ItemNum)
	local OldItem = {}
	local NewItem = {}
	local NewItemPos = {}
	for i = 8,27 do
		OldItem[i]=Item.GetData(Char.GetItemIndex(_PlayerIndex, i), %����_ID%)
	end
	Char.GiveItem(_PlayerIndex, _ItemID, _ItemNum)
	for i = 8,27 do
		if OldItem[i]~=Item.GetData(Char.GetItemIndex(_PlayerIndex, i), %����_ID%) then
			table.insert(NewItemPos, i)
		end
	end
	if table.getn(NewItemPos)==0 then
		return -1
	else
		return NewItemPos
	end
end

--���ܣ�EmptySlot, HaveItem
function EasyItem(ptrPlayer, strMode, intSub, intValue, intEditSub, intEditValue)
	if (ptrPlayer=="" or ptrPlayer==nil or ptrPlayer==-1) then return "ptrPlayer Error" end
	if (string.lower(strMode)=='emptyslot' or string.lower(strMode)=='e' or strMode=='�ո�') then
		--EasyItem(_PlayerIndex, 'EmptySlot')
		--Return: [Number]EmptySlotNum, [Table]EmptySlot
		--if (intValue=="" or intValue==nil or intValue==-1) then return "intValue Error" end
		local tEmptySlot = {}
		for Pos = 8,27 do
			if (Char.GetItemIndex(ptrPlayer, Pos)>0) then
				table.insert(tEmptySlot, Pos)
			end
		end
		--�������������, ���������Pos��Table����
		return table.getn(tEmptySlot),tEmptySlot
	elseif (string.lower(strMode)=='haveitem' or string.lower(strMode)=='h' or strMode=='ӵ��') then
		--EasyItem(_PlayerIndex, 'HaveItem', 88888)
		--Return: [Number]HaveItemNum, [Table]HaveItem
		if (intSub=="" or intSub==nil or intSub<0) then return "intSub Error" end
		local tHaveItem = {}
		local nTotal = 0
		for Pos = 0,27 do
			if (Item.GetData(Char.GetItemIndex(ptrPlayer, Pos),%����_ID%)==intSub) then
				local Num = Item.GetData(Char.GetItemIndex(ptrPlayer, Pos),%����_�ѵ���%)
				nTotal = nTotal + Num
				table.insert(tHaveItem, {Pos,Num})
			end
		end
		--ӵ�е���������ӵ�е���λ�á�������Table����
		return nTotal,tHaveItem
	end
end

--Mode: Read, Check, Sort, Get, Edit, Add, Del, Clear
function EasyFile(strFile, strMode, intSub, intValue, intEditSub, intEditValue)
	if (strFile=="" or strFile==nil) then return "File Error" end
	local tabFile={}
	local tmpFile=""
	if (string.lower(strMode)=='read' or string.lower(strMode)=='r' or strMode=='��ȡ') then
		local mfile = io.open(strFile,"r")
		for line in mfile:lines() do
			if (intSub=="" or intSub==nil) then
				EasyTable(tabFile,'Add',Split(line,","))
			elseif (intSub>0) then
				tabFile=Split(line,",")
				if (tabFile[intSub]==intValue) then break end
			elseif (string.lower(intSub)=="txt") then
				tmpFile = tmpFile .. line .. "\n"
			end
		end
		mfile:close()
		if (intSub=="" or intSub==nil or intSub>0) then
			return tabFile
		elseif (string.lower(intSub)=="txt") then
			return tmpFile
		end
	elseif (string.lower(strMode)=='sort' or string.lower(strMode)=='s' or strMode=='����') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'sort',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='edit' or string.lower(strMode)=='e' or strMode=='�޸�') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'edit',intSub,intValue,intEditSub,intEditValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='del' or string.lower(strMode)=='d' or strMode=='ɾ��') then
		local TM_Table = EasyFile(strFile,'r')
		local rt = EasyTable(TM_Table,'del',intSub,intValue)
		EasyFile(strFile,'w',EasyTable(TM_Table,'read'))
		return rt
	elseif (string.lower(strMode)=='check' or string.lower(strMode)=='c' or strMode=='��ѯ') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'check',intSub,intValue)
	elseif (string.lower(strMode)=='get' or string.lower(strMode)=='g' or strMode=='��ȡ') then
		local TM_Table = EasyFile(strFile,'r')
		return EasyTable(TM_Table,'get',intSub,intValue)
	elseif (string.lower(strMode)=='write' or string.lower(strMode)=='w' or strMode=='д��') then
		local mfile = io.open(strFile,"w")
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='add' or string.lower(strMode)=='a' or strMode=='׷��') then
		local mfile = io.open(strFile,"a")
		if (type(intSub)=='table') then intSub=EasyTable(intSub,'r',nil,'Sub') end
		mfile:write(intSub)
		mfile:close()
		return "Success"
	elseif (string.lower(strMode)=='clear' or string.lower(strMode)=='cl' or strMode=='���') then
		local mfile = io.open(strFile,"w")
		mfile:write("")
		mfile:close()
		return "Success"
	end
end

function EasyGift(_PlayerIndex, GiveStr)
	local TM_Give = Split(GiveStr,"|")
	local TM_RT = ""
	if (TM_Give[1]=="G") then
		TM_Give[3] = tonumber(TM_Give[3])
		local PlayerGold = Char.GetData(_PlayerIndex, %����_���%)
		if (PlayerGold+TM_Give[3])>=1000000 then
			Char.AddGold(_PlayerIndex, 1000000-PlayerGold)
			TM_RT = "[���]" .. 1000000-PlayerGold .. "G��"
		else
			Char.AddGold(_PlayerIndex, TM_Give[3])
			TM_RT = "[���]" .. TM_Give[3] .. "G��"
		end
	elseif (TM_Give[1]=="I") then
		TM_Give[3] = tonumber(TM_Give[3])
		if Char.ItemSlot(_PlayerIndex)<1 then
			TM_RT = "���������㣬�޷����š�"
		else
			Char.GiveItem(_PlayerIndex,TM_Give[2],TM_Give[3])
			TM_RT = "[����]" .. TM_Give[3] .. "��" .. TM_Give[2]
		end
	elseif (TM_Give[1]=="P") then
		TM_Give[3] = tonumber(TM_Give[3])
		if TM_Give[3]>=1 then TM_Give[3]=1 end
		if Char.PetNum(_PlayerIndex)==5 then
			TM_RT = "���������㣬�޷����š�"
		else
			Char.GivePet(_PlayerIndex,TM_Give[2],TM_Give[3])
			if TM_Give[3]==0 then
				TM_RT = "[����]1��" .. TM_Give[2]
			elseif TM_Give[3]==1 then
				TM_RT = "[����]1������" .. TM_Give[2]
			end
		end
	elseif (TM_Give[1]=="W") then
		Char.Warp(_PlayerIndex,0,Warp(TM_Give[3],"Map"),Warp(TM_Give[3],"X"),Warp(TM_Give[3],"Y"))
		TM_RT = "[����]����Ϊ" .. TM_Give[3]
	elseif (TM_Give[1]=="T") then
		Char.SetData(_PlayerIndex, %����_��ʱ%, Char.GetData(_PlayerIndex, %����_��ʱ%)+TM_Give[3])
		local TM_FeverTime = tonumber(TM_Give[3]) / 3600
		TM_RT = "[��ʱ]" .. TM_FeverTime .. "Сʱ��"
	elseif (TM_Give[1]=="E") then
		Char.SetData(_PlayerIndex, %����_����%, Char.GetData(_PlayerIndex, %����_����%)+TM_Give[3])
		TM_RT = "[����]" .. TM_Give[3] .. "�㣬"
	elseif (TM_Give[1]=="F") then
		Char.SetData(_PlayerIndex, %����_����%, Char.GetData(_PlayerIndex, %����_����%)+TM_Give[3])
		TM_RT = "[����]" .. TM_Give[3] .. "�㣬"
	elseif (TM_Give[1]=="A") then
		Char.SetData(_PlayerIndex, TM_Give[2], Char.GetData(_PlayerIndex, TM_Give[2])+TM_Give[3])
		if Char.GetData(_PlayerIndex, TM_Give[2])<0 then Char.SetData(_PlayerIndex, TM_Give[2], 0) end
		TM_RT = "[��������] " .. TM_Give[2] .. " �޸��� " .. TM_Give[3] .. " �㣬"
		NLG.UpChar(_PlayerIndex)
	elseif (TM_Give[1]=="WT") then
		-----ShowWindowTalked( ToPtr, WindowType, ButtonType, SeqNo, Data, [WinTalkPtr]);
		local ProTalk = ""
		local ButtonType = 1
		if TM_Give[4]==nil then TM_Give[4]=1 end
		if TM_Give[2]=="0" then
			ButtonType = 12
		elseif TM_Give[2]=="2" then
			ProTalk = "2"
			ButtonType = 0
		end
		local sTalk = ProTalk .. "�����������������������߹����"..
							"\n\n" .. TM_Give[3]
		if (WindowTalkedSelf==nil) then
			WindowTalkedSelf = NL.CreateNpc("lua/npc/createNpc.lua", "Myinit");
		end
		Char.SetWindowTalkedEvent(nil, "LoginList_WindowTalkedSelf", WindowTalkedSelf)
		NLG.ShowWindowTalked(_PlayerIndex, WindowTalkedSelf, tonumber(TM_Give[2]), ButtonType, tonumber(TM_Give[4]), sTalk)
	elseif (TM_Give[1]=="B") then
		Battle.PVE(_PlayerIndex, _PlayerIndex, nil, {TM_Give[2]}, {TM_Give[3]}, nil); 
		TM_RT = "[ս��]��" .. 1 .. "ֻ" .. TM_Give[3] .. "����" .. TM_Give[2] .. "����ս��"
	elseif (TM_Give[1]=="SA") then
		NLG.CharLook( _PlayerIndex, TM_Give[2])
		NLG.SetAction(_PlayerIndex, TM_Give[3])
		NLG.UpChar(_PlayerIndex)
		TM_RT = "[����]һ��������"
	end
	return TM_RT
end

function isLv1Pet(checkPet)
	if(checkPet==0)then
		return false;
	end
	if(Char.GetData(checkPet,%����_�ȼ�%)==1 and Char.GetData(checkPet,%����_����%)~=9)then
		if((Char.GetData(checkPet,%����_����%)=="��������") or (Char.GetData(checkPet,%����_����%)=="�粼��") or (Char.GetData(checkPet,%����_����%)=="����") or (Char.GetData(checkPet,%����_����%)=="Сʯ���"))then
			return false;
		end
		return true;
	end
	return false;
end

function getTabKey(_PlayerIndex)
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tPlayerLR = Char.GetData(_PlayerIndex, 48)
	local tTabKey = "T_" .. tCdKey .. tPlayerLR
	return tTabKey
end

function Split(strTxt, strDelim, maxNb)   
    -- Eliminate bad cases...   
    if string.find(strTxt, strDelim) == nil then  
        return { strTxt }  
    end  
    if maxNb == nil or maxNb < 1 then  
        maxNb = 0    -- No limit   
    end  
    local result = {}  
    local pat = "(.-)" .. strDelim .. "()"   
    local nb = 0  
    local lastPos   
    for part, pos in string.gfind(strTxt, pat) do  
        nb = nb + 1  
        result[nb] = part   
        lastPos = pos   
        if nb == maxNb then break end  
    end  
    -- Handle the last field   
    if nb ~= maxNb then  
        result[nb + 1] = string.sub(strTxt, lastPos)   
    end  
    return result   
end  

function Ip2Long(strIp)
	local Ip = Split(strIp,"%.")
	local rt = 0
	rt = rt + tonumber(Ip[1]) * 256 ^ 3
	rt = rt + tonumber(Ip[2]) * 256 ^ 2
	rt = rt + tonumber(Ip[3]) * 256 ^ 1
	rt = rt + tonumber(Ip[4])
	return rt
end

function Long2Ip(numLong)
	local rt = {}
	while numLong>256 do
		table.insert(rt,1,math.mod(numLong,256))
		numLong = math.floor(numLong/256)
	end
	table.insert(rt,1,numLong)
	return table.concat(rt,".")
end

function Table2Json(tbl)
	local function serialize(tbl)
		local tmp = {}
		for k, v in pairs(tbl) do
			local k_type = type(k)
			local v_type = type(v)
			local key = (k_type == "string" and "\"" .. k .. "\":")
				or (k_type == "number" and "")
			local value = (v_type == "table" and serialize(v))
				or (v_type == "boolean" and tostring(v))
				or (v_type == "string" and "\"" .. v .. "\"")
				or (v_type == "number" and v)
			tmp[table.getn(tmp) + 1] = key and value and tostring(key) .. tostring(value) or nil
		end
		if table.maxn(tbl) == 0 then
			return "{" .. table.concat(tmp, ",") .. "}"
		else
			return "[" .. table.concat(tmp, ",") .. "]"
		end
	end
	assert(type(tbl) == "table")
	return serialize(tbl)
end

function SplitNumOrStr(strTxt)
	--��������table���ϣ���һ��Ϊ�����ֵ�table���ڶ���Ϊ���ַ���table
	local tNum = {}
	local tStr = {}
	for k in string.gmatch(strTxt, "%d+") do
		table.insert(tNum,k)
	end
	for k in string.gmatch(strTxt, "%D+") do
		table.insert(tStr,k)
	end
	return tNum,tStr
end

function strTrim(s)
   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function getInt(x)
	if x <= 0 then
	   return math.ceil(x);
	end

	if math.ceil(x) == x then
	   x = math.ceil(x);
	else
	   x = math.ceil(x) - 1;
	end
	return x;
end

function Log(strTxt)
	local LogFile = "./lua/Lua.Log"
	local file = io.open(LogFile,"a")
	file:write(os.date("%Y��%m��%d��%X��"),strTxt,"\r\n")
	file:close()
end

function strFormat(str,str_len,str_type)
--[[
����һ��������ַ���
�����������õĿռ䳤��
��������1�����ң�2������3������
]]--
	if(str_type == 1) then
		str_tmp=string.format("%"..str_len.."s", str);
	elseif(str_type == 2) then
		str_tmp=string.format("%-"..str_len.."s", str);
	elseif(str_type == 3) then
		local tmp_splace=math.floor((str_len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-"..str_len.."s", str_tmp);
	end
	return str_tmp;
end

function TableList(sTable, sTitle, sMode)
	--if type(sTable)~="table" then return sTable end
	local TM = ""
	if sTitle==nil then sTitle="" end
	for Key,Value in pairs(sTable) do
		if sMode=="" or sMode=="." or sMode==nil then
			if type(Value)=="table" then
				TM = TM .. TableList(Value,sTitle .. "." .. Key,sMode)
			elseif type(Value)=="function" then
				TM =  TM .. sTitle .. "." .. Key .. "\n"
			else
				TM =  TM .. sTitle .. "." .. Key .. "=" .. Value .. "\n"
			end
		elseif sMode=="[" or sMode=="]" or sMode=="[]" or sMode==1 then
			if type(Value)=="table" then
				TM = TM .. TableList(Value,sTitle .. "[" .. Key .. "]",sMode)
			elseif type(Value)=="function" then
				TM =  TM .. sTitle .. "[" .. Key .. "]" .. "\n"
			else
				TM =  TM .. sTitle .. "[" .. Key .. "]" .. "=" .. Value .. "\n"
			end
		end
	end
	return TM
end

function SetField(t, f, v)
	--local t = _G
	local count = 0
	for w,d in string.gmatch(f, "([%w_]+)(%.?)") do
		if d == "." then
			t[w] = t[w] or {}
			t = t[w]
		else
			t[w] = v
		end
	end
	return t
end

--ʮ����ת��������
function IntToHex(_num)
	local _str = "";
	if _num == -1 then
		_str = "11111111111111111111111111111111";
	else
		local _left = _num;
		while true do
			if _left > 1 then
				_str = math.mod(_left,2).._str;
				_left = math.floor(_left / 2);
			else
				_str = _left.._str;
				break;
			end
		end
	end
	return _str;
end

--���ͼ���Ƿ����
function checkalbumid(_player,_aumid)
	if (_aumid <= 0) or (_aumid > 320) then
		return 0;
	end
	_aumid = _aumid-1;
	local _npos = _aumid / 32;
	local _lpos = math.mod(_aumid,32)+1;
	local _ndata = Char.GetData(_player,130+_npos);
	local _nstr = IntToHex(_ndata);
	if string.len(_nstr) < _lpos then
		return 0;
	else
		local _substr=string.sub(_nstr,-_lpos,-_lpos);
		if _substr == "1" then
			return 1;
		else
			return 0;
		end
	end
end

--�����������ѵǼ�ͼ������
function checkalbumcount(_player)
	local _count = 0;
	for i=130,139 do
		local _ndata = Char.GetData(_player,i);
		local _nstr = IntToHex(_ndata);
		local _nl = string.len(_nstr);
		for i2=1,_nl do
			if string.sub(_nstr,i2,i2) == "1" then
				_count = _count + 1;
			end
		end
	end
	return _count;
end

--�����һ����
function MyRandom(_str)
	local Mr_stl = Split(_str,",");
	local _max = 0;
	for i = 1,table.getn(Mr_stl) do
		local Mr_stl2 = Split(Mr_stl[i],"|");
		_max = _max + tonumber(Mr_stl2[2]);
	end
	local _rd = math.random(1,_max);
	local _max2 = 0;
	for i = 1,table.getn(Mr_stl) do
		local Mr_stl3 = Split(Mr_stl[i],"|");
		_max2 = _max2 + tonumber(Mr_stl3[2]);
		if _rd <= _max2 then
			return Mr_stl3[1];
		end
	end
end

--�ж�ĳ�������Ƿ��ǽ��������
function CheckisYestoday(_date)
	local _olddate = math.floor((_date+28800)/86400)*86400;
	local _nowdate = math.floor((os.time()+28800)/86400)*86400;
	if (_nowdate - _olddate) == 86400 then
		return true;
	else
		return false;
	end
end