------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���幤��ģ��
--
--�Զ���ȫ�µļ���ϵͳ��
--
--by Ducky�Ώͻ�
--in 2014.2.26
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������������á�����
------------------------------------------------------------------------------
GuildClass = GuildClass or {}
--������������
GuildClass.CreateNeedItemName = "�����������֤"	--��Ʒ����
GuildClass.CreateNeedItemID = 475001			--��ƷID
GuildClass.CreateNeedItemNum = 1				--��Ʒ����������д0Ϊ���۳���
GuildClass.CreatePointName = "���"				--�������
GuildClass.CreatePointID = 88888				--���ID
GuildClass.CreatePointNum = 50					--�������������д0Ϊ���۳���
GuildClass.CreateNeedGold = 0					--�������������д0Ϊ���۳���
GuildClass.CreateNeedLv = 120					--����ȼ����ƣ�д0Ϊ����⣩
GuildClass.CreateNeedJobRank = 2				--ְҵ�׼����ƣ�д0Ϊ����⣩
GuildClass.CreateGiveItem = {}
--�������������峤�����嵥��{���ƣ�����ID������}  --(ע�⣺�������𳬳��ѵ����ޣ��������׳����ٸ������)
GuildClass.CreateGiveItem[1] = {"������ļ��", 475004, 30}		--��������������
GuildClass.CreateGiveItem[2] = {"��Ա������", 475005, 30}		--��������������
GuildClass.CreateGiveItem[3] = {"�峤����", 475006, 1}			--��������������
--���������޸�����
GuildClass.EditNeedManageLv = 9					--�޸ļ��������������Ȩ��
--������������
GuildClass.TitleNeedManageLv = 9					--���������������Ȩ��
GuildClass.TitleName = {}
GuildClass.TitleName[9] = "�峤"
GuildClass.TitleName[5] = "����"
GuildClass.TitleName[3] = "����"
GuildClass.TitleName[1] = "��Ա"
GuildClass.TitleNum = {}
GuildClass.TitleNum[5] = {1, 1, 2, 3}			--������ȼ����������ĳ�����(���4��)
GuildClass.TitleNum[3] = {2, 3, 4, 4}			--������ȼ�����������������(���4��)
--�����ͼ����
GuildClass.GuildMapSet = {0, 999, 10, 10}
--���幱������
GuildClass.DonateGoldRate = 0.0005		--����ÿ��ħ�һ�ù��׶�
GuildClass.DonatePointRate = 10			--����ÿ�����ù��׶�
--������������
GuildClass.MaxMemberSet = {50, 70, 90, 100, 999}		--���ȼ����������������1��������2��������3��������4��������5������������
--�����������
GuildClass.JoinNeedItemName = "������ļ��"		--��Ʒ����
GuildClass.JoinNeedItemID = 475004				--��ƷID
GuildClass.JoinNeedItemNum = 1					--��Ʒ��������
GuildClass.JoinNeedManageLv = 2					--��������������Ȩ��
GuildClass.JoinOperater = {}
GuildClass.UseItemSolt = {}
GuildClass.JoinGiveItem = {}
GuildClass.JoinGiveItem[1] = {"����֤����", 475006, 1}		--�������������
--������������
GuildClass.ExpulsionNeedItemName = "��Ա������"	--��Ʒ����
GuildClass.ExpulsionNeedItemID = 475005			--��ƷID
GuildClass.ExpulsionNeedItemNum = 1				--��Ʒ��������
GuildClass.ExpulsionNeedManageLv = 3			--���������������Ȩ��
GuildClass.ExpulsionSaveGold = 0				--�߳�������Ƿ��������ħ�ң�ѡ�0-�۳���1-������
GuildClass.ExpulsionSavePoint = 0				--�߳�������Ƿ�������ĵ��ѡ�0-�۳���1-������
GuildClass.ExpulsionSaveContribution = 0		--�߳�������Ƿ�������Ĺ��׶ȣ�ѡ�0-�۳���1-������
--�˳���������
GuildClass.LeaveSaveGold = 1				--�˳�������Ƿ��������ħ�ң�ѡ�0-�۳���1-������
GuildClass.LeaveSavePoint = 1				--�˳�������Ƿ�������ĵ��ѡ�0-�۳���1-������
GuildClass.LeaveSaveContribution = 1		--�˳�������Ƿ�������Ĺ��׶ȣ�ѡ�0-�۳���1-������
--������������
GuildClass.UpgradeNeedItemName = {"�����������֤ Lv.1", "�����������֤ Lv.2" ,"�����������֤ Lv.3", "�����������֤ Lv.4"}	--��Ʒ����
GuildClass.UpgradeNeedItemID = {475011, 475012, 475013, 475014}		--����������ƷID
GuildClass.UpgradeNeedItemNum = {1, 1, 1, 9999}						--����������Ʒ����
GuildClass.UpgradeNeedGold = {0, 0, 0, 0}					--������������ħ������1����2��ħ�ң�2����3��ħ�ң�3����4��ħ�ҡ�����
GuildClass.UpgradeNeedPoint = {0, 0, 0, 0}					--������������������1����2�����2����3�����3����4���������
GuildClass.UpgradeNeedContribution = {10000, 15000, 64000, 0}		--������������������幱�׶ȣ�1����2�����ף�2����3�����ף�3����4�����ס�����
GuildClass.UpgradeNeedMember = {2, 3, 20, 999}			--�������������������������1����2��������2����3��������3����4������������
GuildClass.UpgradeNeedCreateTime = {0,7,30, 999}		--�������������������������ʱ�䣨��λ���죩
GuildClass.UpgradeNeedManageLv = 9				--���������������Ȩ��
GuildClass.UpgradeSaveGold = 1					--����������Ƿ��������ħ�ң�ѡ�0-�۳���1-������
GuildClass.UpgradeSavePoint = 1					--����������Ƿ�������ĵ��ѡ�0-�۳���1-������
GuildClass.UpgradeGiveItem = {}
GuildClass.UpgradeGiveItem[1] = {"������ļ��", 475004, 30}		--��������������
GuildClass.UpgradeGiveItem[2] = {"��Ա������", 475005, 30}		--��������������
--�����б�����
GuildClass.GuildList = {}						
GuildClass.PlayerGuildList = {}					--�����IndexΪKey�ĳ�Ա��
GuildClass.PlayerGuildID = {}					--�����IndexΪKey��GuildID
GuildClass.GuildListSelect = {}					--�����IndexΪKey��ѡ����
GuildClass.GuildListReturn = {}					--�����IndexΪKey�ķ��غ���
GuildClass.GuildListPageBase = 1000
GuildClass.GuildListPagePerNum = 8
--��Ա�б�����
GuildClass.MemberList = {}						--��GuildIDΪKey�ĳ�Ա��
GuildClass.PlayerMemberList = {}				--�����IndexΪKey�ĳ�Ա��
GuildClass.MemberListType = {}					--�����IndexΪKey�Ĳ鿴����
GuildClass.MemberListSelect = {}				--�����IndexΪKey��ѡ����
GuildClass.MemberListReturn = {}				--�����IndexΪKey�ķ��غ���
GuildClass.MemberListPageBase = 1000
GuildClass.MemberListPagePerNum = 8
--�����̵�
GuildClass.ShopCurrency	= 1						--���׻��ң�ѡ�0-��ѣ�1-���ף�2-ħ�ң�3-���
GuildClass.ShopNeedManageLv = 1					--�����������Ȩ�ޣ����ڴ�Ȩ�޿ɹ���
GuildClass.ShopDiscountRate = 1					--��Ʒ�۸��ۿ�����
GuildClass.ShopList = {}
--�����̵꣺�������ã������Ʒʱ�������θ��ƣ��ȼ��ɵ͵�������
local tNo = 1									--������ţ������������ظ���
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.1"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����1Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 50				--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 2
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.2"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����2Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 100			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 3
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.3"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����3Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 100			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 4
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.4"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����4Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 100			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 5
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 1					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.5"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����5Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 100			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 6
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "��ʱˮ��Lv.6"	--��������
GuildClass.ShopList[tNo].Desc = "ʹ�ú�����6Сʱ��ʱ"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 200			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 999			--���Ʒ�������
local tNo = 7
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "����ͷ��"		--��������
GuildClass.ShopList[tNo].Desc = "�������Եļ���ͷ��"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 2000			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 200				--���Ʒ�������
local tNo = 8
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "����ͷ��"		--��������
GuildClass.ShopList[tNo].Desc = "�������Եļ���ͷ��"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 2000			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 200				--���Ʒ�������
local tNo = 9
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "����ͷ��"		--��������
GuildClass.ShopList[tNo].Desc = "�������Եļ���ͷ��"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 2000			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 20				--���Ʒ�������
local tNo = 10
GuildClass.ShopList[tNo] = {}
GuildClass.ShopList[tNo].Lv = 2					--��Ʒ�ȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.ShopList[tNo].Name = "����ͷ�Σ�������"		--��������
GuildClass.ShopList[tNo].Desc = "��������������Եļ���ͷ��"		--����˵��
GuildClass.ShopList[tNo].Image = 29101			--����ͼ��
GuildClass.ShopList[tNo].ID = 908613			--����ID
GuildClass.ShopList[tNo].Stack = 1				--����ÿ��������ÿ�ι����õ�������
GuildClass.ShopList[tNo].Price = 2000			--�����۸�
GuildClass.ShopList[tNo].MaxNum = 5				--���Ʒ�������
--���弼��
GuildClass.SkillCurrency	= 1					--���׻��ң�ѡ�0-��ѣ�1-���ף�2-ħ�ң�3-���
GuildClass.SkillNeedManageLv = 1				--�����������Ȩ�ޣ����ڴ�Ȩ�޿ɹ���
GuildClass.SkillDiscountRate = 1				--��Ʒ�۸��ۿ�����
GuildClass.SkillList = {}
--���弼�ܣ��������ã���Ӽ���ʱ�������θ��ƣ��ȼ��ɵ͵�������
local tNo = 1									--������ţ������������ظ���
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 1				--���ܵȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.SkillList[tNo].Name = "�ߵ�Ǭ�� Lv.1"		--��������
GuildClass.SkillList[tNo].Desc = "�з����ҷ�ȫ�壬ˮ�����Է�ת���˼��ܽ���1����"		--����˵��
GuildClass.SkillList[tNo].ID = 517			--����ID
GuildClass.SkillList[tNo].Price = 50			--ѧϰ�۸�
GuildClass.SkillList[tNo].MaxNum = 999			--����ѧϰ����
local tNo = 2
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 1				--���ܵȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.SkillList[tNo].Name = "���ɳ²� Lv.1"		--��������
GuildClass.SkillList[tNo].Desc = "͵͵Ǳ�������󣬸��з�ȫ������1���ָ����˼��ܽ���1����"		--����˵��
GuildClass.SkillList[tNo].ID = 518			--����ID
GuildClass.SkillList[tNo].Price = 200			--ѧϰ�۸�
GuildClass.SkillList[tNo].MaxNum = 50			--����ѧϰ����
local tNo = 3
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 2				--���ܵȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.SkillList[tNo].Name = "������� Lv.1"		--��������
GuildClass.SkillList[tNo].Desc = "��������ɹ��������Լ���Ϊȫ��ָ�HP���˼��ܽ���1����"		--����˵��
GuildClass.SkillList[tNo].ID = 519			--����ID
GuildClass.SkillList[tNo].Price = 5000			--ѧϰ�۸�
GuildClass.SkillList[tNo].MaxNum = 10			--����ѧϰ����
local tNo = 4
GuildClass.SkillList[tNo] = {}
GuildClass.SkillList[tNo].Lv = 3				--���ܵȼ�������ȼ��ﵽʱ�Ż���ʾ������
GuildClass.SkillList[tNo].Name = "������ Lv.1"		--��������
GuildClass.SkillList[tNo].Desc = "�ٻ�����Э����ȫ�帴��ָ�1Ѫ���˼��ܽ���1����"			--����˵��
GuildClass.SkillList[tNo].ID = 520			--����ID
GuildClass.SkillList[tNo].Price = 5000			--ѧϰ�۸�
GuildClass.SkillList[tNo].MaxNum = 10			--����ѧϰ����
--���������á�
GuildClass.OnlineMember = GuildClass.OnlineMember or {}
GuildClass.TitleList = GuildClass.TitleList or {}
GuildClass.PlayerTitleList = GuildClass.PlayerTitleList or {}
------------------------------------------------------------------------------
Delegate.RegDelLoginEvent("GuildClass.MemberLogin");
Delegate.RegDelDropEvent("GuildClass.MemberLogout");
Delegate.RegDelLogoutEvent("GuildClass.MemberLogout");
Delegate.RegDelLoginGateEvent("GuildClass.MemberLoginGate");

