local GameMasterCdkey = "shiluodegirl" --��ʹ�ÿ���̨���ܵ�GM�ʺ�
magnification1 = 3 --������ʤ�ߵ�ħ�ҽ�����(1-n Ϊ1ʱ�൱��ֻ�˱���)
magnification2 = 3 --������ʤ�ߵĵ���1������(1-n Ϊ1ʱ�൱��ֻ�˱���)
magnification3 = 3 --������ʤ�ߵĵ���2������(1-n Ϊ1ʱ�൱��ֻ�˱���)
betitem1 = {"������",88888,99999,10} --��עʹ�õĵ���1 {"��������",����itemid,���߿ɶѵ��������,��עһ��ʹ�õĵ�������}
betitem2 = {"����Ǯ��",88889,99999,50} --��עʹ�õĵ���2 {"��������",����itemid,���߿ɶѵ��������,��עһ��ʹ�õĵ�������}
ctrltype = 2 --���Ʒ�ʽ 0Ϊ������ 1Ϊ�Զ����� 2Ϊgm�ֶ�����
starttime = 8 --���Զ�����ʱ ÿ�տ���ʱ�� 24Сʱ�� 
endtime = 23 --���Զ�����ʱ ÿ�չر�ʱ�� 24Сʱ��
bettime = 1.5 --��עʱ�� ��λ����
mainnpcmatamo = 104414 --����npc����
mainnpcname = "�������" --����npc����
mainnpcmap = 60002 --����npc���ڵ�ͼ
mainnpcposx = 21 --����npc����x����
mainnpcposy = 9 --����npc����y����
mainnpclook = 6 --����npc����
RaceMonstermap = 60002 --����ħ�����ڵ�ͼ
RaceMonsterposx = 32 --��һֻ����ħ������x����
RaceMonsterposy = 6 --��һֻ����ħ������y����
RaceEndAway = 99 --�ܵ�����
RaceMonsterDir= 1 --ħ�﷽�� 1Ϊ����ħ����y�������� ��x������ 2Ϊ����ħ����x�������� ��y������
FootLimetMin = 500 --�ж���������(1000Ϊһ��)
FootLimetMax = 4000 --�ж���������(1000Ϊһ��)
RaceMonster = { --����ħ�����
{"������",110379,26573}, --��ʽΪ {"ħ������",ħ������,Ϊ����עʱͼ��}
{"����˿",110378,26573},
{"�����",110308,26573},
{"�򱴿�",110307,26573},
{"���׶�",110306,26573},
{"����˹",110305,26573},
{"����",110304,26573} --���һ��ħ���{}�󲻼�","
}

--[[ע�����
1��ʹ���ֶ�����ʱ�����𷴸�������
2�����رշ����������¼��ر��ű���������ע��¼��δ��ȡ�Ľ��𶼻ᶪʧ��
]]

----����Ϊ����������----

function splitplus(str, pat)
local t = {}
local last_end = 0
local s, e = string.find(str, pat, 1)
local i = 1
while s do
table.insert(t, string.sub(str, last_end + 1, last_end + s - last_end - 1))
last_end = e
s, e = string.find(str, pat, last_end + 1)
i = i + 1
end
if last_end <= string.len(str) then
cap = string.sub(str, last_end + 1)
table.insert(t, cap)
end
return t 
end

function strfindn(str,n)
	local back = nil
	for i = 1,string.len(str) do
		if n == string.sub(str,i,i) then
			back = i
			break
		end
	end
	return back
end

MonsterRacevalue1 = 0
MonsterRacevalue2 = 0
MonsterRacevalue3 = {}
MonsterRacevalue4 = {}
MonsterRacevalue5 = {}
MonsterRacevalue6 = {}
MonsterRacevalue7 = {}
MonsterRacevalue19 = {"������ע��","������"}
MonsterRacevalue19[0] = "�ر���"
if RaceMonsterDir == 1 then
	MonsterRacevalue20 = RaceEndAway + RaceMonsterposx
else
	MonsterRacevalue20 = RaceEndAway + RaceMonsterposy
end

