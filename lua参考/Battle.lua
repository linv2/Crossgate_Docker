---@meta _

---��ȡս�������ж���ʵ���Ķ���index
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Slot  number ս�����������λ��,��Χ0-19������0-9Ϊ�·�ʵ�����У�10-19Ϊ�Ϸ�ʵ�����С�
---@return number @����-1ʧ�ܣ��ɹ����ض���ʵ���Ķ���index�������������Ͳ��Է���-2��ս��index��Ч����-3��ս�����������λ�÷�Χ���󷵻�-4��
function Battle.GetPlayer(BattleIndex, Slot) end

---��ȡս�������ж���ʵ���Ķ���index
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Slot  number ս�����������λ��,��Χ0-19������0-9Ϊ�·�ʵ�����У�10-19Ϊ�Ϸ�ʵ�����С�
---@return number @����-1ʧ�ܣ��ɹ����ض���ʵ���Ķ���index�������������Ͳ��Է���-2��ս��index��Ч����-3��ս�����������λ�÷�Χ���󷵻�-4��
function Battle.GetPlayIndex(BattleIndex, Slot) end

---����ħ���ű����encount����ս��
---@param UpIndex  number ս��һ���� ����index
---@param DownIndex  number ս��һ���� ����index
---@param Data?  string ����ս������Ϣ������ս�����˶��е���Ϣ����ͬ��GMSV����ű���encount����,�ɲ���д
---@return number @ǰ������������ͬһ��������������������������ʱ�򣬽���ԭ�����У�����ô��޷����У��򷵻ظ�����
function Battle.Encount(UpIndex, DownIndex, Data) end

---ʹ��Lua�ű�����һ��ս����ս����������Զ�����Lua��DoFunc������
---[@group Battle.PVE]
---@param CharIndex  number ������ҵĶ���index��
---@param CreatePtr  number ����ս���Ķ���index��
---@param DoFunc  string|nil ս����ʼ�����ܺ���õ�Lua���������ƣ�������ʽ��ο�[BattleInitCallBack]���������������nil
---@param EnemyIdAr  number[] ս�������ֵĹ�����еĹ���ID���飨����IDΪenemy.txt�е�ID����
---@param BaseLevelAr  number[] ս�������ֵĹ�����еĹ���ȼ����飨����ṹ��EnemyIdAr�ṹӦһһ��Ӧ��
---@param RandLv? number[] ս�������ֵĹ�����еĹ���ȼ��������飨����ṹ��EnemyIdAr�ṹӦһһ��Ӧ��
---@return number @���ظ�����ʾʧ�ܣ��ɹ�����ս��index��
function Battle.PVE(CharIndex, CreatePtr, DoFunc, EnemyIdAr, BaseLevelAr, RandLv) end

---ս����ʼ���ص�
---[@group Battle.PVE]
---@param BattleIndex number
function BattleInitCallBack(BattleIndex) end

---����PKս��
---@param UpIndex  number ս��һ���� ����index
---@param DownIndex  number ս��һ���� ����index
---@return number @���ظ�����ʾʧ�ܣ��ɹ�����ս��index��
function Battle.PVP(UpIndex, DownIndex) end

---����ս�����ͣ�����ͨս��PVPս�ȡ�
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Type  number ս�����ͣ��������ս�����ͳ�����
---@return number @1Ϊ�ɹ�,����ʧ�ܡ�
function Battle.SetType(BattleIndex, Type) end

---����ս������ģʽ���罱�����顢����DP��
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Mod  number ս���������ͣ��������ս�����ͳ�����
---@return number @1Ϊ�ɹ�,����ʧ�ܡ�
function Battle.SetGainMode(BattleIndex, Mod) end

---��ȡս�����ͣ�����ͨս��PVPս�ȡ�
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@return number @ս�����ͣ��������ս�����ͳ�����
function Battle.GetType(BattleIndex) end

---��ȡս������ģʽ���罱�����顢����DP��
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@return number @ս���������ͣ��������ս�����ͳ�����
function Battle.GetGainMode(BattleIndex) end

---��ȡս��ʤ������
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@return number @0����1��0��ʾս���·�����0-9λ�õ���ң�1��ʾ�Ϸ�����10-19λ�õ���ҡ�
function Battle.GetWinSide(BattleIndex) end

---��ָ����Ҷ��������һ����Ҷ����ս���У�Ҳ������CharIndex2����CharIndex1��ս��������ʯ��ʱ��������������ʹ��ǰ�����
---@param CharIndex1  number Ŀ��Ķ���index����ս���е���ҡ�
---@param CharIndex2  number Ŀ��� ����index������ս���е���ҡ�
---@return number @0Ϊ�ɹ�������ʧ�ܡ�
function Battle.JoinBattle(CharIndex1, CharIndex2) end

