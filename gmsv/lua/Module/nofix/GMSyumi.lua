function GMSyumiNPC_Create()
	GMSyumiNPC= NL.CreateNpc(nil, "GMSyumi_Init");
	Char.SetData(GMSyumiNPC, %对象_形象%, 106602);
	Char.SetData(GMSyumiNPC, %对象_原形%, 106602); 
	Char.SetData(GMSyumiNPC, %对象_地图%, 1000);
	Char.SetData(GMSyumiNPC, %对象_X%, 242);
	Char.SetData(GMSyumiNPC, %对象_Y%, 78);
	Char.SetData(GMSyumiNPC, %对象_方向%, 4);
	Char.SetData(GMSyumiNPC, %对象_原名%, "测试员Syumi");
	NLG.UpChar(GMSyumiNPC)

--变量注册
	Item_ID=-1	
	Item_NUM=-1	
--事件注册

	if (Char.SetTalkedEvent(nil, "GMSyumiNPC_Talked", GMSyumiNPC) < 0) then
		print("ResistPlusNPC_Talked 注册事件失败。");
		return false;
	end

	if (Char.SetWindowTalkedEvent(nil, "GMSyumiNPC_WindowTalked", GMSyumiNPC) < 0) then
		print("GMSyumiNPC_WindowTalked 注册事件失败。");
		return false;
	end

	return true;
end

function GMSyumi_Init( _MePtr )
	print("GMSyumiNPC.Index = " .. _MePtr)
	return true;
end

function GMSyumiNPC_Talked( _MePtr, _TalkPtr)
	if(NLG.CheckInFront(_TalkPtr, _MePtr, 1) == false) then
		return ;
	end
	NLG.ShowWindowTalked(_TalkPtr,_MePtr, %窗口_选择框%, 0, 0, "1\nSyumi的帮助功能\n1.道具相关\n2.宠物相关\n3.其他相关\n4.属性相关" );
	return ;
end

function GMSyumiNPC_WindowTalked( _MePtr, _TalkPtr, _Seqno, _Select, _Data)
	
	if (_Select==2) then
		GMSyumiNPC_Talked( _MePtr, _TalkPtr);
	end

--首页菜单	
	if (_Seqno==0) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 1, "1\n修改第一格道具属性\n1.修正修改\n2.基础属性修改\n3.抗性修改\n4.获得道具");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 2, "1\n宠物相关\n1.第一栏宠物变成1级\n2.第一栏宠物变成满档1级\n3.第一栏宠物和人物相同等级\n4.获得宠物");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 3, "1\n其他相关\n1.增加声望\n2.地图移动");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 4, "1\n属性相关\n1.人物升级点数\n2.宠物升级点数\n3.宠物四属性\n4.宠物修正\n5.宠物抗性\n6.宠物种族");
		end
	end
--道具相关子菜单
	if (_Seqno==1) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 11, "1\n修改第一格道具修正数据\n1.必杀\n2.反击\n3.命中\n4.闪躲\n5.耐力\n6.灵巧\n7.智力");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 12, "1\n修改第一格道具基础属性\n1.攻击\n2.防御\n3.敏捷\n4.精神\n5.回复");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 13, "1\n修改第一格道具抗性\n1.毒抗\n2.睡抗\n3.石抗\n4.醉抗\n5.乱抗\n6.忘抗");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 14, "\n1.制造道具\n\n\n请输入需要制作的物品ID");
		end
	end
--道具制造子菜单
	if (_Seqno==14) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 141, "\n1.制造道具\n\n\n请输入需要制作的物品数量");
	end
	if (_Seqno==141) then
		Item_NUM = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 1411, "110153|1.制造道具\n\n\n你确定要创造 " ..Item_NUM.. " 个ID为 " ..Item_ID.. " 的物品吗？");
	end		
	if (_Seqno==1411) then
		Char.GiveItem(_TalkPtr,Item_ID,Item_NUM)
	end
