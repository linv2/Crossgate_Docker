tbl_LuaNpcIndex = tbl_LuaNpcIndex or {}

dofile("lua/System/BaseModule/Delegate.lua");
dofile("lua/System/BaseModule/Base.lua");
dofile("lua/System/BaseModule/luac.lua");
dofile("lua/System/BaseModule/System.lua");
--dofile("lua/System/BaseModule/EasyLuaFunc.lua");
--dofile("lua/System/BaseModule/GuildClass.lua");
require("lua/System/AllEvent/All_Talk");
require("lua/System/AllEvent/All_Battle");
require("lua/System/AllEvent/All_Login");
require("lua/System/AllEvent/All_Warp");
require("lua/System/AllEvent/All_Other");
require("lua/System/AllEvent/All_Player");
require("lua/System/AllEvent/All_System");
--require("lua/System/AllEvent/NPC_Event");


function initALL()

	--注册全局事件
	NL.RegLoginEvent(nil,"All_LoginEvent");
	NL.RegLoginGateEvent(nil,"All_LoginGateEvent");
	NL.RegLogoutEvent(nil,"All_LogoutEvent");
	NL.RegTalkEvent(nil,"All_TalkEvent");
	NL.RegLevelUpEvent(nil,"All_LevelUpEvent");
	NL.RegBattleStartEvent(nil,"All_BattleStartEvent");
	NL.RegBattleOverEvent(nil,"All_BattleOverEvent");
	NL.RegWarpEvent(nil,"All_WarpEvent");
	NL.RegAfterWarpEvent(nil,"All_AfterWarpEvent");
	NL.RegDropEvent(nil,"All_DropEvent");
	--NL.RegTitleChangedEvent(nil,"All_TitleChangedEvent");
	NL.RegGetExpEvent(nil,"All_GetExpEvent");
	NL.RegBattleSkillExpEvent(nil,"All_BattleSkillExpEvent");
	NL.RegProductSkillExpEvent(nil,"All_ProductSkillExpEvent");
	--NL.RegPetLevelUpEvent(nil,"RegPetLevelUpEvent");
	--NL.RegBattleExitEvent(nil,"RegBattleExitEvent");
	NL.RegRightClickEvent(nil,"All_RightClickEvent");
	--NL.RegShutDownEvent(nil,"RegShutDownEvent");
	--NL.RegPartyEvent(nil,"RegPartyEvent");
	--NL.RegSealEvent(nil,"RegSealEvent");
	--NL.RegBattleActionEvent(nil,"RegBattleActionEvent");
	--NL.RegCharActionEvent(nil,"RegCharActionEvent");
	--NL.RegMergeItemEvent(nil,"RegMergeItemEvent");
	--NL.RegItemOverLapEvent(nil,"RegItemOverLapEvent");
	--NL.RegGetLoginPointEvent(nil,"RegGetLoginPointEvent");
	--NL.RegItemString(nil,"RegItemString");
	--NL.RegItemInitEvent(nil,"RegItemInitEvent");
	--NL.RegItemUseEvent(nil,"RegItemUseEvent");
	--NL.RegItemAttachEvent(nil,"RegItemAttachEvent");
	--NL.RegItemDetachEvent(nil,"RegItemDetachEvent");
	--NL.RegItemDropEvent(nil,"RegItemDropEvent");
	--NL.RegItemPrePickUpEvent(nil,"RegItemPrePickUpEvent");
	--NL.RegItemPickUpEvent(nil,"RegItemPickUpEvent");
	--NL.RegDamageCalculateEvent(nil,"RegDamageCalculateEvent");
	--NL.RegTechOptionEvent(nil,"RegTechOptionEvent");
	--NL.RegDelRankUpEvent(nil,"RegDelRankUpEvent");
	--NL.RegDelAllOutEvent(nil,"RegDelAllOutEvent");
	--删除NPC
	NL.DelLuaNpc()

	--加载Lua脚本
	dofile("lua/Config.lua");

	--执行NPC初始化委托
    for _,Func in ipairs(tbl_delegate_Init) do
    local f = loadstring(Func.."()");	
	f();
    end
    
	return true
 end

function NL.DelLuaNpc()
	for Name, Index in pairs(tbl_LuaNpcIndex) do
		NL.DelNpc(Index)
	end
end
 
initALL();