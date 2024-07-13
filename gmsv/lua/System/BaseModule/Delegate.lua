--  ***************************************************************************************************** --
--  code by http://www.cgmsv.com
--  适用版本 cgmsv引擎 所有版本
--              #UPDATE LIST#
--  TYPE ***** TIME ***** Editor ***** Text 
-- CREATE   2018/12/22     Zack         增加以下委托调用
--                      *RegInit                    --全局初始化事件
--                      *RegDelLoginEvent           --全局登入事件
--                      *RegDelLoginGateEvent       --全局登回城事件
--                      *RegDelLogoutEvent          --全局登出事件
--                      *RegDelTalkEvent            --全局对话事件
--                      *RegDelLevelUpEvent         --全局玩家升级事件
--                      *RegDelBattleStartEvent     --全局战斗开始事件
--                      *RegDelBattleOverEvent      --全局战斗结束事件
--                      *RegDelWarpEvent            --全局传送事件
--                      *RegDelAfterWarpEvent       --新版全局传送事件
--                      *RegDelDropEvent            --全局掉线事件
--                      *RegDelTitleChangedEvent    --全局玩家角色更换称号事件
--                      *RegDelGetExpEvent          --全局获得战斗经验事件
--                      *RegDelBattleSkillExpEvent  --全局获得战斗技能经验事件
--                      *RegDelProductSkillExpEvent --全局获得生产技能经验事件
--                      *RegDelPetLevelUpEvent      --全局宠物升级事件
--                      *RegDelBattleExitEvent      --全局战斗离开事件
--                      *RegDelRightClickEvent      --全局鼠标右击玩家事件
--                      *RegDelShutDownEvent        --全局服务器关闭事件
--                      *RegDelPartyEvent           --全局玩家组队事件
--                      *RegDelSealEvent            --全局玩家进行宠物封印事件
--                      *RegDelBattleActionEvent    --全局玩家战斗中发出指令事件
--                      *RegDelCharActionEvent      --全局玩家Action事件
--                      *RegDelMergeItemEvent       --全局玩家使用生产技能事件
--                      *RegDelItemOverLapEvent     --全局玩家道具重叠事件
--                      *RegDelGetLoginPointEvent   --全局用户登录时获取登陆点事件
--                      *RegDelItemString           --全局物品标签事件
--                      *RegDelItemInitEvent        --全局物品初始化事件
--                      *RegDelItemUseEvent         --全局玩家使用道具(包括战斗中)事件
--                      *RegDelItemAttachEvent      --全局玩家装备道具事件
--                      *RegDelItemDetachEvent      --全局玩家卸下装备道具事件
--                      *RegDelItemDropEvent        --全局玩家丢弃道具事件
--                      *RegDelItemPrePickUpEvent   --全局玩家拾取道具之前触发的事件
--                      *RegDelItemPickUpEvent      --全局玩家成功拾取道具事件
--                      *RegDelDamageCalculateEvent --全局战斗中计算伤害事件
--                      *RegDelTechOptionEvent      --全局技能附加参数获取事件
--                      *RegDelRankUpEvent          --全局玩家晋级事件
--                      *RegDelAllOutEvent          --全局离开事件  /* 注：此委托之前也会调用DropEvent或LogoutEvent */
--  ***************************************************************************************************** --
--  暂未支持
--                     **RegDelGatherTechUsedEvent  --全局使用采集技能事件
--                     **RegDelVSEnemyCreateEvent   --全局玩家遇敌事件
--                     **RegDelMakeItemStringEvent  --全局生成道具的介绍文字事件
--                     **RegDelBattlePVPMaxHpEvent  --全局创建一个PK时初始化角色生命最大值事件
--                     **RegDelBattleNextEnemyEvent --创建一个通过Battle.SetNextBattle设置的战斗连战事件
--                     **RegDelHeadCoverEvent       --全局所有角色显示头饰效果事件
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
--以下暂未支持--
	RegDelGatherTechUsedEvent = function(FuncString) RegDelGatherTechUsedEvent(FuncString) end;
  RegDelVSEnemyCreateEvent= function(FuncString) RegDelVSEnemyCreateEvent(FuncString) end;
  RegDelMakeItemStringEvent= function(FuncString) RegDelMakeItemStringEvent(FuncString) end;
  RegDelBattlePVPMaxHpEvent= function(FuncString) RegDelBattlePVPMaxHpEvent(FuncString) end;
  RegDelBattleNextEnemyEvent= function(FuncString) RegDelBattleNextEnemyEvent(FuncString) end;
  RegDelHeadCoverEvent= function(FuncString) RegDelHeadCoverEvent(FuncString) end;
};

