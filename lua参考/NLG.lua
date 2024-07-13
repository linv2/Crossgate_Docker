---@meta _

---��ͨ˵�������Զ�ȫ��������˵��
---@param ToIndex  number ˵��Ŀ��� ����index�����Ϊ-1�����ȫ���������˵
---@param TalkerIndex  number ˵���ߵ� ����index�����Ϊ-1������ʾ������
---@param Msg  string ˵��������
---@param FontColor?  number Ĭ��Ϊ0������ɫ [��Ϊ��]
---@param FontSize?  number Ĭ��Ϊ0��Ϊ��ʾ�������С [��Ϊ��]
---@return number @����0��ʾ�ɹ���������ʾʧ��
function NLG.Say(ToIndex,TalkerIndex,Msg,FontColor,FontSize) end

---��ͨ˵�������Զ�ȫ��������˵��
---@param ToIndex  number ˵��Ŀ��� ����index�����Ϊ-1�����ȫ���������˵
---@param TalkerIndex  number ˵���ߵ� ����index�����Ϊ-1������ʾ������
---@param Msg  string ˵��������
---@param FontColor?  number Ĭ��Ϊ0������ɫ [��Ϊ��]
---@param FontSize?  number Ĭ��Ϊ0��Ϊ��ʾ�������С [��Ϊ��]
---@return number @����0��ʾ�ɹ���������ʾʧ��
function NLG.TalkToCli(ToIndex,TalkerIndex,Msg,FontColor,FontSize) end

---��ָ����ͼ���������˵����
---@param Map  number ˵��Ŀ��ĵ�ͼ���ͣ�0Ϊ�̶���ͼ��1Ϊ�����ͼ
---@param Floor  number ˵��Ŀ��ĵ�ͼ���
---@param TalkerIndex  number ˵���ߵ� ����index�����Ϊ-1������ʾ������
---@param Msg  string ˵��������
---@param FontColor?  number Ĭ��Ϊ0������ɫ [��Ϊ��]
---@param FontSize?  number Ĭ��Ϊ0��Ϊ��ʾ�������С [��Ϊ��]
---@return number @����0��ʾ�ɹ���������ʾʧ��
function NLG.TalkToMap(Map,Floor,TalkerIndex,Msg,FontColor,FontSize) end

---��ָ����ͼ���������˵����
---@param Map  number ˵��Ŀ��ĵ�ͼ���ͣ�0Ϊ�̶���ͼ��1Ϊ�����ͼ
---@param Floor  number ˵��Ŀ��ĵ�ͼ���
---@param TalkerIndex  number ˵���ߵ� ����index�����Ϊ-1������ʾ������
---@param Msg  string ˵��������
---@param FontColor?  number Ĭ��Ϊ0������ɫ [��Ϊ��]
---@param FontSize?  number Ĭ��Ϊ0��Ϊ��ʾ�������С [��Ϊ��]
---@return number @����0��ʾ�ɹ���������ʾʧ��
function NLG.Say2Map(Map,Floor,TalkerIndex,Msg,FontColor,FontSize) end

---��ָ����ͼ���������˵����
---@param Map  number ˵��Ŀ��ĵ�ͼ���ͣ�0Ϊ�̶���ͼ��1Ϊ�����ͼ
---@param Floor  number ˵��Ŀ��ĵ�ͼ���
---@param TalkerIndex  number ˵���ߵ� ����index�����Ϊ-1������ʾ������
---@param Msg  string ˵��������
---@param FontColor?  number Ĭ��Ϊ0������ɫ [��Ϊ��]
---@param FontSize?  number Ĭ��Ϊ0��Ϊ��ʾ�������С [��Ϊ��]
---@return number @����0��ʾ�ɹ���������ʾʧ��
function NLG.TalkToFloor(Map,Floor,TalkerIndex,Msg,FontColor,FontSize) end

---��� ����ĸı䲢���������й�������ҷ��͸ö�������ݸ��·����
---@param CharIndex  number Ŀ�����index��
function NLG.UpChar(CharIndex) end