--道具修改
	if (_Seqno==11) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 111, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 112, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 113, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 114, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 115, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 116, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='7') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 117, "\n1.道具修改\n\n\n请输入需要增加的数值");
		end
	end
	if (_Seqno==12) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 121, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 122, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 123, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 124, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 125, "\n1.道具修改\n\n\n请输入需要增加的数值");
		end
	end
	if (_Seqno==13) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 131, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 132, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 133, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 134, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 135, "\n1.道具修改\n\n\n请输入需要增加的数值");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 136, "\n1.道具修改\n\n\n请输入需要增加的数值");
		end
	end
	if(_Seqno>110 and _Seqno<137) then
		Item_NUM = _Data;
		_Item=Char.GetItemIndex(_TalkPtr,8)
		if(_Item >0) then
			if(_Seqno==111) then
				Item.SetData( _Item , %道具_必杀% ,Item.GetData(_Item, %道具_必杀%)+Item_NUM)
			elseif(_Seqno==112) then
				Item.SetData( _Item , %道具_反击% ,Item.GetData(_Item, %道具_反击%)+Item_NUM)
			elseif(_Seqno==113) then
				Item.SetData( _Item , %道具_命中% ,Item.GetData(_Item, %道具_命中%)+Item_NUM)
			elseif(_Seqno==114) then
				Item.SetData( _Item , %道具_闪躲% ,Item.GetData(_Item, %道具_闪躲%)+Item_NUM)
			elseif(_Seqno==115) then
				Item.SetData( _Item , %道具_耐力% ,Item.GetData(_Item, %道具_耐力%)+Item_NUM)
			elseif(_Seqno==116) then
				Item.SetData( _Item , %道具_灵巧% ,Item.GetData(_Item, %道具_灵巧%)+Item_NUM)
			elseif(_Seqno==117) then
				Item.SetData( _Item , %道具_智力% ,Item.GetData(_Item, %道具_智力%)+Item_NUM)
			elseif(_Seqno==121) then
				Item.SetData( _Item , %道具_攻击% ,Item.GetData(_Item, %道具_攻击%)+Item_NUM)
			elseif(_Seqno==122) then
				Item.SetData( _Item , %道具_防御% ,Item.GetData(_Item, %道具_防御%)+Item_NUM)
			elseif(_Seqno==123) then
				Item.SetData( _Item , %道具_敏捷% ,Item.GetData(_Item, %道具_敏捷%)+Item_NUM)
			elseif(_Seqno==124) then
				Item.SetData( _Item , %道具_精神% ,Item.GetData(_Item, %道具_精神%)+Item_NUM)
			elseif(_Seqno==125) then
				Item.SetData( _Item , %道具_回复% ,Item.GetData(_Item, %道具_回复%)+Item_NUM)
			elseif(_Seqno==131) then
				Item.SetData( _Item , %道具_毒抗% ,Item.GetData(_Item, %道具_毒抗%)+Item_NUM)
			elseif(_Seqno==132) then
				Item.SetData( _Item , %道具_睡抗% ,Item.GetData(_Item, %道具_睡抗%)+Item_NUM)
			elseif(_Seqno==133) then
				Item.SetData( _Item , %道具_石抗% ,Item.GetData(_Item, %道具_石抗%)+Item_NUM)
			elseif(_Seqno==134) then
				Item.SetData( _Item , %道具_醉抗% ,Item.GetData(_Item, %道具_醉抗%)+Item_NUM)
			elseif(_Seqno==135) then
				Item.SetData( _Item , %道具_乱抗% ,Item.GetData(_Item, %道具_乱抗%)+Item_NUM)
			elseif(_Seqno==136) then
				Item.SetData( _Item , %道具_忘抗% ,Item.GetData(_Item, %道具_忘抗%)+Item_NUM)
		end
		Item.UpItem(_TalkPtr,8)
		NLG.TalkToCli( _TalkPtr, _MePtr, "第一栏道具修正强化成功", 1, 2)
		end
	end

