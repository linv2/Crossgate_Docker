--  ***************************************************************************************************** --
--  code by http://www.cgmsv.com
--  ���ð汾 cgmsv���� ���а汾
--              #UPDATE LIST#
--  TYPE ***** TIME ***** Editor ***** Text 
-- CREATE   2018/12/22     Zack         ��������ί�е���
--                      *RegInit                    --ȫ�ֳ�ʼ���¼�
--                      *RegDelLoginEvent           --ȫ�ֵ����¼�
--                      *RegDelLoginGateEvent       --ȫ�ֵǻس��¼�
--                      *RegDelLogoutEvent          --ȫ�ֵǳ��¼�
--                      *RegDelTalkEvent            --ȫ�ֶԻ��¼�
--                      *RegDelLevelUpEvent         --ȫ����������¼�
--                      *RegDelBattleStartEvent     --ȫ��ս����ʼ�¼�
--                      *RegDelBattleOverEvent      --ȫ��ս�������¼�
--                      *RegDelWarpEvent            --ȫ�ִ����¼�
--                      *RegDelAfterWarpEvent       --�°�ȫ�ִ����¼�
--                      *RegDelDropEvent            --ȫ�ֵ����¼�
--                      *RegDelTitleChangedEvent    --ȫ����ҽ�ɫ�����ƺ��¼�
--                      *RegDelGetExpEvent          --ȫ�ֻ��ս�������¼�
--                      *RegDelBattleSkillExpEvent  --ȫ�ֻ��ս�����ܾ����¼�
--                      *RegDelProductSkillExpEvent --ȫ�ֻ���������ܾ����¼�
--                      *RegDelPetLevelUpEvent      --ȫ�ֳ��������¼�
--                      *RegDelBattleExitEvent      --ȫ��ս���뿪�¼�
--                      *RegDelRightClickEvent      --ȫ������һ�����¼�
--                      *RegDelShutDownEvent        --ȫ�ַ������ر��¼�
--                      *RegDelPartyEvent           --ȫ���������¼�
--                      *RegDelSealEvent            --ȫ����ҽ��г����ӡ�¼�
--                      *RegDelBattleActionEvent    --ȫ�����ս���з���ָ���¼�
--                      *RegDelCharActionEvent      --ȫ�����Action�¼�
--                      *RegDelMergeItemEvent       --ȫ�����ʹ�����������¼�
--                      *RegDelItemOverLapEvent     --ȫ����ҵ����ص��¼�
--                      *RegDelGetLoginPointEvent   --ȫ���û���¼ʱ��ȡ��½���¼�
--                      *RegDelItemString           --ȫ����Ʒ��ǩ�¼�
--                      *RegDelItemInitEvent        --ȫ����Ʒ��ʼ���¼�
--                      *RegDelItemUseEvent         --ȫ�����ʹ�õ���(����ս����)�¼�
--                      *RegDelItemAttachEvent      --ȫ�����װ�������¼�
--                      *RegDelItemDetachEvent      --ȫ�����ж��װ�������¼�
--                      *RegDelItemDropEvent        --ȫ����Ҷ��������¼�
--                      *RegDelItemPrePickUpEvent   --ȫ�����ʰȡ����֮ǰ�������¼�
--                      *RegDelItemPickUpEvent      --ȫ����ҳɹ�ʰȡ�����¼�
--                      *RegDelDamageCalculateEvent --ȫ��ս���м����˺��¼�
--                      *RegDelTechOptionEvent      --ȫ�ּ��ܸ��Ӳ�����ȡ�¼�
--                      *RegDelRankUpEvent          --ȫ����ҽ����¼�
--                      *RegDelAllOutEvent          --ȫ���뿪�¼�  /* ע����ί��֮ǰҲ�����DropEvent��LogoutEvent */
--  ***************************************************************************************************** --
--  ��δ֧��
--                     **RegDelGatherTechUsedEvent  --ȫ��ʹ�òɼ������¼�
--                     **RegDelVSEnemyCreateEvent   --ȫ����������¼�
--                     **RegDelMakeItemStringEvent  --ȫ�����ɵ��ߵĽ��������¼�
--                     **RegDelBattlePVPMaxHpEvent  --ȫ�ִ���һ��PKʱ��ʼ����ɫ�������ֵ�¼�
--                     **RegDelBattleNextEnemyEvent --����һ��ͨ��Battle.SetNextBattle���õ�ս����ս�¼�
--                     **RegDelHeadCoverEvent       --ȫ�����н�ɫ��ʾͷ��Ч���¼�
--  ***************************************************************************************************** --

