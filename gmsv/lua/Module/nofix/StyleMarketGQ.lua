------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���ͳ��� 
--
--��ѡ�е�����NPC�Ի�������ʱ�Դ��������øı����ͣ��˳����Ч
--

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������������á�����
------------------------------------------------------------------------------
--���ű��������á�
local NpcName = "���ͳ���"		--�ű�����
local ItemID =888888        --��Ҵ���
local TryPrice = 0.01			--�Դ��ۿۣ��Դ��۸�=���ü۸�*�ۿۣ�
--���Զ�����ڷ����á�
--������ȫ���ɽű���˳���Զ�����ڷ�
--�رգ�������ÿ�����������á��еĵ�ͼ�����Զ���ڷ�
local AutoMapSet = {}
AutoMapSet.On = 1			--�Զ���ְڷſ��أ�0-�أ�1-����
AutoMapSet.Map = 22223		--��ͼID
AutoMapSet.MinX = 46		--��ͼ��СX���꣨���ǵ�ͼ�������������꣬һ��Ϊ1��
AutoMapSet.MinY = 38		--��ͼ��СY���꣨���ǵ�ͼ�������������꣬һ��Ϊ1��
AutoMapSet.MaxX = 90		--��ͼ���X���꣨���ǵ�ͼ��Ϸ������꣩
AutoMapSet.MaxY = 70		--��ͼ���Y���꣨���ǵ�ͼ��Ϸ������꣩
AutoMapSet.Spacing = 1		--Npc�����ÿ����Npc����֮��ļ����Ĭ��Ϊ1��
AutoMapSet.AlignDir = 2		--���з���1-�ӱ����ϣ�2-��������
--���������á�
local ActionList = {0,1,2,3,4,5,6,8,9,10}	--���������ѡ���
local AutoAction = 0		--ÿ10���Զ���������ѡ�0-�رգ�1-����������������رգ��˹��ܺ�������Դ
local WalkAction = 1		--�߹��Զ���������ѡ�0-�رգ�1-������
local TalkAction = 1		--�Ի��Զ���������ѡ�0-�رգ�1-������
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������������á�����
------------------------------------------------------------------------------

local StyleSet = {}
--���ֶ����á�
--������ʽ��{Name���ƣ�Imageͼ����Map��ͼ��X��Y��Dir����Price�۸�Tar���ö���Try�Դ�ʱ��}
--�򻯸�ʽ��{Imageͼ����Price�۸�Tar���ö���Try�Դ�ʱ��}	ע���򻯸�ʽֻ���Զ���ְڷŴ�ʱ��Ч
--Tar���ö���0-�����ã�1-������ã�2-������ã�3-�˳趼����
--Try�Դ�ʱ����0Ϊ�����Դ���-1Ϊ�����Դ���Warp��ָ������Դ��󳬹�ʱ����Զ��ָ�ԭ�Σ���λ���룩��Ĭ��Ϊ7200�루2Сʱ��
--StyleSet[1] = {Name="��ɫgm �õ�", Image=100975, Map=999, X=10, Y=10, Dir=6, Price=200, Tar=0, Try=0}

