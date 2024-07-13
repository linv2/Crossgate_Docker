dellv=30
delpet={}
delpet[950177]=1

NL.RegPetLevelUpEvent(nil,"petLevel");
function petLevel(_PetIndex)
	if delpet[Char.GetData(_PetIndex,%对象_邮数%)]==1 then
	 
	local _PlayerIndex=Pet.GetOwner(_PetIndex)
		local Level=Char.GetData(_PetIndex,%对象_等级%)
		local petName=Char.GetData(_PetIndex,%对象_原名%)
		local Name=Char.GetData(_PlayerIndex,%对象_原名%)
		local tp=30-Level
		--NLG.SystemMessage(_PlayerIndex,"宠物设定值为"..delpet[950177].."检测到宠物编号"..Char.GetData(_PetIndex,%对象_邮数%).."");
	if tp>0 then
		NLG.SystemMessage(_PlayerIndex,"[系统]老板【"..Name.."】您的宠物【"..petName.."】已经"..Level.."级啦！距离逃跑还有"..tp.."级！");
	else
    if Level>=dellv then
       Pet.Kill(_PlayerIndex,_PetIndex)
       NLG.UpChar(_PlayerIndex)
			 NLG.SystemMessage(-1,"[系统]老板【"..Name.."】的【"..petName.."】30级啦,性成熟了去找母狗配种去不回来了,你看再去商城买只?");
    end
	end
	end
end