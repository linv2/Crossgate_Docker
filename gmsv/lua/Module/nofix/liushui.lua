--�����Ʒid
R_ItemID = 888888;
R_buro = 10;
-- ע�⣬ֻ������6�����ͱ������������ӻ���ɾ�����������Ҫ��ô�࣬�������д9999999
-- ����Ҫ�ı��ʿ���д0
-- �����Ǵﵽ���
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

-- �������������Ͱٷֱ�,��֧��С����
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

--�������δ��� ��ֵ100����200���ڣ�����5%����ֵ200���ϣ�500���ڣ�����10% ����

Delegate.RegInit("R_Init");


function liushui_Init(index)
	return 1;
end

function initliushuinpc()
     if(liushuinpc == nil)then
		liushuinpc = NL.CreateNpc("lua/Module/liushui.lua", "liushui_Init");
		Char.SetData(liushuinpc,%����_����%,100462);
		Char.SetData(liushuinpc,%����_ԭ��%,100462);
		Char.SetData(liushuinpc,%����_X%,11);
		Char.SetData(liushuinpc,%����_Y%,56);
		Char.SetData(liushuinpc,%����_��ͼ%,803);
		Char.SetData(liushuinpc,%����_����%,2);
		Char.SetData(liushuinpc,%����_ԭ��%,"֧������ֵ��ȡ");
		NLG.UpChar(liushuinpc);
		Char.SetWindowTalkedEvent("lua/Module/liushui.lua","liushuiNPCWTalked",liushuinpc);
		Char.SetTalkedEvent("lua/Module/liushui.lua","liushuiNPCTalked", liushuinpc);
	end
end

function liushuiNPCTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	NLG.ShowWindowTalked(_tome,_me,%����_�����%,%��ť_ȷ��%,1,"\\n\\n����,��ӭʹ����ȡ��ȯϵͳ����������֧������ˮ�ŵĺ�6λ���֣�");
	return;
	
	
end

function liushuiNPCWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	if(tonumber(_seqno)==1 and tonumber(_select)==%��ť_ȷ��% and _data~="")then
		if(Char.ItemSlot(_tome) >= 18)then
			NLG.SystemMessage(_tome,"[ʧ��]Ϊ�˱�������ȡʧ�ܣ����ȿճ�����������λ�����ϵĿո�");
			return;			
		end
		if(string.len(_data) ~= 6 or tonumber(_data) == nil or tonumber(_data) == 0)then
			NLG.SystemMessage(_tome,"[ʧ��]���������ˮ�ź�6λ����");
			return;
		end
		--NLG.SystemMessage(_tome,_data);
		local query = "SELECT * from `tbl_alipay` WHERE `autoid2`='".._data.."'";
		--NLG.SystemMessage(_tome,query);
		local mysql = SQL.Run(query);
		if(type(mysql)~="table")then
			NLG.SystemMessage(_tome,"[ʧ��]��ˮ�Ų����ڣ������Ѿ����ֵ��");	
			return;
		end
		local autoid1 = mysql["0_0"];--��ȡtable��һ�е�һ�е�ֵ
		--NLG.SystemMessage(_tome,autoid1);
		local jinbi = tonumber(mysql["0_1"]);--��ȡ��һ�еڶ��е�ֵ
		local ischange = nil;
		ischange = tonumber(mysql["0_2"]);--��ȡ��һ�е����е�ֵ
		if(ischange == 1 or ischange == nil)then
			NLG.SystemMessage(_tome,"[ʧ��]��ˮ�Ų����ڣ������Ѿ����ֵ��");	
			return;
		end
		--local query1 = "UPDATE `tbl_user` SET cash= cash + "..jinbi.." WHERE `CdKey`='"..Char.GetData(_tome,%����_�˺�%).."'";	
		--SQL.Run(query1);
		local query2 = "UPDATE `tbl_alipay` SET ischange= '1',cdkey = '"..Char.GetData(_tome,%����_�˺�%).."' WHERE `autoid`='"..autoid1.."'";	
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

		NLG.SystemMessage(_tome,"[�ɹ�]����ֵ����Ϊ["..jinbi.."]�Ѿ����ˣ�");				
		
	end
	
end

function R_Init()
	initliushuinpc();
end