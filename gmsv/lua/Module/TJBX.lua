 
 
--��������
tbl_TJBX_areaset = {};	--�������������趨
TJBX_itemid = 18002;	--����ID
TJBX_outtime = 300;	--�������˼�ȡ�Զ���ʧʱ�䣬��λ��
TJBX_limit_playerlevel = 1;	--��ҵȼ�����
TJBX_count = 10;	--�������
TJBX_DEBUG = 1;


--���귶Χ�趨
tbl_TJBX_areaset[1] = {227,72,247,98};
tbl_TJBX_areaset[2] = {214,82,226,92};


Delegate.RegInit("TJBX_Init");
function TJBX_Init()	
	for i=1,TJBX_count do
		TJBXNpc_id101_Create(i);
	end
end


function Myinit(index)
	return true;
end


Delegate.RegDelTalkEvent("TJBX_TalkEvent");

function TJBX_TalkEvent(player,msg,color,range,size)
	if(TJBX_DEBUG == 1)then
	if(msg == "[kaiqitjbxa]") then 
		for i=1,TJBX_count do
			TJBXNpc_id101_show(tbl_TJBX_npc[i]);
		end
	end
	end
end


function TJBXNpc_id101_Create(id)
	if (tbl_TJBX_npc[id] == nil) then
		tbl_TJBX_npc[id] = NL.CreateNpc("lua/Module/TJBX.lua", "Myinit");
		Char.SetData(tbl_TJBX_npc[id],%����_����%,27899);
		Char.SetData(tbl_TJBX_npc[id],%����_ԭ��%,27899);
		Char.SetData(tbl_TJBX_npc[id],%����_X%,2);
		Char.SetData(tbl_TJBX_npc[id],%����_Y%,52);
		Char.SetData(tbl_TJBX_npc[id],%����_��ͼ%,777);
		Char.SetData(tbl_TJBX_npc[id],%����_����%,5);
		Char.SetData(tbl_TJBX_npc[id],%����_����%,"�콵����");
		--Char.SetData(tbl_TJBX_npc[id],%����_��ɫ%,%��ɫ_��ɫ%);
		NLG.UpChar(tbl_TJBX_npc[id]);
		Char.SetTalkedEvent("lua/Module/TJBX.lua","TJBXNpc_id101_Talked", tbl_TJBX_npc[id]);
		Char.SetWindowTalkedEvent("lua/Module/TJBX.lua","TJBXNpc_id101_WTalked", tbl_TJBX_npc[id]);
		Char.SetLoopEvent("lua/Module/TJBX.lua","TJBXNpc_id101_LoopEvent", tbl_TJBX_npc[id],1000);
	end
end




--�콵���䡪��TJBXNpc_id101����Lua�ű�
function TJBXNpc_id101_Talked(_npc,_player)
	if(NLG.CanTalk(_npc,_player)==false)then
		return;
	end
	if Char.GetData(_player,%����_�ȼ�%) < TJBX_limit_playerlevel then
		NLG.SystemMessage(_player,"[ϵͳ��ʾ] �������������޷�ʰȡ�������");
		return;
	end

	if Char.ItemSlot(_player) == 20 then
		NLG.SystemMessage(_player,"[ϵͳ��ʾ] ���ı���̫�����ò��˱��䣡");
		return;
	else
		Char.SetData(_npc,%����_X%,52);
		Char.SetData(_npc,%����_Y%,50);
		Char.SetData(_npc,%����_��ͼ%,555);
		NLG.UpChar(_npc);
		NLG.SystemMessage(-1,"[ϵͳ����] ��ϲ��ҡ�"..Char.GetData(_player,%����_����%).."�����콵���䣬������ر��");
		Char.GiveItem(_player,TJBX_itemid,1);
		return;
	end
end

function TJBXNpc_id101_WTalked(_npc,_player,_seqno,_select,_data)
	if (NLG.CanTalk(_npc,_player)==false) then
		return;
	end

	if (tonumber(_seqno)==1) then
		if (tonumber(_select) == %��ť_��%) then
			return;
		else
			return;
		end
		return;
	end
	return; 