---���ɲ����ͶԻ���
---[@group NLG.ShowWindowTalked]
---@param ToIndex  number ���նԻ����Ŀ��Ķ���index��
---@param WinTalkIndex  number ���ɶԻ����Ŀ��Ķ���index��һ��ΪNPC��
---@param WindowType  number ���ĸ�¼�Ի�������
---@param ButtonType  number �Ի�������İ�ť�����ĸ�¼�Ի���ť
---@param SeqNo  number �Զ�����ֵ������ʶ��ͬ�ĶԻ����¼���Ӧ, �������WindowTalkedCallBack�е���
---@param Data  string �Ի��������,���ݲ�ͬ�ĶԻ������,�в�ͬ�ĸ�ʽ,������ڸ�¼��˵��
---@return number @0��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.ShowWindowTalked(ToIndex,WinTalkIndex,WindowType,ButtonType,SeqNo,Data) end

---ShowWindowTalked�Ļص�����
---@param CharIndex  number ��Ӧ�¼��Ķ��������index��һ��ΪNPC�����ָ�룬��ֵ��Lua���洫�ݸ���������
---@param TargetCharIndex  number �����¼��Ķ����index��һ��Ϊ��Ҷ����ָ�룬��ֵ��Lua���洫�ݸ���������
---@param SeqNo  number ��Դ�Ի����ID����ֵ��NLG.ShowWindowTalked�еĶ���Ӧ�ö�Ӧ����ֵ��Lua���洫�ݸ���������
---@param Select  number ��������µİ�ť��ֵ��ѡ����е�ѡ���ֵ����ֵ��Lua���洫�ݸ���������
---@param Data  string �ͻ��������ݻ�����ֵ�����ֵ�����ݲ�ͬ�Ĵ������Ͷ���ͬ����ֵ��Lua���洫�ݸ���������
---[@group NLG.ShowWindowTalked]
function WindowTalkedCallBack(CharIndex, TargetCharIndex, SeqNo, Select, Data) end

---���ö���Ķ���
---@param CharIndex  number Ŀ�����index��
---@param Action  number ������ţ�����Ȥ�Ŀ��Դ�0��ʼһ��һ�����ԡ�
---@return number @0��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.SetAction(CharIndex, Action) end

---�ö�����ָ�������ƶ�һ��
---@param CharIndex  number Ŀ�����index��
---@param Dir  number ��Χ0-7���ֱ��ʾ��Ϸ�ж�Ӧ�İ˸�����
---@return number @0��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.WalkMove(CharIndex, Dir) end

---�������Ƿ���ָ������֮�ڣ�������Ŀ�����
---@param CharIndex  number �������index��
---@param TargetCharIndex  number Ŀ�����index��
---@param Distance  number ����
---@return number @0: ���ھ����� 1: �ھ�����
function NLG.CheckInFront(CharIndex, TargetCharIndex, Distance) end

---�������Ƿ���������ڶԻ���Χ�ڣ�����
---@param CharIndex  number �������index��
---@param TargetCharIndex  number Ŀ�����index��
---@return number @0: ���ھ����� 1: �ھ�����
function NLG.CanTalk(CharIndex, TargetCharIndex) end

---�������Ƿ���������ڶԻ���Χ�ڣ�����
---@param CharIndex  number �������index��
---@param TargetCharIndex  number Ŀ�����index��
---@return number @0: ���ھ����� 1: �ھ�����
function NLG.CheckTalkRange(CharIndex, TargetCharIndex) end

---��ȡ�����������
---@return number @���������������ʧ�ܷ���-1��
function NLG.GetPlayerNum() end

---��ȡ�����������
---@return number @���������������ʧ�ܷ���-1��
function NLG.GetOnLinePlayer() end

---��ȡ��ͼ����ҵ�����
---@param Map  number ��ͼ���ͣ�0Ϊ������ͼ��1Ϊ�Զ����ɵĵ�ͼ��
---@param Floor  number ��ͼ��š�
---@return number @���������������ʧ�ܷ���-1��
function NLG.GetMapPlayerNum(Map, Floor) end

---��ָ�������ͻ�ɫ�ӴֵĹ�����Ϣ��
---@param CharIndex  number ���չ���Ķ���index��ֵΪ-1ʱ��ȫ��������ҷ��͡�
---@param Message  string Ҫ���͵�����
---@return number @�ɹ�����1�����򷵻�0��
function NLG.SystemMessage(CharIndex, Message) end

---��ָ�������ͻ�ɫ�ӴֵĹ�����Ϣ��
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@param Message  string Ҫ���͵�����
---@return number @�ɹ�����1�����򷵻�0��
function NLG.SystemMessageToMap(MapID, FloorID, Message) end