--宠物相关子菜单
	if (_Seqno==2) then
		if (_Data=='1') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0) then
				Pet.ReBirth(_TalkPtr,_Pet)
				NLG.TalkToCli( _TalkPtr, _MePtr, "你的第一栏宠物已经重置到1级", 1, 2)
			end
		elseif (_Data=='2') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0) then
				Pet.SetArtRank(_Pet, %宠档_体成%,Pet.FullArtRank(_Pet, %宠档_体成%))
				Pet.SetArtRank(_Pet, %宠档_力成%,Pet.FullArtRank(_Pet, %宠档_力成%))
				Pet.SetArtRank(_Pet, %宠档_强成%,Pet.FullArtRank(_Pet, %宠档_强成%))
				Pet.SetArtRank(_Pet, %宠档_敏成%,Pet.FullArtRank(_Pet, %宠档_敏成%))
				Pet.SetArtRank(_Pet, %宠档_魔成%,Pet.FullArtRank(_Pet, %宠档_魔成%))
				Pet.ReBirth(_TalkPtr,_Pet)
				NLG.TalkToCli( _TalkPtr, _MePtr, "你的第一栏宠物已经重置到满档1级", 1, 2)
			end
		elseif (_Data=='3') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0 ) then
				Char.SetData(_Pet,%对象_经验%,Char.GetData(_TalkPtr,%对象_经验%))
				NLG.TalkToCli( _TalkPtr, _MePtr, "第一栏宠物经验已经和人物一样了", 1, 2)
				Pet.UpPet(_TalkPtr, _Pet)
			end
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 24, "\n1.获得宠物\n\n\n请输入需要获得的宠物ID");
		end
	end
--获得宠物
	if (_Seqno==24) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 241, "110153|1.获得宠物\n\n\n你确定要获得ID为 " ..Item_ID.. " 的宠物吗？");
	end
	if (_Seqno==241) then
		Char.AddPet(_TalkPtr,Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "您已经获得宠物了", 1, 2)
	end
--其他相关子菜单
	if (_Seqno==3) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 31, "\n1.增加声望\n\n\n请输入需要增加的声望数");
		end
		if (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 32, "\n2.地图移动\n\n\n请输入需要传送的地图ID及坐标\n\n\n格式：MapID,X,Y\n例子：1000,200,100");
		end
	end
--声望增加
	if (_Seqno==31) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 311, "110153|1.增加声望\n\n\n你确定要增加" ..Item_ID.. " 声望吗？");
	end
	
	if (_Seqno==311) then
		Char.SetData(_TalkPtr, %对象_声望%, Char.GetData(_TalkPtr, %对象_声望%)+Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "你当前声望为[" .. Char.GetData(_TalkPtr, %对象_声望%) .. "]点。", 1, 2)
	end
--地图移动
	if (_Seqno==32) then
		WarpMap_Start = 1;
		WarpMap_End = string.find(_Data, ",", 1)-1;
		WarpX_Start = WarpMap_End+2;
		WarpX_End = string.find(_Data, ",", WarpMap_End+2)-1;
		WarpY_Start = WarpX_End+2;
		WarpY_End = string.len(_Data);
		WarpMap = string.sub(_Data, WarpMap_Start, WarpMap_End) ;
		WarpX = string.sub(_Data, WarpX_Start, WarpX_End) ;
		WarpY = string.sub(_Data, WarpY_Start, WarpY_End);
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 321, "110153|\n1.地图移动\n\n\n你确定要传送去 " ..WarpMap.. " 的 " ..WarpX.. "," ..WarpY.. " 坐标吗？");
	end
	if (_Seqno==321) then
		Char.Warp(_TalkPtr,0,WarpMap,WarpX,WarpY)
	end
--属性相关
	if (_Seqno==4) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 41, "\n1.人物升级点数\n\n\n请输入需要增加的人物升级点数");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 42, "\n1.宠物升级点数\n\n\n请输入需要增加的宠物升级点数");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 43, "1\n宠物四属性\n1.地属性\n2.水属性\n3.火属性\n4.风属性");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 44, "1\n宠物修正\n1.必杀\n2.反击\n3.命中\n4.闪躲");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %窗口_选择框%, %按钮_关闭%, 45, "1\n宠物抗性\n1.毒抗\n2.睡抗\n3.石抗\n4.醉抗\n5.乱抗\n6.忘抗");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 46, "\n1.宠物种族修改\n\n请输入需要修改的种族\n0人形,1龙,2,不死,3飞行,4昆虫,\n5植物,6野兽,7特殊,8金属,9 邪魔");
		end
	end
--升级点数修改
	if (_Seqno==41) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 411, "110153|1.人物升级点数\n\n\n你确定要增加" ..Item_ID.. " 人物升级点数吗？");
	end
	if (_Seqno==411) then
		Char.SetData(_TalkPtr, %对象_升级点%, Char.GetData(_TalkPtr, %对象_升级点%)+Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "获取升级点数成功,需要登出伺服器重新进入", 1, 2)
	end
	if (_Seqno==42) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 421, "110153|1.宠物升级点数\n\n\n你确定要增加" ..Item_ID.. " 宠物升级点数吗？");
	end
	if (_Seqno==421) then
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			Char.SetData(_Pet, %对象_升级点%, Char.GetData(_Pet, %对象_升级点%)+Item_ID)
			NLG.TalkToCli( _TalkPtr, _MePtr, "获取升级点数成功,需要登出伺服器重新进入", 1, 2)
			Pet.UpPet(_TalkPtr, _Pet)
		end
	end
