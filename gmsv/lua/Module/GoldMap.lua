Delegate.RegInit("GoldMap_Init");
local PItemChar =PItemChar or {}
local GoldMapTable = {} --�ر��ص��
local ���ӱ��� ={} --����������Ʒ����|����ID|���� �� ����
���ӱ���[1]={"ħ���ˮ��","I|18450|3",1}
���ӱ���[2]={"����֮��","I|18449|2",1}
���ӱ���[3]={"�����","I|999999|3",1}
���ӱ���[4]={"����������","I|16440|1",1}
���ӱ���[5]={"���ʵ�����","I|16441|1",1}
���ӱ���[6]={"��ʳ������","I|16442|1",1}
���ӱ���[7]={"ɫ��������","I|16443|1",1}
���ӱ���[8]={"���������","I|16444|1",1}
���ӱ���[9]={"̰��������","I|16445|1",1}
���ӱ���[10]={"��ŭ������","I|16446|1",1}

GoldMapTable= {} --��һ������
--GoldMapTable[1] = {"������",1000,200,210,80,90} --��1�����귶Χ mapname,mapid,xmin,xmax,ymin,ymax
--GoldMapTable[2] = {"�����",100,100,300,40,80}
--GoldMapTable[3] = {"������",300,100,300,40,80}
----
GoldMapTable[1] = {"������",2000,33,44,30,35}
GoldMapTable[2] = {"������",2000,39,48,36,46}
GoldMapTable[3] = {"ʥ��³����",2300,30,34,50,60}
GoldMapTable[4] = {"ʥ��³����",2300,30,34,79,89}
GoldMapTable[5] = {"�����ش�",2400,43,54,37,46}
GoldMapTable[6] = {"�����ش�",2400,33,43,74,78}
GoldMapTable[7] = {"άŵ�Ŵ�",2100,44,65,42,48}
GoldMapTable[8] = {"άŵ�Ŵ�",2100,18,31,37,41}
GoldMapTable[9] = {"�ڿ���",2200,53,61,15,23}
GoldMapTable[10] = {"�ڿ���",2200,43,49,37,45}
GoldMapTable[11] = {"������",3200,54,62,46,56}
GoldMapTable[12] = {"������",3200,71,76,68,84}
GoldMapTable[13] = {"���ɴ�",3000,40,52,66,74}
GoldMapTable[14] = {"���ɴ�",3000,36,50,46,56}
GoldMapTable[15] = {"��ŵ����",4000,25,36,36,48}
GoldMapTable[16] = {"��ŵ����",4000,45,50,53,72}
GoldMapTable[17] = {"���ȴ�",4200,25,31,22,30}
GoldMapTable[18] = {"���ȴ�",4200,29,43,43,51}
GoldMapTable[19] = {"������˹��",4300,36,42,54,68}
GoldMapTable[20] = {"������˹��",4300,49,54,33,54}

local GoldMapGiveTable = {} --������70274
GoldMapGiveTable[1] = {0,"��ϸ�����˵���Ҳû���κη��֡�д���ַ��Ƶ�ֽ��ʧ���ò���������",15}
GoldMapGiveTable[2] = {1,{},70}
GoldMapGiveTable[3] = {2,{500,2500,5000,10000},40}
GoldMapGiveTable[4] = {3,{{611,612,613,614,615,616},{10,20,30,40}},20}
--{type,id/gold,pro}
--type �������� 0���޽��� 1������ 2��ħ�� 3��ս��
--id/gold 0��"�¼��Ի�" 1��{ItemID1,itemnum1,ItemID2,itemnum2} 2��{goldmin,goldmax} 3��{{EnemyIdAr},{BaseLevelAr}}
--pro �����ۼ� ��ֱ�Ϊ25 50 75 100 �ͱ�ʾһ��100���� �ֱ�25
--------------------�߼�����--------------------------------

local ��ͼ��Ϣ = %����_����% --��¼��ͼ��Ϣ
local X���� = %����_����% --��¼��ͼx����
local Y���� = %����_����%--��¼��ͼY����

--------------------���ý���--------------------------------
function BoxGiveItem(TJBX_item)--������Ʒ���ʽӿ�{"��ȫ�ᾧ��ĺ챦ʯ",13679,5}
	local JP=0
	for i =1,#TJBX_item do
		JP =JP+TJBX_item[i][3]
	end
	local toJP = math.random(1,JP);--jp�ܸ��ʣ�toJP=�ܸ�������һ�����ֵ
	local JP1=0
	local Num=0
	for b =1,#TJBX_item do
		JP1=JP1+ TJBX_item[b][3]
		if JP1 >= toJP then
			Num= b
			break
		end
	end
	return Num
	--return false;