function GuildClass.MemberLogin(_PlayerIndex)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	--print("Login tGuildID=" .. tGuildID)
	if tGuildID>0 then
		GuildClass.OnlineMember[tGuildID] = GuildClass.OnlineMember[tGuildID] or {}
		local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
		local tDataPN = Char.GetData(_PlayerIndex, 48)
		local tRegistNumber = Char.GetData(_PlayerIndex, 49)
		local tName = Char.GetData(_PlayerIndex, %����_����%)
		local tKey = GuildClass.getTabKey(_PlayerIndex)
		GuildClass.OnlineMember[tGuildID][tKey] = {
													Index = _PlayerIndex,
													CdKey = tCdKey,
													RegistNumber = tRegistNumber,
													DataPN = tDataPN,
													Name = tName,
													Time = os.time()
													}
		--GuildClass.GuildMessage(tGuildID, "��Ա " .. tName .. " �����ˣ�")
		--GuildClass.GuildTalk(tGuildID, "��Һã�����" .. tName .. "����������һ��������ɣ�")
	end
	return 1
end

function GuildClass.MemberLogout(_PlayerIndex)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if tGuildID>0 then
		GuildClass.OnlineMember[tGuildID] = GuildClass.OnlineMember[tGuildID] or {}
		local tKey = GuildClass.getTabKey(_PlayerIndex)
		GuildClass.OnlineMember[tGuildID][tKey] = nil
	end
	return 1