--宠物属性修改
	if (_Seqno==43) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 431, "\n1.宠物四属性\n\n\n请输入需要修改的数值,不能超过100");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 432, "\n1.宠物四属性\n\n\n请输入需要修改的数值,不能超过100");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 433, "\n1.宠物四属性\n\n\n请输入需要修改的数值,不能超过100");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 434, "\n1.宠物四属性\n\n\n请输入需要修改的数值,不能超过100");
		end
	end
	if (_Seqno==44) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 441, "\n1.宠物修正\n\n\n请输入需要增加的数值");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 442, "\n1.宠物修正\n\n\n请输入需要增加的数值");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 443, "\n1.宠物修正\n\n\n请输入需要增加的数值");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 444, "\n1.宠物修正\n\n\n请输入需要增加的数值");
		end
	end
	if (_Seqno==45) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 451, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 452, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 453, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 454, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 455, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 456, "\n1.宠物抗性\n\n\n请输入需要增加的数值");
		end
	end
	
	if(_Seqno>430 and _Seqno<460) then
		Item_NUM = _Data;
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			if(_Seqno==431) then
				Char.SetData(_Pet, %对象_地属性%, Item_NUM)
			elseif(_Seqno==432) then
				Char.SetData(_Pet, %对象_水属性%, Item_NUM)
			elseif(_Seqno==433) then
				Char.SetData(_Pet, %对象_火属性%, Item_NUM)
			elseif(_Seqno==434) then
				Char.SetData(_Pet, %对象_风属性%, Item_NUM)
			elseif(_Seqno==441) then
				Char.SetData(_Pet, %对象_必杀%, Char.GetData(_Pet, %对象_必杀%)+Item_NUM)
			elseif(_Seqno==442) then
				Char.SetData(_Pet, %对象_反击%, Char.GetData(_Pet, %对象_反击%)+Item_NUM)
			elseif(_Seqno==443) then
				Char.SetData(_Pet, %对象_命中%, Char.GetData(_Pet, %对象_命中%)+Item_NUM)
			elseif(_Seqno==444) then
				Char.SetData(_Pet, %对象_闪躲%, Char.GetData(_Pet, %对象_闪躲%)+Item_NUM)
			elseif(_Seqno==451) then
				Char.SetData(_Pet, %对象_抗毒%, Char.GetData(_Pet, %对象_抗毒%)+Item_NUM)
			elseif(_Seqno==452) then
				Char.SetData(_Pet, %对象_抗睡%, Char.GetData(_Pet, %对象_抗睡%)+Item_NUM)
			elseif(_Seqno==453) then
				Char.SetData(_Pet, %对象_抗石%, Char.GetData(_Pet, %对象_抗石%)+Item_NUM)
			elseif(_Seqno==454) then
				Char.SetData(_Pet, %对象_抗醉%, Char.GetData(_Pet, %对象_抗醉%)+Item_NUM)
			elseif(_Seqno==455) then
				Char.SetData(_Pet, %对象_抗乱%, Char.GetData(_Pet, %对象_抗乱%)+Item_NUM)
			elseif(_Seqno==456) then
				Char.SetData(_Pet, %对象_抗忘%, Char.GetData(_Pet, %对象_抗忘%)+Item_NUM)
		end
		Pet.UpPet(_TalkPtr, _Pet)
		NLG.TalkToCli( _TalkPtr, _MePtr, "第一栏道具修正强化成功", 1, 2)
		end
	end
	if (_Seqno==46) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 461, "110153|1.宠物种族修改\n\n\n你确定要修改宠物种族ID为" ..Item_ID.. " 吗？");
	end
	if (_Seqno==461) then
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			Char.SetData(_Pet, %对象_种族%, Item_ID)
			NLG.TalkToCli( _TalkPtr, _MePtr, "宠物种族修改成功,需要登出伺服器重新进入", 1, 2)
			Pet.UpPet(_TalkPtr, _Pet)
		end
	end
--结束
end


GMSyumiNPC_Create()