---��ָ������˳���ǰս����
---@param CharIndex  number Ŀ��Ķ���index����ս���е���ҡ�
---@return number @0Ϊ�ɹ�������ʧ�ܡ�
function Battle.ExitBattle(CharIndex) end

---Ϊ��PVP��ս������ս��ʤ���¼��Ļص���������Lua���潫Callback�Ĳ������ݸ�ָ����Callback��ִ�С�
---[@group Battle.SetWinEvent]
---@param DoFile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param FuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[PVEWinCallBack]
---@param BattleIndex  number ս��index��
---@return number @����1�ɹ�������0ʧ�ܡ�
function Battle.SetWinEvent(DoFile, FuncName, BattleIndex) end

---WinEvent�ص�����
---[@group Battle.SetWinEvent]
---@param BattleIndex  number ս��index����ֵ��Lua���洫�ݸ���������
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
function PVEWinCallBack(BattleIndex, CharIndex) end

---ΪPVP��ս������ս��ʤ���¼��Ļص���������Lua���潫Callback�Ĳ������ݸ�ָ����Callback��ִ�С�
---[@group Battle.SetPVPWinEvent]
---@param DoFile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param FuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[PVPWinCallBack]
---@param BattleIndex  number ս��index��
---@return number @����1�ɹ�������0ʧ�ܡ�
function Battle.SetPVPWinEvent(DoFile, FuncName, BattleIndex) end

---PVPWinEvent�ص�����
---[@group Battle.SetPVPWinEvent]
---@param BattleIndex  number ս��index����ֵ��Lua���洫�ݸ���������
function PVPWinCallBack(BattleIndex) end

---��ȡս����ǰ�غ�����
---@param BattleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@return number @ս���غ�����
function Battle.GetTurn(BattleIndex) end

---�жϵ�ǰ�����Ƿ���ս�����Ҵ��ڵȴ�����ս��ָ���״̬��
---@param CharIndex  number ����index������Ϊ��ҡ�������ˡ�
---@return number @0Ϊ��1Ϊ��
function Battle.IsWaitingCommand(CharIndex) end

---�ö���ִ��ָ����ս�������������ڶ���Battle.IsWaitingCommand(index)����ֵΪ1ʱ�ſ�����Чʹ�á�
---@param CharIndex  number ��Ҷ���index
---@param com1  number CONST.BATTLE_COM
---@param com2  number CONST.BATTLE_COM_TARGET
---@param com3  number techId
---@return number @0ʧ�ܣ�1�ɹ�
function Battle.ActionSelect(CharIndex, com1, com2, com3) end

---��ȡ��ǰս����ս��ħ��Ч���������Է�ת��ħ����ӡ
---@param BattleIndex  number ս������index
---@return number @ʧ�ܷ���0�����򷵻�3��ֵ���ֱ���ս��ħ��״̬���ο�״̬����˵������״̬�����غϡ�״̬���ԡ�
function Battle.GetBattleFieldAttribute(BattleIndex) end

---���õ�ǰս����ս��ħ��Ч���������Է�ת��ħ����ӡ
---@param BattleIndex  number ս������index
---@param Attribute  number ս��״̬ CONST.BATTLE_FIELD_ATTR
---@param TurnCount  number ״̬�����غ���
---@param AttributePower  number ״̬����
---@return number @ʧ�ܷ���0�����򷵻�3��ֵ���ֱ����µ�ս��ħ��״̬���ο�״̬����˵������״̬�����غϡ�״̬���ԡ�
function Battle.SetBattleFieldAttribute(BattleIndex, Attribute, TurnCount, AttributePower) end

---������ս��
---@param battleIndex  number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param encountIndex number -1=ȡ����ս��  -2=lua������ս
---@param flg  number lua��ս����
---@return number @0Ϊ�ɹ�,����ʧ�ܡ�
function Battle.SetNextBattle(battleIndex,encountIndex, flg) end

---��ý�ɫս������ʵλ��
---@param battleIndex number ս��index
---@param charIndex number ��ɫindex
---@return number @��ɫս������ʵλ�ã���Χ0-19
function Battle.GetPos(battleIndex,charIndex) end

---��ý�ɫս������ʵλ��
---@param battleIndex number ս��index
---@param charIndex number ��ɫindex
---@return number @��ɫս������ʵλ�ã���Χ0-19
function Battle.GetEntryPosition(battleIndex,charIndex) end

---��ȡս��Index
---@param charIndex number ��ɫindex
---@return number @ս��index
function Battle.GetCurrentBattle(charIndex) end

---��ȡ��սid
---@param battleIndex number
---@return number @encountIndex
---@return number @flg,lua����
function Battle.GetNextBattle(battleIndex) end

