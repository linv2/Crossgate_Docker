---���������ű� ʵ�ָ߼���Ϊһ��  2017.3.24 ������


Delegate.RegInit("PetRebirth_Init");
NL.RegItemString(nil, "PetRebirth", "LUA_usePetRebirth");
local PetRebirthID = 9700253;					--ϴ����ƷID
function PetRebirth_Creat()
	if (PetRebirth_index == nil) then
		PetRebirth_index = NL.CreateNpc(nil, "PetRebirth_initialize");
		Char.SetData(PetRebirth_index, %����_����%, 106089);    --%����_����%
		Char.SetData(PetRebirth_index, %����_ԭ��%, 106089);    --%����_ԭ��%
		Char.SetData(PetRebirth_index, %����_��ͼ%, 777);      --%����_��ͼ%
		Char.SetData(PetRebirth_index, %����_X%, 30);          --%����_X%
		Char.SetData(PetRebirth_index, %����_Y%, 30);           --%����_Y%
		Char.SetData(PetRebirth_index, %����_����%, %����%);    --%����_����%, %����%
		Char.SetData(PetRebirth_index, %����_ԭ��%, "����������ʦ");    --%����_ԭ��%
		NLG.UpChar(PetRebirth_index);
		if (Char.SetTalkedEvent(nil, "PetRebirth_Talked", PetRebirth_index) < 0) then
			print("PetRebirth_Talked ע���¼�ʧ�ܡ�");
			return false;
		end
		if (Char.SetWindowTalkedEvent(nil, "PetRebirth_WindowTalked", PetRebirth_index) < 0) then
			print("PetRebirth_WindowTalked ע���¼�ʧ�ܡ�");
			return false;
		end
		
	end
	return true;
end

function PetRebirth_initialize()
	return true;
end

function PetRebirth(player,toplayer,itemSlot)
	PetRebirth_Talked( PetRebirth_index,player)
	return true;
end

function PetRebirth_Talked( _MePtr,_TalkPtr)
	NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,12,0,
	"\n�������!["..Char.GetData(_TalkPtr,%����_ԭ��%).."],һ������ľ��ᣬ��������ĳ��ﱣ����ѧ��������ϴ�ֲ���������ȷ��Ҫʹ��ô��"..
	"\n\n�ҿ�������ĳ�����̥���ǣ��������÷�һ���ĳ�����һ����");
 return;
end

function PetRebirth_WindowTalked(_MePtr,_TalkPtr,_Seqno,_Select,_Data)
	if (_Select==8) then 
		NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"���ᣬ���������������Ҳ�У���һֱ�����㡣����ֻҪ˫����������ˡ�����������������");
		return;
	end
	local tab={};
	if (_Seqno==0) then
		local buf="";
		for t = 1,5 do
			
			PetIndex =Char.GetPet(_TalkPtr,t-1);
			if (PetIndex>0) then 
				buf=Char.GetData( PetIndex, %����_ԭ��%);
			else 
				buf="�޳���";
				
				
			end
			tab[t]=buf;
			
		end	
		NLG.ShowWindowTalked(_TalkPtr,_MePtr,2,2,1,
		"2\n��ѡ��"..
		"\n\n       ��["..tab[1].."]��"..
		"\n       ��["..tab[2].."]��"..
		"\n       ��["..tab[3].."]��"..
		"\n       ��["..tab[4].."]��"..
		"\n       ��["..tab[5].."]��");
		
		
		
	end
	if (_Seqno==1) then
		local PetIndex1=Char.GetPet(_TalkPtr,tonumber(_Data)-1)
		if (PetIndex1>0 and Char.GetData(PetIndex1,%����_�ȼ�%)==1) then
			local itemindex = Char.HaveItem(_TalkPtr,PetRebirthID);
			if (itemindex<0) then 
--				NLG.TalkToCli(_TalkPtr,_MePtr,"��Ǹ��Ļ�ԭ���᲻��!",4,0);
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"��Ǹ,��Ļ�ԭ���᲻��!");
				
			else
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"��Ǹ,�����᲻֧��һ�����ﻹԭ!");				
--					Char.DelItem(_TalkPtr,PetRebirthID,1)
--					Pet.SetArtRank(PetIndex1,%�赵_���%,Pet.FullArtRank(PetIndex1,%�赵_���%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%�赵_����%,Pet.FullArtRank(PetIndex1,%�赵_����%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%�赵_ǿ��%,Pet.FullArtRank(PetIndex1,%�赵_ǿ��%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%�赵_����%,Pet.FullArtRank(PetIndex1,%�赵_����%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%�赵_ħ��%,Pet.FullArtRank(PetIndex1,%�赵_ħ��%) - math.random(0,4));
--					Pet.ReBirth(_TalkPtr,PetIndex1);
--					Pet.UpPet(_TalkPtr, PetIndex1);
					--save("event","����ϴ��","���֣�"..Char.GetData(_TalkPtr,2000).."  ʹ����ϴ������Գ���  "..Char.GetData( PetIndex1, %����_ԭ��%).."����ϴ������ǰ������������  -"..Pet.FullArtRank(PetIndex1, %�赵_���%) - Pet.GetArtRank(PetIndex1, %�赵_���%).."  ����  -"..Pet.FullArtRank(PetIndex1, %�赵_����%) - Pet.GetArtRank(PetIndex1, %�赵_����%).."  ����  -"..Pet.FullArtRank(PetIndex1, %�赵_ǿ��%) - Pet.GetArtRank(PetIndex1, %�赵_ǿ��%).."  ����  -"..Pet.FullArtRank(PetIndex1, %�赵_����%) - Pet.GetArtRank(PetIndex1, %�赵_����%).."  ħ��  -"..Pet.FullArtRank(PetIndex1, %�赵_ħ��%) - Pet.GetArtRank(PetIndex1, %�赵_ħ��%));
			end

		elseif (PetIndex1>0 and Char.GetData(PetIndex1,%����_�ȼ�%)>1) then
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"��ѡ��ĳ����Ѿ��ɹ����ϻ�ͯ!");
			Char.DelItem(_TalkPtr,PetRebirthID,1)
			Pet.ReBirth(_TalkPtr, PetIndex1);

		elseif (PetIndex1<0) then
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"��磬���Ҫ����û��ʵ��...");
		end
	end
end

function PetRebirth_Init()
	PetRebirth_Creat()
	--save("npc","����NPC",Char.GetData(PetRebirth_index,%����_����%).." = "..PetRebirth_index.."�����ɹ���")
end

