local normalpowerupMax =  50 --ǿ����������
local normalpowerupgold = 10000 --ÿ��ǿ������ħ��
local normalpowerupname = "װ��ǿ��" --npc�Դ�ǿ����ʽ�ĳƺ�
local normalpowerupexplain = "װ��ǿ������Ϊװ���������ԡ�" --װ��ǿ��˵��
local normalpowerupitem = 18310 --ÿ��ǿ���������id
local normalpowerupitemname = "�ص�ˮ����Ƭ" --npc�Դ˵��߳ƺ�
local normalpowerupitemnum = 5 --ÿ��ǿ������������� Ϊ0����Ҫ
local normalpoweruprateitem = 18088 --ǿ��Ч���ӳɵ���id
local normalpoweruprateitemname = "ħʯ" --npc�Դ˵��߳ƺ�
local normalpoweruprateitemnum = 1 --ǿ��Ч���ӳɵ���ʹ������ Ϊ0�򲻿���
local normalpowerupratename = "�߼�װ��ǿ��" --npc�Դ�ǿ����ʽ�ĳƺ�
local itempowerupexplain = "    �߼�װ��ǿ���������ض�����Ϊװ���������ԡ�"; --����ǿ��˵��
local normalpoweruprateaddmin = 70; --ʹ��ǿ��Ч���ӳɵ��ߺ��ǿ��Ч����Сֵ����
local normalpoweruprateaddmax = 0; --ʹ��ǿ��Ч���ӳɵ��ߺ��ǿ��Ч�����ֵ����
--ע�⣺��2�����ò�Ҫʹ�����ǿ��Ч����Сֵ�������ֵ
--local normalpowerup = {%����_����%,80,150,%����_����%,10,80}; --ÿ��ǿ���ɹ����ӵ�����
local normalpowerup = {%����_����%,80,150,%����_ħ��%,10,80}; --ÿ��ǿ���ɹ����ӵ�����
--��ʽ��{x1,y1,z1,x2,y2,z2} x1Ϊ����1�ֶ� y1Ϊ����1ǿ��Ч����Сֵ z1Ϊ����1ǿ��Ч�����ֵ��x2Ϊ����2�ֶΡ����Դ�����
local poweruppre = {} --ǿ��ǰ׺
poweruppre[1] = "ڤ"
poweruppre[2] = "��"
poweruppre[3] = "�"
poweruppre[4] = "��"
poweruppre[5] = "��"
poweruppre[6] = "�D"
poweruppre[7] = "�p"
poweruppre[8] = "��"
poweruppre[9] = "�u"
poweruppre[10] = "�D"
poweruppre[11] = "��"
poweruppre[12] = "��"
poweruppre[13] = "�D"
poweruppre[14] = "�d"
poweruppre[15] = "��"
poweruppre[16] = "��"
poweruppre[17] = "��"
poweruppre[18] = "��"
poweruppre[19] = "��"
poweruppre[20] = "��"
poweruppre[21] = "��"
poweruppre[22] = "��"
poweruppre[23] = "��"
poweruppre[24] = "��"
poweruppre[25] = "��"
poweruppre[26] = "��"
poweruppre[27] = "��"
poweruppre[28] = "��"
poweruppre[29] = "��"
poweruppre[30] = "ħ"
poweruppre[31] = "��"
poweruppre[32] = "��"
poweruppre[33] = "��"
poweruppre[34] = "�"
poweruppre[35] = "��"
poweruppre[36] = "��"
poweruppre[37] = "��"
poweruppre[38] = "��"
poweruppre[39] = "��"
poweruppre[40] = "�H"
poweruppre[41] = "��"
poweruppre[42] = "ľ"
poweruppre[43] = "ˮ"
poweruppre[44] = "��"
poweruppre[45] = "��"
poweruppre[46] = "��"
poweruppre[47] = "��"
poweruppre[48] = "��"
poweruppre[49] = "��"
poweruppre[50] = "��"

--�ɿ����������ǿ��ǰ׺��δ�����õ�ǰ׺������һ���������õ�ǰ׺��ͬ��

