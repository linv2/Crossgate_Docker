------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���幤��ģ��-����
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