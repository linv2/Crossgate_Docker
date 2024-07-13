---@meta _

---��ȡ����汾
---@return number @
function NL.Version() end

---��ӡ������Ϣ
---@param s string �����ı�
function NL.PrintError(s) end

---ʹ��Lua�ű�����NPC����ִ��Dofile�ļ��е�InitFuncName������
---[@group NL.CreateNPC]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string Init����������,NPC������ִ�еĺ���,������ʽ��ο������[InitCallBack]
---@return number @�����ɹ��򷵻� ����index, ʧ���򷵻ظ���
function NL.CreateNPC(Dofile, InitFuncName) end

---CreateNPC�Ļص�����
---[@group NL.CreateNPC]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function InitCallBack(CharIndex) end

---ɾ����Lua������NPC����Ҫע����ǣ�ɾ��NPC�󱾺������ὫNpcIndex��ֵ����Ϊnil�����ں��������д���NpcIndex��ֵ��
---@param NpcIndex  number Ҫɾ����Npc�Ķ���ָ��
---@return number @�����ɹ��򷵻� 1, ʧ���򷵻� 0
function NL.DelNpc(NpcIndex) end

---ֱ�Ӵ���data/npc.txt��֧�ֵĸ������͵�npc������ֱ�ӵ���npc.txt֧�ֵ�npc���ͺ���Ӧ�Ĳ��������ҿ��Ի�ô�����npc�Ķ���
---@param Type  string npc�������ı�����Сд���У����硱Itemshop2��
---@param Arg  string ��Ӧ��npc���͵Ĳ�������npc.txt��ÿ��npc�����һ�����
---@param Name  string npc��ʾ������
---@param Image  number npc��ͼ�����
---@param Map  number npc���ڵ�MapID
---@param Floor  number npc���ڵ�FloorID
---@param Xpos  number npc���ڵ�x����
---@param Ypos  number npc���ڵ�y����
---@param Dir  number npc�泯�ķ���
---@return number @���ظ�����ʾʧ�ܣ�����0����������ʾ�ɹ������Ҹ�ֵΪnpc�Ķ�������ֵ
function NL.CreateArgNpc(Type, Arg, Name, Image, Map, Floor, Xpos, Ypos, Dir) end

---ֱ�Ӵ���data/npc.txt��֧�ֵĸ������͵�npc������ֱ�ӵ���npc.txt֧�ֵ�npc���ͺ���Ӧ�Ĳ��������ҿ��Ի�ô�����npc�Ķ���
---@param Type  string npc�������ı�����Сд���У����硱Itemshop2��
---@param Arg  string ��Ӧ��npc���͵Ĳ�������npc.txt��ÿ��npc�����һ�����
---@param Name  string npc��ʾ������
---@param Image  number npc��ͼ�����
---@param Map  number npc���ڵ�MapID
---@param Floor  number npc���ڵ�FloorID
---@param Xpos  number npc���ڵ�x����
---@param Ypos  number npc���ڵ�y����
---@param Dir  number npc�泯�ķ���
---@param ShowTime  number ��ѡ����,NPC����ʾʱ��,�������òο��������ʿ��
---@return number @���ظ�����ʾʧ�ܣ�����0����������ʾ�ɹ������Ҹ�ֵΪnpc�Ķ�������ֵ
function NL.CreateArgNpc(Type, Arg, Name, Image, Map, Floor, Xpos, Ypos, Dir, ShowTime) end

---�޸�NL.CreateArgNpc������npc�Ĳ���
---@param NpcIndex  number npc�Ķ���������һ��ΪNL.CreateArgNpc�ķ���ֵ
---@param NewArg  string �µ�npc�Ĳ���
---@return number @���ظ�������ʧ�ܣ�0��ʾ�ɹ���npc���Զ�ˢ�£�ע�⣬���������Ҵ�����npc��ʱ���޸�npc�Ĳ��������ܻ����bug��Ӱ�죬�������������NPC���޸ģ�
function NL.SetArgNpc(NpcIndex, NewArg) end

