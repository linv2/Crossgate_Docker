---@meta _

--[[
---@since HOOK:v0.2.30
---@return string
function getHookVer() end

---����Moduleģ��
function loadModule(string) end 

---������ͨLUA
function useModule(string) end 

---��ȡģ��
---@param name string ģ��ID
---@return ModuleBase 
function getModule(name) end

---����ģ��
---@param name string ģ��ID
function reloadModule(name) end

---ж��ģ��
---@param name string ģ��ID
function unloadModule(name) end

--- ע��ȫ���¼�
---@param eventName string
---@param fn function|OrderedCallback
---@param moduleName string
---@param extraSign string
---@return number ȫ��ע��Index
function regGlobalEvent(eventName, fn, moduleName, extraSign) end

--- ע��ȫ���¼�
---@param eventName string
---@param fn function|OrderedCallback
---@return number ȫ��ע��Index
function regGlobalEvent(eventName, fn) end

--- �Ƴ�ȫ���¼�
---@param eventName string
---@param fnIndex number ȫ��ע��Index
---@param moduleName string|nil
---@param extraSign string|nil
function removeGlobalEvent(eventName, fnIndex, moduleName, extraSign) end

--- �Ƴ�ȫ���¼�
---@param eventName string
---@param fnIndex number ȫ��ע��Index
function removeGlobalEvent(eventName, fnIndex) end

Char = Char or {}

---��ȡװ�������� ItemIndex��λ��
---@param charIndex number
---@return number װ��λ�� ,number װ������, number itemIndex
function Char.GetWeapon(charIndex) end

---@param charIndex number
function Char.UnsetWalkPostEvent(charIndex) end

---@param charIndex number
function Char.UnsetWalkPreEvent(charIndex) end

---@param charIndex number
function Char.UnsetPostOverEvent(charIndex) end

---@param charIndex number
function Char.UnsetLoopEvent(charIndex) end

---@param charIndex number
function Char.UnsetTalkedEvent(charIndex) end

---@param charIndex number
function Char.UnsetWindowTalkedEvent(charIndex) end

---@param charIndex number
function Char.UnsetItemPutEvent(charIndex) end

---@param charIndex number
function Char.UnsetWatchEvent(charIndex) end

---@param ptr number
---@return boolean
function Char.IsValidCharPtr(ptr) end

---@param charIndex number
---@return boolean
function Char.IsValidCharIndex(charIndex) end

---ͨ��ptr��ȡ����
---@param charPtr number
---@param dataLine number
---@return string|number|nil
function Char.GetDataByPtr(charPtr, dataLine) end

---ͨ��ptr��ȡ����
---@param charPtr number
---@param dataLine number
---@param value string|number
function Char.SetDataByPtr(charPtr, dataLine, value) end

---����λ��ɾ����Ʒ
---@param CharIndex number
---@param Slot number
function Char.DelItemBySlot(CharIndex, Slot) end

---�ƶ���ɫ��NPC
---@param charIndex number
---@param walkArray number[] �ƶ��б�ȡֵ0-7��Ӧ CONST����ķ��򣬲����鳬��5���ƶ�
function Char.MoveArray(charIndex, walkArray) end

---@param charIndex number
---@param dataIndex number
---@return string | number
function Char.GetData(charIndex, dataIndex) end

---@param charIndex number
---@param dataIndex number
---@param value string|number
---@return number
function Char.SetData(charIndex, dataIndex, value) end

---�����Զ������ݣ����浽���ݿ⣩
---@param charIndex number
---@param dataIndex string
---@return string | number
function Char.GetExtData(charIndex, dataIndex) end

---��ȡ�Զ������ݣ����浽���ݿ⣩
---@param charIndex number
---@param dataIndex string
---@param value string|number
---@return number
function Char.SetExtData(charIndex, dataIndex, value) end

---������ʱ���ݣ������浽���ݿ⣩
---@param charIndex number
---@param dataIndex string
---@return string | number
function Char.GetTempData(charIndex, dataIndex) end

---��ȡ��ʱ���ݣ������浽���ݿ⣩
---@param charIndex number
---@param dataIndex string
---@param value string|number
---@return number
function Char.SetTempData(charIndex, dataIndex, value) end

---��ȡһ��ΨһID
---@param charIndex number
---@return string
function Char.GetUUID(charIndex) end

---��valueΪ0ʱ�������
---@param charIndex number
---@param flag number
---@param value number '0' | '1'
---@return nil
function Char.NowEvent(charIndex, flag, value) end

---��ȡ��ǰ����
---@param charIndex number
---@param flag number
---@return number
function Char.NowEvent(charIndex, flag) end

---��valueΪ0ʱ�������
---@param charIndex number
---@param flag number
---@param value number '0' | '1'
---@return nil
function Char.EndEvent(charIndex, flag, value) end

---��ȡ��ǰ����
---@param charIndex number
---@param flag number
---@return number
function Char.EndEvent(charIndex, flag) end

---@param charIndex number
---@param itemID number
---@return number ������򷵻ص�һ������ĵ�����λ�ã����û���򷵻�-1��
function Char.FindItemId(charIndex, itemID) end

---@param charIndex number
---@param amount number
function Char.AddGold(charIndex, amount) end

---@param charIndex number
---@param slot number
---@return number ���Ŀ����λ�е��ߣ��򷵻ص���index�����򷵻� -1: ����ָ����� -2: �������޵��� -3: ������Χ��
function Char.GetItemIndex(charIndex, slot) end

---@param CharIndex number
---@param ItemID number
---@param Amount number
---@param ShowMsg boolean
---@return number �ɹ�����1��ʧ���򷵻�0��
function Char.DelItem(CharIndex, ItemID, Amount, ShowMsg) end

---@param CharIndex number
---@param ItemID number
---@param Amount number
---@param ShowMsg boolean
---@return number Ŀ�����index��ʧ���򷵻ظ�����
function Char.GiveItem(CharIndex, ItemID, Amount, ShowMsg) end

---@param CharIndex number
---@param ItemID number
---@return number ���Ŀ���иõ��ߣ��򷵻ظõ���index�����򷵻�-1��
function Char.HaveItem(CharIndex, ItemID) end

---@param CharIndex number
---@param Slot number
---@return number ���Ŀ���У��򷵻�index�����򷵻�-1��
function Char.GetPet(CharIndex, Slot) end

function Char.GivePet(CharIndex, PetID, FullBP) end

---@return number ������ʹ������
function Char.ItemSlot(charIndex) end

function Char.AddPet(CharIndex, PetID) end

---@return number ����е��������������ӷ���-1�����򷵻������������ȡʧ�ܷ���0�������������Ͳ��Է���-2������index��Ч����-3��
function Char.PartyNum(CharIndex) end

---@param Slot number ȡֵ0-4
---@return number ����ָ��λ�õ���ҵĶ���index�����û������򷵻�-1����ȡʧ�ܷ���0�������������Ͳ��Է���-2������index��Ч����-3������Ŷ��е�λ�ó�����Χ(0-4)����-4��
function Char.GetPartyMember(CharIndex, Slot) end

---@return number ����1����ɹ�������0ʧ�ܣ������������Ͳ��Է���-2������index��Ч����-3��
function Char.DischargeParty(CharIndex) end

---@return number �ɹ����ص�ǰս��index������-1����û��ս���������������Ͳ��Է���-2������index��Ч����-3��
function Char.GetBattleIndex(CharIndex) end

---������ӣ�������ӿ��ؼ�����
---@param sourceIndex number ��Աindex
---@param targetIndex number �ӳ�index
function Char.JoinParty(sourceIndex, targetIndex) end

---�뿪����
---@param charIndex number
function Char.LeaveParty(charIndex) end

---@return number �ɹ�������Ҷ��󼤻�ĳƺ�ID������-1����ʧ�ܣ������������Ͳ��Է���-2������index��Ч����-3��
function Char.GetTitle(CharIndex) end

function Char.Warp(CharIndex, MapType, FloorID, X, Y) end

function Char.HaveSkill(CharIndex, SkillID) end

function Char.GetSkillID(CharIndex, Slot) end

function Char.GetSkillLv(CharIndex, Slot) end

function Char.SetWalkPostEvent(Dofile, FuncName, CharIndex) end

function Char.SetWalkPreEvent(Dofile, FuncName, CharIndex) end

function Char.SetPostOverEvent(Dofile, FuncName, CharIndex) end

function Char.SetItemPutEvent(Dofile, FuncName, CharIndex) end

function Char.SetWatchEvent(Dofile, FuncName, CharIndex) end

function Char.SetLoopEvent(Dofile, FuncName, CharIndex, Interval) end

function Char.DelPet(CharIndex, PetID, Level, LevelSetting) end

function Char.DelSlotPet(CharIndex, Slot) end

---�ƶ���Ʒ
---@param charIndex number
---@param fromSlot number �ƶ��Ǹ���Ʒ��ȡֵ0-27
---@param toSlot number �ƶ����Ǹ�λ��, ȡֵ0-27
---@param amount number �����������ƶ�ȡֵ��Ϊ-1
function Char.MoveItem(charIndex, fromSlot, toSlot, amount) end

---����Ƿ����
---@param charIndex integer
---@return boolean
function Char.IsDummy(charIndex) end

---���Ϊ����
---@param charIndex integer
function Char.SetDummy(charIndex) end

---ɾ������
---@param charIndex integer
function Char.DelDummy(charIndex) end

---���㼼�������ħ��
---@param charIndex integer
---@param techId integer
function Char.CalcConsumeFp(charIndex, techId) end

---���ó���ս��״̬
---@param charIndex integer
---@param slot integer
---@param state integer CONST.PET_STATE_*
function Char.SetPetDepartureState(charIndex, slot, state) end

---���ó���ս��״̬(����)
---@param charIndex integer
---@param pet1State integer CONST.PET_STATE_*
---@param pet2State integer CONST.PET_STATE_*
---@param pet3State integer CONST.PET_STATE_*
---@param pet4State integer CONST.PET_STATE_*
---@param pet5State integer CONST.PET_STATE_*
function Char.SetPetDepartureStateAll(charIndex, pet1State, pet2State, pet3State, pet4State, pet5State) end

---ֱ�ӽ�����Ʒ
---@param fromChar integer ��˭���Ͻ��� CharIndex
---@param toChar integer ���׸�˭ CharIndex
---@param slot integer ������λ�ã�8-27
function Char.TradeItem(fromChar, slot, toChar) end

---ֱ�ӽ��׳���
---@param fromChar integer ��˭���Ͻ��� CharIndex
---@param toChar integer ���׸�˭ CharIndex
---@param slot integer ������λ�ã�8-27
function Char.TradePet(fromChar, slot, toChar) end

---��ȡ�յ�ItemSlot
---@param charIndex integer
---@return integer
function Char.GetEmptyItemSlot(charIndex) end

---��ȡ�յ�PetSlot
---@param charIndex integer
---@return integer
function Char.GetEmptyPetSlot(charIndex) end

NLG = NLG or {}
function NLG.ShowWindowTalked(ToIndex, WinTalkIndex, WindowType, ButtonType, SeqNo, Data) end

function NLG.SystemMessage(CharIndex, Message) end

function NLG.TalkToCli(ToIndex, TalkerIndex, Msg, FontColor, FontSize) end

function NLG.CanTalk(npc, player) end

function NLG.UpChar(CharIndex) end

function NLG.c(str) end

function NLG.TalkToMap(Map, Floor, TalkerIndex, Msg, FontColor, FontSize) end

---����cpuʹ��
---@param ms number ��0ʱ�رգ����ڻ����0ʱΪSleepʱ�䣬���������2
function NLG.LowCpuUsage(ms) end

---@overload fun(cdkey: string):number
---@param cdkey string
---@param regId number
---@return number charIndex
function NLG.FindUser(cdkey, regId) end

---@param min number
---@param max number
---@return number
function NLG.Rand(min, max) end

---@param npcOrPlayer number npc�������index
---@param player number ���index
function NLG.OpenBank(npcOrPlayer, player) end

---��������(ȫ�ֿ���)
---@param enable boolean ����:1 ������:0
function NLG.SetPetRandomShot(enable) end

---��������(ĳ�ֳ��￪��)
---@param enable boolean ����:1 ������:0
---@param petId number ����id��EnemyBaseId��
function NLG.SetPetRandomShot(petId, enable) end

---�޸ı���ʱ�˺�����
-----@param mode number|boolean ȡֵ�� 0 = ��ͨģʽ 1 = ����ģʽ 2 = �� true = ��ͨģʽ false = ��
-----@param val number ���ʣ�Ĭ��1.5��
function NLG.SetCriticalDamageAddition(mode, val) end

---������������
---@param rate integer 0-100
---@param mode? nil|0|1|2 0 @0=PVE&PVP 1=PVE 2=PVP
function NLG.SetDexRearrangeRate(rate, mode) end

function NLG.DropPlayer(charIndex) end

Pet = {}

function Pet.ReBirth(PlayerIndex, PetIndex) end

function Pet.SetArtRank(PetIndex, ArtType, Value) end

function Pet.GetArtRank(PetIndex, ArtType) end

function Pet.ArtRank(PetIndex, ArtType) end

function Pet.FullArtRank(PetIndex, ArtType) end

function Pet.UpPet(PlayerIndex, PetIndex) end

function Pet.GetSkill(PetIndex, SkillSlot) end

function Pet.AddSkill(PetIndex, SkillID) end

---���ó���ͻ��63bp����
function Pet.AllowBpOverflow() end

---��ȡΨһid
---@return string
function Pet.GetUUID() end

Item = {}

---��չ�Զ�����Ʒ�������
---@param type number ����
---@param name string ����
---@return boolean
function Item.SetItemTypeName(type, name) end

---��ȡ��չ�Զ�����Ʒ�������
---@param type number ����
---@return string ����
function Item.GetItemTypeName(type) end

---��չ�Զ�����Ʒ���װ��λ��
---@param type number ����
---@param place string λ��
---@return boolean
function Item.SetItemTypeEquipPlace(type, place) end

---��ȡ��չ�Զ�����Ʒ���װ��λ��
---@param type number ����
---@return number λ��
function Item.GetItemTypeEquipPlace(type) end

---��չ�Զ�����Ʒ���ְҵװ���ȼ�
---@param job number ְҵID
---@param type number ����
---@param level number �ȼ�
---@return boolean
function Item.SetItemTypeEquipLevelForJob(job, type, level) end

---��ȡ��չ�Զ�����Ʒ���ְҵװ���ȼ�
---@param job number ְҵID
---@param type number ����
---@return number λ��
function Item.GetItemTypeEquipLevelForJob(job, type) end

function Item.GetData(ItemIndex, Dataline) end

function Item.SetData(ItemIndex, Dataline, value) end

function Item.UpItem(CharIndex, Slot) end

function Item.Kill(CharIndex, ItemIndex, Slot) end

Battle = {}

---@param BattleIndex number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Slot number ս�����������λ��,��Χ0-19������0-9Ϊ�·�ʵ�����У�10-19Ϊ�Ϸ�ʵ�����С�
---@return number ����-1ʧ�ܣ��ɹ����ض���ʵ���� ����index�������������Ͳ��Է���-2��ս��index��Ч����-3��ս�����������λ�÷�Χ���󷵻�-4��
function Battle.GetPlayer(BattleIndex, Slot) end

---@param BattleIndex number ս��index��ΪEncount��PVE��PVP�����ķ���ֵ��
---@param Slot number ս�����������λ��,��Χ0-19������0-9Ϊ�·�ʵ�����У�10-19Ϊ�Ϸ�ʵ�����С�
---@return number ����-1ʧ�ܣ��ɹ����ض���ʵ���� ����index�������������Ͳ��Է���-2��ս��index��Ч����-3��ս�����������λ�÷�Χ���󷵻�-4��
function Battle.GetPlayIndex(BattleIndex, Slot) end

function Battle.Encount(UpIndex, DownIndex) end

---@param CharIndex number
---@param CreatePtr number
---@param DoFunc string
---@param EnemyIdAr number[]
---@param BaseLevelAr number[]
---@param RandLv number[]
function Battle.PVE(CharIndex, CreatePtr, DoFunc, EnemyIdAr, BaseLevelAr, RandLv) end

function Battle.PVP(UpIndex, DownIndex) end

function Battle.SetType(BattleIndex, Type) end

---@return number
function Battle.GetType(BattleIndex) end

function Battle.SetGainMode(BattleIndex, Mod) end

function Battle.GetGainMode(BattleIndex) end

---@return number ȡֵ0����1�� 0��ʾս���·�����0-9λ�õ���ң�1��ʾ�Ϸ�����10-19λ�õ���ҡ�
function Battle.GetWinSide(BattleIndex) end

function Battle.SetWinEvent(DoFile, FuncName, BattleIndex) end

function Battle.ExitBattle(CharIndex) end

function Battle.SetPVPWinEvent(DoFile, FuncName, BattleIndex) end

---@param battleIndex integer
function Battle.UnsetWinEvent(battleIndex) end

---@param battleIndex integer
function Battle.UnsetPVPWinEvent(battleIndex) end

---��ս����
---@overload fun(battleIndex: number, encountIndex: number):number
---@param battleIndex number
---@param encountIndex number -1=ȡ����ս��  -2=lua������ս
---@param flg number lua��ս����
---@return number �ɹ�����0
function Battle.SetNextBattle(battleIndex, encountIndex, flg) end

---��ս����
---@param battleIndex number
---@param encountIndex number encount��ţ�  -1=ȡ����ս
---@return number �ɹ�����0
function Battle.SetNextBattle(battleIndex, encountIndex) end

---��ȡ��սid
---@param battleIndex number
---@return number encountIndex
function Battle.GetNextBattle(battleIndex) end

---��ȡlua��սflg
---@param battleIndex number
---@return number flg
function Battle.GetNextBattleFlg(battleIndex) end

---���������˺�����
---@param ap number[] 4���ԣ��ء�ˮ���𡢷�
---@param dp number[] 4���ԣ��ء�ˮ���𡢷�
---@return number
function Battle.CalcPropScore(ap, dp) end

---��ָ����Ҷ��������һ����Ҷ����ս���У�Ҳ������CharIndex2����CharIndex1��ս��
---@param a number Ŀ��Ķ���index����ս���е����
---@param b number Ŀ��Ķ���index������ս���е����
---@return number ����0Ϊ�ɹ�������ʧ�ܡ�
function Battle.JoinBattle(a, b) end

---�ö���ִ��ָ����ս�������������ڶ���Battle.IsWaitingCommand(index)����ֵΪ1ʱ�ſ�����Чʹ�á�
---@param charIndex number
---@param com1 number @see CONST.BATTLE_COM
---@param com2 number @see CONST.BATTLE_COM_TARGET
---@param com3 number techId
---@return number
function Battle.ActionSelect(charIndex, com1, com2, com3) end

---�жϵ�ǰ�����Ƿ���ս�����Ҵ��ڵȴ�����ս��ָ���״̬��
---@return number ����1Ϊ�ȴ�ָ��
function Battle.IsWaitingCommand(charIndex) end

---��ȡ��ǰ�������ܲ���
---@param charIndex number
---@param type string ȡֵ DD: AR: ��
---@return number|nil
function Battle.GetTechOption(charIndex, type) end

---��ȡ���Կ��ƹ�ϵ
---@param attackerIndex number
---@param defenceIndex number
---@return number ���Ʊ���
function Battle.CalcAttributeDmgRate(attackerIndex, defenceIndex) end

---���������˺�
---@param a number ����������
---@param b number ����������
---@return number
function Battle.CalcTribeRate(a, b) end

---���㵱ǰս�������˺�
---@param aIndex number ������index
---@param bIndex number ������index
---@return number
function Battle.CalcTribeDmgRate(aIndex, bIndex) end

---��ȡ��ǰս���غ�
---@param battleIndex number 
---@return number
function Battle.GetTurn(battleIndex) end

---���õ�ǰ�غ���
---@param battleIndex number 
---@param turn number 
function Battle.SetTurn(battleIndex, turn) end

---�˺��¼��л�ȡ����hit�� 1,2,3,4.....
---@param defSlot number ������slot
---@param battleIndex number
---@return integer
function Battle.GetRandomShotHit(battleIndex, defSlot) end

---��ȡ�����������
---@param BattleIndex integer
---@return number ����, number ʣ��غ�, number ����
function Battle.GetBattleFieldAttribute(BattleIndex) end

---������������
---@param BattleIndex integer
---@param Attribute integer ����
---@param TurnCount integer ʣ��غ�
---@param AttributePower integer ����
---@return integer �Ƿ�ɹ� ����1Ϊ�ɹ� ����Ϊʧ��
function Battle.SetBattleFieldAttribute(BattleIndex, Attribute, TurnCount, AttributePower) end

---Ϊ��ǰ�����ս�������Ϣ
---@param msg string
function Battle.AppendBattleMsg(msg) end

Field = Field or {}

function Field.Get(CharIndex, Field) end

function Field.Set(CharIndex, Field, Value) end

NL = NL or {}

function NL.CreateNPC(Dofile, InitFuncName) end

function NL.DelNpc(NpcIndex) end

function NL.CreateArgNpc(Type, Arg, Name, Image, Map, Floor, Xpos, Ypos, Dir, ShowTime) end

function NL.SetArgNpc(NpcIndex, NewArg) end

function NL.RegCallback(event, callbackStr) end

function NL.RemoveCallback(event) end

---����˵���޸��¼�
---@param callback string callback�ص����� 
---@see NL.RegItemExpansionEventCallback
function NL.RegItemExpansionEvent(dofile, callback) end

---����˵���޸��¼��ص�
---@param itemIndex number
---@param type number
---@param msg string
---@param charIndex number
---@param slot number
---@return string
function NL.RegItemExpansionEventCallback(itemIndex, type, msg, charIndex, slot) end

---���������¼�
---@param callback string callback�ص����� 
---@see NL.ItemBoxEncountEventCallback
function NL.RegItemBoxEncountEvent(dofile, callback) end

---���������¼��ص�
---@param charaIndex number
---@param mapId number
---@param floor number
---@param X number
---@param Y number
---@param itemIndex number ������Ʒindex
---@return number[]|nil �������� ÿ������3���������ֱ�Ϊ id���ȼ�������ȼ��� ����nil�����أ� ���ӣ� {0, 100, 5, 1, 1, 0} ����0�Ź���100-105����1�Ź���1��
function NL.ItemBoxEncountEventCallback(charaIndex, mapId, floor, X, Y, itemIndex) end

---�������и����¼�
---@param callback string callback�ص����� 
---@see NL.ItemBoxEncountRateEventCallback
function NL.RegItemBoxEncountRateEvent(dofile, callback) end

---�������и����¼��ص�
---@param charaIndex number
---@param mapId number
---@param floor number
---@param X number
---@param Y number
---@param itemIndex number ������Ʒindex
---@param boxType number
---@param rate number ������
---@return number ������
function NL.ItemBoxEncountRateEventCallback(charaIndex, mapId, floor, X, Y, itemIndex, rate, boxType) end

---�����ȡ��Ʒ�¼�
---@param callback string callback�ص����� 
---@see NL.ItemBoxLootEventCallback
function NL.RegItemBoxLootEvent(dofile, callback) end

---�����ȡ��Ʒ�¼��ص�
---@param charaIndex number
---@param mapId number
---@param floor number
---@param X number
---@param Y number
---@param boxType number
---@param adm number
---@return number ����1����Ĭ����Ʒ
function NL.ItemBoxLootEventCallback(charaIndex, mapId, floor, X, Y, boxType, adm) end

---���������¼�
---@param callback string callback�ص����� 
---@see NL.ItemBoxGenerateEventCallback
function NL.RegItemBoxGenerateEvent(dofile, callback) end

---���������¼��ص�
---@param mapId number
---@param floor number
---@param itemBoxType number ������
---@param adm number Ӱ�������Ʒ������δ֪
---@return number[] ���ر������ {itemBoxType, adm}
function NL.ItemBoxGenerateEventCallback(mapId, floor, itemBoxType, adm) end

---�����˺������¼�
---@param callback string callback�ص����� 
---@see NL.ItemTribeRateEventCallback
function NL.RegItemTribeRateEvent(dofile, callback) end

---�����˺������¼��ص�
---@param a number ��������
---@param b number ��������
---@param rate number ���Ʊ���
---@return number �����µĿ��Ʊ���
function NL.ItemTribeRateEventCallback(a, b, rate) end

---Http�����¼�
---@param callback string callback�ص����� 
---@see Http.HttpRequestEventCallback
function NL.RegHttpRequestEvent(dofile, callback) end

---@param sql string sql
---@vararg string|number �󶨲��������40��
---@return {status:number, effectRows:number, rows: table} ���ز�ѯ����
function SQL.QueryEx(sql, ...) end

Data = Data or {}

---����Msg
---@param msgId number
---@param val string
function Data.SetMessage(msgId, val) end

---��ȡMsg
---@param msgId number
---@return string
function Data.GetMessage(msgId) end

---���������˺�����
---@param a number �������� ֧�� 0 ~ 19
---@param b number �������� ֧�� 0 ~ 19
---@param rate number ���Ʊ���֧�� -128 ~ 127
function Data.SetTribeMapValue(a, b, rate) end

---��ȡItemsetIndex
function Data.ItemsetGetIndex(ItemID) end

---��ȡItemset����
function Data.ItemsetGetData(ItemsetIndex, DataPos) end

---��ȡEnemyDataIndex
function Data.EnemyGetDataIndex(enemyId) end

---��ȡEnemy����
function Data.EnemyGetData(enemyIndex, DataPos) end

---��ȡEnemyBaseDataIndex
function Data.EnemyBaseGetDataIndex(enemyBaseId) end

---��ȡEnemyBase����
function Data.EnemyBaseGetData(enemyBaseIndex, DataPos) end

function Data.GetEncountIndex(encountId) end

function Data.GetEncountData(encountIndex, dataPos) end

function Data.GetEnemyBaseIdByEnemyId(enemyId) end

function Data.GetEnemyBaseIndexByEnemyId(enemyId) end


Tech = Tech or {}

---��ȡTechIndex
---@param techId integer
---@return integer
function Tech.GetTechIndex(techId) end

---��ȡTech����
---@param techIndex integer
---@param dataLine integer
---@return integer|string
function Tech.GetData(techIndex, dataLine) end

---����ħ������
---@param techId number
---@param earth number ÿ10����1������
---@param water number ÿ10����1������
---@param fire number ÿ10����1������
---@param wind number ÿ10����1������
function Tech.SetTechMagicAttribute(techId, earth, water, fire, wind) end

---����fd��ȡ��ɫIndex
---@param fd integer
---@return integer charIndex
function Protocol.GetCharIndexFromFd(fd) end

---���ͷ�����ͻ���
---@param charIndex number
---@param header string ���ͷ
---@vararg number|string data�����ݷ�����ݶ��������ּ��ַ���������з�����룬��Ĭ�ϴ���
---@return number ��������0Ϊʧ�ܣ���������Ϊ�ɹ�
function Protocol.Send(charIndex, header, ...) end

---���ͷ�����ͻ���
---@param fd number
---@param header string ���ͷ
---@vararg number|string data�����ݷ�����ݶ��������ּ��ַ���������з�����룬��Ĭ�ϴ���
---@return number ��������0Ϊʧ�ܣ���������Ϊ�ɹ�
function Protocol.SendToFd(fd, header, ...) end

---��ȡ�ͻ���IP
---@param fd number
---@return string ip
function Protocol.GetIp(fd) end

---��ȡfd
---@param charIndex number
---@return number fd
function Protocol.GetFdByCharIndex(charIndex) end

---���ط���ص�
---@param Dofile? string �����ļ�
---@param FuncName string �ص�����
---@param PacketID string ���ͷ
function Protocol.OnRecv(Dofile, FuncName, PacketID) end

Recipe = Recipe or {}

---@return number �ɹ�ʱ���� 1, ʧ�ܷ��� 0, charIndex��Ч���� -1, �䷽��Ч���� -2, �䷽�ѻ�÷��� -3
function Recipe.GiveRecipe(charIndex, recipeNo) end

---@return number �ɹ�ʱ���� 1, ʧ�ܷ��� 0, charIndex��Ч���� -1, �䷽��Ч���� -2, �䷽�ѻ�÷��� -3
function Recipe.RemoveRecipe(charIndex, recipeNo) end

---@return number ����ֵ ���䷽ʱ���� 1, ���䷽���� 0, charIndex��Ч���� -1, �䷽��Ч���� -2
function Recipe.HasRecipe(charIndex, recipeNo) end

function Recipe.GetData(recipeNo, dataLine) end

Skill = Skill or {}

---������չ���ܾ����
---@param expId number �����Id
---@param lv number ���ܵȼ�
---@param exp number ��Ҫ�ľ���
function Skill.SetExpForLv(expId, lv, exp) end

---���ü������ȼ�
---@param level number ���֧��127
function Skill.SetMaxLevel(level) end

---��ȡְҵ��߼��ܵȼ�
---@param skillIndex any
---@param job any
---@return integer
function Skill.GetMaxSkillLevelOfJob(skillIndex, job) end

---��ȡskillIndex
---@param id integer ����id
---@return integer
function Skill.GetSkillIndex(id) end

---�޸ĵ������ӵĳ����ҳ϶�
---@param lv integer �ȼ�
---@param add integer ���ӵ��ҳ϶ȣ�Ĭ��ÿ��1���ҳ�
function Skill.SetPetTrainAddition(lv, add) end

---������ְͨҵ���ɹ���
---@param rate number
function Skill.SetNormalJobStealMaxRate(rate) end

---����ҽ��ְҵID
---@param jobId number
function Skill.AddDoctorJob(jobId) end

---�Ƴ�ҽ��ְҵID
---@param jobId number
function Skill.RemoveDoctorJob(jobId) end

---������ְͨҵ���Ƴɹ���
---@param lv integer 
---@param mode 0|1|2|3 0=���ˣ�1=�ƣ�2=�ϣ�3=��
---@param rate integer ʧ�ܸ���
function Skill.SetNormalJobMedicalTreatmentRate(lv, mode, rate) end

---����ҽ��ְҵ���Ƴɹ���
---@param lv integer 
---@param mode 0|1|2|3 0=���ˣ�1=�ƣ�2=�ϣ�3=��
---@param rate integer ʧ�ܸ���
function Skill.SetDoctorJobMedicalTreatmentRate(lv, mode, rate) end

---����ҽ��ְҵ�����ƹ���(����ר����Ʒ)
---@param lv integer 
---@param mode 0|1|2|3 0=���ˣ�1=�ƣ�2=�ϣ�3=��
---@param rate integer ʧ�ܸ���
function Skill.SetDoctorJobExMedicalTreatmentRate(lv, mode, rate) end

Map = Map or {}

---��ȡ�Թ���ʣ��ʱ��
---@param dungeonId integer
---@return integer ʱ�䣨�룩
function Map.GetDungeonExpireTimeByDungeonId(dungeonId) end

---��ȡ�Թ���ͼ��ʣ��ʱ��
---@param floor integer
---@return integer ʱ�䣨�룩
function Map.GetDungeonExpireTime(floor) end

---��ȡ�Թ��Ĺ���ʱ��
---@param dungeonId integer
---@return integer ʱ�䣨UnixTime��
function Map.GetDungeonExpireAtByDungeonId(dungeonId) end

---��ȡ�Թ��Ĺ���ʱ��
---@param floor integer floor
---@return integer ʱ�䣨UnixTime��
function Map.GetDungeonExpireAt(floor) end

---����floor�����Թ�����ʱ�� 
---@param floor integer floor
---@param time integer UnixTime
function Map.SetDungeonExpireAt(floor, time) end

---�����Թ�Id�����Թ�����ʱ�� 
---@param dungeonId integer dungeonId
---@param time integer UnixTime
function Map.SetDungeonExpireAtByDungeonId(dungeonId, time) end

---��ȡ�Թ�Id
---@param floor integer
---@return integer dungeonId �Թ�id
function Map.GetDungeonId(floor) end

---��ȡ�Թ����
---@param dungeonId integer dungeonId
---@return number mapType, number floor, number x, number y
function Map.FindDungeonEntry(dungeonId) end

Http = _G.Http or {}

---��ʼ��Http������
function Http.Init() end

---����Http����
---@param addr string ����IP,����: "0.0.0.0"
---@param port integer �˿� ����10000����
---@return integer ret @1���ɹ�������Ϊʧ��
function Http.Start(addr, port) end

---�ر�Http����������Ҫע�⣬��������ֹͣ�ᵼ��������Ӧ502����ǿ�ƹر�����δ���������
function Http.Stop() end

---��ȡHttp������״̬
---@return 0|1|2 status  @0=δ��ʼ�� 1=δ���� 2=������
function Http.GetStatus() end

---�󶨾�̬��Դ
---@param path string url��ַ
---@param dir string ����Ŀ¼
function Http.AddMountPoint(path, dir) end

---�Ƴ���̬��Դ
---@param path string url��ַ
function Http.RemoveMountPoint(path) end

---http����ص�
---@param method string
---@param api string API����
---@param params {string:string} ����
---@param body string body����
---@return string body ��������
function Http.HttpRequestEventCallback(method, api, params, body) end
--]]--