end

function GuildClass.MemberLoginGate(_PlayerIndex)
	return 1
end

--��ȡ����ID
function GuildClass.GetID(_PlayerIndex)
	return Field.Get(_PlayerIndex, "GuildID")
end

--���ü���ID
function GuildClass.SetID(_PlayerIndex, _GuildID)
	if _GuildID~=nil then
		_GuildID = tonumber(_GuildID)
	end
	return Field.Set(_PlayerIndex, "GuildID", _GuildID)
end

--��������
function GuildClass.CreateGuild(_PlayerIndex, _GuildName)
	_GuildName = _GuildName or ""
	--_GuildName = string.trims(_GuildName)
	if string.len(_GuildName)<8 or string.len(_GuildName)>16 then
		print("CreateGuild Error: string.len(_GuildName)=" .. string.len(_GuildName))
		return -1	--������̫��̫��
	end
	if GuildClass.GetID(_PlayerIndex)~=nil and GuildClass.GetID(_PlayerIndex)~=0 and GuildClass.GetID(_PlayerIndex)~="0" and GuildClass.GetID(_PlayerIndex)~="" then
		return -2	--���Ѽ������
	end
	if GuildClass.GuildNameToID(_GuildName)~=nil then
		print("CreateGuild Error: _GuildName=" .. _GuildName)
		return -3	--���������Ѵ���
	end
	if Char.ItemNumAdv(_PlayerIndex, GuildClass.CreateNeedItemID)<GuildClass.CreateNeedItemNum then
		print("CreateGuild Error: Char.ItemNumAdv=" .. GuildClass.CreateNeedItemID .. "," .. Char.ItemNumAdv(_PlayerIndex, GuildClass.CreateNeedItemID) .. "<" .. GuildClass.CreateNeedItemNum)
		return -4	--ȱ�ټ��崴��֤
	end
	if Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID)<GuildClass.CreatePointNum then
		print("CreateGuild Error: Char.ItemNumAdv=" .. GuildClass.CreatePointID .. "," .. Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID) .. "<" .. GuildClass.CreatePointNum)
		return -5	--ȱ�ٵ��
	end
	if Char.GetData(_PlayerIndex, %����_���%)<GuildClass.CreateNeedGold then
		print("CreateGuild Error: Char.GetData(_PlayerIndex, %����_���%)=" .. Char.GetData(_PlayerIndex, %����_���%) .. "<" .. GuildClass.CreateNeedGold)
		return -6	--ȱ�ٽ��
	end
	if Char.GetData(_PlayerIndex, %����_ְ��%)<GuildClass.CreateNeedJobRank then
		print("CreateGuild Error: Char.GetData(_PlayerIndex, %����_ְ��%)=" .. Char.GetData(_PlayerIndex, %����_ְ��%) .. "<" .. GuildClass.CreateNeedJobRank)
		return -7	--ְ�ײ���
	end
	local tEmptySlot = Char.ItemSlot(_PlayerIndex)
	if tEmptySlot<table.getn(GuildClass.CreateGiveItem) then
		print("CreateGuild Error: Char.ItemSlot(_PlayerIndex)=" .. tEmptySlot .. "<" .. table.getn(GuildClass.CreateGiveItem))
		return -8	--�������������
	end
	Char.DelItem(_PlayerIndex, GuildClass.CreateNeedItemID, GuildClass.CreateNeedItemNum)
	Char.DelItem(_PlayerIndex, GuildClass.CreatePointID, GuildClass.CreatePointNum)
	Char.AddGold(_PlayerIndex, GuildClass.CreateNeedGold*-1)
	--Char.SetData(_PlayerIndex, %����_���%, Char.GetData(_PlayerIndex, %����_���%)-GuildClass.CreateNeedJobRank)
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %����_����%)
	local tGuildID = GuildClass.GetMaxGuildID() + 1
	local tMaxMember = GuildClass.MaxMemberSet[1]
	local tSql1 = "insert into "
	tSql1 = tSql1 .. "lua_guild (GuildID, GuildName, MaxMember, GM_CdKey, GM_RegistNumber, GM_DataPlaceNumber, CreateTime) "
	tSql1 = tSql1 .. "values (" .. tGuildID .. ", '" .. _GuildName .. "', " .. tMaxMember .. ", '" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. os.time() .. "); "
	SQL.Run(tSql1)
	local tSql2 = "insert into "
	tSql2 = tSql2 .. "lua_guildmember (CdKey, RegistNumber, DataPlaceNumber, GuildID, TitleID, JoinTime) "
	tSql2 = tSql2 .. "values ('" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. tGuildID .. ", " .. 9 .. ", " .. os.time() .. "); "
	SQL.Run(tSql2)
	GuildClass.SetID(_PlayerIndex, tGuildID)
	for i = 1, table.getn(GuildClass.CreateGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.CreateGiveItem[i][2], GuildClass.CreateGiveItem[i][3])
	end
	GuildClass.MemberSetData(_PlayerIndex, "Gold", GuildClass.CreateNeedGold)
	GuildClass.MemberSetData(_PlayerIndex, "Point", GuildClass.CreatePointNum)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.GuildSetData(tGuildID, "Gold", GuildClass.CreateNeedGold)
	GuildClass.GuildSetData(tGuildID, "Point", GuildClass.CreatePointNum)
	GuildClass.GuildSetData(tGuildID, "Contribution", math.floor(GuildClass.CreatePointNum * GuildClass.DonatePointRate) + math.floor(GuildClass.CreateNeedGold * GuildClass.DonateGoldRate))
	GuildClass.Log(tGuildID, _PlayerIndex, "CreateGuild", nil, _GuildName)
	return 1
end

