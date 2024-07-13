--�ճ�����    �������  ��Ʒ�������޸�   2017.3.24  ������


Delegate.RegInit("routine_Init");
Delegate.RegDelTalkEvent("routine_talk");
	local tbl_routineinfo =
	{
		header = "0|0|0";
		target = {};
		temporary = {};
	}

function routine_talk(player,msg,color,range,size)
	if(msg == "jd") then
		routine_callback_command(player,msg,color,range,size);
	end
end

Delegate.RegDelBattleStartEvent("routine_BattleStart_Event");
Delegate.RegDelBattleOverEvent("routine_BattleOver_Event");

function routine_new_tbl_Event(_Player)
	local _tbl_routineinfo =
	{
		header = "0|0|0";
		target = {};
		temporary = {};
	}
	
	return _tbl_routineinfo;
	
end
function routine_BattleStart_Event(battleindex)
	routine_prebattle(battleindex);
end

function routine_BattleOver_Event(battleindex)
	for PwhI=0,4 do
		local PIndex = Battle.GetPlayer(battleindex,PwhI);
		
		if(VaildChar(PIndex)==true) then
			if(Char.GetData(PIndex,%����_Ѫ%) ~= 0) then
				routine_postbattle(battleindex,PIndex);
			end
		end
	end
end

ROUTINE_TYPE = {"��׽","��ɱ","��Ѱ"};
routine_list = {};
routine_lvlist = {};

--Ŀ���б�����д
--��ʾ������,ID,����|��ʾ������,ID,����|.......
--��Ҫ��|��β
--����������
--������Ϊ��׽��ʱ��������Ч������׽ֻ��Ҫ��ץһֻ������ȻҪд��ȥ
--������Ϊ��ɱ��ʱ��ID��Ч������ȻҪд�����һ������

--�����б�����д
--��Ǯ|����|����|������������,ID,����|......
--��Ҫ��|��β
--���߿��п��ޣ���ǰ������һ��Ҫ��


routine_list[1] = {};
routine_list[1].type = 3;
routine_list[1].target = "��ͷ��,18195,1";
routine_list[1].reward = "0|0|0|�ճ��������,72010,1";

routine_list[2] = {};
routine_list[2].type = 3;
routine_list[2].target = "��ͷ��,18194,1";
routine_list[2].reward = "0|0|0|�ճ��������,72010,1";


routine_list[3] = {};
routine_list[3].type = 3;
routine_list[3].target = "���������ǹ�Ǯ,18983,1";
routine_list[3].reward = "0|0|0|�ճ��������,72010,1";


routine_list[4] = {};
routine_list[4].type = 1;
routine_list[4].target = "�粼��,801,1";
routine_list[4].reward = "0|0|0|�ճ��������,72010,1";

routine_list[5] = {};
routine_list[5].type = 1;
routine_list[5].target = "����,401,1";
routine_list[5].reward = "0|0|0|�ճ��������,72010,1";

routine_list[6] = {};
routine_list[6].type = 1;
routine_list[6].target = "�Ʒ�,314,1";
routine_list[6].reward = "0|0|0|�ճ��������,72010,1";

routine_list[7] = {};
routine_list[7].type = 1;
routine_list[7].target = "���,321,1";
routine_list[7].reward = "0|0|0|�ճ��������,72010,1";

routine_list[8] = {};
routine_list[8].type = 1;
routine_list[8].target = "ˮ����,722,1";
routine_list[8].reward = "0|0|0|�ճ��������,72010,1";

routine_list[9] = {};
routine_list[9].type = 2;
routine_list[9].target = "ˮ����,722,1";
routine_list[9].reward = "0|0|0|�ճ��������,72010,1";
--�ȼ������б�
--ids����д�˵ȼ���Χ�ڵ�����ID
--���������������ȼ�����Ŵ�С����

routine_lvlist[1] = {};
routine_lvlist[1].max = 160;
routine_lvlist[1].min = 1;
routine_lvlist[1].ids = {1,2,3,4,5,6,7,8,9}


