Delegate.RegInit("announce_Init");

function announce_initialize(_MeIndex)
	return true;
end

function announce_create() --������ʹ
	if (announce_index == nil) then
		announce_index = NL.CreateNpc("lua/Module/announce.lua", "announce_initialize");
		Char.SetData(announce_index,%����_����%,106602);
		Char.SetData(announce_index,%����_ԭ��%,106602);
		Char.SetData(announce_index,%����_X%,242);
		Char.SetData(announce_index,%����_Y%,88);
		Char.SetData(announce_index,%����_��ͼ%,1000);
		Char.SetData(announce_index,%����_����%,4);
		Char.SetData(announce_index,%����_����%,"cgmsv��������Ա");
		NLG.UpChar(announce_index);
		Char.SetTalkedEvent("lua/Module/announce.lua", "Server_AnMsg", announce_index);
		Char.SetWindowTalkedEvent("lua/Module/announce.lua", "Server_AnTalk", announce_index);
	end
	--ע���¼�
	Char.SetLoopEvent("lua/Module/announce.lua", "serverLoop", announce_index, 10000);
end

--����һ�����������,����ȡ�������ÿ�ζ��᲻һ��
math.randomseed(os.time());
local LastAnTime = 0;
local Anon1 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Anon2 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Anon3 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Anon4 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Anon5 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Anon6 = {"��лʹ��cgmsv����,����lua/Module/announce.lua���޸ı��ı�."};
local Server_Anon = {Anon1,Anon2,Anon3,Anon4,Anon5,Anon6};
local An_State = 1;

function StartAtAnnounce()
	An_State = 1;
end

function StopAtAnnounce()
	An_State = 0;
end

function serverLoop(_MeIndex)
	--ȡһ��0-7�������,����NPC�ƶ��ķ���
	local dir= math.random(0, 7);
	--����NPC״̬Ϊ��·
	local walk = 1;
	NLG.SetAction(_MeIndex,walk);
	--��NPC��һ��
	NLG.WalkMove(_MeIndex,dir);
	if(Char.GetData(_MeIndex,%����_X%) < 225 or Char.GetData(_MeIndex,%����_X%) > 249) then
		Char.SetData(_MeIndex,%����_X%,242);
		NLG.UpChar(_MeIndex);
	end
	if(Char.GetData(_MeIndex,%����_Y%) < 80 or Char.GetData(_MeIndex,%����_Y%) > 99) then
		Char.SetData(_MeIndex,%����_Y%,88);
		NLG.UpChar(_MeIndex);
	end
	if(os.time() - LastAnTime >= 2700 and An_State == 1) then
		LastAnTime = os.time();
		NLG.SystemMessage(-1,"[cgmsv����]"..Server_Anon[math.random(1,6)][1].."");
	end
end

function Server_AnMsg(_me,_tome)
	if (NLG.CanTalk(_me,_tome) == true) then
		local str_caller = "3\\n\\n��ѡ������Ҫ��ѯ������...\\n\\n1.��η�ֹ�ʺű���\\n2.�����ϵ�ͷ�\\n3.���������Ϸ";
		NLG.ShowWindowTalked(_tome,_me,%����_ѡ���%,%��ť_�ر�%,1,str_caller);
	end
end

function Server_AnTalk(_MeIndex,_PlayerIndex,_seqno,_select,_data)
	if (_seqno == 1) then
		if ((_select == 0 or _select == "0") and (_data ~= "")) then
			local selectitem = tonumber(_data);
			if (selectitem == 1) then
				local Server_str = "\\n\\n1���벻Ҫ���⽫�ʺŵ���Ϣ��������ҷ���..\\n2���밲װ����ɱ�����,�Ա��������ʺ��Լ���Ϣ��ȫ\\n3��ע��ÿ��һ��ʱ�����һ�������޸�Ŷ\\n4�����������벻Ҫʹ�ô��������\\n5���������ʺű���ʱ,���һʱ����ϵ�ͷ�����";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,10,Server_str);
			end
			if (selectitem == 2) then
				local Server_str = "\\n\\nQQȺ:3191578760\\n\\n�ٷ���վ:www.cgmsv.com";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,10,Server_str);
			end
			if (selectitem == 3) then
				local Server_str = "\\n1��΢��ת�ʣ�����ϵGM\\n\\n2��֧����������ϵ�ͷ�QQ��ȡ֧�����ʺ�\\n\\n3���ٷ���վ:www.cgmsv.com\\n\\n";
				NLG.ShowWindowTalked(_PlayerIndex,_MeIndex,%����_��Ϣ��%,%��ť_�ر�%,10,Server_str);
			end
		end
	end
end

function announce_Init()
	announce_create();
end