end



--ע�⣺����_�����ֶΣ����������汦���ѳ��ֵ�ʱ���ˣ������жϳ�����ʱ�ޣ���ص�555��ͼ
function TJBXNpc_id101_LoopEvent(_npc)
	if Char.GetData(_npc,%����_��ͼ%) ~= 555 then
		if (os.time() - Char.GetData(_npc,%����_����%)) >= TJBX_outtime then
			--NLG.SystemMessage(-1,"[ϵͳ����] ��("..Char.GetData(_npc,%����_X%)..","..Char.GetData(_npc,%����_Y%)..")������콵���䣬��Ϊ����ʰȡ�����Զ���ʧ��");
			Char.SetData(_npc,%����_X%,51);
			Char.SetData(_npc,%����_Y%,50);
			Char.SetData(_npc,%����_��ͼ%,555);
			NLG.UpChar(_npc);
		end
	end
	
	--�Զ�ˢ��
	if (os.date("%X",os.time())=="12:00:00") or (os.date("%X",os.time())=="13:00:00") or (os.date("%X",os.time())=="14:00:00") or (os.date("%X",os.time())=="15:00:00") or (os.date("%X",os.time())=="16:00:00") or (os.date("%X",os.time())=="17:00:00") or (os.date("%X",os.time())=="18:00:00") or (os.date("%X",os.time())=="19:00:00") or (os.date("%X",os.time())=="20:00:00") or (os.date("%X",os.time())=="21:00:00") or (os.date("%X",os.time())=="22:00:00") or (os.date("%X",os.time())=="23:00:00") or (os.date("%X",os.time())=="23:59:00") then
	--if (os.date("%X",os.time())=="08:00:00") or (os.date("%X",os.time())=="09:00:00") or (os.date("%X",os.time())=="10:00:00") or (os.date("%X",os.time())=="11:00:00") or (os.date("%X",os.time())=="12:00:00") or (os.date("%X",os.time())=="13:00:00") or (os.date("%X",os.time())=="14:00:00") or (os.date("%X",os.time())=="17:00:00") then
	--if Char.GetData(_npc,%����_��ͼ%) == 555 then
	--if (os.date("%X",os.time())=="00:05:00") or (os.date("%X",os.time())=="00:10:00")  or (os.date("%X",os.time())=="00:15:00")  or (os.date("%X",os.time())=="00:20:00") then
		TJBXNpc_id101_show(_npc);
	end
end


function myrandom(a1,a2)
	local b1;

	if(a1>=a2)then
		b1 = math.random(a2,a1);
	else
		b1 = math.random(a1,a2);
	end
	return b1;
end

function TJBXNpc_id101_show(_npc)
	local _k1 = myrandom(1,#tbl_TJBX_areaset);
	local _x = myrandom(tbl_TJBX_areaset[_k1][1],tbl_TJBX_areaset[_k1][3]);
	local _y = myrandom(tbl_TJBX_areaset[_k1][2],tbl_TJBX_areaset[_k1][4]);
	Char.SetData(_npc,%����_X%,_x);
	Char.SetData(_npc,%����_Y%,_y);
	Char.SetData(_npc,%����_��ͼ%,1000);
	Char.SetData(_npc,%����_����%,os.time());
	NLG.UpChar(_npc);
	if(TJBX_DEBUG == 1)then
		--NLG.SystemMessage(-1,"[����] (".._x..",".._y..")");
	end
	NLG.SystemMessage(-1,"[ϵͳ����] ���ر����ѳ�����ĳ��λ�ã��������Ǿ���ǰ����Ѱ��");
	--NLG.SystemMessage(-1,"[ϵͳ����] ���ر����ѳ�����ĳ��λ�ã��������Ǿ���ǰ����Ѱ��".._x..",".._y);
end