ROUTINE_WINDOW_SEQUENCE_MAIN = 10000;
ROUTINE_WINDOW_SEQUENCE_OFFER = 10001;
ROUTINE_WINDOW_SEQUENCE_CHECK = 10002;
ROUTINE_WINDOW_SEQUENCE_SUBMIT = 10003;
ROUTINE_WINDOW_SEQUENCE_CANCEL = 10004;
ROUTINE_WINDOW_SEQUENCE_ABANDON = 20000;

function getitemnum(_index,_id)
	local count = 0;
	for i = 8, 27 do
		local index = Char.GetItemIndex(_index,i)
		if index ~= -1 and index ~= -2 and index ~= -3 then
			if Item.GetData(index,%����_��%) == _id then
				count = count + 1;
			end
		end
	end
	return count;
end

function getdata( _flag, _source)
	local a,b;
	a, b = string.find( _source, _flag.."=");
	if( a == nil or b == nil)then
		return nil;
	end
	a = string.find( _source, "|", b);
	local ret = tonumber(string.sub( _source, b+1, a-1));
	if ret == nil then
		ret = 0
	end
	return ret;
end
	
function gendata( _flag, _source, _newdata)
	local data = getdata( _flag, _source);
	local ns;	
	if( data == nil)then
		ns = _source.._flag.."=".._newdata.."|";
	else
		ns = string.gsub( _source, _flag.."="..data.."|", _flag.."=".._newdata.."|",1);
	end
	return ns;
end