--ɾ������
function GuildClass.DelGuild(_PlayerIndex)
	local _GuildID = GuildClass.GetID(_PlayerIndex)
	if _GuildID==nil or _GuildID=="" or _GuildID==0 or _GuildID=="0" then
		return -1	--û�м������
	end
	_GuildID = tonumber(_GuildID)
	if GuildClass.GetMemberNum(_GuildID)>1 then
		return -2	--������Աû�����
	end
	local tGuildName = GuildClass.GuildGetData(_GuildID, "GuildName")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tRegistNumber = tonumber(Char.GetData(_PlayerIndex, 49))
	local tDataPlaceNumber = tonumber(Char.GetData(_PlayerIndex, 48))
	if GM_CdKey~=tCdKey or GM_RegistNumber~=tRegistNumber or GM_DataPlaceNumber~=tDataPlaceNumber then
		return -3	--�㲻�ǹ���Ա
	end
	local tSql1 = "Delete From lua_guildmember where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql1)
	local tSql2 = "Delete From lua_guild where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql2)
	local tSql4 = "Delete From lua_guildmission where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql4)
	--SQL.Run(tSql1 .. tSql2 .. tSql3 .. tSql4)
	GuildClass.SetID(_PlayerIndex, 0)
	Char.Warp(_PlayerIndex, 0, 1000, 242, 88)
	Char.DelItem(_PlayerIndex, 475004, 99999)
	Char.DelItem(_PlayerIndex, 475005, 99999)
	Char.DelItem(_PlayerIndex, 475006, 99999)
	Char.DelItem(_PlayerIndex, 475004, 99999)
	Char.DelItem(_PlayerIndex, 475005, 99999)
	Char.DelItem(_PlayerIndex, 475006, 99999)
	GuildClass.Log(_GuildID, _PlayerIndex, "DelGuild", nil, tGuildName)
	return 1
end

--��������
function GuildClass.UpgradeGuild(_PlayerIndex, _GuildID)
	_GuildID = tonumber(_GuildID)
	local tGuildLv = tonumber(GuildClass.GuildGetData(_GuildID, "GuildLv"))
	local tGuildGold = tonumber(GuildClass.GuildGetData(_GuildID, "Gold"))
	local tGuildPoint = tonumber(GuildClass.GuildGetData(_GuildID, "Point"))
	local tGuildContribution = tonumber(GuildClass.GuildGetData(_GuildID, "Contribution"))
	local tGuildMember = tonumber(GuildClass.GetMemberNum(_GuildID))
	local tNeedGold = tonumber(GuildClass.UpgradeNeedGold[tGuildLv])
	local tNeedPoint = tonumber(GuildClass.UpgradeNeedPoint[tGuildLv])
	local tNeedContribution = tonumber(GuildClass.UpgradeNeedContribution[tGuildLv])
	local tNeedMember = tonumber(GuildClass.UpgradeNeedMember[tGuildLv])
	local tNeedCreateTime = tonumber(GuildClass.UpgradeNeedCreateTime[tGuildLv])
	local tNeedItemName = GuildClass.UpgradeNeedItemName[tGuildLv]
	local tNeedItemID = tonumber(GuildClass.UpgradeNeedItemID[tGuildLv])
	local tNeedItemNum = tonumber(GuildClass.UpgradeNeedItemNum[tGuildLv])
	local tOperaterTitleID = GuildClass.MemberGetData(_PlayerIndex, "TitleID")
	if tOperaterTitleID<GuildClass.UpgradeNeedManageLv then
		return -1	--Ȩ�޲���
	end
	if Char.ItemNumAdv(_PlayerIndex, tNeedItemID)<tNeedItemNum then
		return -2	--���߲���
	end
	if tGuildGold<tNeedGold or tGuildPoint<tNeedPoint or tGuildMember<tNeedMember or tGuildContribution<tNeedContribution then
		return -3	--��������
	end
	GuildClass.GuildSetData(_GuildID, "GuildLv", tGuildLv + 1)
	if GuildClass.UpgradeSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tNeedGold)
	end
	if GuildClass.UpgradeSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tNeedPoint)
	end
	Char.DelItem(_PlayerIndex, tNeedItemID, tNeedItemNum)
	GuildClass.GuildSetData(_GuildID, "MissionID", 0)
	for i = 1, table.getn(GuildClass.UpgradeGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.UpgradeGiveItem[i][2], GuildClass.UpgradeGiveItem[i][3])
	end
	return 1
end

function GuildClass.EnterGuildMap(_PlayerIndex, _GuildID)
	
end

function GuildClass.InviteGuild(_PlayerIndex, _GuildID, _TargetIndex)
	
end

--�������
function GuildClass.JoinGuild(_PlayerIndex, _GuildID, _OperaterIndex)
	--if _GuildID~=nil then _GuildID = tonumber(_GuildID) end
	--if GuildClass.GetID(_PlayerIndex)~=nil then
	--	return -2	--���Ѽ������
	--end
	_GuildID = tonumber(_GuildID)
	local tGuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if tGuildID>0 then
		return -2	--���Ѽ������
	end
	local tGuildLv = tonumber(GuildClass.GuildGetData(_GuildID, "GuildLv"))
	local tGuildMemberNum = GuildClass.GetMemberNum(_GuildID)
	if tGuildMemberNum>=GuildClass.MaxMemberSet[tGuildLv] then
		return -3
	end
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %����_����%)
	local tSql = "insert into "
	tSql = tSql .. "lua_guildmember (CdKey, RegistNumber, DataPlaceNumber, GuildID, TitleID, JoinTime) "
	tSql = tSql .. "values ('" .. tCdKey  .. "', " .. tRegistNumber .. ", " .. tDataPN .. ", " .. _GuildID .. ", " .. 1 .. ", " .. os.time() .. "); "
	SQL.Run(tSql)
	GuildClass.SetID(_PlayerIndex, _GuildID)
	GuildClass.MemberLogin(_PlayerIndex)
	for i = 1, table.getn(GuildClass.JoinGiveItem) do
		Char.GiveItem(_PlayerIndex, GuildClass.JoinGiveItem[i][2], GuildClass.JoinGiveItem[i][3])
	end
	GuildClass.Log(_GuildID, _PlayerIndex, "JoinGuild", _OperaterIndex, nil)
	return 1
end

--�˳�����
function GuildClass.LeaveGuild(_PlayerIndex)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--��δ�������
	end
	local tPlayerGold = GuildClass.MemberGetData(_PlayerIndex, "Gold")
	local tPlayerPoint = GuildClass.MemberGetData(_PlayerIndex, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tRegistNumber = tonumber(Char.GetData(_PlayerIndex, 49))
	local tDataPlaceNumber = tonumber(Char.GetData(_PlayerIndex, 48))
	if GM_CdKey==tCdKey and GM_RegistNumber==tRegistNumber and GM_DataPlaceNumber==tDataPlaceNumber then
		return -2	--���ǹ���Ա
	end
	if GuildClass.LeaveSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tPlayerGold)
	end
	if GuildClass.LeaveSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tPlayerPoint)
	end
	if GuildClass.LeaveSaveContribution~=1 then
		GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution - tPlayerMaxContribution)
	end
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	local tName = Char.GetData(_PlayerIndex, %����_����%)
	local tSql = "delete from lua_guildmember where GuildID=" .. _GuildID .. " and CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	SQL.Run(tSql)
	GuildClass.SetID(_PlayerIndex, 0)
	GuildClass.MemberLogout(_PlayerIndex)
	Char.Warp(_PlayerIndex, 0, 1000, 242, 88)
	GuildClass.Log(_GuildID, _PlayerIndex, "LeaveGuild", nil, nil)
	return 1
