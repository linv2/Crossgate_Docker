Delegate.RegInit("Signin_Init");

SIGNIN_MAIN = 700;
SIGNIN_END = 701;

signInCountPrize = {1,2,3,4,5,6,7};

--======================================
sign_maxLv = 60; 

--��һ��Ľ���
signInPrize = {};
signInPrize[1] = {};
signInPrize[1].Prize = {}; --�������ID��
signInPrize[1].Prize[1] = 70144;	--50��ħ��
signInPrize[1].Prize[2] = 15607;	--�������ظ�ҩ��150��

signInPrize[1].Count = {}; --���影��������
signInPrize[1].Count[1] = 1;
signInPrize[1].Count[2] = 1;
signInPrize[1].Random = {}; --���影�����ʱ�
signInPrize[1].Random[1] = 50;
signInPrize[1].Random[2] = 50;

--�ڶ���Ľ���
signInPrize[2] = {};
signInPrize[2].Prize = {}; --�������ID��
signInPrize[2].Prize[1] = 70107;	--100��ħ��
signInPrize[2].Prize[2] = 47819;	--��ʱС����-Mini

signInPrize[2].Count = {}; --���影��������
signInPrize[2].Count[1] = 1;
signInPrize[2].Count[2] = 1;

signInPrize[2].Random = {}; --���影�����ʱ�
signInPrize[2].Random[1] = 30;
signInPrize[2].Random[2] = 30;


--������Ľ���
signInPrize[3] = {};
signInPrize[3].Prize = {}; --�������ID��
signInPrize[3].Prize[1] = 70150;	--ʱ��ˮ��Lv1
signInPrize[3].Prize[2] = 15203;	--�������


signInPrize[3].Count = {}; --���影��������
signInPrize[3].Count[1] = 1;
signInPrize[3].Count[2] = 1;

signInPrize[3].Random = {}; --���影�����ʱ�
signInPrize[3].Random[1] = 30;
signInPrize[3].Random[2] = 30;


--������Ľ���
signInPrize[4] = {};
signInPrize[4].Prize = {}; --�������ID��
signInPrize[4].Prize[1] = 16001;	--��Կ��*5
signInPrize[4].Prize[2] = 16002;	--��Կ��*5
signInPrize[4].Prize[3] = 361000;	--С����

signInPrize[4].Count = {}; --���影��������
signInPrize[4].Count[1] = 5;
signInPrize[4].Count[2] = 5;
signInPrize[4].Count[3] = 1;

signInPrize[4].Random = {}; --���影�����ʱ�
signInPrize[4].Random[1] = 30;
signInPrize[4].Random[2] = 30;
signInPrize[4].Random[3] = 40;

--������Ľ���
signInPrize[5] = {};
signInPrize[5].Prize = {}; --�������ID��
signInPrize[5].Prize[1] = 70150;	--ʱ��ˮ��Lv1 *2
signInPrize[5].Prize[2] = 70211;	--��ħ��(200��)


signInPrize[5].Count = {}; --���影��������
signInPrize[5].Count[1] = 2;
signInPrize[5].Count[2] = 1;
signInPrize[5].Random = {}; --���影�����ʱ�
signInPrize[5].Random[1] = 30;
signInPrize[5].Random[2] = 30;


--������Ľ���
signInPrize[6] = {};
signInPrize[6].Prize = {}; --�������ID��
signInPrize[6].Prize[1] = 71731;	--���崫����ë
signInPrize[6].Prize[2] = 71734;	--�̴�����ë
signInPrize[6].Prize[3] = 70211;	--��ħ��(200��)

signInPrize[6].Count = {}; --���影��������
signInPrize[6].Count[1] = 1;
signInPrize[6].Count[2] = 1;
signInPrize[6].Count[3] = 1;

signInPrize[6].Random = {}; --���影�����ʱ�
signInPrize[6].Random[1] = 40;
signInPrize[6].Random[2] = 40;
signInPrize[6].Random[3] = 20;

--������Ľ���
signInPrize[7] = {};
signInPrize[7].Prize = {}; --�������ID��
signInPrize[7].Prize[1] = 70211;	--��ħ��(200��)
signInPrize[7].Prize[2] = 70150;	--ʱ��ˮ��Lv1 *3
signInPrize[7].Prize[3] = 18641;	--��ʬͼֽA
signInPrize[7].Prize[4] = 18642;	--��ʬͼֽb
signInPrize[7].Prize[5] = 18643;	--��ʬͼֽc