---����ͼ��x��y�����Ƿ��ͨ�С�
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@param X  number X����
---@param Y  number Y����
---@return number @����1�����ͨ�У�����0����ͨ�С�
function NLG.Walkable(MapID, FloorID, X, Y) end

---��ȡĿ���ͼ���е���ң�����table��ʽ���ء�
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@return number[]|nil @�Է���ֵʹ��Lua����type()�������жϣ��������ֵΪ��table����Ϊ��ҵĶ���index�ļ��ϣ������ʾĿ���ͼ����һ�����Ŀ���ͼ��
function NLG.GetMapPlayer(MapID, FloorID) end

---��Ŀ����ҶϿ����ӡ�
---@param CharIndex  number Ŀ�����index��
---@return number @����1����ɹ�������0ʧ�ܡ�
function NLG.DropPlayer(CharIndex) end

---��ָ����ͼ��ָ����������һ����ͼ�����
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@param X  number X����
---@param Y  number Y����
---@param Obj  number Ҫ��ʾ�ĵ�ͼ��������Ϊ0����ɾ��Ŀ������ĵ�ͼ�����
---@return number @����1����ɹ�������0ʧ�ܡ�
function NLG.SetObj(MapID, FloorID, X, Y, Obj) end

---�ı����Ŀǰ�ĵ�ͼ��ɫ�塣
---@param CharIndex  number Ŀ�����index��
---@param PalID  number ��ͼ��ɫ���š�
---@param Time  number ����ʱ�䣬��λ�롣
---@return number @����1����ɹ�������0ʧ�ܡ�
function NLG.SetPal(CharIndex, PalID, Time) end

---�ı����Ŀǰ�ĵ�ͼ��ɫ�塣
---@param CharIndex  number Ŀ�����index��
---@param PalID  number ��ͼ��ɫ���š�
---@param Time  number ����ʱ�䣬��λ�롣
---@return number @����1����ɹ�������0ʧ�ܡ�
function NLG.ChangePal(CharIndex, PalID, Time) end

---Ȼ���CharIndex�ۿ�TargetCharIndex�ĵ�ǰս���������ս����
---@param CharIndex  number �������index��
---@param TargetCharIndex  number Ŀ�����index��
---@return any @1��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.WatchBattle(CharIndex, TargetCharIndex) end

---Ȼ���CharIndex�ۿ�TargetCharIndex�ĵ�ǰս���������ս����
---@param CharIndex  number �������index��
---@param TargetCharIndex  number Ŀ�����index��
---@return number @1��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.WatchEntry(CharIndex,TargetCharIndex) end

---����NPC�Ի������־��С�
---@param Message  string Ҫ�������õ��ı�
---@return string @���к���ı���
function NLG.c(Message) end

---����ָ����ͼ�����֡�
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@param Name  string ��ͼ����
---@return number @�ɹ�����1�����򷵻�0��
function NLG.SetMapName(MapID, FloorID, Name) end

---��ȡָ����ͼ�����֡�
---@param MapID  number Ŀ���ͼ�����ͣ�0Ϊ�̶���ͼ1Ϊ�����ͼ��
---@param FloorID  number ��ͼ���
---@return string @����ֵΪ0���ȡʧ�ܣ�����ֵΪ[�ַ���]��Ϊ��ͼ���ơ�
function NLG.GetMapName(MapID, FloorID) end

---ͨ������ʺ�����Ҷ���index��
---@param CdKey  string ָ�����ʺ�/Cdkey��
---@return number @����-1����ʧ�ܣ�����Ϊָ���˺�Ŀǰ������ҵĶ���index��
function NLG.FindUser(CdKey) end

---������ҵ��Ŷ���Ϣ��
---@param CharIndex  number Ŀ�����index��
---@return any @
function NLG.UpdateParty(CharIndex) end

---ͨ��Gmsv������������ȡ����������ÿ������ӵ����⣬�ܾ�����ȷ�������������ԡ�
---@param min  number ��������ޡ�
---@param max  number ��������ޡ�
---@return number @��������������������
function NLG.Rand(min, max) end

---��ָ���������NPC�����ͷ������ͼ����ֻҪ����Ϸ�ͻ���ӵ�е�ͼ�����ɵ��á�
---@param CharIndex  number ���չ���Ķ���index��ֵΪ-1ʱ��ȫ��������ҷ��͡�
---@param HeadGraNo  number ͷ�ε�ͼ��ID���ͻ��˵�����ͼ��ID��
---@return number @1��ʾ�ɹ���������ʾʧ�ܡ�
function NLG.SetHeadIcon(CharIndex, HeadGraNo) end