end

--������Ա
function GuildClass.ExpulsionGuild(_PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber, _OperaterIndex)
	_PlayerRegistNumber = tonumber(_PlayerRegistNumber)
	_PlayerDataPlaceNumber = tonumber(_PlayerDataPlaceNumber)
	local _GuildID = tonumber(GuildClass.GetID(_OperaterIndex)) or 0
	if _GuildID<=0 then
		return -1	--��δ�������
	end
	local tPlayerTab = {_PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber}
	local tPlayerGold = GuildClass.MemberGetData(tPlayerTab, "Gold")
	local tPlayerPoint = GuildClass.MemberGetData(tPlayerTab, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(tPlayerTab, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(tPlayerTab, "MaxContribution")
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local GM_CdKey = GuildClass.GuildGetData(_GuildID, "GM_CdKey")
	local GM_RegistNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_RegistNumber"))
	local GM_DataPlaceNumber = tonumber(GuildClass.GuildGetData(_GuildID, "GM_DataPlaceNumber"))
	local tOperaterTitleID = GuildClass.MemberGetData(_OperaterIndex, "TitleID")
	if tOperaterTitleID<GuildClass.ExpulsionNeedManageLv then
		return -2	--Ȩ�޲���
	end
	if GM_CdKey==_PlayerCdKey and GM_RegistNumber==_PlayerRegistNumber and GM_DataPlaceNumber==_PlayerDataPlaceNumber then
		return -3	--�峤�޷�����
	end
	if Char.ItemNumAdv(_OperaterIndex, GuildClass.ExpulsionNeedItemID)<GuildClass.ExpulsionNeedItemNum then
		return -4	--���߲���
	end
	if GuildClass.ExpulsionSaveGold~=1 then
		GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold - tPlayerGold)
	end
	if GuildClass.ExpulsionSavePoint~=1 then
		GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint - tPlayerPoint)
	end
	if GuildClass.ExpulsionSaveContribution~=1 then
		GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution - tPlayerMaxContribution)
	end
	local tName = ""
	local tPlayerIndex = GuildClass.IsOnline(_GuildID, _PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber)
	print("_PlayerCdKey=" .. _PlayerCdKey)
	print("_PlayerRegistNumber=" .. _PlayerRegistNumber)
	print("_PlayerDataPlaceNumber=" .. _PlayerDataPlaceNumber)
	print("tPlayerIndex=" .. tPlayerIndex)
	print("_OperaterIndex=" .. _OperaterIndex)
	if tPlayerIndex~=0 and tPlayerIndex~=-1 and tPlayerIndex~=-2 then
		--Online
		print("Setp: Get Target Name")
		tName = Char.GetData(tPlayerIndex, %����_����%)
		print("Setp: Get Operator Name")
		local tOperaterName = Char.GetData(_OperaterIndex, %����_����%)
		print("Setp: Get Guild Name")
		local tGuildName = GuildClass.GuildGetData(_GuildID, "GuildName")
		print("Setp: Send SystemMessage")
		NLG.SystemMessage(tPlayerIndex, "[����] ���ѱ�" .. tOperaterName .. "�߳�" .. tGuildName .. "���壡")
		--GuildClass.MemberLogout(tPlayerIndex)
		print("Setp: Set Field nil")
		GuildClass.SetID(tPlayerIndex, 0)
		print("Setp: Get Map Info")
		local tGuildMapType = GuildClass.GuildGetData(_GuildID, "MapType")
		local tGuildMapID = GuildClass.GuildGetData(_GuildID, "MapID")
		local tPlayerMapType = Char.GetData(tPlayerIndex, %����_MAP%)
		local tPlayerMapID = Char.GetData(tPlayerIndex, %����_��ͼ%)
		if tPlayerMapType==tGuildMapType and tGuildMapID==tPlayerMapID then
			print("Setp: Warp Target")
			Char.Warp(tPlayerIndex, 0, 1000, 242, 88)
		end
	else
		--Offline
		print("Setp: SQL.Run")
		local tSql1 = "select Name from tbl_character where CdKey='" .. _PlayerCdKey .. "' and RegistNumber=" .. _PlayerRegistNumber .. " and DataPlaceNumber=" .. _PlayerDataPlaceNumber .. ";"
		local tRS = SQL.Run(tSql1)
		if type(tRS)=="table" then
			tName = tRS["0_0"]
		else
			tName = "δ֪"
		end
		print("\n[����] " .. tName .. "��Offline�� �ѱ��߳�����")
		local tSql2 = "delete from tbl_globalregvalue where account_id='" .. _PlayerCdKey .. "' and reg_num=" .. _PlayerRegistNumber .. " and data_place=" .. _PlayerDataPlaceNumber .. " and str='GuildID';"
		local tRS = SQL.Run(tSql2)
	end
	print("Setp: SQL.Run")
	local tSql = "delete from lua_guildmember where GuildID=" .. _GuildID .. " and CdKey='" .. _PlayerCdKey .. "' and RegistNumber=" .. _PlayerRegistNumber .. " and DataPlaceNumber=" .. _PlayerDataPlaceNumber .. ";"
	SQL.Run(tSql)
	print("Setp: Del Item")
	Char.DelItem(_OperaterIndex, GuildClass.ExpulsionNeedItemID, GuildClass.ExpulsionNeedItemNum)
	print("Setp: Log")
	GuildClass.Log(_GuildID, _OperaterIndex, "ExpulsionGuild", tPlayerIndex, nil)
	return 1
end

--��Ա���׽��
function GuildClass.DonateGold(_PlayerIndex, _Value)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--��δ�������
	end
	_Value = tonumber(_Value) or 0
	if _Value<=0 or _Value<(1/GuildClass.DonateGoldRate) or _Value>Char.GetData(_PlayerIndex, %����_���%) then
		return -2
	end
	local tGuildGold = GuildClass.GuildGetData(_GuildID, "Gold")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local tPlayerGold = GuildClass.MemberGetData(_PlayerIndex, "Gold")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	--Char.SetData(_PlayerIndex, %����_���%, Char.GetData(_PlayerIndex, %����_���%) - _Value)
	Char.AddGold(_PlayerIndex, _Value*-1)
	GuildClass.MemberSetData(_PlayerIndex, "Gold", tPlayerGold + _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", tPlayerContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", tPlayerMaxContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	GuildClass.GuildSetData(_GuildID, "Gold", tGuildGold + _Value)
	GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution + math.floor(_Value * GuildClass.DonateGoldRate))
	return 1