signInPrize[7].Count = {}; --���影��������
signInPrize[7].Count[1] = 1;
signInPrize[7].Count[2] = 3;
signInPrize[7].Count[3] = 1;
signInPrize[7].Count[4] = 1;
signInPrize[7].Count[5] = 1;

signInPrize[7].Random = {}; --���影�����ʱ�
signInPrize[7].Random[1] = 40;
signInPrize[7].Random[2] = 10;
signInPrize[7].Random[3] = 40;
signInPrize[7].Random[4] = 10;
signInPrize[7].Random[5] = 10;

function IsInTable(a1,a2)
	for k=1,#a2 do
		if(a2[k] == a1)then
			return a1;
		end
	end
	return -1;
end




function Signin_Init()
	signin_create();
end

function signin_InitNpc()
	return true;
end

function signin_create() --ÿ��ǩ��
	if(SigninNPC == nil)then
		SigninNPC = NL.CreateNpc("lua/Module/Signin.lua", "signin_InitNpc");
		Char.SetData(SigninNPC,%����_����%,14602);
		Char.SetData(SigninNPC,%����_ԭ��%,14602);
		Char.SetData(SigninNPC,%����_X%,247);
		Char.SetData(SigninNPC,%����_Y%,85);
		Char.SetData(SigninNPC,%����_��ͼ%,1000);
		Char.SetData(SigninNPC,%����_����%,6);
		Char.SetData(SigninNPC,%����_����%,"ÿ��ǩ���");
		NLG.UpChar(SigninNPC);
		Char.SetWindowTalkedEvent("lua/Module/Signin.lua","SigninNPCWinTalked",SigninNPC);
		Char.SetTalkedEvent("lua/Module/Signin.lua","SigninNPCTalked", SigninNPC);
	end
end

function canSignin(_tome)
	local times = tonumber(Field.Get(_tome,"SigninCount"));
	local signinTime = tonumber(Field.Get(_tome,"SigninTime"));
	local signble = 0;
	
	if(times == nil and signinTime == nil )then
		signble = 1;
	end

	if(times ~= nil and signinTime ~= nil)then
		local nowTime = os.time();
		local CTimeM = os.date("%m",signinTime);
		local CTimeD = os.date("%d",signinTime);
		local BTimeM = os.date("%m",nowTime);
		local BTimeD = os.date("%d",nowTime);
		if(CTimeM == BTimeM and CTimeD == BTimeD)then
			--�Ѿ�ǩ������
			signble = 0;
			return signble,times;
		end
		if(CTimeM ~= BTimeM or CTimeD ~= BTimeD)then		
			local signintimediff = os.difftime(nowTime,signinTime);
			if(signintimediff > 86400 and signintimediff < 172800)then
			--��������ǩ��
				signble = 1;
			end
			if(signintimediff >= 172800)then
			--��������ǩ��,��ǩ����������
				signble = 1;
				Field.Set(_tome,"SigninCount","0");
				times = 0;
			end
		end
	end
	return signble,times;

end

function SigninNPCTalked(_me,_tome)

	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	local myStr = "";
	local signble,times = canSignin(_tome);
	
	if(signble == 0 or signble == nil)then
		myStr = "\\n"..(Char.GetData(_tome,%����_����%)).."��ã���ӭ�����������ǣ�\\n\\n".."....���Ǹ������Ҽ���ǩ����\\n\\n�������Ѿ�ǩ�������أ��ٽ������ޣ�\\n\\n\\nĿǰ���Ѿ�����ǩ���� "..times.." ���ˣ�\\n";
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,SIGNIN_END,myStr);
		return;
	end

	if (times == nil)then
		myStr = ""..(Char.GetData(_tome,%����_����%)).."��ã���ӭ�����������ǣ�\\n\\n".."....���Ǹ������Ҽ���ǩ����\\n\\n����������һ��ǩ�����أ���������ǩ�������ͻ��ò�ͬ�Ľ����������԰����Ǽ������ޣ�\\nע�⣺��������ǩ�������ͻ����±�Ϊ��һ�죡\\n\\n�����������ھ�ǩ������ȡ�����";
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�Ƿ�%,SIGNIN_MAIN,myStr);
		return;
	end
	if(signble == 1 and times > 0)then
		myStr = "\\n"..(Char.GetData(_tome,%����_����%)).."��ã���ӭ�����������ǣ�\\n\\n".."....���Ǹ������Ҽ���ǩ����\\n\\n���Ѿ�������ȡ�� "..times.." ����Ŷ��\\n\\n\\n�����������ھ�ǩ������ȡ�����";
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�Ƿ�%,SIGNIN_MAIN,myStr);
		return;
	end
	if(signble == 1 and times == 0)then
		myStr = ""..(Char.GetData(_tome,%����_����%)).."��ã���ӭ�������ǣ�\\n\\n".."....���Ǹ������Ҽ���ǩ����\\n\\n���ƺ���һ��ʱ�䶼û����������ħ�����أ���֪�����������ÿɺ��أ�������Σ�ϣ�����ھ���ħ����������ˣ��\\n\\n�����������ھ�ǩ������ȡ�����";
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�Ƿ�%,SIGNIN_MAIN,myStr);
		return;
	end
