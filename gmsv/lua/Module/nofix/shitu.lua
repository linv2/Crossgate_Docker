Delegate.RegInit("shituxitong_init");



local shuliang_stxt;
local Me_Account_stxt;
local tudicdkey_stxt;
local tudimingzi_stxt;
local dangetudimingzi_stxt;
local tudidangqiandengji;
local tudi80ji;
local tudi90ji;
local tudi100ji;
local tudi110ji;
local tudi120ji;
local tudi130ji;
local tudimingdan;

function stxt_create_npc()
	local PlaceNumNpc_stxt = NL.CreateNpc("lua/Module/shitu.lua", "stxt_create_npc_init");
	Char.SetData(PlaceNumNpc_stxt, 1, 100987);
	Char.SetData(PlaceNumNpc_stxt, 2, 100987);
	Char.SetData(PlaceNumNpc_stxt, 3, 0);
	Char.SetData(PlaceNumNpc_stxt, 4, 1000);
	Char.SetData(PlaceNumNpc_stxt, 5, 247);
	Char.SetData(PlaceNumNpc_stxt, 6, 84);
	Char.SetData(PlaceNumNpc_stxt, 7, 6);
	Char.SetData(PlaceNumNpc_stxt, 2000, "师徒系统");
	NLG.UpChar(PlaceNumNpc_stxt)


	if (Char.SetTalkedEvent(nil, "stxt_Talked",PlaceNumNpc_stxt) < 0) then
		print("stxt_Talked 注册事件失败。");
		return false;
	end
	
	if (Char.SetWindowTalkedEvent(nil, "Shitu__Window_Talked", PlaceNumNpc_stxt) < 0) then
			print("Shitu__Window_Talked 注册事件失败。");
			return false;
	end
	
	
	return true;
end

function stxt_Talked( _MeIndex, _PlayerIndex)
	
	
	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2, 0, 
			"1\n                    请选择操作："..
			"\n\n　　　　　　　　　『师徒介绍』"..
			"\n\n　　　　　　　　　『领取奖励』\n");
			
	return;
	
end