local normalpowerupsucceedmsg = "����ҫ�۵Ĺ�â��ǿ���ɹ��ˣ�" --ǿ���ɹ�ʱ��ʾ

local itempowerupname = "����ǿ��" --npc�Դ�ǿ����ʽ�ĳƺ�
local itempowerupgold = 10000 --�滻��װ���ѵ�ħ�ҡ�
local itempowerup = {}
itempowerup[18310] = {"A1",1,%����_����%,100};
itempowerup[18311] = {"B1",2,%����_����%,100};
itempowerup[18312] = {"C1",3,%����_����%,100};
itempowerup[18313] = {"D1",4,%����_����%,100};
--itempowerup[18088] = {"ZZ",5,%����_����%,100,%����_ħ��%,200,%����_����%,50,%����_�ظ�%,50};
itempowerup[18088] = {"ZZ",5,%����_�ظ�%,100};
--��ʽitempowerup[��Ʒitemset���] = {"����2λ��д",���ڷ���,����1�ֶ�,����1��ֵ,����2�ֶ�,����2��ֵ����}
--ע�⣺��λ��д���Բ����ظ������ڷ���Ϊ����1-5�����ɳ�Խ��ͬ����ĵ��߱˴˻��⣬��װʱ���Զ��滻���Ѱ�װ��ͬ�������

local weapenpowerupnpcmetamo = 100500 --npc����
local weapenpowerupnpcmap = 555 --npc��ͼ
local weapenpowerupnpcposx = 20 --npcx����
local weapenpowerupnpcposy = 26 --npcy����
local weapenpowerupnpcdir = 4 --����
local weapenpowerupnpcname = "װ��ǿ��" --npc����

local weapenpowerupnpcmetamo2 = 100500 --����npc����
local weapenpowerupnpcmap2 = 555 --����npc��ͼ
local weapenpowerupnpcposx2 = 20 --����npcx����
local weapenpowerupnpcposy2 = 27 --����npcy����
local weapenpowerupnpcdir2 = 4 --���ķ���
local weapenpowerupnpcname2 = "����ǿ��" --����npc����

local jewelledin = 4 --��ʯ��־λ

--[[���������������ֶα�
	%����_����%
	%����_����%
	%����_����%
	%����_����%
	%����_�ظ�%
	%����_��ɱ%
	%����_����%
	%����_����%
	%����_����%
	%����_����%
	%����_ħ��%
	%����_����%
	%����_˯��%
	%����_ʯ��%
	%����_��%
	%����_�ҿ�%
	%����_����%
	%����_ħ��%
]]

--**���棺��ϵͳʹ�õ��ߵ�"δ������"��"ħ��txt�ű�"�����ֶΣ���Itemset.txt�У������Դ�������Ϊװ����δ��������������װ����"ħ��txt�ű�"��д���κ��ַ�
--------------------------------------------------------
local weapenpowerup1

for i = 1,100 do
	if poweruppre[i] == nil then
		poweruppre[i] = weapenpowerup1
	else
		weapenpowerup1 = poweruppre[i]
	end
end

local weapenpowerup2 = {}

for k,v in pairs(itempowerup) do
	weapenpowerup2[v[1]] = k
end

