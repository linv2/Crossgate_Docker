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
	Char.SetData(PlaceNumNpc_stxt, 2000, "ʦͽϵͳ");
	NLG.UpChar(PlaceNumNpc_stxt)


	if (Char.SetTalkedEvent(nil, "stxt_Talked",PlaceNumNpc_stxt) < 0) then
		print("stxt_Talked ע���¼�ʧ�ܡ�");
		return false;
	end
	
	if (Char.SetWindowTalkedEvent(nil, "Shitu__Window_Talked", PlaceNumNpc_stxt) < 0) then
			print("Shitu__Window_Talked ע���¼�ʧ�ܡ�");
			return false;
	end
	
	
	return true;
end

function stxt_Talked( _MeIndex, _PlayerIndex)
	
	
	NLG.ShowWindowTalked(_PlayerIndex,_MeIndex, 2, 2, 0, 
			"1\n                    ��ѡ�������"..
			"\n\n��������������������ʦͽ���ܡ�"..
			"\n\n����������������������ȡ������\n");
			
	return;
	
end






--��������ѡ����ѡ��
function Shitu__Window_Talked(_MeIndex, _TalkIndex, _Seqno, _Select, _Data)
	--NLG.SystemMessage(_TalkIndex, "��ʾ2");
	--NLG.SystemMessage(_TalkIndex, "��ѯ����Լ��Ĵ��ڲ���ʾ _Seqno=".._Seqno.."  _Select=".._Select.."  _Data=".._Data);
	
	
	
	
	
	if (_Seqno==0 and _Data=='2') then
		--��ʦͽ���ܡ�
		
		NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,
			"��ʦ����:"..
			"\n    ��ɫ�ȼ�С�ڵ���20�����԰�ʦ,��ɫ�ȼ����ڵ���120��������ͽ��"..
			"\n��ʦ����:"..
			"\n    ���ʦ��,�Ҽ����ʦ��,Ȼ��ѡ��'����Ϊʦ',��ʦ�������Ժ�Ͱ�ʦ�ɹ���"..
			"\n\nʦͽ����:"..
			"\n    ͽ��������ָ���ȼ�,ʦ����ͽ�ܶ��н���,���影����鿴��̳"..
			"\n    ͽ�ܳ�ֵʦ���ܻ�÷����"
			);
		
		return;
	end
	
	if (_Seqno==0 and _Data=='4') then
		--����ȡ������
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 2, 2, 1, 
			"1\n               ��ѡ�������"..
			"\n\n        ������ʦ��,��ȡͽ������������"..
			"\n\n        ������ʦ��,��ȡͽ�ܳ�ֵ������"..
			"\n\n        ������ͽ��,��ȡ����������");
		
		return;
	
	end
	
	
	
	if (_Seqno==1 and _Data=='2') then
		--������ʦ��,��ȡͽ������������
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��Ѱ����ճ�2��λ��");
			
			return ;
		end
		
		
		Me_Account_stxt = Char.GetData(_TalkIndex,%����_�˺�%);
		
		
		--�����ݿ��ȡδ��ʦ��ͽ�ܵ�����������
		
		shuliang_stxt = SQL.Run("select count(*) from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 and 130ji < 10;");

		tudimingzi_stxt = SQL.Run("select tudimingzi from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 and 130ji < 10;");
		if tonumber(shuliang_stxt["0_0"]) == 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��û��ͽ��,������ȡ����");
		
			return;
		
		end
		
		tudimingdan_stxt = "";
		for i=0,tonumber(shuliang_stxt["0_0"])-1 do
			
			tudimingdan_stxt = tudimingdan_stxt .. i .. "." .. tudimingzi_stxt[i.."_0"] .." ";
		end
		
		if tonumber(shuliang_stxt["0_0"]) > 15 then
			
			NLG.SystemMessage(_TalkIndex, "���ܹ���"..tonumber(shuliang_stxt["0_0"]).."λͽ��:\n    "..tudimingdan_stxt);
			
			tudimingdan_stxt = "�������ͽ��̫����,������ʾ����,��鿴��Ļ�Ļ�����ʾ,���һ�������ֶ�û����ʾ��ȫ,�밤������";
		
		end
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 1, 1, 11, "���ܹ���"..tonumber(shuliang_stxt["0_0"]).."λͽ��,�������:\n    "..tudimingdan_stxt.."\n\n    ������ͽ�ܵı�ţ�");
		
		
		return;
	end
	
	--ʦ����ȡͽ�ܵȼ����� �����˱��
	if(_Seqno==11 and _Select==1) then
		--NLG.SystemMessage(_TalkIndex, "select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		_Data = tonumber(_Data);
		if tonumber(_Data) == nil or tonumber(_Data) < 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n"..String.Centering("��������Ч��ͽ�ܱ��"));
			return;
		end
		
		--Me_Account_stxt = Char.GetData(_TalkIndex,%����_�˺�%);
		--�����ݿ��ȡδ��ʦ��ͽ�ܵ�����������
		
		if tonumber(shuliang_stxt["0_0"]) <= tonumber(_Data) then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��ֻ��"..shuliang_stxt["0_0"].."λͽ��,��������Ч��ͽ�ܱ��");
		
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
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		else
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    "..dangetudimingzi_stxt.."��û�дﵽ80��,�޷���ȡ����");
			return;
		end
		
		if tudidangqiandengji >= 90 then
			if tudi90ji < 10 then
				SQL.Run("update shituxitong set 90ji = "..(tudi90ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 100 then
			if tudi100ji < 10 then
				SQL.Run("update shituxitong set 100ji = "..(tudi100ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 110 then
			if tudi110ji < 10 then
				SQL.Run("update shituxitong set 110ji = "..(tudi110ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		end
		
		if tudidangqiandengji >= 120 then
			if tudi120ji < 10 then
				SQL.Run("update shituxitong set 120ji = "..(tudi120ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		end
		if tudidangqiandengji >= 130 then
			if tudi130ji < 10 then
				SQL.Run("update shituxitong set 130ji = "..(tudi130ji+10).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

				Char.GiveItem(_TalkIndex,1,1);
				NLG.UpChar(_TalkIndex);
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
				
				return ;
			end
		end
		
		
		NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ͽ�ܻ�û�дﵽ��һ���콱�ĵȼ�(ͽ�����߲Ż�ˢ�µȼ�����)");
		
		return;
		
		
	end

	

	if (_Seqno==1 and _Data=='4') then
		--������ʦ��,��ȡͽ�ܳ�ֵ������
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��Ѱ����ճ�2��λ��");
			
			return ;
		end
		
		Me_Account_stxt = Char.GetData(_TalkIndex,%����_�˺�%);
		--�����ݿ��ȡͽ�ܵ�����������(��ֵ��¼������Ч,ͽ�ܳ�ʦ��Ҳ��Ч)
		--sqltemp_stxt = sql.run("select count(*),tudicdkey from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		local shuliang_stxt_chongzhijiangli = SQL.Run("select count(*) from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		local tudimingzi_stxt_chongzhijiangli = SQL.Run("select tudicdkey from shituxitong where shifucdkey = '"..Me_Account_stxt.."' and zhuangtai = 2 ;");
		
		--NLG.SystemMessage(_TalkIndex, "shuliang_stxt_chongzhijiangli[0_0]:"..shuliang_stxt_chongzhijiangli["0_0"]);
		
		if shuliang_stxt_chongzhijiangli["0_0"] == nil then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��û��ͽ��,������ȡ����1");
			NLG.SystemMessage(_TalkIndex, "jinru");
		
			return;
		
		end
		if tonumber(shuliang_stxt_chongzhijiangli["0_0"]) == 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��û��ͽ��,������ȡ����2");
			--NLG.SystemMessage(_TalkIndex, "jinru2");
		
			return;
		
		end
		
		
		
		
		local tudicdkey_stxtmingdan = "'"..tudimingzi_stxt_chongzhijiangli["0_0"].."'";
		
		
		for i=1,shuliang_stxt_chongzhijiangli["0_0"]-1 do
			tudicdkey_stxtmingdan = tudicdkey_stxtmingdan .. "," .. "'"..tudimingzi_stxt_chongzhijiangli[i.."_0"].."'";
		end
		--�����ݿ��ȡ����ͽ�ܵĳ�ֵ�ܶ�,û�б�ʦ����ȡ����
		local sqltemp_stxt2 = SQL.Run("select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		--NLG.SystemMessage(_TalkIndex, "select sum(`count`) from tbl_alipay where cdkey in ("..tudicdkey_stxtmingdan..") and shifulingqu = 0 ;");
		
		--NLG.SystemMessage(_TalkIndex, "sqltemp_stxt2:"..sqltemp_stxt2);
		
		--NLG.SystemMessage(_TalkIndex, "sqltemp_stxt2[0_0]:"..sqltemp_stxt2["0_0"]);  ��������nil
		
		
		if sqltemp_stxt2["0_0"] == nil then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    Ŀǰû��ͽ�ܳ�ֵ");
		
			return;
		elseif tonumber(sqltemp_stxt2["0_0"]) < 10  then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ͽ�ܳ�ֵ�ܺͲ���10Ԫ");
		
			return;
		elseif tonumber(sqltemp_stxt2["0_0"]) >= 10 then
			SQL.Run("update tbl_alipay set shifulingqu = 1 where cdkey in ("..tudicdkey_stxtmingdan..");");
			
			Char.GiveItem(_TalkIndex,666000,(tonumber(sqltemp_stxt2["0_0"])*0.3));
				NLG.UpChar(_TalkIndex);
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��ȡͽ�ܳ�ֵ�����ɹ�");
			
			return;
		end
		
		
	end
	
	
	

	if (_Seqno==1 and _Data=='6') then
		--NLG.SystemMessage(_TalkIndex, "tudi1");
		
		--������ͽ��,��ȡ����������
		if Char.ItemSlot(_TalkIndex) > 18 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��Ѱ����ճ�2��λ��");
			
			return ;
		end
		
		
		Me_Account_stxt = Char.GetData(_TalkIndex,2002);
		dangetudimingzi_stxt = Char.GetData(_TalkIndex,%����_ԭ��%);
		
		--�����ݿ��ȡͽ��cdkey
		local tudilingjiang_sqljieguo = SQL.Run("Select count(*) from shituxitong Where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2 ;");
		local tudilingjiang_sqljieguo1 = SQL.Run("Select * from shituxitong Where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2 ;");

--		NLG.SystemMessage(_TalkIndex, "tudilingjiang_sqljieguo0_0:"..tudilingjiang_sqljieguo);
		
		if tonumber(tudilingjiang_sqljieguo["0_0"])== 0 then
			NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ��û�а�ʦ,������ȡ����");
		
			return ;
		
		else
				
			if tonumber(tudilingjiang_sqljieguo1["0_10"]) == 1 or tonumber(tudilingjiang_sqljieguo1["0_10"]) == 11 then
				NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    ���Ѿ���ʦ��");
			
				return ;
				
			end
			
			if tonumber(tudilingjiang_sqljieguo1["0_10"]) == 0 or tonumber(tudilingjiang_sqljieguo1["0_10"]) == 10 then
				--NLG.SystemMessage(_TalkIndex, "tudi2");
			
				--�鿴��ǰ�ȼ�
				local tudidangqiandengji = Char.GetData(_TalkIndex,%����_�ȼ�%);
				
				if tudidangqiandengji < 80 then
				
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    80�����ܿ�ʼ��ȡ����");
					return ;
				
				end
				
				--ͽ�ܵĵȼ����ڵ���80��
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
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");	
					return ;
				
				
				end
				
				
				if tudidangqiandengji >= 90 and (tudi90ji == 0 or tudi90ji == 10) then
					SQL.Run("update shituxitong set 90ji = "..(tudi90ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
 					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 100 and (tudi100ji == 0 or tudi100ji == 10) then
					SQL.Run("update shituxitong set 100ji = "..(tudi100ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 110 and (tudi110ji == 0 or tudi110ji == 10) then
					SQL.Run("update shituxitong set 110ji = "..(tudi110ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 120 and (tudi120ji == 0 or tudi120ji == 10) then
					SQL.Run("update shituxitong set 120ji = "..(tudi120ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
					
					return ;
				
				
				end
				
				if tudidangqiandengji >= 130 and (tudi130ji == 0 or tudi130ji == 10) then
					SQL.Run("update shituxitong set 130ji = "..(tudi130ji+1).." where tudimingzi = '"..dangetudimingzi_stxt.."' and zhuangtai = 2;");

					Char.GiveItem(_TalkIndex,1,1);
   				NLG.UpChar(_TalkIndex);
					NLG.ShowWindowTalked(_TalkIndex,_MeIndex, 0, 1, 999,"\n\n    �����Ѿ����ŵ�����,�����");
					
					return ;
				
				
				end
				
				
				
				NLG.ShowWindowTalked(_TalkIndex, _MeIndex, 0, 1, 999,"\n\n    �㻹û�дﵽ��һ���콱����");
				
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