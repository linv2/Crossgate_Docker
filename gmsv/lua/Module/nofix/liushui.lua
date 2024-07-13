--金币物品id
R_ItemID = 888888;
R_buro = 10;
-- 注意，只能设置6个赠送比例，不能增加或者删除，如果不需要那么多，金额请填写9999999
-- 不需要的倍率可以写0
-- 下面是达到金额
R_ZV =
{
	[1] = 1;
	[2] = 300;
	[3] = 500;
	[4] = 1000;	
	[5] = 2000;
	[6] = 3000;
	[7] = 5000;
	[8] = 10000
};

-- 下面是设置赠送百分比,不支持小数点
R_ZV_S =
{
	[1] = 100;
	[2] = 100;
	[3] = 100;
	[4] = 100;	
	[5] = 100;
	[6] = 100;
	[7] = 100
};

--上面依次代表 充值100以上200以内，赠送5%，充值200以上，500以内，赠送10% 类推

Delegate.RegInit("R_Init");


function liushui_Init(index)
	return 1;
end

function initliushuinpc()
     if(liushuinpc == nil)then
		liushuinpc = NL.CreateNpc("lua/Module/liushui.lua", "liushui_Init");
		Char.SetData(liushuinpc,%对象_形象%,100462);
		Char.SetData(liushuinpc,%对象_原形%,100462);
		Char.SetData(liushuinpc,%对象_X%,11);
		Char.SetData(liushuinpc,%对象_Y%,56);
		Char.SetData(liushuinpc,%对象_地图%,803);
		Char.SetData(liushuinpc,%对象_方向%,2);
		Char.SetData(liushuinpc,%对象_原名%,"支付宝充值领取");
		NLG.UpChar(liushuinpc);
		Char.SetWindowTalkedEvent("lua/Module/liushui.lua","liushuiNPCWTalked",liushuinpc);
		Char.SetTalkedEvent("lua/Module/liushui.lua","liushuiNPCTalked", liushuinpc);
	end
end

function liushuiNPCTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	NLG.ShowWindowTalked(_tome,_me,%窗口_输入框%,%按钮_确定%,1,"\\n\\n您好,欢迎使用领取点券系统，请输入您支付宝流水号的后6位数字！");
	return;
	
	
end

function liushuiNPCWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	if(tonumber(_seqno)==1 and tonumber(_select)==%按钮_确定% and _data~="")then
		if(Char.ItemSlot(_tome) >= 18)then
			NLG.SystemMessage(_tome,"[失败]为了避免您领取失败，请先空出道具栏三个位置以上的空格。");
			return;			
		end
		if(string.len(_data) ~= 6 or tonumber(_data) == nil or tonumber(_data) == 0)then
			NLG.SystemMessage(_tome,"[失败]您输入的流水号后6位错误！");
			return;
		end
		--NLG.SystemMessage(_tome,_data);
		local query = "SELECT * from `tbl_alipay` WHERE `autoid2`='".._data.."'";
		--NLG.SystemMessage(_tome,query);
		local mysql = SQL.Run(query);
		if(type(mysql)~="table")then
			NLG.SystemMessage(_tome,"[失败]流水号不存在，或者已经充过值。");	
			return;
		end
		local autoid1 = mysql["0_0"];--获取table第一行第一列的值
		--NLG.SystemMessage(_tome,autoid1);
		local jinbi = tonumber(mysql["0_1"]);--获取第一行第二列的值
		local ischange = nil;
		ischange = tonumber(mysql["0_2"]);--获取第一行第三列的值
		if(ischange == 1 or ischange == nil)then
			NLG.SystemMessage(_tome,"[失败]流水号不存在，或者已经充过值。");	
			return;
		end
		--local query1 = "UPDATE `tbl_user` SET cash= cash + "..jinbi.." WHERE `CdKey`='"..Char.GetData(_tome,%对象_账号%).."'";	
		--SQL.Run(query1);
		local query2 = "UPDATE `tbl_alipay` SET ischange= '1',cdkey = '"..Char.GetData(_tome,%对象_账号%).."' WHERE `autoid`='"..autoid1.."'";	
		SQL.Run(query2);
		if(jinbi >= tonumber(R_ZV[1]) and jinbi < tonumber(R_ZV[2]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[1]) / 100));
		elseif(jinbi >= tonumber(R_ZV[2]) and jinbi < tonumber(R_ZV[3]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[2]) / 100));
		elseif(jinbi >= tonumber(R_ZV[3]) and jinbi < tonumber(R_ZV[4]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[3]) / 100));
		elseif(jinbi >= tonumber(R_ZV[4]) and jinbi < tonumber(R_ZV[5]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[4]) / 100));
		elseif(jinbi >= tonumber(R_ZV[5]) and jinbi < tonumber(R_ZV[6]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[5]) / 100));
		elseif(jinbi >= tonumber(R_ZV[6]) and jinbi < tonumber(R_ZV[7]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[6]) / 100));
		elseif(jinbi >= tonumber(R_ZV[7]) and jinbi < tonumber(R_ZV[8]))then
			jinbi = jinbi + math.floor(jinbi * (tonumber(R_ZV_S[7]) / 100));
			Char.GiveItem(_tome,40852,1);
		end
		jinbi = jinbi * R_buro;
		Char.GiveItem(_tome,R_ItemID,jinbi);

		NLG.SystemMessage(_tome,"[成功]您充值数量为["..jinbi.."]已经到账！");				
		
	end
	
end

function R_Init()
	initliushuinpc();
end