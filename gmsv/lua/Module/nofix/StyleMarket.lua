------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���ͳ��� for GE��GP
--
--��ѡ�е�����NPC�Ի�������ʱ�Դ��������øı����ͣ��˳����Ч
--
--by Ducky�Ώͻ�
--in 2014.4.24
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������������á�����
------------------------------------------------------------------------------
--���ű��������á�
local NpcName = "���ͳ���"		--�ű�����
local TryPrice = 0.02			--�Դ��ۿۣ��Դ��۸�=���ü۸�*�ۿۣ�
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
StyleSet[1] = {Name="С����", Image=115090, Map=999, X=10, Y=10, Dir=6, Price=1000, Tar=0, Try=0}
StyleSet[2] = {Name="è1", Image=115091, Map=999, X=10, Y=10, Dir=6, Price=2000, Tar=1, Try=0}
StyleSet[3] = {Name="è2", Image=115092, Map=999, X=10, Y=10, Dir=6, Price=3000, Tar=2, Try=-1}
StyleSet[4] = {Name="è3", Image=115093, Map=999, X=10, Y=10, Dir=6, Price=10000, Tar=2, Try=-1}
StyleSet[5] = {Name="è4", Image=115094, Map=999, X=10, Y=10, Dir=6, Price=20000, Tar=3, Try=60}
StyleSet[6] = {Name="è5", Image=115095, Map=999, X=10, Y=10, Dir=6, Price=30000, Tar=3, Try=60}
StyleSet[7] = {Name="С����", Image=115096, Map=999, X=10, Y=10, Dir=6, Price=1000, Tar=0, Try=0}
StyleSet[8] = {Name="è1", Image=115097, Map=999, X=10, Y=10, Dir=6, Price=2000, Tar=1, Try=0}
StyleSet[9] = {Name="è2", Image=115098, Map=999, X=10, Y=10, Dir=6, Price=3000, Tar=2, Try=-1}
StyleSet[10] = {Name="è3", Image=115099, Map=999, X=10, Y=10, Dir=6, Price=10000, Tar=2, Try=-1}
StyleSet[11] = {Name="è4", Image=115100, Map=999, X=10, Y=10, Dir=6, Price=20000, Tar=3, Try=60}
StyleSet[12] = {Name="è5", Image=115101, Map=999, X=10, Y=10, Dir=6, Price=30000, Tar=3, Try=60}
--���Զ����á�
--ע���Զ����ý��������ֶ����ú���
--Tar���ö���0-�����ã�1-������ã�2-������ã�3-�˳趼����
--Try�Դ�ʱ����0Ϊ�����Դ���-1Ϊ�����Դ���Warp��ָ������Դ��󳬹�ʱ����Զ��ָ�ԭ�Σ���λ���룩��Ĭ��Ϊ7200�루2Сʱ��
local AutoImageOn = 1		--�Ƿ����Զ�����ͼ����ѡ�0-�رգ�1-������
local ImageMin = 115000		--��Сͼ�����
local ImageMax = 115490		--��Сͼ�����
local Price = 200000		--ͼ���۸�
local Tar = 3				--���ö���
local Try = 5			--�Դ�ʱ��
if AutoImageOn==1 then
	for Image = ImageMin, ImageMax do
		table.insert(StyleSet, {Image=Image, Price=Price, Tar=Tar, Try=Try})
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
	local tPrice = StyleSet[No].Price or 200000
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
	tTalk[3] =        CR .. "�����ۼۣ�" .. tPrice .. "G/���á���" .. tTryPrice .. "G/�Դ�"
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
	local tPrice = StyleSet[No].Price or 200000
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
	local tPrice = tonumber(StyleSet[No].Price) or 200000
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
	local tPlayerGold = Char.GetData(_OperatorIndex, ����.����.���)
	local tNeedGold = tPrice
	if _Try==1 then 
		tNeedGold = tTryPrice
	end
	if tPlayerGold<tNeedGold then
		return -1	--��Ҳ���
	end

	--�۳�ħ�ң��������ֲ�����ʽ����ѡһ������ű��������Գ��Ը�������һ����
--	NLG.AddGold(_OperatorIndex, -1*tNeedGold)
   Char.SetData(_TargetIndex, ����.����.���, Char.GetData(_TargetIndex, ����.����.���)-tNeedGold)

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