function MonsterRacevalue24(npc)
	Char.SetData(npc,%����_����%,mainnpcmatamo)
	Char.SetData(npc,%����_ԭ��%,mainnpcmatamo)
	--Char.SetData(npc,3,0)
	Char.SetData(npc,%����_��ͼ%,mainnpcmap)
	Char.SetData(npc,%����_X%,mainnpcposx)
	Char.SetData(npc,%����_Y%,mainnpcposy)
	Char.SetData(npc,%����_����%,mainnpclook)
	Char.SetData(npc,%����_ԭ��%,mainnpcname)
	Char.SetTalkedEvent(nil, "MonsterRacevalue21",npc)
	Char.SetWindowTalkedEvent(nil,"MonsterRacevalue22",npc)
	Char.SetLoopEvent(nil,"MonsterRacevalue23",npc,1000)
	NLG.UpChar(npc)
	return true
end

function MonsterRacevalue26()
	return true;
end

function MonsterRacevalue21(npc,player)
	local MonsterRacevalue8 = Char.GetData(player,2002)
	local MonsterRacevalue10
	local MonsterRacevalue9
	if MonsterRacevalue8 == GameMasterCdkey then
		MonsterRacevalue10 = 1000
		MonsterRacevalue9 = "2\n��ǰ���Ʒ�ʽΪ"..ctrltype.." ����״̬Ϊ"..MonsterRacevalue19[MonsterRacevalue2].."\n(0Ϊ�رգ�1Ϊ�Զ���2Ϊ�ֶ�)\n1.�ֶ�/�Զ��л�\n2.�鿴��ǰ��ע\n3.�鿴��ǰδ������Ľ���\n4.Ϊ��������ħ�����\n5.Ϊ��������ħ�����\n6.�ر�ϵͳ\n7.��ʼ����"
	else
		MonsterRacevalue10 = 0
		MonsterRacevalue9 = "3\n          **��ӭ����**\n��ǰ�������"..MonsterRacevalue19[MonsterRacevalue2].."\n\n1.��ҪͶע\n2.��Ҫ�콱"
	end
	NLG.ShowWindowTalked(player,npc,2,2,MonsterRacevalue10,MonsterRacevalue9)
end