--���Զ����á�
--ע���Զ����ý��������ֶ����ú���
--Tar���ö���0-�����ã�1-������ã�2-������ã�3-�˳趼����
--Try�Դ�ʱ����0Ϊ�����Դ���-1Ϊ�����Դ���Warp��ָ������Դ��󳬹�ʱ����Զ��ָ�ԭ�Σ���λ���룩��Ĭ��Ϊ7200�루2Сʱ��
local AutoImageOn = 1		--�Ƿ����Զ�����ͼ����ѡ�0-�رգ�1-������
local ImageMin = 100550		--��Сͼ�����100000
local ImageMax = 100555		--���ͼ�����100600
local ImageMin1 = 100575		--��Сͼ�����
local ImageMax1 = 100580		--���ͼ�����
local ImageMin2 = 100600		--��Сͼ�����
local ImageMax2 = 100605		--���ͼ�����
local ImageMin3 = 100625		--��Сͼ�����
local ImageMax3 = 100629		--���ͼ�����
local ImageMin4 = 100651		--��Сͼ�����
local ImageMax4 = 100661		--���ͼ�����
local ImageMin5 = 100882		--��Сͼ�����
local ImageMax5 = 100892		--���ͼ�����
local ImageMin6 = 100972		--��Сͼ�����
local ImageMax6 = 100977		--���ͼ�����
local ImageMin7 = 100810		--��Сͼ�����
local ImageMax7 = 100881		--���ͼ�����
local ImageMin8 = 120200		--��Сͼ�����
local ImageMax8 = 120253		--���ͼ�����
local ImageMin9 = 120200		--��Сͼ�����
local ImageMax9 = 120253		--���ͼ�����
local ImageMin10 = 106600		--��Сͼ�����
local ImageMax10 = 106605		--���ͼ�����
local ImageMin11 = 106625		--��Сͼ�����
local ImageMax11 = 106630		--���ͼ�����
local ImageMin12 = 106700		--��Сͼ�����
local ImageMax12 = 106705		--���ͼ�����
local ImageMin13 = 105500		--��Сͼ�����
local ImageMax13 = 105523		--���ͼ�����
local ImageMin14 = 105525		--��Сͼ�����
local ImageMax14 = 105548		--���ͼ�����
local ImageMin15 = 100050		--��Сͼ�����
local ImageMax15 = 100073		--���ͼ�����
local Price = 200	--ͼ���۸�
local Tar = 1				--���ö���
local Try = 5			--�Դ�ʱ��
local Price2 = 500	--ͼ���۸�
local Tar2 = 1				--���ö���
local Try2 = 5			--�Դ�ʱ��
local Price3 = 5	--ͼ���۸�
local Tar3 = 1				--���ö���
local Try3 = 5			--�Դ�ʱ��
if AutoImageOn==1 then
	for Image = ImageMin, ImageMax do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin1, ImageMax1 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin2, ImageMax2 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin3, ImageMax3 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin4, ImageMax4 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin5, ImageMax5 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin6, ImageMax6 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin7, ImageMax7 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin8, ImageMax8 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin9, ImageMax9 do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
	end
		for Image = ImageMin10, ImageMax10 do
		table.insert(StyleSet, {Image=Image, Price=Price2, Tar=Tar2, Try=Try2})
	end
		for Image = ImageMin11, ImageMax11 do
		table.insert(StyleSet, {Image=Image, Price=Price2, Tar=Tar2, Try=Try2})
	end
		for Image = ImageMin12, ImageMax12 do
		table.insert(StyleSet, {Image=Image, Price=Price2, Tar=Tar2, Try=Try2})
	end
		for Image = ImageMin13, ImageMax13 do
		table.insert(StyleSet, {Image=Image, Price=Price2, Tar=Tar2, Try=Try2})
	end
		for Image = ImageMin14, ImageMax14 do
		table.insert(StyleSet, {Image=Image, Price=Price2, Tar=Tar2, Try=Try2})
	end
		for Image = ImageMin15, ImageMax15 do
		table.insert(StyleSet, {Image=Image, Price=Price3, Tar=Tar3, Try=Try3})
	end
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ������ϵͳ���á���������רҵ���������޸ģ�
------------------------------------------------------------------------------
tbl_NpcIndexToNo = tbl_NpcIndexToNo or {}
tbl_NpcLoop = tbl_NpcLoop or {}
tbl_NpcWarp = tbl_NpcWarp or {}
tbl_NpcCount = tbl_NpcCount or {}
tbl_LuaNpcIndex = tbl_LuaNpcIndex or{}
local CR = string.char(10)	--�س�
local ���� = {}
����.���� = {}
����.����.����=0
����.����.����=1
����.����.ԭ��=2
����.����.��ͼ����=3
����.����.��ͼ=4
����.����.X=5
����.����.Y=6
����.����.����=7
����.����.�ȼ�=8
����.����.���=53
����.����.ս��=62
����.����.ԭʼͼ��=158
����.����.ԭ��=2000
����.����.�˺�=2002
����.��ť = {}
����.��ť.��=0
����.��ť.ȷ��=1
����.��ť.�ر�=2
����.��ť.ȷ���ر�=3
����.��ť.��=4
����.��ť.��=8
����.��ť.�Ƿ�=12
����.��ť.��ȡ��=34
����.��ť.��ȡ��=18
����.��ť.����ȡ��=50
����.��ť.��һҳ=16
����.��ť.��һҳ=32
����.��������={}
����.��������.����=1
����.��������.����=2
����.��������.NPC=2
����.��������.����=3
------------------------------------------------------------------------------

