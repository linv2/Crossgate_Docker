------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�˵��������
------------------------------------------------------------------------------
--���߳�ֵ��ȡLua�ű� For GA
--
--�����ݿ��ѯ��Ӧ�ֶΣ�������Ϸ��һ�Ϊ���ֵ���
--
--by Ducky�Ώͻ�
--in 2013.8.9
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ����������NPC���á�����
------------------------------------------------------------------------------
local NpcName = "������ȡ"			--Npc���ƣ�ͬʱҲ�ǽű����ƣ�
local NpcMapPos = {0, 5, 26, 42}		--Npc��ͼ����
local NpcImage = 14205					--Npcͼ��104561
local NpcDir = 6							--Npc����0Ϊ���ϣ�˳ʱ��ת��
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ������������ȡ���á�����
------------------------------------------------------------------------------
local CreditsName = "����"		--�������ƣ���ֵ������
local ItemName = "����"			--��Ʒ���ƣ����ֿ���
local ItemID = 50006			--��ƷID�����ֿ�ID��
local ItemStack = 10000			--��Ʒ�ѵ��������ֿ��ѵ��������ڼ������ȡ������
local ExchangeNum = 1			--ÿ����ֿ���ȡ�Ĵ�������
local CheckCountDown = 30		--ÿ�β�ѯ��ȴʱ�䣨���ʱ�䣬��λ���룩
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 ���������ݱ����á�����
------------------------------------------------------------------------------
local SqlTable = "tbl_user"
local SqlField = "money"
local SqlCdKey = "cdkey"
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--                 �������ű�ϵͳ���á���������רҵ���������޸ģ�
------------------------------------------------------------------------------
if type(PlayerCredits)~="table" then PlayerCredits={} end
if type(PlayerTotal)~="table" then PlayerTotal={} end
if type(tbl_LuaNpcIndex)~="table" then tbl_LuaNpcIndex={} end
local PlayerCheckCD = {}
------------------------------------------------------------------------------

--�����Ʒid
R_ItemID = 50006;
R_buro = 1;
-- ע�⣬ֻ������6�����ͱ������������ӻ���ɾ�����������Ҫ��ô�࣬�������д9999999
-- ����Ҫ�ı��ʿ���д0
-- �����Ǵﵽ���
R_ZV =
{
	[1] = 100;
	[2] = 500;
	[3] = 1000;
	[4] = 2000;	
	[5] = 5000;	
	[6] = 99999;
	[7] = 999999
};

-- �������������Ͱٷֱ�,��֧��С����
R_ZV_S =
{
	[1] = 5;
	[2] = 10;
	[3] = 15;
	[4] = 20;
	[5] = 25;	
	[6] = 30
};

Delegate.RegInit("ExtractCreditsNpc_Init");

function ExtractCreditsNpc_Init()
	local ExtractCreditsNpc = NL.CreateNpc(nil, "ExtractCreditsNpc_Func");
	Char.SetData( ExtractCreditsNpc, %����_����%, NpcImage);
	Char.SetData( ExtractCreditsNpc, %����_ԭ��%, NpcImage);
	Char.SetData( ExtractCreditsNpc, %����_MAP%, NpcMapPos[1]);
	Char.SetData( ExtractCreditsNpc, %����_��ͼ%, NpcMapPos[2]);
	Char.SetData( ExtractCreditsNpc, %����_X%, NpcMapPos[3]);
	Char.SetData( ExtractCreditsNpc, %����_Y%, NpcMapPos[4]);
	Char.SetData( ExtractCreditsNpc, %����_����%, NpcDir);
	Char.SetData( ExtractCreditsNpc, %����_ԭ��%, NpcName);
	NLG.UpChar( ExtractCreditsNpc)

	tbl_LuaNpcIndex["ExtractCreditsNpc"] = ExtractCreditsNpc
	
	Char.SetTalkedEvent(nil, "ExtractCreditsNpc_Talked", ExtractCreditsNpc)
	Char.SetWindowTalkedEvent(nil, "ExtractCreditsNpc_WindowTalked", ExtractCreditsNpc)
	
	return true;