--这个是玩家选择了选项
function Shitu__Window_Talked(_MeIndex, _TalkIndex, _Seqno, _Select, _Data)
	--NLG.SystemMessage(_TalkIndex, "显示2");
	--NLG.SystemMessage(_TalkIndex, "查询结果自己的窗口才显示 _Seqno=".._Seqno.."  _Select=".._Select.."  _Data=".._Data);
	
	
	
	
	
	if (_Seqno==0 and _Data=='2') then
		--『师徒介绍』
		
		NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,
			"拜师条件:"..
			"\n    角色等级小于等于20级可以拜师,角色等级大于等于120级可以收徒弟"..
			"\n拜师方法:"..
			"\n    面对师傅,右键点击师傅,然后选择'拜他为师',等师傅接受以后就拜师成功了"..
			"\n\n师徒奖励:"..
			"\n    徒弟升级到指定等级,师傅和徒弟都有奖励,具体奖励请查看论坛"..
			"\n    徒弟充值师傅能获得丰厚奖励"
			);
		
		return;
	end
	
	if (_Seqno==0 and _Data=='4') then
		--『领取奖励』
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 2, 2, 1, 
			"1\n               请选择操作："..
			"\n\n        『我是师傅,领取徒弟升级奖励』"..
			"\n\n        『我是师傅,领取徒弟充值奖励』"..
			"\n\n        『我是徒弟,领取升级奖励』");
		
		return;
	
	end
	
	
	
	if (_Seqno==1 and _Data=='2') then
		--『我是师傅,领取徒弟升级奖励』
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    请把包裹空出2个位置");
			
			return ;
		end
		
		
		Me_Account_stxt = Char.GetData(_TalkIndex,%对象_账号%);
		
		
		--从数据库获取未出师的徒弟的总数和名单
		
		shuliang_stxt = SQL.Run("select count(*) from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 and 130ji < 10;");

		tudimingzi_stxt = SQL.Run("select tudimingzi from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 and 130ji < 10;");
		if tonumber(shuliang_stxt["0_0"]) == 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你没有徒弟,不能领取奖励");
		
			return;
		
		end
		
		tudimingdan_stxt = "";
		for i=0,tonumber(shuliang_stxt["0_0"])-1 do
			
			tudimingdan_stxt = tudimingdan_stxt .. i .. "." .. tudimingzi_stxt[i.."_0"] .." ";
		end
		
		if tonumber(shuliang_stxt["0_0"]) > 15 then
			
			NLG.SystemMessage(_TalkIndex, "你总共有"..tonumber(shuliang_stxt["0_0"]).."位徒弟:\n    "..tudimingdan_stxt);
			
			tudimingdan_stxt = "由于你的徒弟太多了,这里显示不下,请查看屏幕的黄字提示,如果一满屏黄字都没有提示完全,请挨个测试";
		
		end
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 1, 11, "你总共有"..tonumber(shuliang_stxt["0_0"]).."位徒弟,编号如下:\n    "..tudimingdan_stxt.."\n\n    请输入徒弟的编号：");
		
		
		return;
	end
	
	--师傅领取徒弟等级奖励 输入了编号
	if(_Seqno==11 and _Select==1) then
		--NLG.SystemMessage(_TalkIndex, "select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		_Data = tonumber(_Data);
		if tonumber(_Data) == nil or tonumber(_Data) < 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n"..String.Centering("请输入有效的徒弟编号"));
			return;
		end
		
		--Me_Account_stxt = Char.GetData(_TalkIndex,%对象_账号%);
		--从数据库获取未出师的徒弟的总数和名单
		
		if tonumber(shuliang_stxt["0_0"]) <= tonumber(_Data) then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你只有"..shuliang_stxt["0_0"].."位徒弟,请输入有效的徒弟编号");
		
			return ;
		end
		
		local sqltemp_stxt = SQL.Run("select * from shituxitong where tudimingzi = '"..tudimingzi_stxt[_Data.."_0"].."' and zhuangtai = 2;");
		
		tudicdkey_stxt = sqltemp_stxt["0_0"];
		dangetudimingzi_stxt = sqltemp_stxt["0_1"];
		tudidangqiandengji = tonumber(SQL.Run("select Lv from tbl_character where CdKey = '"..tudicdkey_stxt.."' and Name = '"..dangetudimingzi_stxt.."';")["0_0"]);
		tudi80ji = tonumber(sqltemp_stxt["0_5"]);
		tudi90ji = tonumber(sqltemp_stxt["0_6"]);
		tudi100ji = tonumber(sqltemp_stxt["0_7"]);
		tudi110ji = tonumber(sqltemp_stxt["0_8"]);
		tudi120ji = tonumber(sqltemp_stxt["0_9"]);
		tudi130ji = tonumber(sqltemp_stxt["0_10"]);
		
		if tudidangqiandengji >= 80 then
			if tudi80ji < 10 then
				--NLG.SystemMessage(_TalkIndex, "update shituxitong set 80ji = "..(tudi80ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");
				SQL.Run("update shituxitong set 80ji = "..(tudi80ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");
				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		else
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    "..dangetudimingzi_stxt.."还没有达到80级,无法领取奖励");
			return;
		end
		
		if tudidangqiandengji >= 90 then
			if tudi90ji < 10 then
				SQL.Run("update shituxitong set 90ji = "..(tudi90ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 100 then
			if tudi100ji < 10 then
				SQL.Run("update shituxitong set 100ji = "..(tudi100ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 110 then
			if tudi110ji < 10 then
				SQL.Run("update shituxitong set 110ji = "..(tudi110ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 120 then
			if tudi120ji < 10 then
				SQL.Run("update shituxitong set 120ji = "..(tudi120ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		end
		if tudidangqiandengji >= 130 then
			if tudi130ji < 10 then
				SQL.Run("update shituxitong set 130ji = "..(tudi130ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
				
				return ;
			end
		end
		
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    徒弟还没有达到下一个领奖的等级(徒弟下线才会刷新等级数据)");
		
		return;
		
		
	end

	

	if (_Seqno==1 and _Data=='4') then
		--『我是师傅,领取徒弟充值奖励』
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    请把包裹空出2个位置");
			
			return ;
		end
		
		Me_Account_stxt = Char.GetData(_TalkIndex,%对象_账号%);
		--从数据库获取徒弟的总数和名单(充值记录永久有效,徒弟出师了也有效)
		--sqltemp_stxt = sql.run("select count(*),tudicdkey from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		local shuliang_stxt_chongzhijiangli = SQL.Run("select count(*) from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		local tudimingzi_stxt_chongzhijiangli = SQL.Run("select tudicdkey from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		--NLG.SystemMessage(_TalkIndex, "shuliang_stxt_chongzhijiangli[0_0]:"..shuliang_stxt_chongzhijiangli["0_0"]);
		
		if shuliang_stxt_chongzhijiangli["0_0"] == nil then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你没有徒弟,不能领取奖励1");
			NLG.SystemMessage(_TalkIndex, "jinru");
		
			return;
		
		end
		if tonumber(shuliang_stxt_chongzhijiangli["0_0"]) == 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你没有徒弟,不能领取奖励2");
			--NLG.SystemMessage(_TalkIndex, "jinru2");
		
			return;
		
		end
		
		
		
		
		local tudicdkey_stxtmingdan = "'"..tudimingzi_stxt_chongzhijiangli["0_0"].."'";
		
		
		for i=1,shuliang_stxt_chongzhijiangli["0_0"]-1 do
			tudicdkey_stxtmingdan = tudicdkey_stxtmingdan .. "," .. "'"..tudimingzi_stxt_chongzhijiangli[i.."_0"].."'";
		end
		--从数据库获取所有徒弟的充值总额,没有被师傅领取过的
		local sqltemp_stxt2 = SQL.Run("select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		--NLG.SystemMessage(_TalkIndex, "select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		
		--NLG.SystemMessage(_TalkIndex, "sqltemp_stxt2:"..sqltemp_stxt2);
		
		--NLG.SystemMessage(_TalkIndex, "sqltemp_stxt2[0_0]:"..sqltemp_stxt2["0_0"]);  这个结果是nil
		
		
		if sqltemp_stxt2["0_0"] == nil then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    目前没有徒弟充值");
		
			return;
		elseif tonumber(sqltemp_stxt2["0_0"]) < 10  then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    徒弟充值总和不到10元");
		
			return;
		elseif tonumber(sqltemp_stxt2["0_0"]) >= 10 then
			SQL.Run("update tbl_alipay set shifulingqu = 1 where cdkey in ("..tudicdkey_stxtmingdan..");");
			
			Char.GiveItem(_TalkIndex,666000,(tonumber(sqltemp_stxt2["0_0"])*0.3));
				NLG.UpChar(_TalkIndex);
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    领取徒弟充值奖励成功");
			
			return;
		end
		
		
	end
	
	
	

	if (_Seqno==1 and _Data=='6') then
		--NLG.SystemMessage(_TalkIndex, "tudi1");
		
		--『我是徒弟,领取升级奖励』
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    请把包裹空出2个位置");
			
			return ;
		end
		
		
		Me_Account_stxt = Char.GetData(_TalkIndex,2002);
		dangetudimingzi_stxt = Char.GetData(_TalkIndex,%对象_原名%);
		
		--从数据库获取徒弟cdkey
		local tudilingjiang_sqljieguo = SQL.Run("Select count(*) from shituxitong Where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2 ;");
		local tudilingjiang_sqljieguo1 = SQL.Run("Select * from shituxitong Where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2 ;");

--		NLG.SystemMessage(_TalkIndex, "tudilingjiang_sqljieguo0_0:"..tudilingjiang_sqljieguo);
		
		if tonumber(tudilingjiang_sqljieguo["0_0"])== 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你没有拜师,不能领取奖励");
		
			return ;
		
		else
				
			if tonumber(tudilingjiang_sqljieguo1["0_10"]) == 1 or tonumber(tudilingjiang_sqljieguo1["0_10"]) == 11 then
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    你已经出师了");
			
				return ;
				
			end
			
			if tonumber(tudilingjiang_sqljieguo1["0_10"]) == 0 or tonumber(tudilingjiang_sqljieguo1["0_10"]) == 10 then
				--NLG.SystemMessage(_TalkIndex, "tudi2");
			
				--查看当前等级
				local tudidangqiandengji = Char.GetData(_TalkIndex,%对象_等级%);
				
				if tudidangqiandengji < 80 then
				
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    80级才能开始领取奖励");
					return ;
				
				end
				
				--徒弟的等级大于等于80级
				tudi80ji = tonumber(tudilingjiang_sqljieguo1["0_5"]);
				tudi90ji = tonumber(tudilingjiang_sqljieguo1["0_6"]);
				tudi100ji = tonumber(tudilingjiang_sqljieguo1["0_7"]);
				tudi110ji = tonumber(tudilingjiang_sqljieguo1["0_8"]);
				tudi120ji = tonumber(tudilingjiang_sqljieguo1["0_9"]);
				tudi130ji = tonumber(tudilingjiang_sqljieguo1["0_10"]);
				if tudidangqiandengji >= 80 and (tudi80ji == 0 or tudi80ji == 10) then
					SQL.Run("update shituxitong set 80ji = "..(tudi80ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");	
					return ;
				
				
				end
				
				
				if tudidangqiandengji >= 90 and (tudi90ji == 0 or tudi90ji == 10) then
					SQL.Run("update shituxitong set 90ji = "..(tudi90ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
 					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 100 and (tudi100ji == 0 or tudi100ji == 10) then
					SQL.Run("update shituxitong set 100ji = "..(tudi100ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 110 and (tudi110ji == 0 or tudi110ji == 10) then
					SQL.Run("update shituxitong set 110ji = "..(tudi110ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 120 and (tudi120ji == 0 or tudi120ji == 10) then
					SQL.Run("update shituxitong set 120ji = "..(tudi120ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 130 and (tudi130ji == 0 or tudi130ji == 10) then
					SQL.Run("update shituxitong set 130ji = "..(tudi130ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    奖励已经发放到包裹,请查收");
					
					return ;
				
				
				end
				
				
				
				NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,"\n\n    你还没有达到下一个领奖级别");
				
				return ;
			end
		
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		end
		
		
		
		
		
		
	end
	
	
	
	
	
end









function stxt_create_npc_init(index)
	return 1;
end
function shituxitong_init()
	stxt_create_npc();
end