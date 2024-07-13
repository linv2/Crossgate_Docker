Global_Reg.RegMoveEquipItem("qichongtuoxia");
Global_Reg.RegEquipItem("qichongshuangji");
Global_Reg.RegTalkEvent("qichongtalk");

--[[ 道具格式

水晶？	地的水晶(骑宠）	qichong									741003	27511	0	22		0	1	2	0	1	1	1	1	0	1500	1500			0	0	0	0	0	0																									1		100																					101022	210					0	0	1			0	140000	179201	100	0	0			0																	

双击效果设置 为 qichong
子参1 设置为图档
子参2 设置为速度
]]--

function qichongtalk( _PlayerIndex,_msg,_color,_range,_size)
	local Name = Char.GetData(_PlayerIndex,%对象_原名%)
	--NLG.SetClientCharRestart(_PlayerIndex,200)
	local TalkMsg = string.sub(_msg,3)
	print("\n[" .. Name .. "]"..TalkMsg );--输出到Gmsv的控制台界面	
	if TalkMsg=="/骑宠" or TalkMsg=="/qc" or TalkMsg=="/QC" then
		--NLG.SystemMessage(_PlayerIndex,"使用的是骑宠talkevent");
		if (Char.GetData(_PlayerIndex,%对象_金币%)<300) then
		NLG.SystemMessage(_PlayerIndex,"[系统] 你的钱不够！")
		return -1
		end
		local ItemIndex = Char.GetItemIndex(_PlayerIndex, 7);  --获取8号位置的道具索引
		local itemid = Item.GetData(ItemIndex, %道具_ID%); ---获取道具编号
		local ClickItemType = Item.GetData(ItemIndex,2003)--获取道具特性
		local zc1 = tonumber(Item.GetData(ItemIndex, %道具_子参一%)); -- 图档编号
		local zc2 = tonumber(Item.GetData(ItemIndex, %道具_子参二%)); --速度
		
		if(zc1 == nil and zc2 == nil )then
		NLG.SystemMessage(_PlayerIndex,"[系统]您身上没有可以骑宠的道具！")
		elseif (zc1 >0 and zc2 >0 and ClickItemType == "qichong" ) then
		NLG.AddGold(_PlayerIndex,-300); 
		--NLG.SystemMessage(_PlayerIndex,"水晶测试" ..zc1 .. "/"..zc2)
		Char.RideFalse(_PlayerIndex,zc1,zc2);
		NLG.SystemMessage(_PlayerIndex,"[系统]你已经骑宠！骑宠速度:" .. zc2 .. "!（原始值为100）")
		else
		NLG.SystemMessage(_PlayerIndex,"[系统]您身上没有可以骑宠的道具！1")
		
		end
		return -1
	elseif TalkMsg=="/下骑乘" or TalkMsg=="/xqc" or TalkMsg=="/XQC" then
	--NLG.SystemMessage(_PlayerIndex,"使用的是骑宠talkevent");
		local ItemIndex = Char.GetItemIndex(_PlayerIndex, 7); 
		local ClickItemType = Item.GetData(ItemIndex,2003)--获取道具特性
		if ClickItemType == "qichong" then 
		Char.RideFalse(_PlayerIndex,-1,100);
		NLG.SystemMessage(_PlayerIndex,"[系统]您已经恢复非骑宠状态！")
		else
		NLG.SystemMessage(_PlayerIndex,"[系统]您身上并未装备骑宠水晶！")
		end
		return -1
	else
	end
end

function qichongshuangji(CharIndex, OldItemPos)
--NLG.SystemMessage(CharIndex,"[系统]执行函数")

	local ItemIndex = Char.GetItemIndex(CharIndex, 7); 
	local ClickItemType = Item.GetData(ItemIndex,2003)--获取道具特性
	
	if ClickItemType == "qichong" then 
	--Char.RideFalse(CharIndex,-1,100);
	NLG.SystemMessage(CharIndex,"[系统]您现在装备的是骑宠水晶，请手动摘下已装备的骑宠水晶再进行下一步操作！")
	return -1;
	end
    return 0;
end


function qichongtuoxia(CharIndex, OldItemPos, NewItemPos,Type)
    local ItemIndex = Char.GetItemIndex(CharIndex, 8);  --获取8号位置的道具索引
	local itemid = Item.GetData(ItemIndex, %道具_ID%); ---获取道具编号
	local OldItemPos = Char.FindItemId(CharIndex, itemid); -----获取装备前道具位置
	local NewItemPos = Char.FindItemId(CharIndex, itemid); -----获取装备前道具位置
	
	if (NewItemPos ~= 7)then
        --print(Char.GetData(CharIndex, %对象_名字%).."装备了水晶");
		Char.RideFalse(CharIndex,-1,100);
        return 0;
    end



end