function splitdata(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

function genpdata_t(_data)
	local tdata = splitdata(_data,"|");
	local tn = #tdata;
	local pdata = {};
	for i = 1, tn do
		local ttdata = splitdata(tdata[i],",");
		pdata[i] = {ttdata[1],tonumber(ttdata[2]),tonumber(ttdata[3])}
	end
	return pdata;
end

function genpdata_r(_data)
	local rdata = splitdata(_data,"|");
	local rn = #rdata;
	local pdata = {};
	pdata[1] = rdata[1];
	pdata[2] = rdata[2];
	pdata[3] = rdata[3];
	for i = 4, rn do
		local rrdata = splitdata(rdata[i],",");
		pdata[i] = {rrdata[1],tonumber(rrdata[2]),tonumber(rrdata[3])}
	end
	return pdata;
end

function routine_create()
	if(routine_index == nil)then
		routine_index = NL.CreateNpc("lua/Module/routine_too.lua","routine_init")
		Char.SetData(routine_index,%����_����%,100975);
		Char.SetData(routine_index,%����_ԭ��%,100975);
		Char.SetData(routine_index,%����_X%,247);
		Char.SetData(routine_index,%����_Y%,86);
		Char.SetData(routine_index,%����_��ͼ%,1000);
		Char.SetData(routine_index,%����_����%,6);
		Char.SetData(routine_index,%����_����%,"�ճ�����");
		NLG.UpChar(routine_index);
		Char.SetTalkedEvent("lua/Module/routine_too.lua", "routine_callback_talk", routine_index);
		Char.SetWindowTalkedEvent("lua/Module/routine_too.lua", "routine_callback_window", routine_index);
	end
end

function routine_Init()
	routine_create();
end

--function routine_initialize(_index_me)
--	return true;
--end

function routine_init(_index)
	return true;
end


function routine_offer( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = Field.Get(_index_tome,"routine_header");
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	local message = "";
	local nowtime = tonumber(os.date("%d",os.time()));
	local lv = Char.GetData(_index_tome, %����_�ȼ�%)
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	if flag == 0 or time ~= nowtime then
		local seed = 0;
		for i = 1, #routine_lvlist do
			if lv <= routine_lvlist[i].max and lv >= routine_lvlist[i].min then
				local ids2 = routine_lvlist[i].ids;
				seed = routine_lvlist[i].ids[math.random(1,#ids2)]
				break;
			end
		end
		if seed == 0 then
			seed = math.random(1,#routine_list);
		end
		local tpdata = genpdata_t(routine_list[seed].target);
		local rpdata = genpdata_r(routine_list[seed].reward);
		local message = "\\n�����ѽ���"..
				"\\n"..
				"\\n"..
				"\\n�������ͣ�"..ROUTINE_TYPE[routine_list[seed].type]..
				"\\n����Ҫ��";
		for i = 1, #tpdata do
			message = message .. tpdata[i][1] .. "��" .. tpdata[i][3] .. " ";
		end
		message = message .. "\\n�������� ";
		for i = 4, #rpdata do
			message = message .. rpdata[i][1] .. "��" .. rpdata[i][3] .. " ";
		end
		NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_ȷ��%, ROUTINE_WINDOW_SEQUENCE_OFFER, message);
		local nheader = "1|" .. nowtime .. "|" .. seed;
		tbl_routineinfo[_Player].header = nheader;
		--Field.Set(_index_tome,"routine_header",nheader);
		if routine_list[seed].type == 2 then
			local tpdata = genpdata_t(routine_list[seed].target);
			for i = 1, #tpdata do
				tbl_routineinfo[_Player].target[i] = 0;
				tbl_routineinfo[_Player].temporary[i] = 0;
				--Field.Set(_index_tome,"routine_target_"..i,0)
				--Field.Set(_index_tome,"routine_target_temporary_"..i,0)
			end
		end
	else
		local message = "\\n";
		if flag == 1 then
			message = "\\n������ճ��������ڽ����У�����͡�"
		end
		if flag == 2 then
			message = "\\n������ճ��������Ѿ�����ඣ�������������"
		end
		if flag == 3 then
			message = "\\n������ճ��������Ѿ����ඣ�������������"
		end
		NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_ȷ��%, ROUTINE_WINDOW_SEQUENCE_OFFER, message);
	end

end


function routine_check( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = tbl_routineinfo[_Player].header;
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 then
		message = "\\n�㻹û��ʼ������ճ�����";
	elseif flag == 1 then
		local tpdata = genpdata_t(routine_list[seed].target);
		local rpdata = genpdata_r(routine_list[seed].reward);

		message = "\\n�����ѽ���"..
				"\\n"..
				"\\n"..
				"\\n�������ͣ�"..ROUTINE_TYPE[routine_list[seed].type]..
				"\\n����Ҫ��";
		for i = 1, #tpdata do
			message = message .. tpdata[i][1] .. "��" .. tpdata[i][3] .. " ";
		end
		message = message .. "\\n�������� ";
		for i = 4, #rpdata do
			message = message .. rpdata[i][1] .. "��" .. rpdata[i][3] .. " ";
		end
	elseif flag == 2 then
		message = "\\n���Ѿ�����������ճ�����������������";
	elseif flag == 3 then
		message = "\\n���Ѿ�����˽�����ճ�����������������";
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_ȷ��%, ROUTINE_WINDOW_SEQUENCE_CHECK, message);

end

function routine_submit( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	--local header = tbl_routineinfo[_Player].header;
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 then
		message = "\\n�㻹û��ʼ������ճ�����";
	elseif flag == 1 then
		local tpdata = genpdata_t(routine_list[seed].target);
		local type = routine_list[seed].type;
		if type == 1 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"���ϵĵ���̫���ˡ�")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local id = tpdata[i][2];
				if Char.HavePet(_index_tome,id) == -1 then
					clear = false;
				end
				if clear == false then
					break;
				end
			end
			if clear == false then
				message = "\\n�㻹û����ɽ�����ճ���������͡�";
			else
				for i = 1, #tpdata do
					local id = tpdata[i][2];
					NLG.SystemMessage(_index_tome,"����"..tpdata[i][1].."��");
					Char.DelSlotPet(_index_tome,Char.HavePet(_index_tome,id));
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				--Char.AddGold( _index_tome, gold);
				local tgold = Char.GetData(_index_tome,%����_���%);
				if(tgold + gold <= 1000000)then
					Char.SetData(_index_tome,%����_���%,tgold + gold);
				end
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+fame);
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n��ý����� ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "��" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--local header = tbl_routineinfo[_Player].header;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		elseif type == 2 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"���ϵĵ���̫���ˡ�")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local tcount = tonumber(tbl_routineinfo[_Player].target[i]);
				--local tcount = tonumber(Field.Get(_index_tome,"routine_target_"..i));
				if tcount == nil then
					tcount = 0;
				end
				if tcount < tpdata[i][3] then
					clear = false;
				end
				if clear == false then
					break;
				end
			end

			if clear == false then
				message = "\\n�㻹û����ɽ�����ճ���������͡�";
			else
				for i = 1, #tpdata do
					tbl_routineinfo[_Player].target[i] = 0;
					tbl_routineinfo[_Player].temporary[i] = 0;
					--Field.Set(_index_tome,"routine_target_"..i,0)
					--Field.Set(_index_tome,"routine_target_temporary_"..i,0)
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				--Char.AddGold( _index_tome, gold);		
				local tgold = Char.GetData(_index_tome,%����_���%);
				if(tgold + gold <= 1000000)then
					Char.SetData(_index_tome,%����_���%,tgold + gold);
				end
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+fame);
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n��ý����� ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "��" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		elseif type == 3 then
			if Char.ItemSlot(_index_tome) == 20 then
				NLG.SystemMessage(_index_tome,"���ϵĵ���̫���ˡ�")
				return;
			end
			local clear = true;
			for i = 1, #tpdata do
				local id = tpdata[i][2];
				local num = tpdata[i][3];
				if num > Char.ItemNum(_index_tome,id) then
					clear = false;
				end
				if clear == false then
					break;
				end
			end
			if clear == false then
				message = "\\n�㻹û����ɽ�����ճ���������͡�";
			else
				for i = 1, #tpdata do
					local id = tpdata[i][2];
					local num = tpdata[i][3]
					Char.DelItem(_index_tome,id,num);
				end
				local rpdata = genpdata_r(routine_list[seed].reward);
				local gold = rpdata[1];
				local fame = rpdata[2];
				local exp = rpdata[3];
				for i = 4, #rpdata do
					Char.GiveItem( _index_tome, rpdata[i][2], rpdata[i][3]);
				end
				Char.AddGold( _index_tome, gold);
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+fame);
				Char.SetData( _index_tome, %����_����%, Char.GetData( _index_tome,%����_����%)+exp);
				NLG.UpChar( _index_tome);
				message = "\\n��ý����� ";
				for i = 4, #rpdata do
					message = message .. rpdata[i][1] .. "��" .. rpdata[i][3] .. " ";
				end
				local nheader = "3|"..time.."|0";
				tbl_routineinfo[_Player].header = nheader;
				--Field.Set(_index_tome,"routine_header","3|"..time.."|0")
			end
		end
	elseif flag == 2 then
		message = "\\n���Ѿ�����������ճ�����������������";
	elseif flag == 3 then
		message = "\\n���Ѿ�����˽�����ճ�����������������";
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 
			ROUTINE_WINDOW_SEQUENCE_SUBMIT, message);	
