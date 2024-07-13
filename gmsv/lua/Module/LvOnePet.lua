Delegate.RegDelBattleStartEvent("LvOnePet_Event");

local evolutionflg = false;		--是否开启一级宠物变异(默认关闭)
local evolutionrate = 100;		--宠物变异机率(默认百分之一)
local PetID = {101501,101313,101320,101324,101321,101721,101722,101723,101724}---限制图档设定
local 宠物图档={}
宠物图档[101501]={100454}---添加前面的数值是原有图档，后面的数值是要变身图档
宠物图档[101313]={116139}---添加前面的数值是原有图档，后面的数值是要变身图档
宠物图档[101320]={107910}
宠物图档[101324]={107911}
宠物图档[101321]={107912}
宠物图档[101721]={101721}
宠物图档[101722]={101722}
宠物图档[101723]={101723}
宠物图档[101724]={101724}

function LvOnePet_Event(_battle)
	if (Battle.GetGainMode(_battle)==%战奖_普通% and Battle.GetType(_battle)==%战斗_普通%) then
		for BWhile=10,19 do
			local PlayerIndex = Battle.GetPlayer(_battle,BWhile);
			if(VaildChar(PlayerIndex)==true) then
				if(Char.GetData(PlayerIndex,%对象_等级%) == 1 and Char.GetData(PlayerIndex,%对象_名字%) ~= "哥布林" and Char.GetData(PlayerIndex,%对象_名字%) ~= "迷你蝙蝠") then
					local TL1 = Pet.FullArtRank(PlayerIndex,%宠档_体成%);
					local GJ1 = Pet.FullArtRank(PlayerIndex,%宠档_力成%);
					local FY1 = Pet.FullArtRank(PlayerIndex,%宠档_强成%);
					local MJ1 = Pet.FullArtRank(PlayerIndex,%宠档_敏成%);
					local MF1 = Pet.FullArtRank(PlayerIndex,%宠档_魔成%);
					local TL2 = Pet.GetArtRank(PlayerIndex,%宠档_体成%);
					local GJ2 = Pet.GetArtRank(PlayerIndex,%宠档_力成%);
					local FY2 = Pet.GetArtRank(PlayerIndex,%宠档_强成%);
					local MJ2 = Pet.GetArtRank(PlayerIndex,%宠档_敏成%);
					local MF2 = Pet.GetArtRank(PlayerIndex,%宠档_魔成%);	
					local TL = math.abs(TL2-TL1);
					local GJ = math.abs(GJ2-GJ1);
					local FY = math.abs(FY2-FY1);
					local MJ = math.abs(MJ2-MJ1);
					local MF = math.abs(MF2-MF1);
					if(evolutionflg == true) then
						local JL1 = NLG.Rand(1,evolutionrate); ---当前几率是百分之一
						local BY = Char.GetData(PlayerIndex,%对象_名色%);
						if JL1 == 1 and BY == 0  then
							Char.SetData(PlayerIndex,%对象_名字%,"变异-"..Char.GetData(PlayerIndex,%对象_名字%));
							local BYTL1 = Pet.SetArtRank(PlayerIndex,%宠档_体成%, TL2 + math.random(1,3)); ------档次提升范围
							local BYTL2 = Pet.SetArtRank(PlayerIndex,%宠档_力成%, GJ2 + math.random(1,3));
							local BYTL3 = Pet.SetArtRank(PlayerIndex,%宠档_强成%, FY2 + math.random(1,3));
							local BYTL4 = Pet.SetArtRank(PlayerIndex,%宠档_敏成%, MJ2 + math.random(1,3));
							local BYTL5 = Pet.SetArtRank(PlayerIndex,%宠档_魔成%, MF2 + math.random(1,3));
							local B1 = Char.SetData(PlayerIndex,%对象_抗毒%,Char.GetData(PlayerIndex,%对象_抗毒%) + math.random(0,10)); ------修正和抗性提升范围
							local B2 = Char.SetData(PlayerIndex,%对象_抗睡%,Char.GetData(PlayerIndex,%对象_抗睡%) + math.random(0,10));
							local B3 = Char.SetData(PlayerIndex,%对象_抗石%,Char.GetData(PlayerIndex,%对象_抗石%) + math.random(0,10));
							local B4 = Char.SetData(PlayerIndex,%对象_抗醉%,Char.GetData(PlayerIndex,%对象_抗醉%) + math.random(0,10));
							local B5 = Char.SetData(PlayerIndex,%对象_抗乱%,Char.GetData(PlayerIndex,%对象_抗乱%) + math.random(0,10));
							local B6 = Char.SetData(PlayerIndex,%对象_抗忘%,Char.GetData(PlayerIndex,%对象_抗忘%) + math.random(0,10));
							local B7 = Char.SetData(PlayerIndex,%对象_必杀%,Char.GetData(PlayerIndex,%对象_必杀%) + math.random(0,10));
							local B8 = Char.SetData(PlayerIndex,%对象_反击%,Char.GetData(PlayerIndex,%对象_反击%) + math.random(0,10));
							local B9 = Char.SetData(PlayerIndex,%对象_命中%,Char.GetData(PlayerIndex,%对象_命中%) + math.random(0,10));
							local B10 = Char.SetData(PlayerIndex,%对象_闪躲%,Char.GetData(PlayerIndex,%对象_闪躲%) + math.random(0,10));
							local B11 = Char.SetData(PlayerIndex,%对象_名色%,Char.GetData(PlayerIndex,%对象_名色%) + math.random(10,10));
							local TL3 = Pet.GetArtRank(PlayerIndex,%宠档_体成%);
							local GJ3 = Pet.GetArtRank(PlayerIndex,%宠档_力成%);
							local FY3 = Pet.GetArtRank(PlayerIndex,%宠档_强成%);
							local MJ3 = Pet.GetArtRank(PlayerIndex,%宠档_敏成%);
							local MF3 = Pet.GetArtRank(PlayerIndex,%宠档_魔成%);
							local PetTD1 = Char.GetData(PlayerIndex,%对象_形象%)
							local PetTD2 = Char.GetData(PlayerIndex,%对象_原形%)
							if PET_CheckInTable(PetID,PetTD1)==true then
								local PetTDH = 宠物图档[PetTD1][1]
								local PetTD11 = Char.SetData(PlayerIndex,%对象_形象%,PetTDH);
								local PetTD22 = Char.SetData(PlayerIndex,%对象_原形%,PetTDH);
							end
						end
					end
					for BPWhile=0,4 do
						local BPlayerIndex = Battle.GetPlayer(_battle,BPWhile);
						if(BPlayerIndex >= 0) then
							NLG.TalkToCli(BPlayerIndex,-1,"一级宠物【"..Char.GetData(PlayerIndex,%对象_名字%).."】出现！掉档为:体【".. TL.."】攻【".. GJ.."】防【".. FY.."】敏【".. MJ.."】魔【".. MF.."】",%颜色_黄色%,%字体_中%);					
							if(evolutionflg == true) then
								if JL1 == 1 and BY == 0  then
									NLG.TalkToCli(BPlayerIndex,-1,"人品大爆发当前宠物已变异。",%颜色_黄色%,%字体_中%);	
									NLG.TalkToCli(BPlayerIndex,-1,"变异前档次：体【".. TL2.."】攻【".. GJ2.."】防【".. FY2.."】敏【".. MJ2.."】魔【".. MF2.."】",%颜色_黄色%,%字体_中%);	
									NLG.TalkToCli(BPlayerIndex,-1,"变异后档次：体【".. TL3.."】攻【".. GJ3.."】防【".. FY3.."】敏【".. MJ3.."】魔【".. MF3.."】",%颜色_黄色%,%字体_中%);
								end
							end
						end
					end
				end
			end
		end
	end
end
function PET_CheckInTable(_idTab, _idVar) ---循环函数
	for k,v in pairs(_idTab) do
		print(v .. " = " .. _idVar)
		if v==_idVar then
			return true
		end
	end
	return false
end