end

--��Ա���׵��
function GuildClass.DonatePoint(_PlayerIndex, _Value)
	local _GuildID = tonumber(GuildClass.GetID(_PlayerIndex)) or 0
	if _GuildID<=0 then
		return -1	--��δ�������
	end
	_Value = tonumber(_Value) or 0
	if _Value<=0 or _Value>Char.ItemNumAdv(_PlayerIndex, GuildClass.CreatePointID) then
		return -2
	end
	local tGuildPoint = GuildClass.GuildGetData(_GuildID, "Point")
	local tGuildContribution = GuildClass.GuildGetData(_GuildID, "Contribution")
	local tPlayerPoint = GuildClass.MemberGetData(_PlayerIndex, "Point")
	local tPlayerContribution = GuildClass.MemberGetData(_PlayerIndex, "Contribution")
	local tPlayerMaxContribution = GuildClass.MemberGetData(_PlayerIndex, "MaxContribution")
	Char.DelItem(_PlayerIndex, GuildClass.CreatePointID, _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Point", tPlayerPoint + _Value)
	GuildClass.MemberSetData(_PlayerIndex, "Contribution", tPlayerContribution + math.floor(_Value * GuildClass.DonatePointRate))
	GuildClass.MemberSetData(_PlayerIndex, "MaxContribution", tPlayerMaxContribution + math.floor(_Value * GuildClass.DonatePointRate))
	GuildClass.GuildSetData(_GuildID, "Point", tGuildPoint + _Value)
	GuildClass.GuildSetData(_GuildID, "Contribution", tGuildContribution + math.floor(_Value * GuildClass.DonatePointRate))
	return 1
end

--��ȡ�����б�
function GuildClass.GetGuildList()
	local tGuildNum = GuildClass.GetGuildNum()
	local tSql = "SELECT g.GuildID, g.GuildName, g.GuildLv, count(m.CdKey) AS Member, g.Contribution " .. 
				"FROM lua_guild g LEFT JOIN lua_guildmember m ON g.GuildID = m.GuildID " .. 
				"GROUP BY g.GuildName ORDER BY g.GuildLv DESC, g.Contribution DESC"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetGuildList Error: ���ݿ����: " .. tRS)
		 return -2		--���ݿ����
	end
	local tFieldName = {"GuildID", "GuildName", "GuildLv", "Member", "Contribution"}
	local tGuildList = {}
	for tRow = 0, tGuildNum-1 do
		if tRS[tRow .. "_" .. 0]~=nil then
			--break
			local tGuildListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tGuildListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tGuildList, tGuildListRow)
		end
	end
	GuildClass.GuildList = tGuildList
	return tGuildList
end