end

function routine_cancel( _index_me, _index_tome)
	local _Player = Playerkey(_index_tome);
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	--local header = tbl_routineinfo[_Player].header;
	--local header = Field.Get(_index_tome,"routine_header");
	local message = "";
	if header == nil then
		header = "0|0|0";
	end
	local pheader = splitdata(header,"|");
	local flag = tonumber(pheader[1]);
	local time = tonumber(pheader[2]);
	local seed = tonumber(pheader[3]);
	if flag == 0 or flag == 2 or flag == 3 then
		message = "\\n��û�����ڽ��е��ճ�����";
	elseif flag == 1 then
		message = "\\n��ȷ��Ҫ����������ճ�������?"..
		"\\nһ������,��Ҫ�ȵ���������ٽ���!";
		NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�Ƿ�%,ROUTINE_WINDOW_SEQUENCE_ABANDON,message);
--		message = "\\n����յ��ճ������ѷ�������Ҫ����������ٽ�ม�";
--		Field.Set(_index_tome,"routine_header","2|"..time.."|0");
--		Field.Set(_index_tome,"routine_header","0|0|0")
	end
	NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 
			ROUTINE_WINDOW_SEQUENCE_CANCEL, message);
end

function routine_prebattle(_index_battle)
	for pos = 0, 4 do
		local index = Battle.GetPlayer( _index_battle, pos);
		if( VaildChar(index) == true)then
			local _Player = Playerkey(index);
			local header = nil;
			--local header = Field.Get(index,"routine_header");
			--if header == nil then
			if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
				header = tbl_routineinfo[_Player].header;
			end
			if header == nil then
				header = "0|0|0";
			else
				header = tbl_routineinfo[_Player].header;
			end
			local pheader = splitdata(header,"|");
			local flag = tonumber(pheader[1]);
			local seed = tonumber(pheader[3]);
			if flag == 1 and routine_list[seed].type == 2 then
				local tpdata = genpdata_t(routine_list[seed].target);
				for oppos = 10, 19 do
					local opindex = Battle.GetPlayer( _index_battle, oppos);
					if( VaildChar(opindex) == true)then
						for i = 1, #tpdata do
							if( Char.GetData( opindex, %����_����%) == tpdata[i][1])then
								if(tonumber(tbl_routineinfo[_Player].target[i]) < tpdata[i][3]) then
								--if( tonumber( Field.Get( index, "routine_target_"..i)) < tpdata[i][3])then
									tbl_routineinfo[_Player].temporary[i] = tbl_routineinfo[_Player].temporary[i] + 1;
									--Field.Set( index, "routine_target_temporary_"..i, tostring( tonumber( Field.Get( index, "routine_target_temporary_"..i))+1));
								end
							end
						end
					end
				end
			end
		end
	end

