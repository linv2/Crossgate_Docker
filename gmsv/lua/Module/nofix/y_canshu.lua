
--NPCλ��
yongbing_npc_wa = {1000,245,82,4}

yongbing_item = 70002;				--Ӷ��ѫ����Ʒid
yong_jiadianshu = 4;				--ÿ�μӵ���

skill_Level = 10;					--ʹ�ü�����ߵȼ�
zhiye_jie = 1;						--ְҵ�׼���1-5��Ĭ��ѡ��ְҵ��ת

-----------------------------------------------------
--ְҵ����
function zhiyename(zhiyeid)

			if(zhiyeid>=10 and zhiyeid<=19)then
				name = "��ʿ";
				id = 1;
			elseif(zhiyeid>=20 and zhiyeid<=29)then
				name = "��ͷսʿ";
				id = 1;
			elseif(zhiyeid>=30 and zhiyeid<=39)then
				name = "��ʿ";
				id = 1;
			elseif(zhiyeid>=40 and zhiyeid<=49)then
				name = "������";
				id = 1;
			elseif(zhiyeid>=50 and zhiyeid<=59)then
				name = "ʿ��";
				id = 1;
			elseif(zhiyeid>=60 and zhiyeid<=69)then
				name = "����";
				id = 2;
			elseif(zhiyeid>=70 and zhiyeid<=79)then
				name = "ħ��ʦ";
				id = 2;
			elseif(zhiyeid>=80 and zhiyeid<=89)then
				name = "����ʦ";
				id = 1;
			elseif(zhiyeid>=90 and zhiyeid<=99)then
				name = "��ӡʦ";
				id = 2;
			elseif(zhiyeid>=100 and zhiyeid<=109)then
				name = "����ʦ";
				id = 2;
			elseif(zhiyeid>=110 and zhiyeid<=119)then
				name = "ѱ��ʦ";
				id = 2;
			elseif(zhiyeid>=120 and zhiyeid<=129)then
				name = "����";
				id = 2;
			elseif(zhiyeid>=130 and zhiyeid<=139)then
				name = "��ʦ";
				id = 2;
			elseif(zhiyeid>=140 and zhiyeid<=149)then
				name = "�񶷼�";
				id = 2;
			elseif(zhiyeid>=150 and zhiyeid<=159)then
				name = "����";
				id = 2;
			elseif(zhiyeid>=160 and zhiyeid<=169)then
				name = "����";
				id = 2;
			elseif(zhiyeid>=410 and zhiyeid<=419)then
				name = "��̽";
				id = 3;
			elseif(zhiyeid>=420 and zhiyeid<=429)then
				name = "����";
				id = 3;
			elseif(zhiyeid>=430 and zhiyeid<=439)then
				name = "��ʿ";
				id = 3;
			elseif(zhiyeid>=440 and zhiyeid<=449)then
				name = "ҽ��";
				id = 3;
				
			-------------------
			elseif(zhiyeid>=200 and zhiyeid<=209)then
				name = "��������";
				id = 3;
			elseif(zhiyeid>=270 and zhiyeid<=279)then
				name = "���ߴ���";
				id = 3;
			-------------------
			elseif(zhiyeid>=350 and zhiyeid<=359)then
				name = "�������";
				id = 3;
			-------------------
			elseif(zhiyeid>=370 and zhiyeid<=379)then
				name = "�������";
				id = 3;
			elseif(zhiyeid>=390 and zhiyeid<=399)then
				name = "����ʦ";
				id = 3;
			-----------------------------
			elseif(zhiyeid>=450 and zhiyeid<=459)then
				name = "�ɼ�����";
				id = 3;
			else
				name = "����";
				id = 4;
			end
	return name,id;
end


---�ո��������
function kongge(petnax,shu)

	local petnaxc = string.len(petnax)/2; 
	konggex = "";

	for i=petnaxc,shu do
		konggex = konggex.."��";
	end
	
	fanhui = petnax..""..konggex;
	return fanhui;
end
---�ո��������
function kong(petnax,shu)

	local petnaxc = string.len(petnax); 
	konggex = "";

	for i=petnaxc,shu do
		konggex = konggex.." ";
	end
	
	fanhui = petnax..""..konggex;
	return fanhui;
end

function zhongzu(lei)
	if(lei==0)then
		zu = "����ϵ";
	elseif(lei==1)then
		zu = "��ϵ";
	elseif(lei==2)then
		zu = "����ϵ";
	
	elseif(lei==3)then
		zu = "����ϵ";
	elseif(lei==4)then
		zu = "����ϵ";
	elseif(lei==5)then
		zu = "ֲ��ϵ";
	elseif(lei==6)then
		zu = "Ұ��ϵ";
	elseif(lei==7)then
		zu = "����ϵ";
	elseif(lei==8)then
		zu = "����ϵ";
	elseif(lei==9)then
		zu = "аħϵ";
	else 
		zu = "δ֪";
	end

	return zu;
end

function jiankang(jk)
	if(jk>0)then

		qk = "$6������$0";
	
	else 
	
		qk = "$5�ǳ�����$0";
	end

	return qk;
end

function diaohuen(jk)
	if(jk==0)then

		qk = "$5δ����$0";
	
	else 
	
		qk = "$6��"..jk.."��$0";
	end

	return qk;
end 
--ʱ�����
function s2m(player,se)
	local min = 0;
	local hr = 0;
	while se > 0 do
		if se >= 60 then
			se = se - 60;
			min = min + 1;
			if min >= 60 then

				hr = hr + 1;
				min = 0;
			end
			
		else
			break;
		end
	end

	if(se <10)then
		se = "0"..se;
	end
	
	if(min <10)then
		min = "0"..min;
	end
	return hr,min,se;
end