--��ȡ��Ա�б�
function GuildClass.GetMemberList(_GuildID)
	local _GuildID = tonumber(_GuildID) or 0
	if _GuildID<=0 then
		print("GetMemberList Error: ����������")
		return -1	--����������
	end
	local tMemberNum = GuildClass.GetMemberNum(_GuildID)
	--print("GetMemberList.tMemberNum=" .. tMemberNum)
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				"AND m.GuildID = " .. _GuildID .. 
				" order by m.TitleID desc, m.MaxContribution desc;"
	--local tSql = "select g.GuildName, g.GuildID, m.Contribution from lua_guild g, lua_guildmember m where g.GuildID=m.GuildID;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetMemberList Error: ���ݿ����: " .. tRS)
		 return -2		--���ݿ����
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tMemberList = {}
	for tRow = 0, tMemberNum-1 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tMemberListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tMemberListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tMemberList, tMemberListRow)
		end
	end
	GuildClass.MemberList[_GuildID] = tMemberList
	--print("#tMemberList=" .. #tMemberList)
	return tMemberList
end

--��ȡȫ����Ա�б�
function GuildClass.GetMemberAllList()
	local tMemberNum = GuildClass.GetMemberAllNum()
	--print("GetMemberList.tMemberNum=" .. tMemberNum)
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				" order by m.MaxContribution desc;"
	--local tSql = "select g.GuildName, g.GuildID, m.Contribution from lua_guild g, lua_guildmember m where g.GuildID=m.GuildID;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetMemberList Error: ���ݿ����: " .. tRS)
		 return -2		--���ݿ����
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tMemberList = {}
	for tRow = 0, tMemberNum-1 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tMemberListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tMemberListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tMemberList, tMemberListRow)
		end
	end
	GuildClass.MemberList[-9] = tMemberList
	--print("#tMemberList=" .. #tMemberList)
	return tMemberList
end

function GuildClass.GetTitleList(_GuildID, _TitleID)
	local _GuildID = tonumber(_GuildID) or 0
	if _GuildID<=0 then
		print("GetTitleList Error: ����������")
		return -1	--����������
	end
	local _TitleID = tonumber(_TitleID) or 0
	if _TitleID<=0 then
		print("GetTitleList Error: �ƺű������")
		return -2	--�ƺű������
	end
	local tSql = "SELECT c.CdKey, c.RegistNumber, c.DataPlaceNumber, m.GuildID, c.Name, " ..
				"c.Lv, c.MainJob, g.GuildName, m.Contribution, m.MaxContribution, m.Gold, m.Point, m.TitleID, " .. 
				"m.MissionID, m.JoinTime " ..
				"FROM tbl_character c, lua_guildmember m, lua_guild g " .. 
				"WHERE c.CdKey = m.CdKey AND m.GuildID = g.GuildID AND c.RegistNumber = m.RegistNumber AND c.DataPlaceNumber = m.DataPlaceNumber " .. 
				" AND m.GuildID = " .. _GuildID .. 
				" AND m.TitleID = " .. _TitleID .. 
				" order by m.TitleID desc, m.MaxContribution desc;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		print("GetTitleList Error: ���ݿ����: " .. tRS)
		return {}		--���ݿ����
	end
	local tFieldName = {"CdKey", "RegistNumber", "DataPlaceNumber", "GuildID", "Name", "Lv", "MainJob", "GuildName", "Contribution", "MaxContribution", "Gold", "Point", "TitleID", "MissionID", "JoinTime"}
	local tTitleList = {}
	for tRow = 0, 3 do
		--print("CdKey=" .. (tRS[tRow .. "_" .. 0] or "nil"))
		if tRS[tRow .. "_" .. 0]~=nil then
			local tTitleListRow = {}
			for tField = 0, table.getn(tFieldName)-1 do
				tTitleListRow[tFieldName[tField+1]] = tRS[tRow .. "_" .. tField]
			end
			table.insert(tTitleList, tTitleListRow)
		end
	end
	GuildClass.TitleList[_GuildID] = GuildClass.TitleList[_GuildID] or {}
	GuildClass.TitleList[_GuildID][_TitleID] = tTitleList
	return tTitleList
end

--��ȡ���������
function GuildClass.GuildGetData(_GuildID, _Const)
	_GuildID = tonumber(_GuildID)  or 0
	local tSql = "select " .. _Const .. " from lua_guild where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tRS["0_0"]
end

--���ü��������
function GuildClass.GuildSetData(_GuildID, _Const, _Value)
	_GuildID = tonumber(_GuildID)  or 0
	if _Value==nil then _Value=0 end
	if type(_Value)=="string" then _Value = "'" .. _Value .. "'" end
	local tSql = "update lua_guild set " .. _Const .. "=" .. _Value .. " where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql)
end

--��ȡ��Ա������
function GuildClass.MemberGetData(_PlayerIndex, _Const)
	local tCdKey, tDataPN, tRegistNumber
	if type(_PlayerIndex)=="number" then
		tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
		tDataPN = Char.GetData(_PlayerIndex, 48)
		tRegistNumber = Char.GetData(_PlayerIndex, 49)
	elseif type(_PlayerIndex)=="table" then
		tCdKey = _PlayerIndex[1]
		tRegistNumber = _PlayerIndex[2]
		tDataPN = _PlayerIndex[3]
	end
	local tSql = "select " .. _Const .. " from lua_guildmember where CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--������Ա������
function GuildClass.MemberSetData(_PlayerIndex, _Const, _Value)
	if _Value==nil then _Value=0 end
	local tCdKey, tDataPN, tRegistNumber
	if type(_PlayerIndex)=="number" then
		tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
		tDataPN = Char.GetData(_PlayerIndex, 48)
		tRegistNumber = Char.GetData(_PlayerIndex, 49)
	elseif type(_PlayerIndex)=="table" then
		tCdKey = _PlayerIndex[1]
		tRegistNumber = _PlayerIndex[2]
		tDataPN = _PlayerIndex[3]
	end
	local tSql = "update lua_guildmember set " .. _Const .. "=" .. _Value .. " where CdKey='" .. tCdKey .. "' and RegistNumber=" .. tRegistNumber .. " and DataPlaceNumber=" .. tDataPN .. ";"
	return SQL.Run(tSql)
end

--��ȡ���������
function GuildClass.MissionGetData(_GuildID, _Const)
	_GuildID = tonumber(_GuildID)  or 0
	local tSql = "select " .. _Const .. "from lua_guildmission where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--�������������
function GuildClass.MissionSetData(_GuildID, _Const, _Value)
	_GuildID = tonumber(_GuildID)  or 0
	if _Value==nil then _Value=0 end
	local tSql = "update lua_guildmission set " .. _Const .. "=" .. _Value .. " where GuildID=" .. _GuildID .. ";"
	SQL.Run(tSql)
end

function GuildClass.IsOnline(_GuildID, _PlayerCdKey, _PlayerRegistNumber, _PlayerDataPlaceNumber)
	--GuildClass.OnlineMember[_GuildID] = GuildClass.OnlineMember[_GuildID] or {}
	--print("_GuildID=" .. _GuildID)
	--print("type(GuildClass.OnlineMember[_GuildID])=" .. type(GuildClass.OnlineMember[_GuildID]))
	_GuildID = tonumber(_GuildID) or -1
	_PlayerCdKey = tostring(_PlayerCdKey)
	_PlayerRegistNumber = tonumber(_PlayerRegistNumber)
	_PlayerDataPlaceNumber = tonumber(_PlayerDataPlaceNumber)
	local tKey = "T_" .. _PlayerCdKey .. "_" .. _PlayerRegistNumber .. "_" .. _PlayerDataPlaceNumber
	if GuildClass.OnlineMember[_GuildID]==nil then
		return -1
	end
	if GuildClass.OnlineMember[_GuildID][tKey]==nil then
		return -2
	end
	local tPlayerIndex = GuildClass.OnlineMember[_GuildID][tKey].Index
	local tCdKey = Char.GetData(tPlayerIndex, %����_�˺�%)
	local tDataPN = Char.GetData(tPlayerIndex, 48)
	local tRegistNumber = Char.GetData(tPlayerIndex, 49)
	if tCdKey==_PlayerCdKey and tRegistNumber==_PlayerRegistNumber and tDataPN==_PlayerDataPlaceNumber then
		return tPlayerIndex
	end
	return -3
end

--��ȡ������
function GuildClass.GetGuildNum()
	local tSql = "select count(*) from lua_guild;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--��ȡ������Ա��
function GuildClass.GetMemberNum(_GuildID)
	_GuildID = tonumber(_GuildID)
	local tSql = "select count(*) from lua_guildmember where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--��ȡ������Ա��
function GuildClass.GetMemberAllNum()
	local tSql = "select count(*) from lua_guildmember;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return -1
	end
	return tonumber(tRS["0_0"])
end

--��ȡ������ID
function GuildClass.GetMaxGuildID()
	local tSql = "select GuildID from lua_guild order by GuildID desc limit 1;"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return 0
	end
	return tonumber(tRS["0_0"])
end

--ͨ���������Ʋ�ѯ����ID
function GuildClass.GuildNameToID(_GuildName)
	local tSql = "select GuildID from lua_guild where GuildName='" .. _GuildName .. "';"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return nil
	end
	return tonumber(tRS["0_0"])
end

--ͨ���������Ʋ�ѯ����ID
function GuildClass.GuildIDToName(_GuildID)
	_GuildID = tonumber(_GuildID) or 0
	if _GuildID==-9 then
		return "ȫ��"
	end
	local tSql = "select GuildName from lua_guild where GuildID=" .. _GuildID .. ";"
	local tRS = SQL.Run(tSql)
	if type(tRS)~="table" then
		 return nil
	end
	return tonumber(tRS["0_0"])
end

function GuildClass.GuildTalk(_GuildID, _Talk)
	local tCount = 0
	for Key, Value in pairs(GuildClass.OnlineMember[_GuildID]) do
		if Field.Get(Value.Index, "GuildMessageOff")~=1 then
			NLG.TalkToCli(Value.Index, 0, "[����] " .. Value.Name .. "��" .. _Talk)
			tCount = tCount + 1
		end
	end
	return tCount
end

function GuildClass.GuildMessage(_GuildID, _Message)
	local tCount = 0
	for Key, Value in pairs(GuildClass.OnlineMember[_GuildID]) do
		if Field.Get(Value.Index, "GuildMessageOff")~=1 then
			NLG.SystemMessage(Value.Index, "[����] " .. _Message)
			tCount = tCount + 1
		end
	end
	return tCount
end

function GuildClass.getTabKey(_PlayerIndex)
	local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
	local tDataPN = Char.GetData(_PlayerIndex, 48)
	local tRegistNumber = Char.GetData(_PlayerIndex, 49)
	return "T_" .. tCdKey .. "_" .. tRegistNumber .. "_" .. tDataPN
end

--��¼����Log
function GuildClass.Log(_GuildID, _OperatorIndex, _Operation, _TargetIndex, _Value)
	_Operation = _Operation or ""
	_Value = _Value or ""
	local oCdKey = Char.GetData(_OperatorIndex, %����_�˺�%)
	local oName = Char.GetData(_OperatorIndex, %����_����%)
	local oShow = oName .. "[" .. oCdKey .. "]"
	local tShow = ""
	if _TargetIndex~=nil and _TargetIndex~=0 and _TargetIndex~=-1 and _TargetIndex~=-2 then
		local tCdKey = Char.GetData(_TargetIndex, %����_�˺�%) or ""
		local tName = Char.GetData(_TargetIndex, %����_����%) or ""
		tShow = tName .. "[" .. tCdKey .. "]" or ""
	end
	if type(_OperatorIndex)~="number" or _OperatorIndex==0 then
		oShow = ""
	end
	if type(_TargetIndex)~="number" or _TargetIndex==0 then
		tShow = ""
	end
	if type(_Value)=="table" then
		_Value = table.concat(_Value, "|")
	end
	print("Log.oShow=" .. oShow .. " ,Log.tShow=" .. tShow)
	local tSql = "insert into "
	tSql = tSql .. "lua_guildlog (GuildID, Operator, Operation, Target, Value, LogTime) "
	tSql = tSql .. "values (" .. _GuildID .. ", '" .. oShow  .. "', '" .. _Operation .. "', '" .. tShow .. "', '" .. _Value .. "', " .. os.time() .. ");"
	SQL.Run(tSql)
end

function string.trim(s)
	local from = s:match"^%s*()"
	return from > table.getn(s) and "" or s:match(".*%S", from)
end

function string.trims(str)
	local trims = string.trims
	if str:sub(1,1)==" " then
		str = trims(str:sub(2, str:len()))
	end
	if str:sub(str:len(), str:len())==" " then
		str = trims(str:sub(1, str:len()-1))
	end
	if str:sub(1,2)=="��" then
		str = trims(str:sub(3, str:len()))
	end
	if str:sub(str:len()-1, str:len())=="��" then
		str = trims(str:sub(1, str:len()-2))
	end
	return str
end

function string.align(str, _Len, _Align)
--[[
����һ��������ַ���
�����������õĿռ䳤��
��������1������2�����У�3������
]]--
	if string.len(str)>_Len then
		str = string.sub(str,1,_Len)
	end
	if(_Align == 3) then
		str_tmp=string.format("%".._Len.."s", str);
	elseif(_Align == 1) then
		str_tmp=string.format("%-".._Len.."s", str);
	elseif(_Align == 2) then
		local tmp_splace=math.floor((_Len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-".._Len.."s", str_tmp);
	end
	return str_tmp;
end

function getJobTypeName(_TypeNo)
	local JobTypeName = {}
	JobTypeName[1]="����"
	JobTypeName[10]="��ʿ"
	JobTypeName[20]="ս��"
	JobTypeName[30]="��ʿ"
	JobTypeName[40]="����"
	JobTypeName[50]="ʿ��"
	JobTypeName[60]="����"
	JobTypeName[70]="ħ��"
	JobTypeName[80]="����"
	JobTypeName[90]="��ӡ"
	JobTypeName[100]="����"
	JobTypeName[110]="ѱ��"
	JobTypeName[120]="����"
	JobTypeName[130]="��ʦ"
	JobTypeName[140]="��"
	JobTypeName[150]="����"
	JobTypeName[160]="����"
	JobTypeName[170]="��ʿ"
	JobTypeName[180]="ħ��"
	JobTypeName[200]="�콣"
	JobTypeName[210]="�츫"
	JobTypeName[220]="��ǹ"
	JobTypeName[230]="�칭"
	JobTypeName[240]="����"
	JobTypeName[250]="���"
	JobTypeName[260]="�쵶"
	JobTypeName[270]="���"
	JobTypeName[280]="��ñ"
	JobTypeName[290]="����"
	JobTypeName[300]="���"
	JobTypeName[310]="����"
	JobTypeName[320]="��ѥ"
	JobTypeName[330]="��Ь"
	JobTypeName[340]="���"
	JobTypeName[350]="��ʦ"
	JobTypeName[360]="ҩ��"
	JobTypeName[370]="����"
	JobTypeName[380]="����"
	JobTypeName[390]="����"
	JobTypeName[400]="δ֪"
	JobTypeName[410]="��̽"
	JobTypeName[420]="����"
	JobTypeName[430]="��ʿ"
	JobTypeName[440]="ҽʦ"
	JobTypeName[450]="��ľ"
	JobTypeName[460]="����"
	JobTypeName[470]="��"
	JobTypeName[999]="GM"
	JobTypeName[170]="����"
	JobTypeName[500]="����"
	JobTypeName[510]="�ɼ�"
	if _TypeNo==0 then _TypeNo=1 end
	if _TypeNo==-1 then _TypeNo=1 end
	return JobTypeName[_TypeNo]
end

function string.align(str, _Len, _Align)
--[[
����һ��������ַ���
�����������õĿռ䳤��
��������1������2�����У�3������
]]--
	if string.len(str)>_Len then
		str = string.sub(str,1,_Len)
	end
	if(_Align == 3) then
		str_tmp=string.format("%".._Len.."s", str);
	elseif(_Align == 1) then
		str_tmp=string.format("%-".._Len.."s", str);
	elseif(_Align == 2) then
		local tmp_splace=math.floor((_Len-string.len(str))/2)+string.len(str);
		str_tmp=string.format("%"..tmp_splace.."s", str);
		str_tmp=string.format("%-".._Len.."s", str_tmp);
	end
	return str_tmp;
end

function string.split(strTxt, strDelim, maxNb)   
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

function Char.ItemNumAdv(_PlayerIndex, _ItemID)
	local ItemNums = 0
	for Slot=8,27 do
		local tItemIndex = Char.GetItemIndex(_PlayerIndex, Slot)
		if tItemIndex>0 then
			local tItemID = Item.GetData(tItemIndex, 0)
			if tItemID==_ItemID then
				local tItemNum = Item.GetData(tItemIndex, 9)
				if tItemNum>1 then
					ItemNums = ItemNums + tItemNum
				else
					ItemNums = ItemNums + 1
				end
			end
		end
	end
	return ItemNums
end