end

function routine_postbattle( _index_battle, _index_me)
	local _Player = Playerkey(_index_me);
		
	--local header = Field.Get(_index_me,"routine_header")
	--if header == nil then
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end

	if header == nil then
		header = "0|0|0";
	else
		header = tbl_routineinfo[_Player].header;
	end
	local pheader = splitdata(header,"|")
	local flag = tonumber(pheader[1])
	local seed = tonumber(pheader[3])
	if flag == 1 and routine_list[seed].type == 2 then
		local tpdata = genpdata_t(routine_list[seed].target)
		for i = 1, #tpdata do
			precount = tbl_routineinfo[_Player].temporary[i];
			count = tbl_routineinfo[_Player].target[i];
			--precount = tonumber( Field.Get( _index_me, "routine_target_temporary_"..i));
			--count = tonumber( Field.Get( _index_me, "routine_target_"..i));
			if( precount == nil)then
				precount = 0;
			end
			if( count == nil)then
				count = 0;
			end
			
			count = count + precount;
			tbl_routineinfo[_Player].target[i] = count;
			tbl_routineinfo[_Player].temporary[i] = 0;
			--Field.Set( _index_me, "routine_target_"..i, tostring( count));
			--Field.Set( _index_me, "routine_target_temporary_"..i, 0)
		end
	end
end

function routine_callback_talk( _index_me, _index_tome)
	local message = "5"..
			"\\n����������ճ�������ȡ����������"..
			"\\nע�⣺������������޷������½�����"..
			"\\nע�⣺�ύ��׽�����ʱ���벻Ҫ���Լ���������"..
			"\\nĿ����ͬ�ĳ���������ϣ�������ܻᱻ����Ŷ��"..
			"\\n"..
			"\\n�����ճ�����"..
			"\\n�鿴��ǰ������ɽ���"..
			"\\n�ύ����"..
			"\\n��������";
	NLG.ShowWindowTalked( _index_tome, _index_me, %����_ѡ���%, %��ť_�ر�%, 
			ROUTINE_WINDOW_SEQUENCE_MAIN, message);	
