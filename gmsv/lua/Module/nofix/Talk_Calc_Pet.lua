
Delegate.RegDelTalkEvent("TalkEvent");


function TalkEvent( _PlayerIndex, _msg, _color, _range, _size)
	if(Get_Try(_range,_size,_color) == -1)then
		return -1;
	end
	if(string.sub(_msg,1,5)=="/pet ")then
	   local NewMsg = Stringsplitplus(_msg," ");
	   local Date = tonumber(NewMsg[2]);
			
		if(Date == 0) then
			PetCalc_ShowAllCalc(_PlayerIndex);
			return -1;
		else
			PetCalc_ShowCalc(_PlayerIndex,Date);
			return -1;
		end
	end
	
	
end

function PetCalc_ShowCalc(_PlayerIndex,i)
	if _PlayerIndex < 0 then
		return;
	end
	local PetIndex = Char.GetPet(_PlayerIndex, i-1);
	if PetIndex >= 0 then
		NLG.SystemMessage( _PlayerIndex, string.rep("-",#Char.GetData(PetIndex, %����_ԭ��%)));
		NLG.SystemMessage( _PlayerIndex, Char.GetData(PetIndex, %����_ԭ��%));
		NLG.SystemMessage( _PlayerIndex, string.rep("-",#Char.GetData(PetIndex, %����_ԭ��%)));
		NLG.SystemMessage( _PlayerIndex, "������" .. Pet.GetArtRank(PetIndex, %�赵_���%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_���%));
		NLG.SystemMessage( _PlayerIndex, "������" .. Pet.GetArtRank(PetIndex, %�赵_����%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_����%));
		NLG.SystemMessage( _PlayerIndex, "ǿ�ȣ�" .. Pet.GetArtRank(PetIndex, %�赵_ǿ��%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_ǿ��%));
		NLG.SystemMessage( _PlayerIndex, "���ݣ�" .. Pet.GetArtRank(PetIndex, %�赵_����%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_����%));
		NLG.SystemMessage( _PlayerIndex, "ħ����" .. Pet.GetArtRank(PetIndex, %�赵_ħ��%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_ħ��%));
		NLG.SystemMessage( _PlayerIndex, "�ܵ���" .. Pet.GetArtRank(PetIndex, %�赵_���%) + Pet.GetArtRank(PetIndex, %�赵_����%) + Pet.GetArtRank(PetIndex, %�赵_ǿ��%) + Pet.GetArtRank(PetIndex, %�赵_����%) + Pet.GetArtRank(PetIndex, %�赵_ħ��%) .. "/" .. Pet.FullArtRank(PetIndex, %�赵_���%) + Pet.FullArtRank(PetIndex, %�赵_����%) + Pet.FullArtRank(PetIndex, %�赵_ǿ��%) + Pet.FullArtRank(PetIndex, %�赵_����%) + Pet.FullArtRank(PetIndex, %�赵_ħ��%));
		NLG.SystemMessage( _PlayerIndex, "������" .. Pet.FullArtRank(PetIndex, %�赵_���%) - Pet.GetArtRank(PetIndex, %�赵_���%) .. Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.GetArtRank(PetIndex, %�赵_����%) .. Pet.FullArtRank(PetIndex, %�赵_ǿ��%) - Pet.GetArtRank(PetIndex, %�赵_ǿ��%) .. Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.GetArtRank(PetIndex, %�赵_����%) .. Pet.FullArtRank(PetIndex, %�赵_ħ��%) - Pet.GetArtRank(PetIndex, %�赵_ħ��%));
	else
		NLG.SystemMessage( _PlayerIndex, "��λ���޳��");
	end
	return;
end

function PetCalc_ShowAllCalc(_PlayerIndex)
	if _PlayerIndex < 0 then
		return;
	end
	local PetIndex;
	NLG.SystemMessage( _PlayerIndex, "--------------");
	NLG.SystemMessage( _PlayerIndex, "�������ơ�����");
	NLG.SystemMessage( _PlayerIndex, "--------------");
	for i = 0,4 do
		PetIndex = Char.GetPet(_PlayerIndex, i);
		if PetIndex >= 0 then
			NLG.SystemMessage( _PlayerIndex, Char.GetData(PetIndex, %����_ԭ��%) .. "��" .. Pet.FullArtRank(PetIndex, %�赵_���%) - Pet.GetArtRank(PetIndex, %�赵_���%) .. Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.GetArtRank(PetIndex, %�赵_����%) .. Pet.FullArtRank(PetIndex, %�赵_ǿ��%) - Pet.GetArtRank(PetIndex, %�赵_ǿ��%) .. Pet.FullArtRank(PetIndex, %�赵_����%) - Pet.GetArtRank(PetIndex, %�赵_����%) .. Pet.FullArtRank(PetIndex, %�赵_ħ��%) - Pet.GetArtRank(PetIndex, %�赵_ħ��%));
		else
			NLG.SystemMessage( _PlayerIndex, "λ��[" .. i+1 .. "]�޳���");
		end
	end 
	return;
end

function Get_Try(_range,_size,_color)
	if(_range < 0 or _range > 5)then
		return -1;
	end
	if(_size < 0 or _size > 4)then
		return -1;
	end
	if(_color<0 or _color >9)then
		return -1;
	end
	return 1;
end
function Stringsplitplus(str, pat)
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