function weapenpowerup3(player,itemindex,n1)
	local weapenpowerup5 = Item.GetData(itemindex,%����_����%)
	local weapenpowerup6
	local weapenpowerup7 = Char.GetData(player,%����_���%)
	local weapenpowerup8
	local weapenpowerup9
	local weapenpowerup10 = Item.GetData(itemindex,%����_����%)
	if weapenpowerup5 >= 0 and weapenpowerup5 <= 14 then
		weapenpowerup6 = tonumber(Item.GetData(itemindex,%����_��ǰ��%))
		if type(weapenpowerup6) ~= "number" then
			weapenpowerup6 = 0
		end
		if weapenpowerup6 < normalpowerupMax then
			if weapenpowerup7 >= normalpowerupgold and Char.ItemNum(player,normalpowerupitem) >= normalpowerupitemnum then
				if ( n1 ~= nil and n1 == 1 and normalpoweruprateitemnum > 0 and Char.ItemNum(player,normalpoweruprateitem) >= normalpoweruprateitemnum ) or ( n1 == nil or n1 ~= 1) then
					if n1 ~= nil and n1 == 1 then
						Char.DelItem(player,normalpoweruprateitem,normalpoweruprateitemnum)
					end
					Char.DelItem(player,normalpowerupitem,normalpowerupitemnum)
					Char.AddGold(player,-normalpowerupgold)
					for i = 1,#normalpowerup,3 do
						for k = 1,10 do
							if n1 ~= nil and n1 == 1 then
								weapenpowerup9 = math.random(normalpowerup[i+1]+normalpoweruprateaddmin,normalpowerup[i+2]+normalpoweruprateaddmax)
							else
								weapenpowerup9 = math.random(normalpowerup[i+1],normalpowerup[i+2])
							end
						end
						weapenpowerup8 = Item.GetData(itemindex,normalpowerup[i])
						Item.SetData(itemindex,normalpowerup[i],weapenpowerup8+weapenpowerup9)
					end
					Item.SetData(itemindex,%����_��ǰ��%,weapenpowerup6+1)
					--NLG.SystemMessage(player,(Item.GetData(itemindex,%����_����%))..normalpowerupsucceedmsg)
					NLG.SystemMessage(player,(Item.GetData(itemindex,%����_����%))..normalpowerupsucceedmsg)
					if string.find(weapenpowerup10,"+",1) then
						weapenpowerup10 = splitplus(weapenpowerup10,"+")[1]
					end
					if string.find(weapenpowerup10,"*",1) then
						weapenpowerup10 = splitplus(weapenpowerup10,"*")[2]
					end
					Item.SetData(itemindex,%����_����%,poweruppre[(weapenpowerup6+1)].."*"..weapenpowerup10.."+"..(weapenpowerup6+1))
					Item.SetData(itemindex,jewelledin,0)
					for i = 0,27 do
						Item.UpItem(player,i)
					end
					return 1
				else
					NLG.SystemMessage(player,"ǿ������ĵ��߲��㡣")
					return -1
				end
			else
				NLG.SystemMessage(player,"ǿ������ĵ��߻���ħ�Ҳ��㡣")
				return -1
			end
		else
			NLG.SystemMessage(player,"���ĵ����Ѿ�ǿ����������")
			return -1
		end
	else
		NLG.SystemMessage(player,"��ѡ����ȷ�ĵ��߽���ǿ����")
		return -1
	end
end