Delegate.RegInit("StyleMarketNpc_Init");
function StyleMarketNpc_Init()
	--�Զ�����
	if AutoMapSet.On==1 then
		--�ӱ�����
		if AutoMapSet.AlignDir==1 then
			local tX = AutoMapSet.MinX
			local tY = AutoMapSet.MinY
			for No = 1,table.getn(StyleSet) do
				local tName = StyleSet[No].Name or StyleSet[No].Image
				local tImage = StyleSet[No].Image or 0
				local tMap = AutoMapSet.Map or 999
				local tDir = 6
				if tX>AutoMapSet.MaxX-1 then
					print("\n[" .. NpcName .. "] ���󣺵�ͼ�������޷��������")
					return false
				end
				if tY>AutoMapSet.MaxY-1 then
					tX = tX + AutoMapSet.Spacing + 1
					tY = AutoMapSet.MinY
				end
				StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--����NPC
				tY = tY + AutoMapSet.Spacing+1
			end
		end
		--��������
		if AutoMapSet.AlignDir==2 then
			local tX = AutoMapSet.MinX
			local tY = AutoMapSet.MinY
			for No = 1,table.getn(StyleSet) do
				local tName = StyleSet[No].Name or StyleSet[No].Image
				local tImage = StyleSet[No].Image or 0
				local tMap = AutoMapSet.Map or 999
				local tDir = 4
				if tY>AutoMapSet.MaxY-1 then
					print("\n[" .. NpcName .. "] ���󣺵�ͼ�������޷��������")
					return false
				end
				if tX>AutoMapSet.MaxX-1 then
					tY = tY + AutoMapSet.Spacing + 1
					tX = AutoMapSet.MinX
				end
				StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--����NPC
				tX = tX + AutoMapSet.Spacing + 1
			end
		end
	end
	
	--�Զ�������
	if AutoMapSet.On==0 then
		for No = 1,table.getn(StyleSet) do
			local tName = StyleSet[No].Name or StyleSet[No].Image
			local tImage = StyleSet[No].Image or 0
			local tMap = StyleSet[No].Map or 999
			local tX = StyleSet[No].X or 10
			local tY = StyleSet[No].Y or 10
			local tDir = StyleSet[No].Dir or 6
			--local tPrice = StyleSet[No].Price or 200000
			--local tTarget = StyleSet[No].Tar or 3
			--local tTry = StyleSet[No].Try or 7200
			StyleMarketNpc_CreateNpc(tName, tImage, tMap, tX, tY, tDir, No)	--����NPC
		end
	end
	return 1
end