---����һ��������ҵ�½��Ϸʱ���Զ�������Lua������
---[@group NL.RegLoginEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ���ҵ�½���Զ�����FuncName��Lua�������ú�����������ʽ��ο�[LoginEventCallBack]
function NL.RegLoginEvent(Dofile, InitFuncName) end

---LoginEvent�Ļص�����
---[@group NL.RegLoginEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function LoginEventCallBack(CharIndex) end

---����һ��������ҵǳ��ؼ�¼��ͻᴥ����Lua���������ֻ�е���ͻ��ˡ��ǳ��ؼ�¼�㡱��ťʱ�ſɴ����ú�����
---[@group NL.RegLoginGateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[LoginGateEventCallBack]
function NL.RegLoginGateEvent(Dofile, InitFuncName) end

---LoginGateEvent�Ļص�����
---[@group NL.RegLoginGateEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function LoginGateEventCallBack(CharIndex) end

---����һ��������ҵǳ���Ϸ�ͻᴥ����Lua������
---[@group NL.RegLogoutEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[LogoutEventCallBack]
function NL.RegLogoutEvent(Dofile, InitFuncName) end

---LogoutEvent�Ļص�����
---[@group NL.RegLogoutEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function LogoutEventCallBack(CharIndex) end

---����һ���������˵���ͻᴥ����Lua�������������Ϸ��˵�����ɴ������¼������������½�ָ�GM����ȣ�ͬʱ���Զ�GM������зּ���Ȩ��
---[@group NL.RegTalkEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[TalkEventCallBack]
function NL.RegTalkEvent(Dofile, InitFuncName) end

---TalkEvent�Ļص�����
---[@group NL.RegTalkEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Msg  string �������ݣ���ֵ��Lua���洫�ݸ���������
---@param Color  number ˵����ɫ����ֵ��Lua���洫�ݸ���������
---@param Range  number ˵����������Χ������ֵ��Lua���洫�ݸ�������
---@param Size  number ˵�������С����ֵ��Lua���洫�ݸ���������
---@return number @����0����˵�����ݣ�����1��������
function TalkEventCallBack(CharIndex, Msg, Color, Range, Size) end

---����һ��������ҽ�ɫ����������Lua�������������Ϸ�н�ɫ������Ϳɴ����������������ض��ȼ������ض���������¼��ҳ弶�ٶ����еȡ�
---[@group NL.RegLevelUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[LevelUpCallBack]
function NL.RegLevelUpEvent(Dofile, InitFuncName) end

---LevelUpEvent�Ļص�����
---[@group NL.RegLevelUpEvent]
---@param CharIndex  number �������˵�index����ֵ��Lua���洫�ݸ���������
---@param PetIndex  number �����index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function LevelUpCallBack(CharIndex, PetIndex) end

---����һ����ɫ����ս�����ɴ�����Lua������
---[@group NL.RegBattleStartEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[BattleStartEventCallBack]
function NL.RegBattleStartEvent(Dofile, InitFuncName) end

---BattleStartEvent�Ļص�����
---[@group NL.RegBattleStartEvent]
---@param BattleIndex  number ��Ӧ�¼���ս��index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function BattleStartEventCallBack(BattleIndex) end

---����һ��ս���������ɴ�����Lua������
---[@group NL.RegBattleOverEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[BattleOverEventCallBack]
function NL.RegBattleOverEvent(Dofile, InitFuncName) end

---BattleOverEvent�Ļص�����
---[@group NL.RegBattleOverEvent]
---@param BattleIndex  number ��Ӧ�¼���ս��index����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function BattleOverEventCallBack(BattleIndex) end

---����һ�����ͨ�����͵�ʱ������Lua����������������¼��ҵĴ��͹켣��
---[@group NL.RegWarpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[WarpEventCallBack]
function NL.RegWarpEvent(Dofile, InitFuncName) end

---����һ�����ͨ�����͵�ʱ������Lua����������������¼��ҵĴ��͹켣��
---[@group NL.RegWarpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[WarpEventCallBack]
function NL.RegAfterWarpEvent(Dofile, InitFuncName) end

---WarpEvent�Ļص�����
---[@group NL.RegWarpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Ori_MapId  number ����ǰ��mapid����ֵ��Lua���洫�ݸ���������
---@param Ori_FloorId  number ����ǰ��floor id����ֵ��Lua���洫�ݸ���������
---@param Ori_X  number ����ǰ��x����ֵ��Lua���洫�ݸ���������
---@param Ori_Y  number ����ǰ��y����ֵ��Lua���洫�ݸ���������
---@param Target_MapId  number ���ͺ��mapid����ֵ��Lua���洫�ݸ���������
---@param Target_FloorId  number ���ͺ��floor id����ֵ��Lua���洫�ݸ���������
---@param Target_X  number ���ͺ��x����ֵ��Lua���洫�ݸ���������
---@param Target_Y  number ���ͺ��y����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function WarpEventCallBack(CharIndex, Ori_MapId, Ori_FloorId, Ori_X, Ori_Y, Target_MapId, Target_FloorId, Target_X, Target_Y) end

---����һ��������ҵ��߾ͻᴥ����Lua������
---[@group NL.RegDropEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[DropEventCallBack]
function NL.RegDropEvent(Dofile, InitFuncName) end

---DropEvent�Ļص�����
---[@group NL.RegDropEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0���ɡ�
function DropEventCallBack(CharIndex) end

---����һ��������ҽ�ɫ�����ƺż��ɴ�����Lua������
---[@group NL.RegTitleChangedEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[TitleChangedCallBack]
function NL.RegTitleChangedEvent(Dofile, InitFuncName) end

---TitleChangedEvent�Ļص�����
---[@group NL.RegTitleChangedEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Ori_Title  number ��title id����ֵ��Lua���洫�ݸ���������
---@param New_Title  number ��title id����ֵ��Lua���洫�ݸ���������
---@return number @����0�����л��ƺ�,����ֵС��0�����ء�
function TitleChangedCallBack(CharIndex, Ori_Title, New_Title) end

---����һ�������ȡս������ʱ������Lua������
---[@group NL.RegGetExpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[GetExpEventCallBack]
function NL.RegGetExpEvent(Dofile, InitFuncName) end

---GetExpEvent�Ļص�����
---[@group NL.RegGetExpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Exp  number ��ȡ�ľ���ֵ����ֵ��Lua���洫�ݸ���������
---@return number @���ض���Ҫ��ȡ�ľ���ֵ���粻�Ծ���ֵ�������벻Ҫдreturn������дreturn Exp; ��������ȵ��߶Ծ���ļӳ����ȣ�Ҳ����˵���߼ӳɵľ���ֵ���ڱ���������ֵ�û����ϼ���ġ�
function GetExpEventCallBack(CharIndex, Exp) end

---����һ�������ȡս�����ܾ���ʱ������Lua������
---[@group NL.RegBattleSkillExpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[GetBattleSkillExpEventCallBack]
function NL.RegBattleSkillExpEvent(Dofile, InitFuncName) end

---BattleSkillExpEvent�Ļص�����
---[@group NL.RegBattleSkillExpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param SkillID  number ����ID����ֵ��Lua���洫�ݸ���������
---@param Exp  number ��ȡ�ľ���ֵ����ֵ��Lua���洫�ݸ���������
---@return any @����Ҫ��ȡ�ľ���ֵ���粻�Ծ���ֵ�������벻Ҫдreturn������дreturn Exp; ��������ȵ��߶Ծ���ļӳ����ȣ�Ҳ����˵���߼ӳɵľ���ֵ���ڱ���������ֵ�û����ϼ���ġ�
function GetBattleSkillExpEventCallBack(CharIndex, SkillID, Exp) end

---����һ�������ȡ�������ܾ���ʱ������Lua������
---[@group NL.RegProductSkillExpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[GetProductSkillExpEventCallBack]
function NL.RegProductSkillExpEvent(Dofile, InitFuncName) end

---GetProductSkillExpEvent�Ļص�����
---[@group NL.RegProductSkillExpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param SkillID  number ����ID����ֵ��Lua���洫�ݸ���������
---@param Exp  number ��ȡ�ľ���ֵ����ֵ��Lua���洫�ݸ���������
---@return any @����Ҫ��ȡ�ľ���ֵ���粻�Ծ���ֵ�������벻Ҫдreturn������дreturn Exp; ��������ȵ��߶Ծ���ļӳ����ȣ�Ҳ����˵���߼ӳɵľ���ֵ���ڱ���������ֵ�û����ϼ���ġ�
function GetProductSkillExpEventCallBack(CharIndex, SkillID, Exp) end

---����һ����������������Lua��������ҳ�������Ϸ��������Ϳɴ����������������ض��ȼ������ض���������¼��ҳ���弶�ٶ����еȡ�
---[@group NL.RegPetLevelUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[LevelUpCallBack]
function NL.RegPetLevelUpEvent(Dofile, InitFuncName) end

---PetLevelUpEvent�Ļص�����
---[@group NL.RegPetLevelUpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param PetIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@return number @����0���ɡ�
function LevelUpCallBack(CharIndex, PetIndex) end

---����һ����������뿪ս���ͻᴥ����Lua������
---[@group NL.RegBattleExitEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[BattleExitCallBack]
function NL.RegBattleExitEvent(Dofile, InitFuncName) end

---BattleExitEvent�Ļص�����
---[@group NL.RegBattleExitEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param BattleIndex  number ս��Index����ֵ��Lua���洫�ݸ���������
---@param Type  number �뿪ս���ķ�ʽ�����ֵΪ1���ʾ�����뿪������ս��ʤ����ʧ�ܡ����ܡ��ǳ����������ֵΪ2�����ʾ��ұ��ɡ���ֵ��Lua���洫�ݸ���������
function BattleExitCallBack(CharIndex, BattleIndex, Type) end

---����һ������Ҽ����������Ҿͻᴥ����Lua������
---[@group NL.RegRightClickEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[RightClickCallBack]
function NL.RegRightClickEvent(Dofile, InitFuncName) end

---RightClickEvent�Ļص�����
---[@group NL.RegRightClickEvent]
---@param CharIndex  number ��Ӧ�¼��������¼����Ķ���index����ֵ��Lua���洫�ݸ���������(�����¼������)
---@param TargetCharIndex  number ��Ӧ�¼�������Ӧ�¼����Ķ���index����ֵ��Lua���洫�ݸ���������(���Ҽ���������)
---@return number @����1���ظ��¼�������������
function RightClickCallBack(CharIndex, TargetCharIndex) end

---����һ������������رմ������¼�
---[@group NL.RegShutDownEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[ShutDownCallBack]
function NL.RegShutDownEvent(Dofile, InitFuncName) end

---ShutDownEvent�Ļص�����
---[@group NL.RegShutDownEvent]
---@return number @����0���ɡ�
function ShutDownCallBack() end

---����һ�������Ӵ������¼���
---[@group NL.RegPartyEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[PartyEventCallBack]
function NL.RegPartyEvent(Dofile, InitFuncName) end

---PartyEvent�Ļص�����
---[@group NL.RegPartyEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ�������������Ա��
---@param TargetCharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ������������ӳ���
---@param Type  number ģʽ����ӻ��Ǽ����Ŷӣ���ֵ��Lua���洫�ݸ�����������0 ������ӣ�1 �뿪��ӣ�
---@return number @����1��ʾ�������������0��ʾ��ֹ���������ʧ��/���ʧ�ܣ�
function PartyEventCallBack(CharIndex, TargetCharIndex, Type) end

---����ҽ��г����ӡ��ʱ��ᴥ�����¼������ҷ��ط�ӡ�Ľ����ͬʱLuaҲ���ԶԷ�ӡ��������޸ġ�
---[@group NL.RegSealEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[SealEventCallBack]
function NL.RegSealEvent(Dofile, InitFuncName) end

---SealEvent�Ļص�����
---[@group NL.RegSealEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param EnemyIndex  number ����ӡ�Ĺ�����󣬸�ֵ��Lua���洫�ݸ���������
---@param Ret  number ��ӡ�Ľ����������鿴�����RetFlg��ֵ�Ľ�������ֵ��Lua���洫�ݸ���������
---RetFlgΪ����˶Է�ӡ�������ж������ֵ����Ϊ������Ҳ����Ϊ���������Ϊ�������ʾ��ӡʧ�ܣ����Ϊ�������ʾ��ӡ�ɹ��� <br/>
---��ӡʧ�ܷ���ֵ��Ӧ������<br/>
--- -1 ������ӡ��������ʹ���<br/>
--- -2 ������ӡ��������Ϊ����<br/>
--- -3 ���������û���㹻��λ<br/>
--- -4 ����ҵȼ������Է�ӡ����<br/>
--- -5 ������ӡ�ĳ������ٻ������Ķ���Ұ����<br/>
--- -6 �����û�б���ӡ�����ͼ��<br/>
--- -7 ��ʹ�õķ�ӡ�����߲�����<br/>
--- -8 ��ʹ�õĵ��߲����Ƿ�ӡ������<br/>
--- -9 ��ʹ�õķ�ӡ��û�в�������<br/>
--- -10 ��ʹ�õķ�ӡ�����岻��ȷ<br/>
--- -11 �����ܷ�ӡаħϵ����<br/>
--- -100 ����ӡ������ʲ��㣬��ԭ��ӡ������ʵĹ�ʽΪ abs(rate/100)-1
---@return number @����ֱ�ӷ���RetFlg������Ҳ�ɸ������󷵻��������߸���������ֵ��Ӱ����ҷ�ӡЧ��
function SealEventCallBack(CharIndex, EnemyIndex, Ret) end

---����ґ��Y�аl��ָ���ʱ��ᴥ�����¼�
---[@group NL.RegBattleActionEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[BattleActionEventCallBack]
function NL.RegBattleActionEvent(Dofile, InitFuncName) end

---BattleActionEvent�Ļص�����
---[@group NL.RegBattleActionEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Com1  number ���Yʹ�õĄ�����̖����ֵ��Lua���洫�ݸ���������
---@param Com2  number ������Ŀ�ˌ����λ�ã���ֵ��Lua���洫�ݸ���������
---@param Com3  number ��������tech��ID����ֵ��Lua���洫�ݸ���������
---@param ActionNum  number �ǌ���ĵڎׄ�����ͨ���������������2����Ч��������ֵ��Lua���洫�ݸ���������
function BattleActionEventCallBack(CharIndex, Com1, Com2, Com3, ActionNum) end

---������е�Action�¼������|�l����������ʹ�Õ�����������������ʯ�^�����ȡ�
---[@group NL.RegCharActionEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[CharActionEventCallBack]
function NL.RegCharActionEvent(Dofile, InitFuncName) end

---CharActionEvent�Ļص�����
---[@group NL.RegCharActionEvent]
---@param CharIndex  number ��Ӧ�¼��������¼����Ķ���index����ֵ��Lua���洫�ݸ���������
---@param ActionID  number ��ҵĄ���ID����ֵ��Lua���洫�ݸ���������
function CharActionEventCallBack(CharIndex, ActionID) end

---�����ʹ�����a�����u�����ߵĕr����|�l������ͨ�^ԓ�¼��@ȡ��Ҍ��󣬼��ܵ�ID���ȼ������ɵĵ��ߌ���
---[@group NL.RegMergeItemEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[MergeItemEventCallBack]
function NL.RegMergeItemEvent(Dofile, InitFuncName) end

---MerGeItemEvent�Ļص�����
---[@group NL.RegMergeItemEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param SkillID  number ���a�������õļ���ID����ֵ��Lua���洫�ݸ���������
---@param SkillLv  number ���a�������õļ��ܵȼ�����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ���ɳ��ĵ��ߵČ��������-1���t��ʾ���ɵ���ʧ������ֵ��Lua���洫�ݸ���������
---@param jewelNo  number ��ʯ��ƷId
function MergeItemEventCallBack(CharIndex, SkillID, SkillLv, ItemIndex, jewelNo) end

---����һ�������ص��������¼�����������ص�����˼�ǣ��ڵ�������һ������������һ�����߻ᴥ�����¼���
---[@group NL.RegItemOverLapEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[ItemOverLapEventCallBack]
function NL.RegItemOverLapEvent(Dofile, InitFuncName) end

---ItemOverLapEvent�Ļص�����
---[@group NL.RegItemOverLapEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param FromItemIndex  number ��ѡ�еĵ��ߵĶ��󣬸�ֵ��Lua���洫�ݸ���������
---@param TargetItemIndex  number �����ǵĵ��ߵĶ��󣬸�ֵ��Lua���洫�ݸ���������
---@param Num  number ��ѡ�еĵ��ߵ���������ֵ��Lua���洫�ݸ�������
---@return number @����в����򷵻ط�0ֵ�����򷵻�0��ִ���ƶ����ߵĲ�����
function ItemOverLapEventCallBack(CharIndex, FromItemIndex, TargetItemIndex, Num) end

---����һ���û���¼��ʱ���ȡ��½����Ϣ�������¼�������¼��������Login�¼��е�ԭ�ص�½���ܣ�ֻ��Ҫ��Callback��ֱ�����ö�����������Ϣ���ɣ�����warp��
---[@group NL.RegGetLoginPointEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[GetLoginPointEventCallBack]
function NL.RegGetLoginPointEvent(Dofile, InitFuncName) end

---GetLoginPointEvent�Ļص�����
---[@group NL.RegGetLoginPointEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param MapID  number ��½��Map ID����ֵ��Lua���洫�ݸ���������
---@param FloorID  number ��½��Floor ID����ֵ��Lua���洫�ݸ���������
---@param X  number ��½��X���꣬��ֵ��Lua���洫�ݸ���������
---@param Y  number ��½��Y���꣬��ֵ��Lua���洫�ݸ���������
function GetLoginPointEventCallBack(CharIndex, MapID, FloorID, X, Y) end

---����һ��������itemset��ʹ�õĵ���Ч���ֶΣ������ߴ������ֶ�ʱ�������Զ����ö����lua������
---[@group NL.RegItemString]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
---@param ItemSigh  string Itemset�ж�Ӧ�Ĺ����ֶΣ���ʼ�������ĺ�����LUA_init��ͷ��ʹ�ô����ĺ�����LUA_use��ͷ��װ�����ߴ����ĺ�����LUA_att��ͷ��ж��װ�������ĺ�����LUA_det��ͷ�����߶���ʱ�����ĺ�����LUA_drop��ͷ������ʰȡǰ�����ĺ�����LUA_prepick��ͷ������ʰȡ�󴥷��ĺ�����LUA_pick��ͷ
--- itemset.txt�е��Զ��庯��������Ӧ���в�ͬ.<br/>
--- FuncName������ĺ�����������ʽ���ݲ�ͬ�ĵ���Ч������ͬ��������ο��������� <br/>
--- <br/>
--- LUA_init�� [ItemStringInitCallBack] ���߳�ʼ������,itemset.txt��4�����Զ��庯����. <br/>
--- LUA_use �� [ItemStringUseCallBack] ����ʹ�ô���,itemset.txt��6�����Զ��庯����. <br/>
--- LUA_att �� [ItemStringAttachCallBack] ����װ������,itemset.txt��7�����Զ��庯����. <br/>
--- LUA_det �� [ItemStringDetachCallBack] ����ж�´���,itemset.txt��8�����Զ��庯����. <br/>
--- LUA_drop   [ItemStringDropCallBack]���߶���ʱ����,itemset.txt��9�����Զ��庯����. <br/>
--- LUA_prepick   [ItemStringPrePickUpCallBack]����ʰȡǰ����,itemset.txt��10�����Զ��庯����. <br/>
--- LUA_pick  [ItemStringPickUpCallBack]����ʰȡ�󴥷�,itemset.txt��11�����Զ��庯����. 
function NL.RegItemString(Dofile, InitFuncName, ItemSigh) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���index����ֵ��Lua���洫�ݸ���������
function ItemStringInitCallBack(CharIndex, ItemIndex) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param TargetCharIndex  number ����ʹ��Ŀ��Ķ���index��������ʹ������CharIndexֵ��ͬ����ֵ��Lua���洫�ݸ���������
---@param ItemSlot  number ��Ӧ�¼��ĵ������ڵ���λ����Χ8-27����ֵ��Lua���洫�ݸ���������
---@return number @����0����
function ItemStringUseCallBack(CharIndex, TargetCharIndex, ItemSlot) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param FromItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return number @����ֵС��0��ȡ������װ��,���ش��ڵ���0������װ����
function ItemStringAttachCallBack(CharIndex, FromItemIndex) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param FromItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
function ItemStringDetachCallBack(CharIndex, FromItemIndex) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
function ItemStringDropCallBack(CharIndex, ItemIndex) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0��ȡ������ʹ��,���ش��ڵ���0������ʰȡ���ߡ�
function ItemStringPrePickUpCallBack(CharIndex, ItemIndex) end

---ItemString�Ļص�����
---[@group NL.RegItemString]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
function ItemStringPickUpCallBack(CharIndex, ItemIndex) end

---����һ������������е��߳�ʼ��ʱ�ͻᴥ����Lua����,�˺�����������渺��,�����ʹ��!
---[@group NL.RegItemInitEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua���������� 
---ֻҪע���˱��¼�,���ܵ����Ƿ����Init����,���������ᴥ��.
---������������:  ��ҵ�½, �������ȡ�µ���, ������, �򿪹���ֿ⡣
function NL.RegItemInitEvent(Dofile, InitFuncName) end

---ItemInitEvent�Ļص�����
---[@group NL.RegItemInitEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���index����ֵ��Lua���洫�ݸ���������
function ItemInitCallBack(CharIndex, ItemIndex) end

---����һ���������ʹ�õ���(����ս����)�ͻᴥ����Lua������
---[@group NL.RegItemUseEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemUseEvent(Dofile, InitFuncName) end

---ItemUseEvent�Ļص�����
---[@group NL.RegItemUseEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param TargetCharIndex  number ����ʹ��Ŀ��Ķ���index��������ʹ������CharIndexֵ��ͬ����ֵ��Lua���洫�ݸ���������
---@param ItemSlot  number ��Ӧ�¼��ĵ������ڵ���λ����Χ8-27����ֵ��Lua���洫�ݸ���������
---@return number @����ֵС��0��ȡ������ʹ��,���ش��ڵ���0������ʹ�á�
function ItemUseCallBack(CharIndex, TargetCharIndex, ItemSlot) end

---����һ���������װ������ʱ�ͻᴥ����Lua������
---[@group NL.RegItemAttachEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemAttachEvent(Dofile, InitFuncName) end

---ItemAttachEvent�Ļص�����
---[@group NL.RegItemAttachEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param FromItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return number @����ֵС��0��ȡ������ʹ��,���ش��ڵ���0������ʹ�á�
function ItemAttachCallBack(CharIndex, FromItemIndex) end

---����һ���������ж��װ������ʱ�ͻᴥ����Lua������
---[@group NL.RegItemDetachEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemDetachEvent(Dofile, InitFuncName) end

---ItemDetachEvent�Ļص�����
---[@group NL.RegItemDetachEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param FromItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
function ItemDetachCallBack(CharIndex, FromItemIndex) end

---����һ��������Ҷ�������ʱ�ͻᴥ����Lua������
---[@group NL.RegItemDropEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemDropEvent(Dofile, InitFuncName) end

---ItemDropEvent�Ļص�����
---[@group NL.RegItemDropEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0�����ض���,���ش��ڵ���0������������
function ItemDropCallBack(CharIndex, ItemIndex) end

---����һ��������ҳɹ�ʰȡ����֮��ͻᴥ����Lua������
---[@group NL.RegItemPickUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemPickUpEvent(Dofile, InitFuncName) end

---ItemPickUpEvent�Ļص�����
---[@group NL.RegItemPickUpEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0������ʰȡ,���ش��ڵ���0������ʰȡ��
function ItemPickUpCallBack(CharIndex, ItemIndex) end

---����һ���������չʾ(��Ϣ)����ͻᴥ����Lua������
---[@group NL.RegPetFieldEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPetFieldEvent(Dofile, InitFuncName) end

---PetFieldEvent�Ļص�����
---[@group NL.RegPetFieldEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param PetIndex  number ��չʾ(��Ϣ)����Ķ���index����ֵ��Lua���洫�ݸ���������
---@param PetPos  number ��չʾ(��Ϣ)�ĳ���������λ����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0������չʾ,���ش��ڵ���0������չʾ(��Ϣ)��
function PetFieldCallBack(CharIndex, PetIndex, PetPos) end

---����һ��������Ҷ�������ͻᴥ����Lua������
---[@group NL.RegPetDropEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPetDropEvent(Dofile, InitFuncName) end

---PetDropEvent�Ļص�����
---[@group NL.RegPetDropEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param PetPos  number �������ĳ���������λ����ֵ��Lua���洫�ݸ���������
---@return number @����ֵС��0�����ض���,���ش��ڵ���0������������
function PetDropCallBack(CharIndex, PetPos) end

---����һ��������Ҽ������ͻᴥ����Lua������
---[@group NL.RegPetPickUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPetPickUpEvent(Dofile, InitFuncName) end

---PetPickUpEvent�Ļص�����
---[@group NL.RegPetPickUpEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param PetIndex  number Ҫ�������Ķ�����������ֵ��Lua���洫�ݸ���������
---@return number @����ֵС��0������ʰȡ,���ش��ڵ���0���������ʰȡ����(����ǿ��ʰȡ)��
function PetPickUpCallBack(CharIndex, PetIndex) end

---ս���м����˺�ʱ�ᴥ���ú���
---[@group NL.RegDamageCalculateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[DamageCalculateCallBack]
function NL.RegDamageCalculateEvent(Dofile, InitFuncName) end

---DamageCalculateEvent�Ļص�����
---[@group NL.RegDamageCalculateEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index�������ߣ�����ֵ��Lua���洫�ݸ���������
---@param DefCharIndex  number ��Ӧ�¼��Ķ���index�������ߣ�����ֵ��Lua���洫�ݸ���������
---@param OriDamage  number δ�����˺�����ֵ��Lua���洫�ݸ���������
---@param Damage  number �����˺�����ʵ�˺�������ֵ��Lua���洫�ݸ���������
---@param BattleIndex  number ��ǰս��index����ֵ��Lua���洫�ݸ���������
---@param Com1  number ������ʹ�õĄ�����̖����ֵ��Lua���洫�ݸ���������
---@param Com2  number �����߹���������Ŀ�ˌ����λ�ã���ֵ��Lua���洫�ݸ���������
---@param Com3  number ������ʹ�õ���������tech��ID����ֵ��Lua���洫�ݸ���������
---@param DefCom1  number ������ʹ�õĄ�����̖����ֵ��Lua���洫�ݸ���������
---@param DefCom2  number �����߹���������Ŀ�ˌ����λ�ã���ֵ��Lua���洫�ݸ���������
---@param DefCom3  number ������ʹ�õ���������tech��ID����ֵ��Lua���洫�ݸ���������
---@param Flg  number �˺�ģʽ������鿴CONST.DamageFlags
---@param ExFlg  number �˺�ģʽ2������鿴CONST.DamageFlagsEx
---@return number @�˺�ֵ
function DamageCalculateCallBack(CharIndex, DefCharIndex, OriDamage, Damage, BattleIndex, Com1, Com2, Com3, DefCom1, DefCom2, DefCom3, Flg, ExFlg) end

---���ܸ��Ӳ�����ȡʱ�����ĺ���
---[@group NL.RegTechOptionEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[TechOptionCallBack]
function NL.RegTechOptionEvent(Dofile, InitFuncName) end

---TechOptionEvent�Ļص�����
---[@group NL.RegTechOptionEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param Option  string ��Ӧ�¼��ļ��ܵ�Option�ֶΣ���ֵ��Lua���洫�ݸ���������
---@param TechID  number ��ǰ���ܵ�Tech ID����ֵ��Lua���洫�ݸ���������
---@param Val  number ��Ӧ�ֶε�ֵ����ֵ��Lua���洫�ݸ���������
---@return number @�µ�ֵ
function TechOptionCallBack(CharIndex, Option, TechID, Val) end

---����һ�����н�ɫ��ʾͷ��Ч����ʱ�򴥷��ĺ�����
---[@group NL.RegHeadCoverEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[HeadCoverEventCallBack]
function NL.RegHeadCoverEvent(Dofile, InitFuncName) end

---HeadCoverEvent�Ļص�����
---[@group NL.RegHeadCoverEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param CurrentHeadCoverImage  number �ö���ǰ��ͷ��ͼ��id����ֵ��Lua���洫�ݸ���������
---@return number @�����µ�ͷ��ͼ��id���粻������򷵻�CurrentHeadCoverImage����
function HeadCoverEventCallBack(CharIndex, CurrentHeadCoverImage) end

---����һ��������ҽ�ɫְҵ����ʱ������Lua�������������Ϸ�н�ɫְҵ������Ϳɴ����������������ض�ְҵ�ȼ������ض���������¼��ҳ弶�ٶ����еȡ�
---[@group NL.RegRankUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ������Lua���������ƣ��ú�����������ʽ��ο�[RankUpCallBack]
function NL.RegRankUpEvent(Dofile, InitFuncName) end

---RankUpEvent�Ļص�����
---[@group NL.RegRankUpEvent]
---@param CharIndex  number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ���������
---@param OldRank  number ��Ӧ�¼��Ķ���ǰְҵ�ȼ�����ֵ��Lua���洫�ݸ���������
---@param NewRank  number ��Ӧ�¼��Ķ���ְҵ�������ְҵ�ȼ�����ֵ��Lua���洫�ݸ���������
---@return number @����ֵ���ڵ���0�������,����ֵΪ�����ܾ��˴ν�����
function RankUpCallBack(CharIndex, OldRank, NewRank) end

---����һ��������ĳ��ﱻϵͳɾʱ�ᴥ�����¼������ô��¼����Խ����ӳ��ó����ɾ��ʱ��Ȳ�����
---[@group NL.RegPetTimeDeleteEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPetTimeDeleteEvent(Dofile, InitFuncName) end

---PetTimeDeleteEvent�Ļص�����
---[@group NL.RegPetTimeDeleteEvent]
---@param PetIndex  number ����ʱ��ĳ�����������ֵ��Lua���洫�ݸ���������
---@return number @����ֵС�ڵ���0���������ɾ���� | ���ش���0��ó����ɾ��ʱ�佫�ᱻ�ӳ�������ֵ�趨��������ɾ����
function PetTimeDeleteCallBack(PetIndex) end

---����һ��ս��͵Ϯ֮ǰ�������¼������ô��¼����Ըı�ս����͵Ϯ��ʽ
---[@group NL.RegBattleSurpriseEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleSurpriseEvent(Dofile, InitFuncName) end

---BattleSurpriseEvent�Ļص�����
---[@group NL.RegBattleSurpriseEvent]
---@param battleIndex number ս����index
---@param result number �˴�ս����͵Ϯ��ʽ 0��͵Ϯ��1͵Ϯ��2��͵Ϯ
---@return number @����0��͵Ϯ������1͵Ϯ������2��͵Ϯ
function BattleSurpriseCallBack(battleIndex, result) end

---����һ������ʩ���ٻ�ʱ�������¼������ô��¼����Ըı��ٻ��������͵ȼ�
---[@group NL.RegBattleSummonEnemyEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleSummonEnemyEvent(Dofile, InitFuncName) end

---BattleSummonEnemyEvent�Ļص�����
---[@group NL.RegBattleSummonEnemyEvent]
---@param battleIndex number ս����index
---@param charIndex number ʩ���ٻ���ɫ��index
---@param enemyId number �ٻ���enemyId
---@return number @�����±�� {enemyId���ȼ����ȼ�����}
function BattleSummonEnemyCallBack(battleIndex, charIndex, enemyId) end

---����һ���ٻ�������ǰ�������¼������ô��¼����Ըı��ٻ��������
---[@group NL.RegBattleSummonedEnemyEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleSummonedEnemyEvent(Dofile, InitFuncName) end

---BattleSummonedEnemy�Ļص�����
---[@group NL.RegBattleSummonedEnemyEvent]
---@param battleIndex number ս����index
---@param actionCharIndex number ʩ���ٻ���ɫ��index
---@param charIndex number ���ٻ���ɫ��index
function BattleSummonedEnemyCallBack(battleIndex, actionCharIndex, charIndex) end

---����һ����ս����ǰ�������¼������ô��¼����Ըı���ս�Ĺ���͵ȼ�
---[@group NL.RegBattleNextEnemyEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleNextEnemyEvent(Dofile, InitFuncName) end

---BattleNextEnemy�Ļص�����
---[@group NL.RegBattleNextEnemyEvent]
---@param battleIndex number ս����index
---@param flg number lua��ս����
---@return number[]|nil @�����±��{enmeyId,�ȼ�,...}��10-19��λ�����У�����nilȡ����ս
function BattleNextEnemyCallBack(battleIndex, flg) end

---����һ����սħ������ǰ�������¼������ô��¼����Ըı���սħ�������
---[@group NL.RegBattleNextEnemyInitEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleNextEnemyInitEvent(Dofile, InitFuncName) end

---BattleNextEnemyInit�Ļص�����
---[@group NL.RegBattleNextEnemyInitEvent]
---@param battleIndex number ս����index
---@param flg number lua��ս����
function BattleNextEnemyInitCallBack(battleIndex, flg) end

---����һ������aiִ��ǰ�������¼�
---[@group NL.RegBeforeBattleTurnEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBeforeBattleTurnEvent(Dofile, InitFuncName) end

---BeforeBattleTurnEvent�Ļص�����
---[@group NL.RegBeforeBattleTurnEvent]
---@param battleIndex number ս����index
function BeforeBattleTurnCallBack(battleIndex) end

---����һ������ָ���Ѿ�λ�������¼�
---[@group NL.RegBeforeBattleTurnStartEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBeforeBattleTurnStartEvent(Dofile, InitFuncName) end

---BeforeBattleTurnStartevent�Ļص�����
---[@group NL.RegBeforeBattleTurnStartEvent]
---@param battleIndex number ս����index
function BeforeBattleTurnStartCallBack(battleIndex) end

---����һ���غϽ����������¼�
---[@group NL.RegAfterBattleTurnEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegAfterBattleTurnEvent(Dofile, InitFuncName) end

---AfterBattleTurnevent�Ļص�����
---[@group NL.RegAfterBattleTurnEvent]
---@param battleIndex number ս����index
function AfterBattleTurnCallBack(battleIndex) end

---����һ����ɫ���Լ��㴥�����¼�(����װ������)
---[@group NL.RegAfterCalcCharaBpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegAfterCalcCharaBpEvent(Dofile, InitFuncName) end

---AfterCalcCharaBpevent�Ļص�����
---[@group NL.RegAfterCalcCharaBpEvent]
---@param charIndex number ��ɫ��index
function AfterCalcCharaBpCallBack(charIndex) end

---����һ����ɫװ�����㴥�����¼�(�������ˣ�����)
---[@group NL.RegAfterCalcCharaStatusEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegAfterCalcCharaStatusEvent(Dofile, InitFuncName) end

---AfterCalcCharaStatusevent�Ļص�����
---[@group NL.RegAfterCalcCharaStatusEvent]
---@param charIndex number ��ɫ��index
function AfterCalcCharaStatusCallBack(charIndex) end

---����һ����ɫ�������Եĵ��¼�
---[@group NL.RegStatusCalcEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegStatusCalcEvent(Dofile, InitFuncName) end

---StatusCalcEvent�Ļص�����
---[@group NL.RegStatusCalcEvent]
---@param charIndex number ��ɫ��index
function StatusCalcCallBack(charIndex) end

---����һ������ִ��AI�������¼�
---[@group NL.RegEnemyCommandEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegEnemyCommandEvent(Dofile, InitFuncName) end

---EnemyCommandEvent�Ļص�����
---[@group NL.RegEnemyCommandEvent]
---@param battleIndex number ս����index
---@param side number 0 Ϊ�·���1λ�Ϸ�
---@param slot number ս����վλ
---@param action number ���غ��ж�������
function EnemyCommandCallBack(battleIndex, side, slot, action) end

---����һ������(�������� A|B��)����ǰ�Ĵ����¼�
---[@group NL.RegCheckDummyDollEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegCheckDummyDollEvent(Dofile, InitFuncName) end

---CheckDummyDollEvent�Ļص�����
---[@group NL.RegCheckDummyDollEvent]
---@param charIndex number ��ɫ��index
---@param battleIndex number ս����index
---@param dmg number �ܵ����˺�
---@param type number �˺�����
---@return number @����1����ʹ�����ޣ�����0��������
function CheckDummyDoll(charIndex, battleIndex, dmg, type) end

---����һ������ʱ�������¼�
---[@group NL.BattleInjuryCallBack]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleInjuryEvent(Dofile, InitFuncName) end

---BattleInjuryEvent�Ļص��¼�
---[@group NL.BattleInjuryCallBack]
---@param fIndex number �����ߵ�index
---@param aIndex number �����ߵ�index
---@param battleIndex number ս����index
---@param inject number ���˳̶�
---@return any @�������˳̶ȣ���Χ0~100
function BattleInjuryCallBack(fIndex, aIndex, battleIndex, inject) end

---����һ��ս�����㻭�����ʱ�������¼�
---[@group NL.RegResetCharaBattleStateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegResetCharaBattleStateEvent(Dofile, InitFuncName) end

---ResetCharaBattleStateEvent�Ļص�����
---[@group NL.RegResetCharaBattleStateEvent]
---@param battleIndex number ս����index
function ResetCharaBattleStateCallBack(battleIndex) end

---����һ����ɫ����󴥷����¼�
---[@group NL.RegCharaSavedEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegCharaSavedEvent(Dofile, InitFuncName) end

---CharaSavedEvent�Ļص�����
---[@group NL.RegCharaSavedEvent]
---@param charIndex number ��ɫ��index
function CharaSavedCallBack(charIndex) end

---����һ����ɫ���ݱ���ǰ�������¼�
---[@group NL.RegBeforeCharaSaveEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBeforeCharaSaveEvent(Dofile, InitFuncName) end

---BeforeCharaSave�Ļص�����
---[@group NL.RegBeforeCharaSaveEvent]
---@param charIndex number ��ɫ��index
function BeforeCharaSaveCallBack(charIndex) end

---����һ����ɫɾ��ʱ�������¼�
---[@group NL.RegCharaDeletedEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegCharaDeletedEvent(Dofile, InitFuncName) end

---CharaDeleted�Ļص�����
---[@group NL.RegCharaDeletedEvent]
---@param cdkey string ��ɫ��cdkey
---@param registnumber number ��ɫ��ע���
---@param result number �ɹ�Ϊ1, ����Ϊʧ��
function CharaDeletedCallBack(cdkey, registnumber, result) end

---����һ��luac�������¼�
---[@group NL.RegScriptCallEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua���������ƣ��ο�[ScriptCallCallBack]
function NL.RegScriptCallEvent(Dofile, InitFuncName) end

---ScriptCallEvent�Ļص�����
---[@group NL.RegScriptCallEvent]
---@param npcIndex number ����npc��index
---@param playerIndex number ��ɫ��index
---@param text string ��luac������ַ���
---@param msg string ���ִ������ַ������ο�ͷĿ����
---@return number @������ֵ�����ظ�data
function ScriptCallCallBack(npcIndex, playerIndex, text, msg) end

---����һ����Ʒ���ʵ��¼�
---[@group NL.RegDropRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegDropRateEvent(Dofile, InitFuncName) end

---DropRateEvent�Ļص�����
---[@group NL.RegDropRateEvent]
---@param enemyIndex number ħ��index
---@param itemId number
---@param rate number ������
function DropRateCallBack(enemyIndex, itemId, rate) end

---����һ������ʱ�������¼�
---[@group NL.RegBattleEscapeEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleEscapeEvent(Dofile, InitFuncName) end

---BattleEscapeEvent�Ļص�����
---[@group NL.RegBattleEscapeEvent]
---@param battleIndex number ս����index
---@param charIndex number ʩ���ٻ���ɫ��index
---@param rate number ���ܽṹ, �ɹ�Ϊ1, 0Ϊʧ��
---@return number @���ܽṹ, �ɹ�Ϊ1, 0Ϊʧ��
function BattleEscape(battleIndex, charIndex, rate) end

---����һ����ӡʱ�������¼������¼�����ͻ�Ʒ��������趨
---[@group NL.RegBattleSealRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleSealRateEvent(Dofile, InitFuncName) end

---BattleSealRateEvent�Ļص�����
---[@group NL.RegBattleSealRateEvent]
---@param battleIndex number ս����index
---@param charIndex number ʩ�ŷ�ӡ��ɫ��index
---@param enemyIndex number ��ӡ��ħ��index
---@param rate number ��ӡ�ɹ���
---@return number @�ɹ���
function BattleSealRateCallBack(battleIndex, charIndex, enemyIndex, rate) end

---����һ������ʱ�������¼�
---[@group NL.RegCalcCriticalRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegCalcCriticalRateEvent(Dofile, InitFuncName) end

---CalcCriticalRateEvent�Ļص�����
---[@group NL.RegCalcCriticalRateEvent]
---@param aIndex number �����ߵ�index
---@param fIndex number �����ߵ�index
---@param rate number ��ɱ��
---@return number @��ɱ��
function CalcCriticalRateCallBack(aIndex, fIndex, rate) end

---����һ������ʱ�������¼�
---[@group NL.RegBattleDodgeRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleDodgeRateEvent(Dofile, InitFuncName) end

---BattleDodgeRateEvent�Ļص�����
---[@group NL.RegBattleDodgeRateEvent]
---@param battleIndex number ս����index
---@param aIndex number �����ߵ�index
---@param fIndex number �����ߵ�index
---@param rate number ������
---@return number @������
function BattleDodgeRateCallBack(battleIndex, aIndex, fIndex, rate) end

---����һ������ʱ�������¼�
---[@group NL.RegBattleCounterRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleCounterRateEvent(Dofile, InitFuncName) end

---BattleCounterRateEvent�Ļص�����
---[@group NL.RegBattleCounterRateEvent]
---@param battleIndex number ս����index
---@param aIndex number �����ߵ�index
---@param fIndex number �����ߵ�index
---@param rate number ������
---@return number @������
function BattleCounterRateCallBack(battleIndex, aIndex, fIndex, rate) end

---����һ�����ħ���˺��������¼������ڸı�ħ���˺�ϵ��
---[@group NL.RegBattleMagicDamageRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleMagicDamageRateEvent(Dofile, InitFuncName) end

---BattleMagicDamageRateEvent�Ļص�����
---[@group NL.RegBattleMagicDamageRateEvent]
---@param battleIndex number ս����index
---@param aIndex number �����ߵ�index
---@param fIndex number �����ߵ�index
---@param rate number ħ��ϵ��
---@return number @ħ��ϵ��
function BattleMagicDamageRateCallBack(battleIndex, aIndex, fIndex, rate) end

---����һ�����ħ���˺��������¼������ڸı�ħ��ϵ��
---[@group NL.RegBattleMagicRssRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleMagicRssRateEvent(Dofile, InitFuncName) end

---BattleMagicRssRateEvent�Ļص�����
---[@group NL.RegBattleMagicRssRateEvent]
---@param battleIndex number ս����index
---@param aIndex number �����ߵ�index
---@param fIndex number �����ߵ�index
---@param rate number ħ��ϵ��
---@return number @ħ��ϵ��
function BattleMagicRssRateCallBack(battleIndex, aIndex, fIndex, rate) end

---����һ���������ɴ������¼�
---[@group NL.RegItemBoxGenerateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemBoxGenerateEvent(Dofile, InitFuncName) end

---ItemBoxGenerateEvent�Ļص�����
---[@group NL.RegItemBoxGenerateEvent]
---@param mapId number �������ڵ�ͼ����
---@param floor number �������ڵ�ͼ
---@param itemBoxType number ����itemId
---@param adm number Ӱ�������Ʒ������δ֪
---@return number[] @���ر������ {itemBoxType, adm}
function ItemBoxGenerateCallback(mapId, floor, itemBoxType, adm) end

---����һ�������ȡ��Ʒ���¼�
---[@group NL.RegItemBoxLootEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemBoxLootEvent(Dofile, InitFuncName) end

---ItemBoxLootEvent�Ļص�����
---[@group NL.RegItemBoxLootEvent]
---@param charaIndex number �����Ʒ�Ľ�ɫ
---@param mapId number charaIndex��ͼ����
---@param floor number charaIndex��ͼ
---@param X number charaIndex X����
---@param Y number charaIndex Y����
---@param boxType number ����itemId
---@param adm number
---@return number @number ����1����Ĭ����Ʒ, ����0������
function ItemBoxLootCallback(charaIndex, mapId, floor, X, Y, boxType, adm) end

---����һ���������и��ʵ��¼�
---[@group NL.RegItemBoxEncountRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemBoxEncountRateEvent(Dofile, InitFuncName) end

---ItemBoxEncountRateEvent�Ļص�����
---[@group NL.RegItemBoxEncountRateEvent]
---@param charaIndex number
---@param mapId number
---@param floor number
---@param X number
---@param Y number
---@param itemIndex number ������Ʒindex
---@return number @���и���
function ItemBoxEncountRateEventCallback(charaIndex, mapId, floor, X, Y, itemIndex) end

---����һ���������е��¼�
---[@group NL.RegItemBoxEncountEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemBoxEncountEvent(Dofile, InitFuncName) end

---ItemBoxEncountEvent�Ļص�����
---[@group NL.RegItemBoxEncountEvent]
---@param charaIndex number ������Ľ�ɫ
---@param mapId number charaIndex��ͼ����
---@param floor number charaIndex��ͼ
---@param X number charaIndex X����
---@param Y number charaIndex Y����
---@param itemIndex number ����index
---@return number[]|nil @�������� ÿ������3���������ֱ�Ϊ id���ȼ�������ȼ��� ����nil�����أ� ���ӣ� {0, 100, 5, 1, 1, 0} ����0�Ź���100-105����1�Ź���1��
function ItemBoxEncountCallback(charaIndex, mapId, floor, X, Y, itemIndex) end

---����һ�������˺������¼�
---[@group NL.RegTribeRateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegTribeRateEvent(Dofile, InitFuncName) end

---ItemTribeRateEvent�Ļص�����
---[@group NL.RegTribeRateEvent]
---@param a number ��������
---@param b number ��������
---@param rate number ���Ʊ���
---@return number @�����µĿ��Ʊ���
function TribeRateCallback(a, b, rate) end

---����һ��Http�����¼�
---[@group NL.RegHttpRequestEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegHttpRequestEvent(Dofile, InitFuncName) end

---HttpRequestEvent�Ļص�����
---[@group NL.RegHttpRequestEvent]
---@param method string
---@param api string API����
---@param params {string:string} ����
---@param body string body����
---@return string @��������
function HttpRequestCallBack(method, api, params, body) end

---����һ������ʱ�������¼�
---[@group NL.RegBattleHealCalculateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegBattleHealCalculateEvent(Dofile, InitFuncName) end

---BattleHealCalculate�Ļص�����
---[@group NL.RegBattleHealCalculateEvent]
---@param charIndex  number ��Ӧ�¼��Ķ���index�������ߣ�����ֵ��Lua���洫�ݸ���������
---@param defCharIndex  number ��Ӧ�¼��Ķ���index�������ߣ�����ֵ��Lua���洫�ݸ���������
---@param oriheal  number δ�������ƣ���ֵ��Lua���洫�ݸ���������
---@param heal  number �������ƣ���ʵ���ƣ�����ֵ��Lua���洫�ݸ���������
---@param battleIndex  number ��ǰս��index����ֵ��Lua���洫�ݸ���������
---@param com1  number ������ʹ�õĄ�����̖����ֵ��Lua���洫�ݸ���������
---@param com2  number �����߹���������Ŀ�ˌ����λ�ã���ֵ��Lua���洫�ݸ���������
---@param com3  number ������ʹ�õ���������tech��ID����ֵ��Lua���洫�ݸ���������
---@param defCom1  number ������ʹ�õĄ�����̖����ֵ��Lua���洫�ݸ���������
---@param defCom2  number �����߹���������Ŀ�ˌ����λ�ã���ֵ��Lua���洫�ݸ���������
---@param defCom3  number ������ʹ�õ���������tech��ID����ֵ��Lua���洫�ݸ���������
---@param flg  number �˺�ģʽ������鿴CONST.HealDamageFlags
---@param ExFlg  number �˺�ģʽ2������鿴CONST.DamageFlagsEx
---@return number @����ֵ
function BattleHealCalculateCallBack(charIndex, defCharIndex, oriheal, heal, battleIndex, com1, com2, com3, defCom1, defCom2, defCom3, flg, ExFlg) end

---����һ����ħʱ�������¼�
---[@group NL.RegCalcFpConsumeEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegCalcFpConsumeEvent(Dofile, InitFuncName) end

---CalcFpConsume�Ļص�����
---[@group NL.RegCalcFpConsumeEvent]
---@param charIndex number ��ɫ��index
---@param techId number ����id
---@param Fp number ��ħ��ֵ
---@return number @��ħ��ֵ
function CalcFpConsumeCallBack(charIndex, techId, Fp) end

---����һ��װ��˵�����¼��������޸���Ʒ˵��
---[@group NL.RegItemExpansionEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemExpansionEvent(Dofile, InitFuncName) end

---ItemExpansion�Ļص�����
---[@group NL.RegItemExpansionEvent]
---@param itemIndex number
---@param type number 1��Ʒ˵����2�Ҽ�˵��
---@param msg string ��Ʒ˵������
---@param charIndex number
---@param slot number ����λ��
---@return string @��Ʒ˵��
function ItemExpansionCallBack(itemIndex, type, msg, charIndex, slot) end

---����һ�����ƺŴ������¼�������ͨ��lua�Զ���ƺţ����巽ʽ��titleconfig.txt���������������ã�ʹ��LUAΪ�����ؼ��֣���LUA=50,=��ӦFlg�е�5,50��ӦData
---[@group NL.RegTitleCheckCallEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegTitleCheckCallEvent(Dofile, InitFuncName) end

---TitleCheckCallEvent�Ļص�����
---[@group NL.RegTitleCheckCallEvent]
---@param charIndex number ��ɫ��index
---@param Data number ������ֵ
---@param Flg number �����ж��� 0: <=�� 1: >=�� 2: <>�� 3: >�� 4: <�� 5: =
---@return number @����0�ƺ����������㣬����1�ƺ���������
function TitleCheckCallCallBack(charIndex, Data, Flg) end

---����һ���ɼ������¼�
---[@group NL.RegGatherItemEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[GatherItemEventCallback]
function NL.RegGatherItemEvent(Dofile, InitFuncName) end

---GatherItemEvent�Ļص�����
---[@group NL.RegGatherItemEvent]
---@param charIndex number ��ɫ��index
---@param skillId number ����id
---@param skillLv number ���ܵȼ�
---@param itemNo number �ɼ���Id,�ο�itemset.txt
---@return number @���زɼ����Id���ο�itemset.txt | ��д����ֵʱ�ɼ�ΪĬ�Ͻ��
function GatherItemEventCallback(charIndex, skillId, skillLv, itemNo) end

---��������е�ʱ�򴥷�������ͨ������ӿ����޸����еĶ��к�������
---[@group NL.RegVSEnemyCreateEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[VSEnemyCreateEventCallback]
function NL.RegVSEnemyCreateEvent(Dofile, InitFuncName) end

---VSEnemyCreateEvent�Ļص�����
---[@group NL.RegVSEnemyCreateEvent]
---@param CharIndex number ��Ӧ�¼��Ķ���index����ֵ��Lua���洫�ݸ�������
---@param GroupIndex number ��Ӧ�¼���ս������group ID����ֵ��Lua���洫�ݸ���������
---@param EnemyNum number ��Ӧ�¼���ս��������������ֵ��Lua���洫�ݸ���������
---@param EnemyList number[] ��Ӧ�¼���ս�����ж��У���ֵ��Lua���洫�ݸ���������
---@return number[] @�����µ����ж��м��ɣ������޸ķ���EnemyList��������Table��ֵ���ɡ�
function VSEnemyCreateEventCallback(CharIndex, GroupIndex, EnemyNum, EnemyList) end

---��ҹ���ʱ�����������޸Ĺ���Ŀ�꣨���䡢�����ȣ���
---[@group NL.RegBattleActionTargetEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[BattleActionTargetEventCallback]
function NL.RegBattleActionTargetEvent(Dofile, InitFuncName) end

---BattleActionTargetEvent�Ļص�����
---[@group NL.RegBattleActionTargetEvent]
---@param charIndex number ����index
---@param battleIndex number ս��Index
---@param com1 number COM1���������
---@param com2 number COM2����ѡĿ��
---@param com3 number COM3��һ����TechId
---@param targetList number[] ��Ӧ�¼���Ŀ��λ�ö���
---@return number[] @�����µ�Ŀ��λ�ã������޸ķ���targetList��������Table��ֵ���ɡ�
function BattleActionTargetEventCallback(charIndex, battleIndex, com1, com2, com3, targetList) end

---���Ƽ����Ƿ����ʹ���¼�
---[@group NL.RegBattleSkillCheckEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[BattleSkillCheckEventCallback]
function NL.RegBattleSkillCheckEvent(Dofile, InitFuncName) end

---BattleSkillCheckEvent�Ļص�����
---[@group NL.RegBattleSkillCheckEvent]
---@param charIndex number ����index
---@param battleIndex number ս��Index
---@param arrayOfSkillEnable number[] ��Ӧ�ļ����Ƿ���ã�1Ϊ���ã�0Ϊ������
---@return number[] @���ض�Ӧ�ļ����Ƿ���ã�1Ϊ���ã�0Ϊ������
function BattleSkillCheckEventCallback(charIndex, battleIndex, arrayOfSkillEnable) end

---�Զ���lua���ܻص��¼�
---[@group NL.RegBattleLuaSkillEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[BattleLuaSkillEventCallback]
function NL.RegBattleLuaSkillEvent(Dofile, InitFuncName) end

---BattleLuaSkillEvent�Ļص�����
---[@group NL.RegBattleLuaSkillEvent]
---@param charIndex number ����index
---@param battleIndex number ս��Index
---@param SKLFunc function ����SKL���ܷ�������в�����ѡ,�ο�[SKLFunc]
---@param DMGFunc function �����˺�������ο�[DMGFunc]
function BattleLuaSkillEventCallback(battleIndex, charIndex, SKLFunc, DMGFunc) end

---����SKL���ܷ����֧��0-3������
---[@group NL.RegBattleLuaSkillEvent]
---@param TechId number ���ܱ��
---@param WeaponType number ������������
---@param AttackerPos number ������ս��λ��
function SKLFunc(TechId, WeaponType, AttackerPos) end

---����SKL���ܷ����֧��0-3������
---[@group NL.RegBattleLuaSkillEvent]
---@param TechId number ���ܱ��
---@param WeaponType number ������������
function SKLFunc(TechId, WeaponType) end

---����SKL���ܷ����֧��0-3������
---[@group NL.RegBattleLuaSkillEvent]
---@param TechId number ���ܱ��
function SKLFunc(TechId) end

---[@group NL.RegBattleLuaSkillEvent]
---����SKL���ܷ����֧��0-3������
function SKLFunc() end

---�����˺����
---[@group NL.RegBattleLuaSkillEvent]
---@param pos number Ŀ��λ��
---@param flg number ����Ч�����
---@param dmg number �˺�/������ֵ
function DMGFunc(pos, flg, dmg) end

---��Ʒ�;ñ仯�¼�
---[@group NL.RegItemDurabilityChangedEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[ItemDurabilityChangedEventCallback]
function NL.RegItemDurabilityChangedEvent(Dofile, InitFuncName) end

---ItemDurabilityChangedEvent�Ļص�����
---[@group NL.RegItemDurabilityChangedEvent]
---@param itemIndex number ItemIndex
---@param oldDurability number ԭ�����;�
---@param newDurability number �仯����;�
---@param value number �仯ֵ
---@param mode number 0����ս����ģ�1-2�;ã���1���������-50%��ǰ�;ã���2���ش����-10%����;ã���3װ���ƻ�����
---@return number @�µ�mode������modeΪ1��2ʱ����0ȡ����Ӧ��ʾ
function ItemDurabilityChangedEventCallback(itemIndex, oldDurability, newDurability, value, mode) end

---ս�����ս��Ʒ����Ʒ���¼�
---[@group NL.RegBattleGetProfitEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[BattleGetProfitEventCallback]
function NL.RegBattleGetProfitEvent(Dofile, InitFuncName) end


---BattleGetProfitEvent�Ļص�����
---[@group NL.RegBattleGetProfitEvent]
---@param battleIndex number ս��Index
---@param side number ����0��1
---@param pos number ������λ��0-9
---@param charaIndex number ��ɫIndex
---@param type number EXP = -1,DP = -2,ITEM1 = 0,ITEM2 = 1,ITEM3 = 2,
---@param reward number EXP/DPʱΪ��Ӧ����/DP��ITEM1/ITEM2/ITEM3ΪitemIndex
---@return number @�����޸ĺ�ľ���/DP/ItemIndex
function BattleGetProfitEventCallback(battleIndex, side, pos, charaIndex, type, reward) end


---ս�������ж����ȼ��¼�
---[@group NL.RegBattleCalcDexEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������,�ο�[BattleCalcDexEventCallback]
function NL.RegBattleCalcDexEvent(Dofile, InitFuncName) end


---BattleCalcDexEvent�Ļص�����
---[@group NL.RegBattleCalcDexEvent]
---@param battleIndex number ս��Index
---@param action number 0Ϊ1����1Ϊ2��
---@param charaIndex number ��ɫIndex
---@param flg number ����
---@param dex number �ж����ȼ�
---@return number @�����޸ĺ��dex
function BattleCalcDexEventCallback(battleIndex, charaIndex, action, flg, dex) end


---����һ��������Ҷ�������֮ǰ�ͻᴥ����Lua������
---[@group NL.RegPreItemDropEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPreItemDropEvent(Dofile, InitFuncName) end

---PreItemDropEvent�Ļص�����
---[@group NL.RegPreItemDropEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0�����ض���,���ش��ڵ���0������������
function PreItemDropCallBack(CharIndex, ItemIndex) end


---����һ��������ҳɹ�ʰȡ����֮ǰ�ͻᴥ����Lua������
---[@group NL.RegPreItemPickUpEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegPreItemPickUpEvent(Dofile, InitFuncName) end

---PreItemPickUpEvent�Ļص�����
---[@group NL.RegPreItemPickUpEvent]
---@param CharIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param ItemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@return any @����ֵС��0������ʰȡ,���ش��ڵ���0������ʰȡ��
function PreItemPickUpCallBack(CharIndex, ItemIndex) end

---����һ��������ҳɹ�ʰȡ����֮ǰ�ͻᴥ����Lua������
---[@group NL.RegItemConsumeEvent]
---@param Dofile?  string Ҫ���صĽű��ļ��������Ϊ��ǰ�ļ�������nil����
---@param InitFuncName  string ָ���Lua����������
function NL.RegItemConsumeEvent(Dofile, InitFuncName) end

---ItemConsumeEvent�Ļص�����
---[@group NL.RegItemConsumeEvent]
---@param charIndex  number ���������ߵĶ���index����ֵ��Lua���洫�ݸ���������
---@param itemIndex  number ��Ӧ�¼��ĵ���Index����ֵ��Lua���洫�ݸ���������
---@param slot  number ��Ӧ�¼��ĵ��ߵ�λ�ã���ֵ��Lua���洫�ݸ���������
---@param amount  number ��Ӧ�¼��ĵ��ߵ�������������ֵ��Lua���洫�ݸ���������
---@return number @��������
function ItemConsumeEventCallback(charIndex, itemIndex, slot, amount) end


---ɾ����Lua������NPC����Ҫע����ǣ�ɾ��NPC�󱾺������ὫNpcIndex��ֵ����Ϊnil�����ں��������д���NpcIndex��ֵ��
---@param NpcIndex  number Ҫɾ����Npc�Ķ���ָ��
---@return number @�����ɹ��򷵻� 1, ʧ���򷵻� 0
function NL.DelArgNpc(NpcIndex) end


---��ȡ����汾
---@return string @cgmsv
function NL.Ver() end