tbl_delegate_Init = {};
tbl_delegate_LoginEvent = {};
tbl_delegate_LoginGateEvent = {};
tbl_delegate_LogoutEvent = {};
tbl_delegate_TalkEvent = {};
tbl_delegate_LevelUpEvent = {};
tbl_delegate_BattleStartEvent = {};
tbl_delegate_BattleOverEvent = {};
tbl_delegate_WarpEvent = {};
tbl_delegate_AfterWarpEvent = {};
tbl_delegate_DropEvent = {};
tbl_delegate_TitleChangedEvent = {};
tbl_delegate_GetExpEvent = {};
tbl_delegate_BattleSkillExpEvent = {};
tbl_delegate_ProductSkillExpEvent = {};
tbl_delegate_PetLevelUpEvent = {};
tbl_delegate_BattleExitEvent = {};
tbl_delegate_RightClickEvent = {};
tbl_delegate_ShutDownEvent = {};
tbl_delegate_PartyEvent = {};
tbl_delegate_SealEvent = {};
tbl_delegate_BattleActionEvent = {};
tbl_delegate_CharActionEvent = {};
tbl_delegate_MergeItemEvent = {};
tbl_delegate_ItemOverLapEvent = {};
tbl_delegate_GetLoginPointEvent = {};
tbl_delegate_ItemString = {};
tbl_delegate_ItemInit = {};
tbl_delegate_ItemUse = {};
tbl_delegate_ItemAttach = {};
tbl_delegate_ItemDetach= {};
tbl_delegate_ItemDrop = {};
tbl_delegate_ItemPrePickUp = {};
tbl_delegate_ItemPickUp = {};
tbl_delegate_DamageCalculateEvent = {};
tbl_delegate_TechOptionEvent = {};
tbl_delegate_RankUpEvent = {};
tbl_delegate_AllOutEvent = {};

tbl_delegate_GatherTechUsedEvent = {};
tbl_delegate_VSEnemyCreateEvent = {};
tbl_delegate_MakeItemStringEvent = {};
tbl_delegate_BattlePVPMaxHpEvent = {};
tbl_delegate_BattleNextEnemyEvent = {};
tbl_delegate_HeadCoverEvent = {};





Delegate =
{
	RegInit = function(FuncString) RegInit(FuncString) end;
  RegDelLoginEvent = function(FuncString) RegDelLoginEvent(FuncString) end;
  RegDelLoginGateEvent = function(FuncString) RegDelLoginGateEvent(FuncString) end;
  RegDelLogoutEvent = function(FuncString) RegDelLogoutEvent(FuncString) end;
  RegDelTalkEvent = function(FuncString) RegDelTalkEvent(FuncString) end;
  RegDelLevelUpEvent = function(FuncString) RegDelLevelUpEvent(FuncString) end;
  RegDelBattleStartEvent = function(FuncString) RegDelBattleStartEvent(FuncString) end;
  RegDelBattleOverEvent = function(FuncString) RegDelBattleOverEvent(FuncString) end;
  RegDelWarpEvent = function(FuncString) RegDelWarpEvent(FuncString) end;
  RegDelAfterWarpEvent = function(FuncString) RegDelAfterWarpEvent(FuncString) end;
  RegDelDropEvent = function(FuncString) RegDelDropEvent(FuncString) end;
  RegDelTitleChangedEvent= function(FuncString) RegDelTitleChangedEvent(FuncString) end;
  RegDelGetExpEvent = function(FuncString) RegDelGetExpEvent(FuncString) end;
  RegDelBattleSkillExpEvent= function(FuncString) RegDelBattleSkillExpEvent(FuncString) end;
  RegDelProductSkillExpEvent= function(FuncString) RegDelProductSkillExpEvent(FuncString) end;
  RegDelPetLevelUpEvent= function(FuncString) RegDelPetLevelUpEvent(FuncString) end;
  RegDelBattleExitEvent = function(FuncString) RegDelBattleExitEvent(FuncString) end;
  RegDelRightClickEvent = function(FuncString) RegDelRightClickEvent(FuncString) end;
  RegDelShutDownEvent = function(FuncString) RegDelShutDownEvent(FuncString) end;
  RegDelPartyEvent= function(FuncString) RegDelPartyEvent(FuncString) end;
  RegDelSealEvent= function(FuncString) RegDelSealEvent(FuncString) end;
  RegDelBattleActionEvent= function(FuncString) RegDelBattleActionEvent(FuncString) end;
  RegDelCharActionEvent= function(FuncString) RegDelCharActionEvent(FuncString) end;
  RegDelMergeItemEvent= function(FuncString) RegDelMergeItemEvent(FuncString) end;
  RegDelItemOverLapEvent= function(FuncString) RegDelItemOverLapEvent(FuncString) end;
  RegDelGetLoginPointEvent= function(FuncString) RegDelGetLoginPointEvent(FuncString) end;
  RegDelItemString = function(FuncString) RegDelItemString(FuncString) end;
  RegDelItemInit = function(FuncString) RegDelItemInitEvent(FuncString) end;
  RegDelItemUseEvent = function(FuncString) RegDelItemUseEvent(FuncString) end;
  RegDelItemAttachEvent = function(FuncString) RegDelItemAttachEvent(FuncString) end;
  RegDelItemDetachEvent = function(FuncString) RegDelItemDetachEvent(FuncString) end;
  RegDelItemDropEvent = function(FuncString) RegDelItemDropEvent(FuncString) end;
  RegDelItemPrePickUpEvent = function(FuncString) RegDelItemPrePickUpEvent(FuncString) end;
  RegDelItemPickUpEvent = function(FuncString) RegDelItemPickUpEvent(FuncString) end;
  RegDelDamageCalculateEvent= function(FuncString) RegDelDamageCalculateEvent(FuncString) end;
  RegDelTechOptionEvent= function(FuncString) RegDelTechOptionEvent(FuncString) end;
  RegDelRankUpEvent = function(FuncString) RegDelRankUpEvent(FuncString) end;
	RegDelAllOutEvent = function(FuncString) RegDelAllOutEvent(FuncString) end;
--������δ֧��--
	RegDelGatherTechUsedEvent = function(FuncString) RegDelGatherTechUsedEvent(FuncString) end;
  RegDelVSEnemyCreateEvent= function(FuncString) RegDelVSEnemyCreateEvent(FuncString) end;
  RegDelMakeItemStringEvent= function(FuncString) RegDelMakeItemStringEvent(FuncString) end;
  RegDelBattlePVPMaxHpEvent= function(FuncString) RegDelBattlePVPMaxHpEvent(FuncString) end;
  RegDelBattleNextEnemyEvent= function(FuncString) RegDelBattleNextEnemyEvent(FuncString) end;
  RegDelHeadCoverEvent= function(FuncString) RegDelHeadCoverEvent(FuncString) end;
};

