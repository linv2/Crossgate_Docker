Delegate.RegDelBattleStartEvent("LvOnePet_Event");

local evolutionflg = false;		--�Ƿ���һ���������(Ĭ�Ϲر�)
local evolutionrate = 100;		--����������(Ĭ�ϰٷ�֮һ)
local PetID = {101501,101313,101320,101324,101321,101721,101722,101723,101724}---����ͼ���趨
local ����ͼ��={}
����ͼ��[101501]={100454}---���ǰ�����ֵ��ԭ��ͼ�����������ֵ��Ҫ����ͼ��
����ͼ��[101313]={116139}---���ǰ�����ֵ��ԭ��ͼ�����������ֵ��Ҫ����ͼ��
����ͼ��[101320]={107910}
����ͼ��[101324]={107911}
����ͼ��[101321]={107912}
����ͼ��[101721]={101721}
����ͼ��[101722]={101722}
����ͼ��[101723]={101723}
����ͼ��[101724]={101724}

function LvOnePet_Event(_battle)
	if (Battle.GetGainMode(_battle)==%ս��_��ͨ% and Battle.GetType(_battle)==%ս��_��ͨ%) then
		for BWhile=10,19 do
			local PlayerIndex = Battle.GetPlayer(_battle,BWhile);
			if(VaildChar(PlayerIndex)==true) then
				if(Char.GetData(PlayerIndex,%����_�ȼ�%) == 1 and Char.GetData(PlayerIndex,%����_����%) ~= "�粼��" and Char.GetData(PlayerIndex,%����_����%) ~= "��������") then
					local TL1 = Pet.FullArtRank(PlayerIndex,%�赵_���%);
					local GJ1 = Pet.FullArtRank(PlayerIndex,%�赵_����%);
					local FY1 = Pet.FullArtRank(PlayerIndex,%�赵_ǿ��%);
					local MJ1 = Pet.FullArtRank(PlayerIndex,%�赵_����%);
					local MF1 = Pet.FullArtRank(PlayerIndex,%�赵_ħ��%);
					local TL2 = Pet.GetArtRank(PlayerIndex,%�赵_���%);
					local GJ2 = Pet.GetArtRank(PlayerIndex,%�赵_����%);
					local FY2 = Pet.GetArtRank(PlayerIndex,%�赵_ǿ��%);
					local MJ2 = Pet.GetArtRank(PlayerIndex,%�赵_����%);
					local MF2 = Pet.GetArtRank(PlayerIndex,%�赵_ħ��%);	
					local TL = math.abs(TL2-TL1);
					local GJ = math.abs(GJ2-GJ1);
					local FY = math.abs(FY2-FY1);
					local MJ = math.abs(MJ2-MJ1);
					local MF = math.abs(MF2-MF1);
					if(evolutionflg == true) then
						local JL1 = NLG.Rand(1,evolutionrate); ---��ǰ�����ǰٷ�֮һ
						local BY = Char.GetData(PlayerIndex,%����_��ɫ%);
						if JL1 == 1 and BY == 0  then
							Char.SetData(PlayerIndex,%����_����%,"����-"..Char.GetData(PlayerIndex,%����_����%));
							local BYTL1 = Pet.SetArtRank(PlayerIndex,%�赵_���%, TL2 + math.random(1,3)); ------����������Χ
							local BYTL2 = Pet.SetArtRank(PlayerIndex,%�赵_����%, GJ2 + math.random(1,3));
							local BYTL3 = Pet.SetArtRank(PlayerIndex,%�赵_ǿ��%, FY2 + math.random(1,3));
							local BYTL4 = Pet.SetArtRank(PlayerIndex,%�赵_����%, MJ2 + math.random(1,3));
							local BYTL5 = Pet.SetArtRank(PlayerIndex,%�赵_ħ��%, MF2 + math.random(1,3));
							local B1 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10)); ------�����Ϳ���������Χ
							local B2 = Char.SetData(PlayerIndex,%����_��˯%,Char.GetData(PlayerIndex,%����_��˯%) + math.random(0,10));
							local B3 = Char.SetData(PlayerIndex,%����_��ʯ%,Char.GetData(PlayerIndex,%����_��ʯ%) + math.random(0,10));
							local B4 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B5 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B6 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B7 = Char.SetData(PlayerIndex,%����_��ɱ%,Char.GetData(PlayerIndex,%����_��ɱ%) + math.random(0,10));
							local B8 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B9 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B10 = Char.SetData(PlayerIndex,%����_����%,Char.GetData(PlayerIndex,%����_����%) + math.random(0,10));
							local B11 = Char.SetData(PlayerIndex,%����_��ɫ%,Char.GetData(PlayerIndex,%����_��ɫ%) + math.random(10,10));
							local TL3 = Pet.GetArtRank(PlayerIndex,%�赵_���%);
							local GJ3 = Pet.GetArtRank(PlayerIndex,%�赵_����%);
							local FY3 = Pet.GetArtRank(PlayerIndex,%�赵_ǿ��%);
							local MJ3 = Pet.GetArtRank(PlayerIndex,%�赵_����%);
							local MF3 = Pet.GetArtRank(PlayerIndex,%�赵_ħ��%);
							local PetTD1 = Char.GetData(PlayerIndex,%����_����%)
							local PetTD2 = Char.GetData(PlayerIndex,%����_ԭ��%)
							if PET_CheckInTable(PetID,PetTD1)==true then
								local PetTDH = ����ͼ��[PetTD1][1]
								local PetTD11 = Char.SetData(PlayerIndex,%����_����%,PetTDH);
								local PetTD22 = Char.SetData(PlayerIndex,%����_ԭ��%,PetTDH);
							end
						end
					end
					for BPWhile=0,4 do
						local BPlayerIndex = Battle.GetPlayer(_battle,BPWhile);
						if(BPlayerIndex >= 0) then
							NLG.TalkToCli(BPlayerIndex,-1,"һ�����"..Char.GetData(PlayerIndex,%����_����%).."�����֣�����Ϊ:�塾".. TL.."������".. GJ.."������".. FY.."������".. MJ.."��ħ��".. MF.."��",%��ɫ_��ɫ%,%����_��%);					
							if(evolutionflg == true) then
								if JL1 == 1 and BY == 0  then
									NLG.TalkToCli(BPlayerIndex,-1,"��Ʒ�󱬷���ǰ�����ѱ��졣",%��ɫ_��ɫ%,%����_��%);	
									NLG.TalkToCli(BPlayerIndex,-1,"����ǰ���Σ��塾".. TL2.."������".. GJ2.."������".. FY2.."������".. MJ2.."��ħ��".. MF2.."��",%��ɫ_��ɫ%,%����_��%);	
									NLG.TalkToCli(BPlayerIndex,-1,"����󵵴Σ��塾".. TL3.."������".. GJ3.."������".. FY3.."������".. MJ3.."��ħ��".. MF3.."��",%��ɫ_��ɫ%,%����_��%);
								end
							end
						end
					end
				end
			end
		end
	end
end
function PET_CheckInTable(_idTab, _idVar) ---ѭ������
	for k,v in pairs(_idTab) do
		print(v .. " = " .. _idVar)
		if v==_idVar then
			return true
		end
	end
	return false
end