function StyleMarketNpc_CreateNpc(_Name, _Image, _Map, _X, _Y, _Dir, _No)
	local StyleMarketNpc = NL.CreateNpc(nil, "StyleMarketNpc_Myinit");
	Char.SetData( StyleMarketNpc, %����_����%, _Image);
	Char.SetData( StyleMarketNpc, %����_ԭ��%, _Image);
	Char.SetData( StyleMarketNpc, ����.����.��ͼ, _Map);
	Char.SetData( StyleMarketNpc, ����.����.X, _X);
	Char.SetData( StyleMarketNpc, ����.����.Y, _Y);
	Char.SetData( StyleMarketNpc, ����.����.����, _Dir);
	Char.SetData( StyleMarketNpc, ����.����.ԭ��, _Name);
	NLG.UpChar(StyleMarketNpc)

	tbl_LuaNpcIndex["StyleMarketNpc_" .. _No] = StyleMarketNpc
	tbl_NpcIndexToNo[StyleMarketNpc] = _No

	local LoopTime = math.random(900,1100)
	Char.SetLoopEvent(nil, "StyleMarketNpc_LoopEvent", StyleMarketNpc, LoopTime)
	Char.SetTalkedEvent(nil, "StyleMarketNpc_Talked", StyleMarketNpc)
	Char.SetWindowTalkedEvent(nil, "StyleMarketNpc_WindowTalked", StyleMarketNpc)
	
	return true;
end
function StyleMarketNpc_Myinit(index)
	return true
end
--NpcLoop�¼�����ʱ����
function StyleMarketNpc_LoopEvent( _Index )
	--�Զ�������
	if AutoAction==1 then
		tbl_NpcCount[_Index] = (tbl_NpcCount[_Index] or 0) + 1
		if tbl_NpcCount[_Index]==9999 then
			tbl_NpcCount[_Index] = 0
		end
		if math.mod(tbl_NpcCount[_Index],10)==0 then
			StyleMarketNpc_Action( _Index )
		end
	end
	
	for _PlayerIndex, _LimitTime in pairs(tbl_NpcLoop) do
		if _LimitTime>0 and os.time()>=_LimitTime then
			Char.SetData(_PlayerIndex, %����_����%, Char.GetData(_PlayerIndex,%����_ԭʼͼ��%));
			Char.SetData(_PlayerIndex, %����_ԭ��%, Char.GetData(_PlayerIndex,%����_ԭʼͼ��%));
			NLG.UpChar(_PlayerIndex)
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���Դ���ʱ���ѵ����ָ���������")
			tbl_NpcLoop[_PlayerIndex] = nil
		end
	end
	return 1
end

--���˲���¼�
Delegate.RegDelWarpEvent("StyleMarket_WarpEvent");
function StyleMarket_WarpEvent( _PlayerIndex, _PosX, _PosY )
	if tbl_NpcWarp[_PlayerIndex]~=nil then
		Char.SetData(_PlayerIndex, %����_����%, Char.GetData(_PlayerIndex,%����_ԭʼͼ��%));
		Char.SetData(_PlayerIndex, %����_ԭ��%, Char.GetData(_PlayerIndex,%����_ԭʼͼ��%));
		NLG.UpChar(_PlayerIndex)
		NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] �����뿪" .. NpcName .. "��ͼ���ָ���������")
		tbl_NpcWarp[_PlayerIndex] = nil
	end
	return 1
end