--ע���ʼ���¼�ί��
function RegInit(FuncString)
	
   for _,v in ipairs(tbl_delegate_Init) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_Init,FuncString);
   return true;
end

--ע��ȫ�ֵ�¼�¼�ί��
function RegDelLoginEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LoginEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LoginEvent,FuncString);
   return true;
end

--ע��ȫ�ֵǳ��¼�ί��
function RegDelLogoutEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LogoutEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LogoutEvent,FuncString);
   return true;
end

--ע��ȫ�ֵǻس��¼�ί��
function RegDelLoginGateEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LoginGateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LoginGateEvent,FuncString);
   return true;
end

--ע��ȫ�ֶԻ��¼�ί��
function RegDelTalkEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_TalkEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_TalkEvent,FuncString);
   return true;
end

--ע��ȫ����������¼�ί��
function RegDelLevelUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LevelUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LevelUpEvent,FuncString);
   return true;
end

--ע��ȫ��ս����ʼ�¼�ί��
function RegDelBattleStartEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_BattleStartEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_BattleStartEvent,FuncString);
   return true;
end

--ע��ȫ��ս�������¼�ί��
function RegDelBattleOverEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_BattleOverEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_BattleOverEvent,FuncString);
   return true;
end

--ע��ȫ�ִ����¼�ί��
function RegDelWarpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_WarpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_WarpEvent,FuncString);
   return true;
end

function RegDelAfterWarpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_AfterWarpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_AfterWarpEvent,FuncString);
   return true;
end

--ע��ȫ�ֵ����¼�ί��
function RegDelDropEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_DropEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_DropEvent,FuncString);
   return true;
end

--ȫ����ҽ�ɫ�����ƺ��¼�
function RegDelTitleChangedEvent(FuncString)
   for _,v in ipairs(tbl_delegate_TitleChangedEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_TitleChangedEvent,FuncString);
   return true;
end

--ע��ȫ�ֻ��ս�������¼�ί��
function RegDelGetExpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_GetExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_GetExpEvent,FuncString);
   return true;
end

--ȫ�ֻ��ս�����ܾ����¼�
function RegDelBattleSkillExpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleSkillExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleSkillExpEvent,FuncString);
   return true;
end

--ȫ�ֻ���������ܾ����¼�
function RegDelProductSkillExpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_ProductSkillExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ProductSkillExpEvent,FuncString);
   return true;
end

--ȫ�ֳ��������¼�
function RegDelPetLevelUpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_PetLevelUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_PetLevelUpEvent,FuncString);
   return true;
end

--ע��ȫ��ս���˳��¼�ί��
function RegDelBattleExitEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_BattleExitEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleExitEvent,FuncString);
   return true;
end

--ע��ȫ������һ�����¼�ί��
function RegDelRightClickEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_RightClickEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_RightClickEvent,FuncString);
   return true;
end