end

function ExtractCreditsNpc_Func(index)
	return true
end

function ExtractCreditsNpc_Talked( _MeIndex, _PlayerIndex, _Mode)

	if(NLG.CheckInFront(_PlayerIndex, _MeIndex, 2) == false and _Mode~=1) then
		return ;
	end 

	NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 2, 2, 1,
			"5|\n��֧����������ֵϵͳ����֧������ֵ�ɹ���" ..
			"\n�ɵ��˴���ȡ��ֵ��[" .. CreditsName .. "]" ..
			"\n����ȡ��Ӧ��vip���Ρ�" ..
			"\n��ÿ����ȡǰ�����Ƚ���һ�β�ѯ��" ..
			"\n��ȷ����������1��������������������Ը�" ..
			"\n���������������ܵ�����ʣ�������ѯ��" ..
			"\n������������ȡ���𿨡�" ..
			"\n������������ȡVIPͷ�Ρ�" 
			);

	return ;
end

function ExtractCreditsNpc_WindowTalked( _MeIndex, _PlayerIndex, _Seqno, _Select, _Data)
	
	--ȡ����ť
	if _Select==2 then
		return
	end

	if _Seqno==1 then
		local PlayerSelect = tonumber(_Data)
		--��ѯ
		if PlayerSelect==1 then
			local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
			local tName = Char.GetData(_PlayerIndex, %����_����%)
			PlayerCheckCD[tCdKey] = PlayerCheckCD[tCdKey] or 0
			if PlayerCheckCD[tCdKey]+CheckCountDown>os.time() then
				local TalkBuf =	"\n��������������������" .. NpcName .. "��\n\n\n" ..
								"\n����" ..
								"\n��������������ѯ��ȴ�У���" .. PlayerCheckCD[tCdKey]+CheckCountDown-os.time() .. "������ԡ�"
				NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
				return
			end
			local tSQL = "select " .. SqlCdKey .. "," .. SqlField .. ",TotalMoney from " .. SqlTable .. " where " .. SqlCdKey .. "='" .. tCdKey .. "';"
			local RS = SQL.Run(tSQL)
			PlayerCredits[tCdKey] = tonumber(RS["0_1"] or 0)
			PlayerTotal[tCdKey] = tonumber(RS["0_2"] or 0)
			local tSQL = "select CDK,TotalMoney,XiaoFei from tbl_char where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
			local RS = SQL.Run(tSQL)
			local TotalMoney = tonumber(RS["0_1"] or 0)
			local XiaoFei = tonumber(RS["0_2"] or 0)
			local TalkBuf =	"\n��������������������" .. NpcName .. "��\n\n\n\n" ..
								"�㹲��[" .. PlayerCredits[tCdKey] .. "]��" .. ItemName .. "δ��ȡ��\\n�ý�ɫ���ۻ���ȡ��ֵ���[" .. TotalMoney .. "]Ԫ��\\n�ý�ɫ���ۻ��һ�����[" .. XiaoFei .. "]�ţ�"
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
			PlayerCheckCD[tCdKey] = os.time()
			return
		end

		--��������
		if PlayerSelect==2 then
			if(NLG.CanTalk(_MeIndex, _PlayerIndex)==false)then
				return;
			end
	
			NLG.ShowWindowTalked(_PlayerIndex, _MeIndex,%����_�����%,%��ť_ȷ��%,2,"\\n\\n����,��ӭʹ����ȡ��ȯϵͳ����������֧������ˮ�ŵĺ�6λ���֣�");
			return;
		end

		if PlayerSelect==3 then
			local tCdKey = Char.GetData(_PlayerIndex, %����_�˺�%)
			local tName = Char.GetData(_PlayerIndex, %����_����%)
			local tSQL = "select CDK,TotalMoney,VipLevel,XiaoFei from tbl_char where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
			local RS = SQL.Run(tSQL)
			local TotalMoney = tonumber(RS["0_1"] or 0)
			local VipLevel = tonumber(RS["0_2"] or 0)
			local TotalXiaoFei = tonumber(RS["0_3"] or 0)
			local VipMoneyArr = {100,300,500,1000,2000,5000}
			local VipNameArr = {"��ͭ","����","�ƽ�","�׽�","��ʯ","��ǿ����"}
			local VipGiftArr = {51125,51126,51127,51128,51129,51131}
			if (VipLevel<10) then
				if (TotalMoney+math.floor(TotalXiaoFei/10)>=VipMoneyArr[VipLevel+1]) then
				Char.GiveItem(_PlayerIndex, VipGiftArr[VipLevel+1], 1)
				TalkBuf =	"\n��ȡͷ�γɹ�����ϲ���Ϊ"..VipNameArr[VipLevel+1].."��";
				local tSQL = "update tbl_char set VipLevel=VipLevel+1 where CDK='" .. tCdKey .. "' and Name='" .. tName .. "'"
				local RS = SQL.Run(tSQL)
				else
					local TouShiIndex=Char.HaveItem(_PlayerIndex,VipGiftArr[VipLevel]);
					if(TouShiIndex == -1 and VipLevel>0)then
						Char.GiveItem(_PlayerIndex, VipGiftArr[VipLevel], 1);
					end
				TalkBuf = "\n�ٳ�ֵ"..tostring(VipMoneyArr[VipLevel+1]-TotalMoney).."Ԫ���ɵ���"..VipNameArr[VipLevel+1].."��"
				end
				NLG.ShowWindowTalked(_PlayerIndex, _MeIndex, 0, 2, 99999, TalkBuf)
			end
			return
		end
	end

	if _Seqno==2 then
		if(Char.ItemSlot(_PlayerIndex) >= 18)then
			NLG.SystemMessage(_PlayerIndex,"[ʧ��]Ϊ�˱�������ȡʧ�ܣ����ȿճ�����������λ�����ϵĿո�");
			return;			
		end
		if(string.len(_Data) ~= 6 or tonumber(_Data) == nil or tonumber(_Data) == 0)then
			NLG.SystemMessage(_PlayerIndex,"[ʧ��]���������ˮ�ź�6λ����");
			return;
		end
		local query = "SELECT * from `tbl_alipay` WHERE `autoid2`='".._Data.."'";
		local mysql = SQL.Run(query);
		if(type(mysql)~="table")then
			NLG.SystemMessage(_PlayerIndex,"[ʧ��]��ˮ�Ų����ڣ������Ѿ����ֵ��");	
			return;
		end
		local autoid1 = mysql["0_0"];
		--NLG.SystemMessage(_PlayerIndex,autoid1);
		local jinbi = tonumber(mysql["0_1"]);
		local ischange = nil;
		ischange = tonumber(mysql["0_2"]);
		if(ischange == 1 or ischange == nil)then
			NLG.SystemMessage(_PlayerIndex,"[ʧ��]��ˮ�Ų����ڣ������Ѿ����ֵ��");	
			return;
		end
		--local query1 = "UPDATE `tbl_user` SET cash= cash + "..jinbi.." WHERE `CdKey`='"..Char.GetData(_PlayerIndex,%����_�˺�%).."'";	
		--SQL.Run(query1);
		local query2 = "UPDATE `tbl_alipay` SET ischange= '1',cdkey = '"..Char.GetData(_PlayerIndex,%����_�˺�%).."' WHERE `autoid`='"..autoid1.."'";	
		SQL.Run(query2);
		local tSQL = "update tbl_char set TotalMoney=TotalMoney+" .. jinbi .. " where CDK='" .. Char.GetData(_PlayerIndex,%����_�˺�%) .. "'"
		local RS = SQL.Run(tSQL)
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
		end
		jinbi = jinbi * R_buro;
		Char.GiveItem(_PlayerIndex,R_ItemID,jinbi);

		NLG.SystemMessage(_PlayerIndex,"[�ɹ�]����ֵ����Ϊ["..jinbi.."]�Ѿ����ˣ�");	
	end

	return
end