end
--Delegate.RegDelUseItemEvent("GqLuaItme_Event")
function GqLuaItme_Event(_PlayerIndex,_toPlayerIndex,_ItemPos)
	local _ItemIndex=Char.GetItemIndex(_PlayerIndex,_ItemPos)
	local ItemType=Item.GetData(_ItemIndex,2003)
	local Zc1 = Item.GetData(_ItemIndex,46)
	local Zc2= Item.GetData(_ItemIndex,47)
	local tItemID = Item.GetData(_ItemIndex,0)
	PItemChar[_PlayerIndex] = nil
	if ItemType == "GoldMap"  then
		local ItemMap = Item.GetData(_ItemIndex,��ͼ��Ϣ)
		if ItemMap > 0 then --�Ѿ��Ǽǵ�ͼ�Ĳر�ͼ
			local mapid =GoldMapTable[ItemMap][2]
			local mapposx = Item.GetData(_ItemIndex,X����)
			local mapposy = Item.GetData(_ItemIndex,Y����)
			local _PlayerIndexmap = Char.GetData(_PlayerIndex,%����_��ͼ%)
			local _PlayerIndexposx = Char.GetData(_PlayerIndex,%����_X%)
			local _PlayerIndexposy = Char.GetData(_PlayerIndex,%����_Y%)
			if (mapid == _PlayerIndexmap) and (_PlayerIndexposx > (mapposx-3) and _PlayerIndexposx < (mapposx+3)) and (_PlayerIndexposy > (mapposy-3) and _PlayerIndexposy < (mapposy+3)) then
				local rdm1
				local rdmMAx=0
				for b=1,#GoldMapGiveTable do
					rdmMAx= rdmMAx + GoldMapGiveTable[b][3]
				end
				local givetype=math.random(1,rdmMAx)
				local Num=0
				for i = 1,#GoldMapGiveTable do
					Num=Num+GoldMapGiveTable[i][3]
					if givetype <= Num then
						givetype = i
						break
					end	
				end
				Char.DelItem(_PlayerIndex,tItemID,1)
				if GoldMapGiveTable[givetype][1] == 0 then --����
					NLG.SystemMessage(_PlayerIndex,GoldMapGiveTable[givetype][2])
				elseif GoldMapGiveTable[givetype][1] == 1 then --����
					local ��Ʒ = BoxGiveItem(���ӱ���)
					EasyGive(_PlayerIndex,���ӱ���[��Ʒ][2])
					local ItemBoxName=���ӱ���[��Ʒ][1]
					NLG.SystemMessage(_PlayerIndex,"[ϵͳ] ��ϲ���ڵ����أ�"..ItemBoxName);
					--EasyGive(_PlayerIndex,GoldMapGiveTable[givetype][2][rdm2])
				elseif GoldMapGiveTable[givetype][1] == 2 then --ħ�ҽ���
					local rdm2
					for i = 1,10 do
						rdm2 = math.random(GoldMapGiveTable[givetype][2][1],GoldMapGiveTable[givetype][2][2])
					end
					Char.SetGold(_PlayerIndex,rdm2)
				elseif GoldMapGiveTable[givetype][1] == 3 then --����ս��
					Enemy={GoldMapGiveTable[givetype][2][1][math.random(1,5)]}
					EnemyLevel={math.random(1,50)}
					local tName = Char.GetData(_MePtr, ����.����.ԭ��)
					local BattleIndex= Battle.PVE(_PlayerIndex, IntNpc["GoldMapNpc"], nil, Enemy, EnemyLevel);
					--NLG.CreateBattle(_PlayerIndex,IntNpc["GoldMapNpc"], nil,Enemy,EnemyLevel);
				end
			else
				NLG.SystemMessage(_PlayerIndex,"���Ƶ�ֽ��д��"..GoldMapTable[ItemMap][1].."("..mapposx..","..mapposy..")������")
				return 0
			end
		else
			local rdm1
			local rdm2
			local rdm3
			for i = 1,10 do
				rdm1 = math.random(1,#GoldMapTable)
				rdm2 = math.random(GoldMapTable[rdm1][3],GoldMapTable[rdm1][4])
				rdm3 = math.random(GoldMapTable[rdm1][5],GoldMapTable[rdm1][6])
			end
			Item.SetData(_ItemIndex,��ͼ��Ϣ,rdm1)
			Item.SetData(_ItemIndex,X����,rdm2)
			Item.SetData(_ItemIndex,Y����,rdm3)
			NLG.SystemMessage(_PlayerIndex,"���Ƶ�ֽ���ּ��𽥸��ֳ�����������"..GoldMapTable[rdm1][1].."("..rdm2..","..rdm3..")���������ӡ�")
			Item.UpItem(_PlayerIndex,_ItemPos)
			return 0
		end		
	end

	if ItemType == "GoldMapWarp"  then
		for tItemPos= 8,27 do
			local _tItemPosIndex = Char.GetItemIndex(_PlayerIndex,tItemPos)
			if _tItemPosIndex > 0 then
				local PosType=Item.GetData(_tItemPosIndex,����.����.˫��Ч��)
				if PosType == "GoldMap" and tonumber(Item.GetData(_tItemPosIndex,��ͼ��Ϣ))>0 then
					local ItemMap = Item.GetData(_tItemPosIndex,��ͼ��Ϣ)
					local mapposx = Item.GetData(_tItemPosIndex,X����)
					local mapposy = Item.GetData(_tItemPosIndex,Y����)
					local mapid = GoldMapTable[ItemMap][2]
					Char.DelItem(_PlayerIndex,tItemID,1)
					Char.DischargeParty(_PlayerIndex)
					Char.Warp(_PlayerIndex,0,mapid,mapposx,mapposy)
					NLG.SystemMessage(_PlayerIndex,"[�״�]���Ѿ���������λ���ˡ�")
					return 0
				end
			end
		end
		NLG.SystemMessage(_PlayerIndex,"[����]��û�ж�Ӧ�Ĳر�ͼ��")
		return 0
	end
end
function GoldMap_Init()
	NL.RegItemString("lua/Module/GoldMap.lua","GqLuaItme_Event","LUA_useBT"); --ע����ħ��
end
---------------���߷���--------------
--�ر�ͼ��	�ر�ͼ	GoldMap			LUA_useBT						23658	1002969	0	43		0	1	0	72	1	1	1	1	0																																																																0	0	0			0	70203	70203	100	0	0	0		
--�ر�ͼ�״	�ر�ͼ�״�	GoldMapWarp			LUA_useBT						23659	1002969	0	43		0	1	0	72	1	1	1	1	0																																																																0	0	0			0	70203	70203	100	0	0	0		