--注册初始化事件委托
function RegInit(FuncString)
	
   for _,v in ipairs(tbl_delegate_Init) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_Init,FuncString);
   return true;
end

--注册全局登录事件委托
function RegDelLoginEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LoginEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LoginEvent,FuncString);
   return true;
end

--注册全局登出事件委托
function RegDelLogoutEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LogoutEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LogoutEvent,FuncString);
   return true;
end

--注册全局登回城事件委托
function RegDelLoginGateEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LoginGateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LoginGateEvent,FuncString);
   return true;
end

--注册全局对话事件委托
function RegDelTalkEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_TalkEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_TalkEvent,FuncString);
   return true;
end

--注册全局玩家升级事件委托
function RegDelLevelUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_LevelUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_LevelUpEvent,FuncString);
   return true;
end

--注册全局战斗开始事件委托
function RegDelBattleStartEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_BattleStartEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_BattleStartEvent,FuncString);
   return true;
end

--注册全局战斗结束事件委托
function RegDelBattleOverEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_BattleOverEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_BattleOverEvent,FuncString);
   return true;
end

--注册全局传送事件委托
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

--注册全局掉线事件委托
function RegDelDropEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_DropEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_DropEvent,FuncString);
   return true;
end

--全局玩家角色更换称号事件
function RegDelTitleChangedEvent(FuncString)
   for _,v in ipairs(tbl_delegate_TitleChangedEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_TitleChangedEvent,FuncString);
   return true;
end

--注册全局获得战斗经验事件委托
function RegDelGetExpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_GetExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_GetExpEvent,FuncString);
   return true;
end

--全局获得战斗技能经验事件
function RegDelBattleSkillExpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleSkillExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleSkillExpEvent,FuncString);
   return true;
end

--全局获得生产技能经验事件
function RegDelProductSkillExpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_ProductSkillExpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ProductSkillExpEvent,FuncString);
   return true;
end

--全局宠物升级事件
function RegDelPetLevelUpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_PetLevelUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_PetLevelUpEvent,FuncString);
   return true;
end

--注册全局战斗退出事件委托
function RegDelBattleExitEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_BattleExitEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleExitEvent,FuncString);
   return true;
end

--注册全局鼠标右击玩家事件委托
function RegDelRightClickEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_RightClickEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_RightClickEvent,FuncString);
   return true;
end

--注册全局服务器关闭委托
function RegDelShutDownEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ShutDownEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ShutDownEvent,FuncString);
   return true;
end

--全局玩家组队事件
function RegDelPartyEvent(FuncString)
   for _,v in ipairs(tbl_delegate_PartyEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_PartyEvent,FuncString);
   return true;
end

--全局玩家进行宠物封印事件
function RegDelSealEvent(FuncString)
   for _,v in ipairs(tbl_delegate_SealEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_SealEvent,FuncString);
   return true;
end

--全局玩家战斗中发出指令事件
function RegDelBattleActionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleActionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleActionEvent,FuncString);
   return true;
end

--全局玩家Action事件
function RegDelCharActionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_CharActionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_CharActionEvent,FuncString);
   return true;
end

--全局玩家使用生产技能事件
function RegDelMergeItemEvent(FuncString)
   for _,v in ipairs(tbl_delegate_MergeItemEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_MergeItemEvent,FuncString);
   return true;