end

function makeSignin(_me,_tome,times)
	if(Char.GetData(_tome,%����_�ȼ�%) < sign_maxLv) then
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,SIGNIN_END,"\\n\\n\\n�Բ������ĵȼ�����"..sign_maxLv.."�����޷�Ϊ���ṩǩ�����������Ŭ���ޣ�\\n");
		return;
	end
	local myStr = "\\n\\n\\n��ϲ��ǩ���ɹ���\\n\\nף����Ϸ��죡\\n\\n";
	local prizeCount = IsInTable(times,signInCountPrize);
	if(prizeCount ~= -1)then
		if(signInPrize[prizeCount] == nil) then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,SIGNIN_END,"\\n\\n\\n��ȡ����ʱ�����˴���...\\n������Ϣ: signInPrize[prizeCount] == nil \\n�뽫�˴��󱨸���ͷ�,�ѱ������޸���BUG!");
			return;
		end
		if(Char.ItemSlot(_tome)>19)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,SIGNIN_END,"\\n\\n��ı����ƺ�װ���½�����Ŷ!\\n\\n��ȥ�����°�!");
			return;
		end
		local PrizeFlg = 0;
		for i = 1,#(signInPrize[prizeCount].Prize) do
			if(NLG.Rand(0,100) <= signInPrize[prizeCount].Random[i]) then
				PrizeFlg = i;
				break;
			end
		end
		if(PrizeFlg == 0) then
			PrizeFlg = NLG.Rand(1,#(signInPrize[prizeCount].Prize));
		end
		local ArrayFlg = 0;
		if(type(signInPrize[prizeCount].Prize[PrizeFlg]) == "table") then
			for i = 1,#(signInPrize[prizeCount].ArrayRand[PrizeFlg]) do
				if(NLG.Rand(0,100) <= signInPrize[prizeCount].ArrayRand[PrizeFlg][i]) then
					ArrayFlg = i;
					break;
				end
			end
			if(ArrayFlg == 0) then
				ArrayFlg = NLG.Rand(1,#(signInPrize[prizeCount].Prize[PrizeFlg]));
			end
		end
		if(ArrayFlg == 0) then
			Char.GiveItem(_tome,signInPrize[prizeCount].Prize[PrizeFlg],signInPrize[prizeCount].Count[PrizeFlg]);
		else
			local ArrRand = NLG.Rand(1,#signInPrize[prizeCount].Prize[PrizeFlg][ArrayFlg]);
			Char.GiveItem(_tome,signInPrize[prizeCount].Prize[PrizeFlg][ArrayFlg][ArrRand],signInPrize[prizeCount].Count[PrizeFlg][ArrayFlg][ArrRand]);
		end
		myStr = myStr .. "���Ľ����Ѿ����ţ���ע�����Ŷ��\\n";
	end
	local t = os.time();
	local m = os.date("%m" ,t);
	local d = os.date("%d" ,t);
	local Y = os.date("%Y" ,t);
	local tt = {year = Y, month = m, day = d, hour = 0};
	Field.Set(_tome,"SigninTime",""..os.time(tt));
	Field.Set(_tome,"SigninCount",""..times);
	NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,SIGNIN_END,myStr);
end

function SigninNPCWinTalked(_me,_tome,_seqno,_select,_data)
	if(_seqno == SIGNIN_MAIN) then
		if(NLG.CanTalk(_me,_tome) == false)then
			return;
		end
		if(_select == %��ť_��% or _select == ""..%��ť_��%)then
			local signble,times = canSignin(_tome);
			if(times == nil)then
				times = 0;
				signble = 1;
			end
			if(signble==1)then
				times = times + 1;
				if(times > 7) then
					times = 1;
				end
				makeSignin(_me,_tome,times);
			end
		end
	end
end