function StyleMarketNpc_Talked( _MeIndex, _PlayerIndex, _Mode)

	if _Mode==1 or _Mode==true then
		--Զ�̵��ã�ֱ��ִ��
	elseif NLG.CheckInFront(_PlayerIndex, _MeIndex, 2)==false then
		--�Ի����ã�������
		return false
	end

	--�Ի�������
	if TalkAction==1 then
		StyleMarketNpc_Action( _MeIndex )
	end

	--��ȡ����������Ϣ
	local No = tbl_NpcIndexToNo[_MeIndex]
	local tPrice = StyleSet[No].Price 
	local tTarget = StyleSet[No].Tar or 3
	local tTryTime = StyleSet[No].Try or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	local tTryMsg = "��ʱ�Դ�" .. tTryTime .. "�루��ʱ���Զ��ָ�ԭ�Σ�"
	if tTryTime==0 then
		tTryMsg = "�����Դ�"
	elseif tTryTime==-1 then
		tTryMsg = "�����Դ����뿪�������Զ��ָ�ԭ�Σ�"
	end

	local tTitle = NpcName		--�Ի������
	local tSL = 5			--ѡ�������Ϣ��������һ�������ѡ��
	local tTalk = {}
	tTalk[1] = tSL .. CR .. "��������������������" .. tTitle .. "��"
	tTalk[2] =        CR .. "�������ƣ�" .. Char.GetData(_MeIndex, ����.����.ԭ��) .. "(ID:" .. Char.GetData(_MeIndex, %����_ԭ��%) .. ")"
	tTalk[3] =        CR .. "�����ۼۣ�" .. tPrice .. "���/���á���" .. tTryPrice .. "���/�Դ�"
	tTalk[4] =        CR .. "�Դ�ģʽ��" .. tTryMsg
	tTalk[5] =        CR .. ""
	tTalk[6] =        CR .. "���������������������Դ�-���"
	tTalk[7] =        CR .. "���������������������Դ�-ս�衻"
	tTalk[8] =        CR .. "������������������������-���"
	tTalk[9] =        CR .. "������������������������-ս�衻"

	--�رղ���Ҫ�İ�ť
	if tTryTime==0 then	--�Դ�
		tTalk[6] = CR .. ""
		tTalk[7] = CR .. ""
	end
	if tTarget==0 or tTarget==1 then	--ս��
		tTalk[7] = CR .. ""
		tTalk[9] = CR .. ""
	end
	if tTarget==0 or tTarget==2 then	--����
		tTalk[6] = CR .. ""
		tTalk[8] = CR .. ""
	end
	if tTarget==0 then	--�ۼ�
		tTalk[3] = CR .. "�����ۼۣ��ݲ�����"
	end

	local tTalkMsg = table.concat(tTalk)

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 1, tTalkMsg);

	return ;
end

function StyleMarketNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)

	--print("\n_MeIndex=" .. _MeIndex .. ", _PlayerIndex=" .. _PlayerIndex .. ", _Seqno=" .. _Seqno .. ", _Select=" .. _Select .. ", _Data=" .. _Data)
	
	--ȡ����ť
	if _Select==2 then
		return
	end

	--�Ի�������
	if TalkAction==1 then
		StyleMarketNpc_Action( _MeIndex )
	end

	--��ȡ����������Ϣ
	local No = tbl_NpcIndexToNo[_MeIndex]
	local tPrice = StyleSet[No].Price or 100
	local tTarget = StyleSet[No].Tar or 3
	local tTryTime = StyleSet[No].Try or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	--��ȡ��������

	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		local tResult = 0
		--���Դ�-���
		if PlayerSelect==1 then
			tResult = StyleMarketNpc_ChangeType(_PlayerIndex, _PlayerIndex, No, 1)
		end

		--���Դ�-ս�衻
		if PlayerSelect==2 then
			local tPetPos = Char.GetData(_PlayerIndex,����.����.ս��)
			local tPetIndex = -2
			if tPetPos>=0 then
				tPetIndex = Char.GetPet(_PlayerIndex, tPetPos)
			end
			if tPetIndex<0 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���Ȱѳ�������Ϊ��ս״̬��")
				return 0
			end
			tResult = StyleMarketNpc_ChangeType(tPetIndex, _PlayerIndex, No, 1)
		end

		--������-���
		if PlayerSelect==3 then
			tResult = StyleMarketNpc_ChangeType(_PlayerIndex, _PlayerIndex, No, 0)
		end

		--������-ս�衻
		if PlayerSelect==4 then
			local tPetPos = Char.GetData(_PlayerIndex,����.����.ս��)
			local tPetIndex = -2
			if tPetPos>=0 then
				tPetIndex = Char.GetPet(_PlayerIndex, tPetPos)
			end
			if tPetIndex<0 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���Ȱѳ�������Ϊ��ս״̬��")
				return 0
			end
			tResult = StyleMarketNpc_ChangeType(tPetIndex, _PlayerIndex, No, 0)
		end

		--������-ħ�Ҳ���
		if tResult==-1 then
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ����е�ħ�Ҳ��㡣")
			return
		end

		--������-���Ͳ���
		if tResult==-2 then
			NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ��Ҫ��װ�Ķ������Ͳ����ϡ�")
			return
		end

		--˳�����
		if tResult==1 then
			local tTryTime = StyleSet[No].Try or 0
			local tTryMsg = "��ʱ�Դ�" .. tTryTime .. "�루��ʱ���Զ��ָ�ԭ�Σ�"
			if tTryTime==-1 then
				tTryMsg = "�����Դ����뿪�������Զ��ָ�ԭ�Σ�"
			end
			
			if PlayerSelect==1 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ��������ѻ����������͡�" .. tTryMsg)
			elseif PlayerSelect==2 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���ս���ѻ����������͡�" .. tTryMsg)
			elseif PlayerSelect==3 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ������������ø������͡�")
			elseif PlayerSelect==4 then
				NLG.SystemMessage(_PlayerIndex, "[" .. NpcName .. "] ���ս�������ø������͡�")
			end
			return
		end
	end
	return 1
