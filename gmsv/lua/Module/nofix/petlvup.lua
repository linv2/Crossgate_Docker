dellv=30
delpet={}
delpet[950177]=1

NL.RegPetLevelUpEvent(nil,"petLevel");
function petLevel(_PetIndex)
	if delpet[Char.GetData(_PetIndex,%����_����%)]==1 then
	 
	local _PlayerIndex=Pet.GetOwner(_PetIndex)
		local Level=Char.GetData(_PetIndex,%����_�ȼ�%)
		local petName=Char.GetData(_PetIndex,%����_ԭ��%)
		local Name=Char.GetData(_PlayerIndex,%����_ԭ��%)
		local tp=30-Level
		--NLG.SystemMessage(_PlayerIndex,"�����趨ֵΪ"..delpet[950177].."��⵽������"..Char.GetData(_PetIndex,%����_����%).."");
	if tp>0 then
		NLG.SystemMessage(_PlayerIndex,"[ϵͳ]�ϰ塾"..Name.."�����ĳ��"..petName.."���Ѿ�"..Level.."�������������ܻ���"..tp.."����");
	else
    if Level>=dellv then
       Pet.Kill(_PlayerIndex,_PetIndex)
       NLG.UpChar(_PlayerIndex)
			 NLG.SystemMessage(-1,"[ϵͳ]�ϰ塾"..Name.."���ġ�"..petName.."��30����,�Գ�����ȥ��ĸ������ȥ��������,�㿴��ȥ�̳���ֻ?");
    end
	end
	end
end