---���������˺����ʣ�10����=100��
---@param ap number[] ������4���ԣ��ء�ˮ���𡢷�
---@param dp number[] ���ط�4���ԣ��ء�ˮ���𡢷�
---@return any @�����˺�����
function Battle.CalcPropScore(ap, dp) end

---��ȡ��ǰ�������ܲ���
---@param charIndex number
---@param type string ȡֵ DD:  AR:  ��
---@return number @��ǰ�������ܲ���
function Battle.GetTechOption(charIndex, type) end

---��ȡ������ƹ�ϵ
---@param attackerIndex number
---@param defenceIndex number
---@return number @���Ʊ���
function Battle.CalcAttributeDmgRate(attackerIndex, defenceIndex) end

---���������˺�
---@param a number ����������
---@param b number ����������
---@return number @�����˺�
function Battle.CalcTribeRate(a, b) end

---���㵱ǰս�������˺�
---@param aIndex number ������index
---@param bIndex number ������index
---@return number @��ǰս�������˺�
function Battle.CalcTribeDmgRate(aIndex, bIndex) end

---���WinEvent
---@param battleIndex  number ս������index
function Battle.UnsetWinEvent(battleIndex) end

---���PVPWinEvent
---@param battleIndex  number ս������index
function Battle.UnsetPVPWinEvent(battleIndex) end

---���õ�ǰ�غ���
---@param battleIndex number 
---@param turn number �غ���
---@return number @����1�ɹ�
function Battle.SetTurn(battleIndex, turn) end

---Ϊ��ǰ�����ս�������Ϣ(���ͷż��ܺ���)
---@param msg string
function Battle.AppendBattleMsg(msg) end

---��ȡս����Ϣ
---@param battleIndex  number ս������index
---@param charIndex number
---@param dataline  number ��Ӧ��CONST.BATTLE_ENTRY_* 
---@return number @ս����Ϣ
function Battle.GetEntryData(battleIndex,charIndex,dataline) end

---����ս����Ϣ
---@param battleIndex  number ս������index
---@param charIndex number
---@param dataline  number ��Ӧ��CONST.BATTLE_ENTRY_* 
---@param value  number ��Ӧ����Ϣ
function Battle.SetEntryData(battleIndex,charIndex,dataline,value) end

---�ж�ս���Ƿ���BOSSս
---@param BattleIndex  number ս��index
---@return number @0=��1=�ǣ�����ʧ��
function Battle.IsBossBattle(BattleIndex) end

---��ȡս��������
---@param BattleIndex  number ս��index
---@return number @�����Ƿ�����
---@return number @����
function Battle.GetDexRearrangeRate(BattleIndex) end

---����ս��������
---@param BattleIndex  number ս��index
---@param rate number 0~100 ��������
---@return number @�ɹ�����1
function Battle.SetDexRearrangeRate(BattleIndex,rate) end

---��ȡս����󷴻���
---@param BattleIndex  number ս��index
---@return number @�����Ƿ�����
---@return number @����
function Battle.GetMaxCounter(BattleIndex) end

---����ս����󷴻���
---@param BattleIndex  number ս��index
---@param rate number ��󷴻���
---@return number @�ɹ�����1
function Battle.SetMaxCounter (BattleIndex,rate) end

---����ܷ񹥻���Ӧλ��
---@param charIndex number CharIndex
---@param pos number λ�ã�0-19
---@return number @���Թ�������1����������0
function Battle.PositionCheck (charIndex, pos) end

---��ȡ�Զ�������
---@param battleIndex number Ŀ��� ����index��
---@param dataIndex string ��Ϣ�����λ�ã��Զ���
---@return string|number|nil @���ָ��λ�õ��ַ���
function Battle.GetExtData(battleIndex, dataIndex) end

---�����Զ�������
---@param battleIndex number Ŀ��� ����index��
---@param dataIndex string ��Ϣ�����λ�ã��Զ���
---@param val string|number|nil @���ָ��λ�õ��ַ���
function Battle.SetExtData(battleIndex, dataIndex, val) end

---���õ�ǰ�����ս��״̬
---@param CharIndex number Ŀ��� ����index��
---@param Status number ״̬���� ���ս������
---@param Val number �趨ָ��λ�õ�����
---@return number @ʧ�ܷ���-1�����򷵻ض�Ӧ��ֵ
function Battle.SetBattleCharacterStatus(CharIndex, Status, Val) end

---��ȡ��ǰ�����ս��״̬
---@param CharIndex number Ŀ��� ����index��
---@param Status number ״̬���� ���ս������
---@return number @ʧ�ܷ���-1�����򷵻ض�Ӧ��ֵ
function Battle.GetBattleCharacterStatus(CharIndex, Status) end