end

function StyleMarketNpc_ChangeType(_TargetIndex, _OperatorIndex, _No, _Try)
	--��ȡ����������Ϣ
	local No = tonumber(_No)
	local tImage = tonumber(StyleSet[No].Image) or 0
	local tPrice = tonumber(StyleSet[No].Price) or 100
	local tTarget = tonumber(StyleSet[No].Tar) or 3
	local tTryTime = tonumber(StyleSet[No].Try) or 0
	local tTryPrice = math.floor(StyleSet[No].Price * TryPrice)
	--��ȡ��������
	local tTypeName = {"����","����","����"}
	local tType = Char.GetData(_TargetIndex, ����.����.����)

	--����������
	if tTarget==0 or (tTarget==1 and tType~=1) or (tTarget==2 and tType~=3) then
		return -2	--���Ͳ�����
	end
	--���ħ��
--local tPlayerGold = Char.GetData(_OperatorIndex, ����.����.���)
	local tPlayerGold = Char.HaveItemNum(_OperatorIndex, ItemID)
	local tNeedGold = tPrice
	if _Try==1 then 
		tNeedGold = tTryPrice
	end
	if tPlayerGold<tNeedGold then
		return -1	--��Ҳ���
	end

	--�۳�ħ�ң��������ֲ�����ʽ����ѡһ������ű��������Գ��Ը�������һ����
--	NLG.AddGold(_OperatorIndex, -1*tNeedGold)
    Char.DelItem(_TargetIndex,ItemID,tNeedGold)

--   Char.SetData(_TargetIndex, ����.����.���, Char.GetData(_TargetIndex, ����.����.���)-tNeedGold)

	--��������
	if _Try==1 then 
		Char.SetData(_TargetIndex, %����_����%, tImage)
		Char.SetData(_TargetIndex, %����_ԭ��%, tImage)
	else
		Char.SetData(_TargetIndex, %����_����%, tImage)
		Char.SetData(_TargetIndex, %����_ԭ��%, tImage)
		Char.SetData(_TargetIndex, %����_ԭʼͼ��%, tImage)
	end

	--����Loop��ʱ��
	if _Try==1 and tTryTime>0 then
		tbl_NpcLoop[_TargetIndex] = os.time() + tTryTime
	end

	--����Warp�¼�
	if _Try==1 and tTryTime==-1 then
		tbl_NpcWarp[_TargetIndex] = Char.GetData(_OperatorIndex, ����.����.��ͼ)
	end

	--��������
	NLG.UpChar(_TargetIndex)
	NLG.UpChar(_OperatorIndex)
	Pet.UpPet(_OperatorIndex, Char.GetData(_OperatorIndex,%����_ս��%))
	return 1
end

function StyleMarketNpc_Action( _NpcIndex )
	local No = math.random(1, #ActionList)
	NLG.SetAction(_NpcIndex, ActionList[No])
end