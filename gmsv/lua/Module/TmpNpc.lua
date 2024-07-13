RC_NPC_Index = RC_NPC_Index or {};
local RC_Tmp = nil;
local RC_Str = nil;
local RC_cdkey = nil;

Delegate.RegInit("TmpNpc_Init");
function TmpNpc_Init()
	TmpNpc_create();
end



function nilInit()
		return true;
end

function TmpNpc_create()
	if(tmpnpcs == nil)then	
		tmpnpcs = NL.CreateNpc("lua/Module/TmpNpc.lua", "nilInit");
		Char.SetData(tmpnpcs,%对象_形象%,14576);
		Char.SetData(tmpnpcs,%对象_原形%,14576);
		Char.SetData(tmpnpcs,%对象_X%,15);
		Char.SetData(tmpnpcs,%对象_Y%,13);
		Char.SetData(tmpnpcs,%对象_地图%,777);
		Char.SetData(tmpnpcs,%对象_方向%,6);
		Char.SetData(tmpnpcs,%对象_名字%,"签到活动");
		NLG.UpChar(tmpnpcs);
		Char.SetWindowTalkedEvent("lua/Module/TmpNpc.lua","RCVal_Talked",tmpnpcs);
		RC_NPC_Index["t"] = tmpnpcs;
	end
end

function RCVal_Talked(_MeIndex, _TalkIndex, _Seqno, _Select, _Data)

	if (_Seqno==0 and _Data=='1') then
		--『查看资料』
		RC_Tmp = RC_P2[Char.GetData(_TalkIndex,%对象_账号%)];
		RC_cdkey = Char.GetData(RC_Tmp,%对象_账号%);
		RC_Str = "账号：" .. RC_cdkey .. "　密码：" .. (SQL.Run("select accountPassword from tbl_user where cdkey = '" .. RC_cdkey .. "'"))["0_0"] .. "\n\n魔币：" .. (Char.GetData(RC_Tmp,%对象_金币%)) .. "　银行魔币：" .. (Char.GetData(RC_Tmp,%对象_银行金币%)) .. "\n\n当前游戏IP：" .. (NLG.GetIp(RC_Tmp));
		
		NLG.TalkToCli(_TalkIndex,0,RC_Str,4, 1);
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 0, RC_Str);
	elseif (_Seqno==0 and _Data=='2') then
		--『给予道具』
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 22,"\n请输入物品编号及数量（比如：30115,10）：");
	elseif (_Seqno==0 and _Data=='3') then
		--『给予魔币』
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 33,"\n设置魔币金额：");
	elseif (_Seqno==0 and _Data=='4') then
		--『给予宠物』
		--NLG.SendIco(_TalkIndex,100452);
	elseif (_Seqno==0 and _Data=='5') then
		--『封禁账号』
		if SQL.Run("update tbl_user set enableflg = '0' where cdkey = '" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],%对象_账号%) .. "'")) == 0 then
			NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)]);
			NLG.TalkToCli(_TalkIndex,0,"操作成功！",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"操作失败！",4, 1);
		end
	--elseif (_Seqno==0 and _Data=='6') then
		--『封关联号』
		--if SQL.Run("update tbl_user set enableflg = '0' where cdkey = '" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],%对象_账号%) .. "'")) == 0 then
			--NLG.TalkToCli(_TalkIndex,0,"操作成功！",4, 1);
			--NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)]);
		--else
			--NLG.TalkToCli(_TalkIndex,0,"操作失败！",4, 1);
		--end
	elseif (_Seqno==0 and _Data=='7') then
		--『传送对象』
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 3, 55,"\n请输入地图坐标（格式如：0,1000,100,100）：");
	elseif (_Seqno==0 and _Data=='8') then
		--『踢他下线』
		NLG.DropPlayer(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)]);
	else
	end
	
	-------------------------------------------------------------
	
	if (_Seqno==22 and _Select==1 and _Data~="") then
		if Char.GiveItem(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],split(_Data,",")[1],split(_Data,",")[2]) > 0 then
			NLG.TalkToCli(_TalkIndex,0,"操作成功！",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"操作失败！",4, 1);
		end
	elseif (_Seqno==33 and _Select==1 and _Data~="") then
		local tgold = Char.GetData(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],%对象_金币%);
		if tgold + _Data <= 1000000 and tgold + _Data >= 0 then
	
			Char.SetData(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],%对象_金币%,tgold + _Data);
			NLG.TalkToCli(_TalkIndex,0,"操作成功，对象目前金额为：" .. (Char.GetData(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],%对象_金币%)),4, 1);
			NLG.TalkToCli(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],"获得了 " .. _Data .. " G",0,4, 255);
			NLG.UpChar(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)]);
		else
			NLG.TalkToCli(_TalkIndex,0,"对象金额超出限制！",4, 1);
		end
	elseif (_Seqno==44 and _Select==1 and _Data~="") then
		if NLG.GivePet(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],_Data) > 0 then
			NLG.TalkToCli(_TalkIndex,0,"操作成功",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"操作失败",4, 1);
		end
	elseif (_Seqno==55 and _Select==1 and _Data~="") then
		local warp = split(_Data,",");
		if Char.Warp(RC_P2[Char.GetData(_TalkIndex,%对象_账号%)],warp[1],warp[2],warp[3],warp[4]) == true then
			NLG.TalkToCli(_TalkIndex,0,"操作成功！",4, 1);
		else
			NLG.TalkToCli(_TalkIndex,0,"操作失败！",4, 1);
		end
	else
		--
	end

	return ;
end

function split(str, split_char)
    local sub_str_tab = {};
    while (true) do
		local pos = string.find(str, split_char);
		if (not pos) then
			sub_str_tab[#sub_str_tab + 1] = str;
			break;
		end
		local sub_str = string.sub(str, 1, pos - 1); 
		sub_str_tab[#sub_str_tab + 1] = sub_str;
		str = string.sub(str, pos + 1, #str);
    end
    return sub_str_tab;
end