end

function routine_callback_window( _index_me, _index_tome, _sequence, _select, _data)
	local _Player = Playerkey(_index_tome);
	if(tbl_routineinfo[_Player] == nil) then
		tbl_routineinfo[_Player] = routine_new_tbl_Event(_index_tome);
	end
	if( _sequence == ROUTINE_WINDOW_SEQUENCE_MAIN)then
		argument = tonumber( _data);
--		if( argument == 1)then
--			routine_offer( _index_me, _index_tome);
		if( argument == 1)then
			if(Char.GetData(_index_tome,%����_�ȼ�%) <=59)then
				NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 
				ROUTINE_WINDOW_SEQUENCE_CANCEL, "���ĵȼ�С��60�����޷�������");
				return;
			end
			routine_offer( _index_me, _index_tome)

		end
		if( argument == 2)then
			routine_check( _index_me, _index_tome);
		end
		--if( argument == 2)then
				--NLG.SystemMessage(_index_tome,"������������� jd ��ѯ�ճ��������ɶȡ�");
			--routine_check( _index_me, _index_tome);
		--end
		if( argument == 3)then
			routine_submit( _index_me, _index_tome);
		end
		if( argument == 4)then
			routine_cancel( _index_me, _index_tome);
		end
	end
	if ( _sequence ==  ROUTINE_WINDOW_SEQUENCE_ABANDON ) then
		if ( _select == %��ť_��%) then
			local _Player = Playerkey(_index_tome);
			local header = nil;
			if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
				header = tbl_routineinfo[_Player].header;
			end

			--local header = tbl_routineinfo[_Player].header;	
			--local header = Field.Get(_index_tome,"routine_header");
			local message = "";
			if header == nil then
				header = "0|0|0";
			end
			local pheader = splitdata(header,"|");
			local flag = tonumber(pheader[1]);
			local time = tonumber(pheader[2]);
			local seed = tonumber(pheader[3]);
			message = "\\n����յ��ճ������ѷ�������Ҫ����������ٽ�ม�";
			nheader = "2|"..time.."|0";
			tbl_routineinfo[_Player].header = nheader;
			--Field.Set(_index_tome,"routine_header","2|"..time.."|0");
			--Field.Set(_index_tome,"routine_header","0|0|0");
			NLG.ShowWindowTalked( _index_tome, _index_me, %����_��Ϣ��%, %��ť_�ر�%, 
				ROUTINE_WINDOW_SEQUENCE_CANCEL, message);
		end
	end 
end

function routine_callback_command( _index, _message, _color, _range, _size)
	local _Player = Playerkey(_index);
	--local header;
	--local header = Field.Get(_index,"routine_header")
	local header = nil;
	if(tbl_routineinfo ~= nil and tbl_routineinfo[_Player] ~= nil and tbl_routineinfo[_Player].header ~= nil)then
		header = tbl_routineinfo[_Player].header;
	end
	if header == nil then
		header = "0|0|0";
	else
		header = tbl_routineinfo[_Player].header;
	end
	local pheader = splitdata(header,"|")
	local flag = tonumber(pheader[1])
	local seed = tonumber(pheader[3])
	local message = "[�ճ�����]";
	if flag == 1 and routine_list[seed].type == 2 then
		local tpdata = genpdata_t(routine_list[seed].target)
		for i = 1, #tpdata do
			message = message .. tpdata[i][1].."("..tbl_routineinfo[_Player].target[i].."/".. tpdata[i][3]..") "
			--message = message .. tpdata[i][1].."("..Field.Get(_index,"routine_target_"..i).."/".. tpdata[i][3]..") "
		end
	else
		message = message .. "û�п��Բ�ѯ�����ݡ�"
	end
	NLG.SystemMessage(_index,message)
end