---��ȡ��ҵ�IP��ַ��
---@param CharIndex  number Ŀ�����index��
---@return string @�����IP��ַ��������Ҷ�����Ч
function NLG.GetIp(CharIndex) end

---��ȡ��ҵ�MAC��ַ��
---@param CharIndex  number Ŀ�����index��
---@return string @�����MAC��ַ��������Ҷ�����Ч
function NLG.GetMAC(CharIndex) end

---��ȡ��Ϸ�еĵ�ǰʱ�䣬�����磬�ƻ裬ҹ���峿��
---@return number @0 ������ | 1 ���ƻ� | 2 ��ҹ�� | 3 ���峿
function NLG.GetGameTime() end

---������ұ�����
---@param CharIndex  number Ŀ�����index��
---@return number @0Ϊʧ�ܣ�1Ϊ�ɹ���
function NLG.SortItem(CharIndex) end

---���������˺�
---@param a number ����������
---@param b number ����������
---@param rate number �˺�����
---@return number @number �˺�����
function NLG.SetTribeRate(a, b, rate) end

---��ȡ������ң�����table��ʽ���ء�
---@return number @table ���index
function NLG.GetPlayer() end

---����cpuʹ��
---@param ms number С��0ʱ�رգ����ڻ����0ʱΪSleepʱ�䣬���������2
function NLG.LowCpuUsage(ms) end

---������
---@param npcOrPlayer number npc�������index
---@param player number ���index
---@return number @�ɹ�����0
function NLG.OpenBank(npcOrPlayer, player) end

---ģ�����
function NLG.RaiseCrash() end

---��������(ȫ�ֿ���)
---@param enable boolean|number ���� 1��true ������ 0��false
function NLG.SetPetRandomShot(enable) end

---��������(ĳ�ֳ��￪��)
---@param enable boolean|number ���� 1��true ������ 0��false
---@param petId number ����id��EnemyBaseId��
function NLG.SetPetRandomShot(petId, enable) end

---������������
---@param rate number 0-100
---@param mode  nil|0|1|2 0 @0=PVE&PVP 1=PVE 2=PVP
---@return number @�ɹ�����1
function NLG.SetDexRearrangeRate(rate, mode) end

---�޸ı���ʱ�˺�����
---@param mode number|boolean ȡֵ�� 0 = ��ͨģʽ 1 = ����ģʽ 2 = �� 3 = �Ʒ�ģʽ true = ��ͨģʽ false = ��
---@param val number ���ʣ�Ĭ��1.5������modeΪ3ʱ���ñ���Ϊ�Ʒ��ʣ���0.7��ʾ����ʱ������70%����
function NLG.SetCriticalDamageAddition(mode, val) end

---ɾ����ɫ���첽����
---@param cdkey number CdKey
---@param dataPlaceNum number ��ɫλ�� 0 �� 1 ��
---@return number @����0Ϊ�ɹ�������ʧ��
function NLG.DeleteCharacter(cdkey, dataPlaceNum) end

---ɾ����ɫ���첽����
---[@group NLG.DeleteCharacter]
---@param cdkey number CdKey
---@param dataPlaceNum number ��ɫλ�� 0 �� 1 ��
---@param callback string �ص��������ο�[DeleteCharacterCallback]
---@return number @����0Ϊ�ɹ�������ʧ��
function NLG.DeleteCharacter(cdkey, dataPlaceNum, callback) end

---ɾ����ɫ�ص�����
---[@group NLG.DeleteCharacter]
---@param cdkey number CdKey
---@param dataPlaceNum number ��ɫλ�� 0 �� 1 ��
---@param registerNumber number registerNumber
---@param result number ����1����ɹ���0����ʧ��
function DeleteCharacterCallback(cdkey, dataPlaceNum, registerNumber, result) end

---��ȡNPC����
---@param charIndex number npc�Ķ���������һ��ΪNL.CreateArgNpc�ķ���ֵ
---@return string @����NPC����
function NLG.GetArgNpc(charIndex) end

---��ȡ�Թ���ʣ��ʱ��
---@param dungeonId number �Թ�id
---@return number @ʣ��ʱ��
function NLG.GetDungeonLimit(dungeonId) end

---������ɫ�棬���Լ���npc
---@param charIndex number Ŀ��� ����index
---@param dir number ����0~7
function NLG.CharLook(charIndex, dir) end