function weapenpowerup4(player,itemindex1,itemindex2)
	local weapenpowerup11 = {"","","","",""}
	local weapenpowerup12 = {0,0,0,0,0}
	local weapenpowerup5 = Item.GetData(itemindex1,%����_����%)
	local weapenpowerup13 = Item.GetData(itemindex2,%����_ID%)
	local weapenpowerup8
	local weapenpowerup14 = ""
	local weapenpowerup7 = Char.GetData(player,%����_���%)
	if weapenpowerup7 >= itempowerupgold then
		if weapenpowerup5 >= 0 and weapenpowerup5 <= 14 then
			if type(itempowerup[weapenpowerup13]) == "table" then
				if Char.ItemSlot(player) <= 19 then
					Char.AddGold(player,-itempowerupgold)
					if string.find(Item.GetData(itemindex1,%����_���ò���%),"/",1) then
						weapenpowerup11 = splitplus(Item.GetData(itemindex1,%����_���ò���%),"/")
					end
					for i = 1,5 do
						if type(weapenpowerup2[weapenpowerup11[i]]) == "number" then
							weapenpowerup12[i] = weapenpowerup2[weapenpowerup11[i]]
						end
					end
					if weapenpowerup12[itempowerup[weapenpowerup13][2]] > 0 then
						for i = 3,#itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]],2 do
							weapenpowerup8 = Item.GetData(itemindex1,itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i])
							Item.SetData(itemindex1,itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i],weapenpowerup8-itempowerup[weapenpowerup12[itempowerup[weapenpowerup13][2]]][i+1])
						end
						Char.GiveItem(player,weapenpowerup12[itempowerup[weapenpowerup13][2]],1)
					end
					for i = 3,#itempowerup[weapenpowerup13],2 do
						weapenpowerup8 = Item.GetData(itemindex1,itempowerup[weapenpowerup13][i])
						Item.SetData(itemindex1,itempowerup[weapenpowerup13][i],weapenpowerup8+itempowerup[weapenpowerup13][i+1])
					end
					Char.DelItem(player,weapenpowerup13,1)
					weapenpowerup11[itempowerup[weapenpowerup13][2]] = itempowerup[weapenpowerup13][1]
					for i = 1,5 do
						weapenpowerup14 = weapenpowerup14..weapenpowerup11[i].."/"
					end
					Item.SetData(itemindex1,%����_���ò���%,weapenpowerup14)
					Item.SetData(itemindex1,jewelledin,0)
					NLG.SystemMessage(player,itempowerupname.."�ɹ���")
					for i = 0,27 do
						Item.UpItem(player,i)
					end
					return 1
				else
					NLG.SystemMessage(player,"��Ķ���̫���ˡ�")
					return -1
				end
			else
				NLG.SystemMessage(player,"ǿ��ʹ�õĵ��߲���ȷ��")
				return -1
			end
		else
			NLG.SystemMessage(player,"��ѡ����ȷ�ĵ��߽���ǿ����")
			return -1
		end
	else
		NLG.SystemMessage(player,"����ħ�Ҳ��㡣")
		return -1
	end
end

function weapenpowerup15(npc)
	--Char.SetData(npc,(%����_����%),weapenpowerupnpcmetamo)
	Char.SetData(npc,(%����_����%),weapenpowerupnpcmetamo)
	Char.SetData(npc,%����_ԭ��%,weapenpowerupnpcmetamo)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%����_��ͼ%,weapenpowerupnpcmap)
	Char.SetData(npc,%����_X%,weapenpowerupnpcposx)
	Char.SetData(npc,%����_Y%,weapenpowerupnpcposy)
	Char.SetData(npc,%����_����%,weapenpowerupnpcdir)
	Char.SetData(npc,%����_ԭ��%,weapenpowerupnpcname)
	Char.SetTalkedEvent(nil, "weapenpowerup16",npc)
	Char.SetWindowTalkedEvent(nil,"weapenpowerup17",npc)
	NLG.UpChar(npc)
	return true
end

function weapenpowerup151(npc)
	--Char.SetData(npc,(%����_����%),weapenpowerupnpcmetamo)
	Char.SetData(npc,(%����_����%),weapenpowerupnpcmetamo2)
	Char.SetData(npc,%����_ԭ��%,weapenpowerupnpcmetamo2)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%����_��ͼ%,weapenpowerupnpcmap2)
	Char.SetData(npc,%����_X%,weapenpowerupnpcposx2)
	Char.SetData(npc,%����_Y%,weapenpowerupnpcposy2)
	Char.SetData(npc,%����_����%,weapenpowerupnpcdir2)
	Char.SetData(npc,%����_ԭ��%,weapenpowerupnpcname2)
	Char.SetTalkedEvent(nil, "weapenpowerup161",npc)
	Char.SetWindowTalkedEvent(nil,"weapenpowerup171",npc)
	NLG.UpChar(npc)
	return true
end