--ע��ȫ�ַ������ر�ί��
function RegDelShutDownEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ShutDownEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ShutDownEvent,FuncString);
   return true;
end

--ȫ���������¼�
function RegDelPartyEvent(FuncString)
   for _,v in ipairs(tbl_delegate_PartyEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_PartyEvent,FuncString);
   return true;
end

--ȫ����ҽ��г����ӡ�¼�
function RegDelSealEvent(FuncString)
   for _,v in ipairs(tbl_delegate_SealEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_SealEvent,FuncString);
   return true;
end

--ȫ�����ս���з���ָ���¼�
function RegDelBattleActionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleActionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleActionEvent,FuncString);
   return true;
end

--ȫ�����Action�¼�
function RegDelCharActionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_CharActionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_CharActionEvent,FuncString);
   return true;
end

--ȫ�����ʹ�����������¼�
function RegDelMergeItemEvent(FuncString)
   for _,v in ipairs(tbl_delegate_MergeItemEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_MergeItemEvent,FuncString);
   return true;
end

--ȫ����ҵ����ص��¼�
function RegDelItemOverLapEvent(FuncString)
   for _,v in ipairs(tbl_delegate_ItemOverLapEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemOverLapEvent,FuncString);
   return true;
end

--ȫ���û���¼ʱ��ȡ��½���¼�
function RegDelGetLoginPointEvent(FuncString)
   for _,v in ipairs(tbl_delegate_GetLoginPointEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_GetLoginPointEvent,FuncString);
   return true;
end

--ע��ȫ����Ʒ��ǩί��
function RegDelItemString(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemString) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemString,FuncString);
   return true;
end

--ע��ȫ����Ʒ��ʼ���¼�
function RegDelItemInitEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemInit) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemInit,FuncString);
   return true;
end

--ע��ȫ�����ʹ�õ���(����ս����)�¼�
function RegDelItemUseEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemUse) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemUse,FuncString);
   return true;
end

--ע��ȫ�����װ�������¼�
function RegDelItemAttachEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemAttach) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemAttach,FuncString);
   return true;
end

--ע��ȫ�����ж��װ�������¼�
function RegDelItemDetachEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemDetach) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemDetach,FuncString);
   return true;
end

--ע��ȫ����Ҷ��������¼�
function RegDelItemDropEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemDrop) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemDrop,FuncString);
   return true;
end

--ע��ȫ�����ʰȡ����֮ǰ�������¼�
function RegDelItemPrePickUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemPrePickUp) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemPrePickUp,FuncString);
   return true;
end

--ע��ȫ����ҳɹ�ʰȡ�����¼�
function RegDelItemPickUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemPickUp) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemPickUp,FuncString);
   return true;
end

--ȫ��ս���м����˺��¼�
function RegDelDamageCalculateEvent(FuncString)
   for _,v in ipairs(tbl_delegate_DamageCalculateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_DamageCalculateEvent,FuncString);
   return true;
end

--ȫ�ּ��ܸ��Ӳ�����ȡ�¼�
function RegDelTechOptionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_TechOptionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_TechOptionEvent,FuncString);
   return true;
end

--ע��ȫ����ҽ����¼�ί��
function RegDelRankUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_RankUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_RankUpEvent,FuncString);
   return true;
end

--ע��ȫ���뿪�¼�ί�У������ǳ��͵��ߣ�
function RegDelAllOutEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_AllOutEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_AllOutEvent,FuncString);
   return true;
end

--ע��ȫ��ʹ�òɼ������¼�ί��
function RegDelGatherTechUsedEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_GatherTechUsedEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_GatherTechUsedEvent,FuncString);
   return true;
end

--ȫ����������¼�
function RegDelVSEnemyCreateEvent(FuncString)
   for _,v in ipairs(tbl_delegate_VSEnemyCreateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_VSEnemyCreateEvent,FuncString);
   return true;
end

--ȫ�����ɵ��ߵĽ��������¼�
function RegDelMakeItemStringEvent(FuncString)
   for _,v in ipairs(tbl_delegate_MakeItemStringEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_MakeItemStringEvent,FuncString);
   return true;
end

--ȫ�ִ���һ��PKʱ��ʼ����ɫ�������ֵ�¼�
function RegDelBattlePVPMaxHpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattlePVPMaxHpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattlePVPMaxHpEvent,FuncString);
   return true;
end

--����һ��ͨ��Battle.SetNextBattle���õ�ս����ս�¼�
function RegDelBattleNextEnemyEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleNextEnemyEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleNextEnemyEvent,FuncString);
   return true;
end

--ȫ�����н�ɫ��ʾͷ��Ч���¼�
function RegDelHeadCoverEvent(FuncString)
   for _,v in ipairs(tbl_delegate_HeadCoverEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_HeadCoverEvent,FuncString);
   return true;
end