function MonsterRacevalue22(npc,player,Seqno,Select,Data)
	if Select ~= 2 then
		local MonsterRacevalue8 = Char.GetData(player,2002)
		if Seqno == 0 then
			if tonumber(Data) == 1 then
				if MonsterRacevalue2 == 1 then
					local MonsterRacevalue9 = "3\n��ѡ����ע��ʽ��\n\n\n1.ħ����ע(ÿע1000ħ��)\n2.ħ����ע(ÿע10000ħ��)\n3."..betitem1[1].."��ע\n4."..betitem2[1].."��ע"
					NLG.ShowWindowTalked(player,npc,2,2,10,MonsterRacevalue9)
				else
					NLG.SystemMessage(player,"��ǰ�������"..MonsterRacevalue19[MonsterRacevalue2].."������Ͷע����ȴ��´λ��ᡣ")
					return
				end
			elseif tonumber(Data) == 2 then
				if type(MonsterRacevalue5[MonsterRacevalue8]) == "table" then
					if MonsterRacevalue5[MonsterRacevalue8][1] ~= nil and MonsterRacevalue5[MonsterRacevalue8][1] > 0 then
						if Char.GetData(player,%����_���%) + MonsterRacevalue5[MonsterRacevalue8][1] <= 1000000 then
							Char.AddGold(player,MonsterRacevalue5[MonsterRacevalue8][1])
							NLG.SystemMessage(player,"�õ�"..MonsterRacevalue5[MonsterRacevalue8][1].."G��")
							MonsterRacevalue5[MonsterRacevalue8][1] = 0
						else
							local MonsterRacevalue11 = 1000000 - Char.GetData(player,%����_���%)
							if MonsterRacevalue11 > 0 and MonsterRacevalue5[MonsterRacevalue8][1] > MonsterRacevalue11 then
								MonsterRacevalue5[MonsterRacevalue8][1] = MonsterRacevalue5[MonsterRacevalue8][1] - MonsterRacevalue11
								Char.AddGold(player,MonsterRacevalue11)
								NLG.SystemMessage(player,"�õ�"..MonsterRacevalue11.."G��")
								NLG.SystemMessage(player,"���Ǯ���ˣ�ʣ��"..MonsterRacevalue5[MonsterRacevalue8][1].."ħ�ҽ���δ�졣")
							end
						end
					else
						NLG.SystemMessage(player,"���޿���ȡ��ħ�ҽ���")
					end
					if MonsterRacevalue5[MonsterRacevalue8][2] ~= nil and MonsterRacevalue5[MonsterRacevalue8][2] > 0 then
						if Char.ItemSlot(player) + math.ceil(MonsterRacevalue5[MonsterRacevalue8][2]/betitem1[3]) <= 20 then
							Char.GiveItem(player,betitem1[2],MonsterRacevalue5[MonsterRacevalue8][2])
							MonsterRacevalue5[MonsterRacevalue8][2] = 0
						else
							if Char.ItemSlot(player) <= 19 and MonsterRacevalue5[MonsterRacevalue8][2] > betitem1[3] then
								MonsterRacevalue5[MonsterRacevalue8][2] = MonsterRacevalue5[MonsterRacevalue8][2] - betitem1[3]
								Char.GiveItem(player,betitem1[2],betitem1[3])
								NLG.SystemMessage(player,"��ĵ������ˣ�ʣ��"..MonsterRacevalue5[MonsterRacevalue8][2]..betitem1[1].."����δ�졣")
							end
						end
					else
						NLG.SystemMessage(player,"���޿���ȡ��"..betitem1[1].."����")
					end
					if MonsterRacevalue5[MonsterRacevalue8][3] ~= nil and MonsterRacevalue5[MonsterRacevalue8][3] > 0 then
						if Char.ItemSlot(player) + math.ceil(MonsterRacevalue5[MonsterRacevalue8][3]/betitem2[3]) <= 20 then
							Char.GiveItem(player,betitem2[2],MonsterRacevalue5[MonsterRacevalue8][3])
							MonsterRacevalue5[MonsterRacevalue8][3] = 0
						else
							if Char.ItemSlot(player) <= 19 and MonsterRacevalue5[MonsterRacevalue8][3] > betitem2[3] then
								MonsterRacevalue5[MonsterRacevalue8][3] = MonsterRacevalue5[MonsterRacevalue8][3] - betitem2[3]
								Char.GiveItem(player,betitem2[2],betitem2[3])
								NLG.SystemMessage(player,"��ĵ������ˣ�ʣ��"..MonsterRacevalue5[MonsterRacevalue8][3]..betitem2[1].."����δ�졣")
							end
						end
					else
						NLG.SystemMessage(player,"���޿���ȡ��"..betitem2[1].."����")
					end
				end
			end
		elseif Seqno == 10 then
			if MonsterRacevalue2 == 1 then
				if tonumber(Data) == 1 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ����֧�ֵĳ�����ע����ǰÿעΪ1000ħ�ҡ�|����ħ�Ҳ��㡣|���ĵ��������㡣"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|Ͷע"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1000|$6ÿעΪ1000ħ��|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,11,MonsterRacevalue9)
				elseif tonumber(Data) == 2 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ����֧�ֵĳ�����ע����ǰÿעΪ10000ħ�ҡ�|����ħ�Ҳ��㡣|���ĵ��������㡣"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|Ͷע"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|10000|$6ÿעΪ10000ħ��|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,12,MonsterRacevalue9)
				elseif tonumber(Data) == 3 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ����֧�ֵĳ�����ע����ǰÿעΪ"..betitem1[4].."��"..betitem1[1].."��|����ħ�Ҳ��㡣|���ĵ��������㡣"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|Ͷע"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6ÿעΪ"..betitem1[4].."��"..betitem1[1].."|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,13,MonsterRacevalue9)
				elseif tonumber(Data) == 4 then
					local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ����֧�ֵĳ�����ע����ǰÿעΪ"..betitem2[4].."��"..betitem2[1].."��|����ħ�Ҳ��㡣|���ĵ��������㡣"
					for i = 1,#RaceMonster do
						MonsterRacevalue9 = MonsterRacevalue9.."|Ͷע"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6ÿעΪ"..betitem2[4].."��"..betitem2[1].."|1|999"
					end
					NLG.ShowWindowTalked(player,npc,6,2,14,MonsterRacevalue9)
				end
			else
				NLG.SystemMessage(player,"��ǰ�������"..MonsterRacevalue19[MonsterRacevalue2].."������Ͷע����ȴ��´λ��ᡣ")
				return
			end
		elseif Seqno == 11 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*1000
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*1000
					end
					if Char.GetData(player,%����_���%) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.AddGold(player,-MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][1] = MonsterRacevalue4[MonsterRacevalue8][k][1] + v
							MonsterRacevalue6[k][1] = MonsterRacevalue6[k][1] + v
							NLG.SystemMessage(player,"��Ϊ"..RaceMonster[k][1].."��ע"..v.."ħ�ҳɹ�����ǰ����ע��Ϊ��"..MonsterRacevalue4[MonsterRacevalue8][k][1].."ħ�ң�"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."��"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."��")
						end
					else
						NLG.SystemMessage(player,"����ħ�Ҳ��㡣")
					end
				end
			end
		elseif Seqno == 12 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*10000
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*10000
					end
					if Char.GetData(player,%����_���%) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.AddGold(player,-MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][1] = MonsterRacevalue4[MonsterRacevalue8][k][1] + v
							MonsterRacevalue6[k][1] = MonsterRacevalue6[k][1] + v
							NLG.SystemMessage(player,"��Ϊ"..RaceMonster[k][1].."��ע"..v.."ħ�ҳɹ�����ǰ����ע��Ϊ��"..MonsterRacevalue4[MonsterRacevalue8][k][1].."ħ�ң�"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."��"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."��")
						end
					else
						NLG.SystemMessage(player,"����ħ�Ҳ��㡣")
					end
				end
			end
		elseif Seqno == 13 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*betitem1[4]
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*betitem1[4]
					end
					if Char.ItemNum(player,betitem1[2]) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.DelItem(player,betitem1[2],MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][2] = MonsterRacevalue4[MonsterRacevalue8][k][2] + v
							MonsterRacevalue6[k][2] = MonsterRacevalue6[k][2] + v
							NLG.SystemMessage(player,"��Ϊ"..RaceMonster[k][1].."��ע"..v..betitem1[1].."�ɹ�����ǰ����ע��Ϊ��"..MonsterRacevalue4[MonsterRacevalue8][k][1].."ħ�ң�"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."��"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."��")
						end
					else
						NLG.SystemMessage(player,"����"..betitem1[1].."���㡣")
					end
				end
			end
		elseif Seqno == 14 then
			if MonsterRacevalue2 == 1 then
				if strfindn(Data,"|") then
					local MonsterRacevalue12 = splitplus(Data,"|")
					local MonsterRacevalue13 = {}
					local MonsterRacevalue14 = 0
					for i = 1,(#MonsterRacevalue12/2) do
						MonsterRacevalue14 = MonsterRacevalue14 + tonumber(MonsterRacevalue12[i*2])*betitem2[4]
						MonsterRacevalue13[tonumber(MonsterRacevalue12[i*2-1])+1] = tonumber(MonsterRacevalue12[i*2])*betitem2[4]
					end
					if Char.ItemNum(player,betitem2[2]) >= MonsterRacevalue14 and MonsterRacevalue14 > 0 then
						Char.DelItem(player,betitem2[2],MonsterRacevalue14)
						if type(MonsterRacevalue4[MonsterRacevalue8]) ~= "table" then
							MonsterRacevalue4[MonsterRacevalue8] = {}
						end
						for k,v in pairs(MonsterRacevalue13) do
							if type(MonsterRacevalue4[MonsterRacevalue8][k]) ~= "table" then
								MonsterRacevalue4[MonsterRacevalue8][k] = {0,0,0}
							end
							MonsterRacevalue4[MonsterRacevalue8][k][3] = MonsterRacevalue4[MonsterRacevalue8][k][3] + v
							MonsterRacevalue6[k][3] = MonsterRacevalue6[k][3] + v
							NLG.SystemMessage(player,"��Ϊ"..RaceMonster[k][1].."��ע"..v..betitem2[1].."�ɹ�����ǰ����ע��Ϊ��"..MonsterRacevalue4[MonsterRacevalue8][k][1].."ħ�ң�"..MonsterRacevalue4[MonsterRacevalue8][k][2]..betitem1[1].."��"..MonsterRacevalue4[MonsterRacevalue8][k][3]..betitem2[1].."��")
						end
					else
						NLG.SystemMessage(player,"����"..betitem2[1].."���㡣")
					end
				end
			end
		elseif Seqno == 1000 then
			if MonsterRacevalue8 == GameMasterCdkey then
				if tonumber(Data) == 1 then
					if ctrltype == 1 then
						ctrltype = 2
						NLG.SystemMessage(player,"���Ʒ�ʽ�л�Ϊ�ֶ���")
					else
						ctrltype = 1
						NLG.SystemMessage(player,"���Ʒ�ʽ�л�Ϊ�Զ���")
					end
				elseif tonumber(Data) == 2 then
					for i = 1,#MonsterRacevalue6 do
						NLG.SystemMessage(player,RaceMonster[i][1].."��Ͷע���Ϊ��"..MonsterRacevalue6[i][1].."ħ�ң�"..MonsterRacevalue6[i][2]..betitem1[1].."��"..MonsterRacevalue6[i][3]..betitem2[1].."��")
					end
				elseif tonumber(Data) == 3 then
					for k,v in pairs(MonsterRacevalue5) do
						NLG.SystemMessage(player,"����ʺ�"..k.."��δ��ȡ�Ľ���Ϊ��"..v[1].."ħ�ң�"..v[2]..betitem1[1].."��"..v[3]..betitem2[1].."��")
					end
				elseif tonumber(Data) == 4 then
					if MonsterRacevalue2 >= 1 then
						local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ��Ҫ���ٵĳ�����ٷ���1-10��|����ħ�Ҳ��㡣|���ĵ��������㡣"
						for i = 1,#RaceMonster do
							MonsterRacevalue9 = MonsterRacevalue9.."|����"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6ÿһ����ٷ���Ϊ50\n$6��ǰ�����ٶ�Ϊ"..MonsterRacevalue3[MonsterRacevalue7[i]][2].."|1|999"
						end
						NLG.ShowWindowTalked(player,npc,6,2,1100,MonsterRacevalue9)
					else
						NLG.SystemMessage(player,"����û�б�����")
					end
				elseif tonumber(Data) == 5 then
					if MonsterRacevalue2 >= 1 then
						local MonsterRacevalue9 = mainnpcmatamo.."|"..mainnpcname.."|��ѡ��Ҫ���ٵĳ�����ٷ��������ơ�|����ħ�Ҳ��㡣|���ĵ��������㡣"
						for i = 1,#RaceMonster do
							MonsterRacevalue9 = MonsterRacevalue9.."|����"..RaceMonster[i][1].."|"..RaceMonster[i][3].."|1|$6ÿһ����ٷ���Ϊ50\n$6��ǰ�����ٶ�Ϊ"..MonsterRacevalue3[MonsterRacevalue7[i]][2].."|1|999"
						end
						NLG.ShowWindowTalked(player,npc,6,2,1200,MonsterRacevalue9)
					else
						NLG.SystemMessage(player,"����û�б�����")
					end
				elseif tonumber(Data) == 6 then
					MonsterRacevalue2 = 0
					ctrltype = 0
					MonsterRacevalue28()
					NLG.SystemMessage(player,"��ѹرա�")
				elseif tonumber(Data) == 7 then
					if MonsterRacevalue2 == 0 then
						MonsterRacevalue2 = 1
						MonsterRacevalue1 = os.time()
						MonsterRacevalue29()
						NLG.SystemMessage(-1,"����������ڿ�ʼ����Ͷע��~��Ҫ�������ҿ�����~")
					else
						NLG.SystemMessage(player,"����������С�")
					end
				end
			else
				return
			end
		elseif Seqno == 1100 then
			if MonsterRacevalue8 == GameMasterCdkey then
				local MonsterRacevalue12 = splitplus(Data,"|")
				local MonsterRacevalue14 = 0
				for i = 1,(#MonsterRacevalue12/2) do
					for k,v in pairs(MonsterRacevalue3) do
						if tonumber(v[1]) == tonumber(MonsterRacevalue12[i*2-1]) + 1 then
							MonsterRacevalue3[k][2] = v[2] + tonumber(MonsterRacevalue12[i*2])*50
							NLG.SystemMessage(player,RaceMonster[tonumber(MonsterRacevalue12[i*2-1])+1][1].."���ٶ����"..tonumber(MonsterRacevalue12[i*2]).."����")
							break
						end
					end
				end
			else
				return
			end
		elseif Seqno == 1200 then
			if MonsterRacevalue8 == GameMasterCdkey then
				local MonsterRacevalue12 = splitplus(Data,"|")
				local MonsterRacevalue14 = 0
				for i = 1,(#MonsterRacevalue12/2) do
					for k,v in pairs(MonsterRacevalue3) do
						if v[1] == tonumber(MonsterRacevalue12[i*2-1]) + 1 then
							MonsterRacevalue3[k][2] = v[2] - tonumber(MonsterRacevalue12[i*2])*50
							NLG.SystemMessage(player,RaceMonster[tonumber(MonsterRacevalue12[i*2-1])+1][1].."���ٶȽ���"..tonumber(MonsterRacevalue12[i*2]).."����")
							break
						end
					end
				end
			else
				return
			end
		end
	end
end

function MonsterRacevalue23(npc)
	if MonsterRacevalue2 == 0 then
		if ctrltype == 1 then
			local MonsterRacevalue15 = tonumber(os.date("%H"))
			--print("MonsterRacevalue15 = "..MonsterRacevalue15)
			if MonsterRacevalue15 >= starttime and MonsterRacevalue15 < endtime then
				MonsterRacevalue2 = 1
				MonsterRacevalue1 = os.time()
				MonsterRacevalue29()
				NLG.SystemMessage(-1,"����������ڿ�ʼ����Ͷע��~��Ҫ�������ҿ�����~")
			end
		end
	elseif MonsterRacevalue2 == 1 then
		if os.time() - MonsterRacevalue1 >= bettime * 60 then
			MonsterRacevalue2 = 2
			NLG.SystemMessage(-1,"�������������ʽ��������û���ü�Ͷע���������´λ���~")
		end
	end
end

function MonsterRacevalue27(npc)
	if MonsterRacevalue2 == 2 then
		NLG.SetAction(npc,1)
		local MonsterRacevalue16= math.random(FootLimetMin,FootLimetMax)
		MonsterRacevalue16 = MonsterRacevalue16 + MonsterRacevalue3[npc][2]
		if MonsterRacevalue16 >= 3000 then
			MonsterRacevalue16 = 3000
		elseif MonsterRacevalue16 <= 100 then
			MonsterRacevalue16 = 100
		end
		MonsterRacevalue3[npc][3] = MonsterRacevalue3[npc][3] + MonsterRacevalue16
		if MonsterRacevalue3[npc][3] >= 1000 then
			repeat
				--if MonsterRacevalue3[npc][3] >= 1000 then
					if RaceMonsterDir == 1 then
						NLG.WalkMove(npc,2)
					else
						NLG.WalkMove(npc,4)
					end
					MonsterRacevalue3[npc][3] = MonsterRacevalue3[npc][3] - 1000
					local MonsterRacevalue17
					if RaceMonsterDir == 1 then
						MonsterRacevalue17 = Char.GetData(npc,%����_X%)
					else
						MonsterRacevalue17 = Char.GetData(npc,%����_Y%)
					end
					if MonsterRacevalue17 >= MonsterRacevalue20 then
						NLG.SystemMessage(-1,"��ϲ"..Char.GetData(npc,%����_����%).."����˱��α�����ʤ����")
						for k,v in pairs(MonsterRacevalue4) do
							if type(v[MonsterRacevalue3[npc][1]]) == "table" then
								if v[MonsterRacevalue3[npc][1]][1] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][1] ~= nil then
										MonsterRacevalue5[k][1] = MonsterRacevalue5[k][1] + magnification1 * v[MonsterRacevalue3[npc][1]][1]
									else
										MonsterRacevalue5[k][1] = magnification1 * v[MonsterRacevalue3[npc][1]][1]
									end
								end
								if v[MonsterRacevalue3[npc][1]][2] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][2] ~= nil then
										MonsterRacevalue5[k][2] = MonsterRacevalue5[k][2] + magnification2 * v[MonsterRacevalue3[npc][1]][2]
									else
										MonsterRacevalue5[k][2] = magnification2 * v[MonsterRacevalue3[npc][1]][2]
									end						
								end
								if v[MonsterRacevalue3[npc][1]][3] > 0 then
									if type(MonsterRacevalue5[k]) ~= "table" then
										MonsterRacevalue5[k] = {0,0,0}
									end
									if MonsterRacevalue5[k][3] ~= nil then
										MonsterRacevalue5[k][3] = MonsterRacevalue5[k][3] + magnification3 * v[MonsterRacevalue3[npc][1]][3]
									else
										MonsterRacevalue5[k][3] = magnification3 * v[MonsterRacevalue3[npc][1]][3]
									end						
								end
							end
						end
						MonsterRacevalue4 = {}
						local MonsterRacevalue15 = tonumber(os.date("%H"))
						if MonsterRacevalue15 >= starttime and MonsterRacevalue15 < endtime and ctrltype == 1 then
							--[[
							MonsterRacevalue2 = 1
							MonsterRacevalue1 = os.time()
							MonsterRacevalue28()
							MonsterRacevalue29()
							]]
							MonsterRacevalue2 = 0
							MonsterRacevalue28()
						else
							MonsterRacevalue2 = 0
							MonsterRacevalue28()
						end
						break
					end
				--else
				--	break
				--end
			until MonsterRacevalue3[npc][3] < 1000 or MonsterRacevalue2 ~= 2
		end
	end
end

function MonsterRacevalue28()
	for k,v in pairs(MonsterRacevalue7) do
		local MonsterRacevalue18 = NL.DelNpc(v)
		MonsterRacevalue7[k] = nil
	end
	MonsterRacevalue3 = {}
	MonsterRacevalue6 = {}
	MonsterRacevalue7 = {}
end

function MonsterRacevalue29()
	for i = 1,#RaceMonster do
		MonsterRacevalue7[i] = NL.CreateNpc(nil,"MonsterRacevalue26")
		MonsterRacevalue3[MonsterRacevalue7[i]] = {i,0,i}
		MonsterRacevalue6[i] = {0,0,0}
		Char.SetData(MonsterRacevalue7[i],%����_����%,RaceMonster[i][2])
		Char.SetData(MonsterRacevalue7[i],%����_ԭ��%,RaceMonster[i][2])
		--Char.SetData(MonsterRacevalue7[i],3,0)
		Char.SetData(MonsterRacevalue7[i],%����_��ͼ%,RaceMonstermap)
		Char.SetData(MonsterRacevalue7[i],%����_ԭ��%,RaceMonster[i][1])
		if RaceMonsterDir == 1 then
			Char.SetData(MonsterRacevalue7[i],%����_X%,RaceMonsterposx)
			Char.SetData(MonsterRacevalue7[i],%����_Y%,RaceMonsterposy+i-1)
			Char.SetData(MonsterRacevalue7[i],%����_����%,4)
		else
			Char.SetData(MonsterRacevalue7[i],%����_X%,RaceMonsterposx+i-1)
			Char.SetData(MonsterRacevalue7[i],%����_Y%,RaceMonsterposy)
			Char.SetData(MonsterRacevalue7[i],%����_����%,2)
		end
		NLG.UpChar(MonsterRacevalue7[i])
		Char.SetLoopEvent(nil,"MonsterRacevalue27",MonsterRacevalue7[i],1000)
	end
end

if MonsterRacevalue25 == nil or MonsterRacevalue25 < 0 then
	MonsterRacevalue25 = NL.CreateNpc(nil,"MonsterRacevalue24")
end