function weapenpowerup16(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local weapenpowerup20 = "2\n�������ǿ��װ������ѡ��\n\n1.ʹ��˵��\n2."..normalpowerupname
		if normalpoweruprateitemnum > 0 then
			weapenpowerup20 = weapenpowerup20.."\n3."..normalpowerupratename
		end
		NLG.ShowWindowTalked(player,npc,2,2,0,weapenpowerup20)
	end
end

function weapenpowerup17(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			local weapenpowerup20
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					NLG.ShowWindowTalked(player,npc,0,2,1,normalpowerupexplain)
				elseif tonumber(Data) == 2 then
					weapenpowerup20 = "\n"..normalpowerupname.."��Ҫ���²��ϣ�\n1.ħ��"..normalpowerupgold.."\n2."..normalpowerupitemnum.."��"..normalpowerupitemname.."\n\n�����ȷ������ǿ��λ�ڵ���������һ�񡿵ĵ��ߡ�"
					NLG.ShowWindowTalked(player,npc,0,3,2,weapenpowerup20)
				elseif tonumber(Data) == 3 then
					if normalpoweruprateitemnum > 0 then
						weapenpowerup20 = "\n"..normalpowerupratename.."��Ҫ���²��ϣ�\n1.ħ��"..normalpowerupgold.."\n2."..normalpowerupitemnum.."��"..normalpowerupitemname.."\n3."..normalpoweruprateitemnum.."��"..normalpoweruprateitemname.."\n\n�����ȷ������ǿ��λ�ڵ���������һ�񡿵ĵ��ߡ�"
						NLG.ShowWindowTalked(player,npc,0,3,3,weapenpowerup20)
					else
						return
					end
				end
			elseif Seqno == 2 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				if weapenpowerup18 > 0 then
					weapenpowerup3(player,weapenpowerup18,0)
				else
					NLG.SystemMessage(player,"û�п�ǿ���ĵ��ߡ�")
				end
			elseif Seqno == 3 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				if weapenpowerup18 > 0 then
					weapenpowerup3(player,weapenpowerup18,1)
				else
					NLG.SystemMessage(player,"û�п�ǿ���ĵ��ߡ�")
				end
			end
		end
	end
end

function weapenpowerup161(npc,player)
	if NLG.CheckInFront(npc,player,2) then
		local weapenpowerup20 = "2\n�������Ϊװ�����ӻ��滻���ġ�\n��ѡ��\n1.ʹ��˵��\n2."..itempowerupname
		NLG.ShowWindowTalked(player,npc,2,2,0,weapenpowerup20)
	end
end

function weapenpowerup171(npc,player,Seqno,Select,Data)
	if NLG.CheckInFront(npc,player,2) then
		if Select ~= 2 then
			local weapenpowerup20
			if Seqno == 0 then
				if tonumber(Data) == 1 then
					weapenpowerup20 = itempowerupexplain
					NLG.ShowWindowTalked(player,npc,0,2,1,weapenpowerup20)
				elseif tonumber(Data) == 2 then
					weapenpowerup20 = "\n"..itempowerupname.."��Ҫ��\n1.����ǿ����װ�����ڵ���������һ��\n2.������"..itempowerupname.."�ĵ��߷��ڵ��������ڶ���\n3.����"..itempowerupgold.."ħ��\n\n�����ȷ����������"..itempowerupname.."��"
					NLG.ShowWindowTalked(player,npc,0,3,2,weapenpowerup20)
				end
			elseif Seqno == 2 then
				local weapenpowerup18 = Char.GetItemIndex(player,8)
				local weapenpowerup19 = Char.GetItemIndex(player,9)
				if weapenpowerup18 > 0 and weapenpowerup19 > 0 then
					weapenpowerup4(player,weapenpowerup18,weapenpowerup19)
				else
					NLG.SystemMessage(player,"����ȷ���õ��ߡ�")
				end
			end
		end
	end
end

--[[
if weapenpowerup21 == nil or weapenpowerup21 < 0 then
	print("WeapenPowerUpNpc1 Start")
	weapenpowerup21 = NL.CreateNpc(nil,"weapenpowerup15")
	print("WeapenPowerUpNpc1 Done")
end
if weapenpowerup22 == nil or weapenpowerup22 < 0 then
	print("WeapenPowerUpNpc2 Start")
	weapenpowerup22 = NL.CreateNpc(nil,"weapenpowerup151")
	print("WeapenPowerUpNpc2 Done")
end
]]
NL.CreateNpc(nil,"weapenpowerup15")
NL.CreateNpc(nil,"weapenpowerup151")
