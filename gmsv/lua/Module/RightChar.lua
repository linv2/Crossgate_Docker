Delegate.RegInit("RightChar_Init");

function RightChar_Init()
	NL.RegRightClickEvent(nil, "RCEvent");
end
RC_P2 = {};

function RCEvent(p1,p2)
	--NLG.Setpalette(p1,11,5);
	--NLG.Seteffect(p1,11,5);
	if Char.GetData(p1,%对象_GM%) ~= 1 then
		return;
	end


	RC_P2[(Char.GetData(p1,%对象_账号%))] = p2;
	NLG.ShowWindowTalked(p1,RC_NPC_Index["t"],%窗口_选择框%,%按钮_确定%,0,
	"1\n请选择对该玩家的操作：".."\n　　　　　　　　　『查看资料』"..
	"\n　　　　　　　　　『给予道具』"..
	"\n　　　　　　　　　『给予魔币』"..
	"\n　　　　　　　　　『给予宠物』"..
	"\n　　　　　　　　　『封禁账号』"..
	"\n　　　　　　　　　『充值金额』"..
	"\n　　　　　　　　　『传送对象』"..
	"\n　　　　　　　　　『踢他下线』"
	);
		
    return;
	
end