end

--全局玩家道具重叠事件
function RegDelItemOverLapEvent(FuncString)
   for _,v in ipairs(tbl_delegate_ItemOverLapEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemOverLapEvent,FuncString);
   return true;
end

--全局用户登录时获取登陆点事件
function RegDelGetLoginPointEvent(FuncString)
   for _,v in ipairs(tbl_delegate_GetLoginPointEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_GetLoginPointEvent,FuncString);
   return true;
end

--注册全局物品标签委托
function RegDelItemString(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemString) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemString,FuncString);
   return true;
end

--注册全局物品初始化事件
function RegDelItemInitEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemInit) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemInit,FuncString);
   return true;
end

--注册全局玩家使用道具(包括战斗中)事件
function RegDelItemUseEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemUse) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemUse,FuncString);
   return true;
end

--注册全局玩家装备道具事件
function RegDelItemAttachEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemAttach) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemAttach,FuncString);
   return true;
end

--注册全局玩家卸下装备道具事件
function RegDelItemDetachEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemDetach) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemDetach,FuncString);
   return true;
end

--注册全局玩家丢弃道具事件
function RegDelItemDropEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemDrop) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemDrop,FuncString);
   return true;
end

--注册全局玩家拾取道具之前触发的事件
function RegDelItemPrePickUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemPrePickUp) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemPrePickUp,FuncString);
   return true;
end

--注册全局玩家成功拾取道具事件
function RegDelItemPickUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_ItemPickUp) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_ItemPickUp,FuncString);
   return true;
end

--全局战斗中计算伤害事件
function RegDelDamageCalculateEvent(FuncString)
   for _,v in ipairs(tbl_delegate_DamageCalculateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_DamageCalculateEvent,FuncString);
   return true;
end

--全局技能附加参数获取事件
function RegDelTechOptionEvent(FuncString)
   for _,v in ipairs(tbl_delegate_TechOptionEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_TechOptionEvent,FuncString);
   return true;
end

--注册全局玩家晋级事件委托
function RegDelRankUpEvent(FuncString)
  
   for _,v in ipairs(tbl_delegate_RankUpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_RankUpEvent,FuncString);
   return true;
end

--注册全局离开事件委托（包括登出和掉线）
function RegDelAllOutEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_AllOutEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_AllOutEvent,FuncString);
   return true;
end

--注册全局使用采集技能事件委托
function RegDelGatherTechUsedEvent(FuncString)
	
   for _,v in ipairs(tbl_delegate_GatherTechUsedEvent) do
       if (v == FuncString)then
       return false;
	   end
   end
   
   table.insert(tbl_delegate_GatherTechUsedEvent,FuncString);
   return true;
end

--全局玩家遇敌事件
function RegDelVSEnemyCreateEvent(FuncString)
   for _,v in ipairs(tbl_delegate_VSEnemyCreateEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_VSEnemyCreateEvent,FuncString);
   return true;
end

--全局生成道具的介绍文字事件
function RegDelMakeItemStringEvent(FuncString)
   for _,v in ipairs(tbl_delegate_MakeItemStringEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_MakeItemStringEvent,FuncString);
   return true;
end

--全局创建一个PK时初始化角色生命最大值事件
function RegDelBattlePVPMaxHpEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattlePVPMaxHpEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattlePVPMaxHpEvent,FuncString);
   return true;
end

--创建一个通过Battle.SetNextBattle设置的战斗连战事件
function RegDelBattleNextEnemyEvent(FuncString)
   for _,v in ipairs(tbl_delegate_BattleNextEnemyEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_BattleNextEnemyEvent,FuncString);
   return true;
end

--全局所有角色显示头饰效果事件
function RegDelHeadCoverEvent(FuncString)
   for _,v in ipairs(tbl_delegate_HeadCoverEvent) do
       if (v == FuncString)then
       return false;
     end
   end
   
   table.insert(tbl_delegate_HeadCoverEvent,FuncString);
   return true;
end