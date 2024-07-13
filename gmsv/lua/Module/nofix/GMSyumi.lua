function GMSyumiNPC_Create()
	GMSyumiNPC= NL.CreateNpc(nil, "GMSyumi_Init");
	Char.SetData(GMSyumiNPC, %����_����%, 106602);
	Char.SetData(GMSyumiNPC, %����_ԭ��%, 106602); 
	Char.SetData(GMSyumiNPC, %����_��ͼ%, 1000);
	Char.SetData(GMSyumiNPC, %����_X%, 242);
	Char.SetData(GMSyumiNPC, %����_Y%, 78);
	Char.SetData(GMSyumiNPC, %����_����%, 4);
	Char.SetData(GMSyumiNPC, %����_ԭ��%, "����ԱSyumi");
	NLG.UpChar(GMSyumiNPC)

--����ע��
	Item_ID=-1	
	Item_NUM=-1	
--�¼�ע��

	if (Char.SetTalkedEvent(nil, "GMSyumiNPC_Talked", GMSyumiNPC) < 0) then
		print("ResistPlusNPC_Talked ע���¼�ʧ�ܡ�");
		return false;
	end

	if (Char.SetWindowTalkedEvent(nil, "GMSyumiNPC_WindowTalked", GMSyumiNPC) < 0) then
		print("GMSyumiNPC_WindowTalked ע���¼�ʧ�ܡ�");
		return false;
	end

	return true;
end

function GMSyumi_Init( _MePtr )
	print("GMSyumiNPC.Index = " .. _MePtr)
	return true;
end

function GMSyumiNPC_Talked( _MePtr, _TalkPtr)
	if(NLG.CheckInFront(_TalkPtr, _MePtr, 1) == false) then
		return ;
	end
	NLG.ShowWindowTalked(_TalkPtr,_MePtr, %����_ѡ���%, 0, 0, "1\nSyumi�İ�������\n1.�������\n2.�������\n3.�������\n4.�������" );
	return ;
end

function GMSyumiNPC_WindowTalked( _MePtr, _TalkPtr, _Seqno, _Select, _Data)
	
	if (_Select==2) then
		GMSyumiNPC_Talked( _MePtr, _TalkPtr);
	end

--��ҳ�˵�	
	if (_Seqno==0) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 1, "1\n�޸ĵ�һ���������\n1.�����޸�\n2.���������޸�\n3.�����޸�\n4.��õ���");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 2, "1\n�������\n1.��һ��������1��\n2.��һ������������1��\n3.��һ�������������ͬ�ȼ�\n4.��ó���");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 3, "1\n�������\n1.��������\n2.��ͼ�ƶ�");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 4, "1\n�������\n1.������������\n2.������������\n3.����������\n4.��������\n5.���￹��\n6.��������");
		end
	end
--��������Ӳ˵�
	if (_Seqno==1) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 11, "1\n�޸ĵ�һ�������������\n1.��ɱ\n2.����\n3.����\n4.����\n5.����\n6.����\n7.����");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 12, "1\n�޸ĵ�һ����߻�������\n1.����\n2.����\n3.����\n4.����\n5.�ظ�");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 13, "1\n�޸ĵ�һ����߿���\n1.����\n2.˯��\n3.ʯ��\n4.��\n5.�ҿ�\n6.����");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 14, "\n1.�������\n\n\n��������Ҫ��������ƷID");
		end
	end
--���������Ӳ˵�
	if (_Seqno==14) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 141, "\n1.�������\n\n\n��������Ҫ��������Ʒ����");
	end
	if (_Seqno==141) then
		Item_NUM = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 1411, "110153|1.�������\n\n\n��ȷ��Ҫ���� " ..Item_NUM.. " ��IDΪ " ..Item_ID.. " ����Ʒ��");
	end		
	if (_Seqno==1411) then
		Char.GiveItem(_TalkPtr,Item_ID,Item_NUM)
	end
--�����޸�
	if (_Seqno==11) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 111, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 112, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 113, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 114, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 115, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 116, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='7') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 117, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		end
	end
	if (_Seqno==12) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 121, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 122, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 123, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 124, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 125, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		end
	end
	if (_Seqno==13) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 131, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 132, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 133, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 134, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 135, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 136, "\n1.�����޸�\n\n\n��������Ҫ���ӵ���ֵ");
		end
	end
	if(_Seqno>110 and _Seqno<137) then
		Item_NUM = _Data;
		_Item=Char.GetItemIndex(_TalkPtr,8)
		if(_Item >0) then
			if(_Seqno==111) then
				Item.SetData( _Item , %����_��ɱ% ,Item.GetData(_Item, %����_��ɱ%)+Item_NUM)
			elseif(_Seqno==112) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==113) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==114) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==115) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==116) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==117) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==121) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==122) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==123) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==124) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==125) then
				Item.SetData( _Item , %����_�ظ�% ,Item.GetData(_Item, %����_�ظ�%)+Item_NUM)
			elseif(_Seqno==131) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
			elseif(_Seqno==132) then
				Item.SetData( _Item , %����_˯��% ,Item.GetData(_Item, %����_˯��%)+Item_NUM)
			elseif(_Seqno==133) then
				Item.SetData( _Item , %����_ʯ��% ,Item.GetData(_Item, %����_ʯ��%)+Item_NUM)
			elseif(_Seqno==134) then
				Item.SetData( _Item , %����_��% ,Item.GetData(_Item, %����_��%)+Item_NUM)
			elseif(_Seqno==135) then
				Item.SetData( _Item , %����_�ҿ�% ,Item.GetData(_Item, %����_�ҿ�%)+Item_NUM)
			elseif(_Seqno==136) then
				Item.SetData( _Item , %����_����% ,Item.GetData(_Item, %����_����%)+Item_NUM)
		end
		Item.UpItem(_TalkPtr,8)
		NLG.TalkToCli( _TalkPtr, _MePtr, "��һ����������ǿ���ɹ�", 1, 2)
		end
	end

--��������Ӳ˵�
	if (_Seqno==2) then
		if (_Data=='1') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0) then
				Pet.ReBirth(_TalkPtr,_Pet)
				NLG.TalkToCli( _TalkPtr, _MePtr, "��ĵ�һ�������Ѿ����õ�1��", 1, 2)
			end
		elseif (_Data=='2') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0) then
				Pet.SetArtRank(_Pet, %�赵_���%,Pet.FullArtRank(_Pet, %�赵_���%))
				Pet.SetArtRank(_Pet, %�赵_����%,Pet.FullArtRank(_Pet, %�赵_����%))
				Pet.SetArtRank(_Pet, %�赵_ǿ��%,Pet.FullArtRank(_Pet, %�赵_ǿ��%))
				Pet.SetArtRank(_Pet, %�赵_����%,Pet.FullArtRank(_Pet, %�赵_����%))
				Pet.SetArtRank(_Pet, %�赵_ħ��%,Pet.FullArtRank(_Pet, %�赵_ħ��%))
				Pet.ReBirth(_TalkPtr,_Pet)
				NLG.TalkToCli( _TalkPtr, _MePtr, "��ĵ�һ�������Ѿ����õ�����1��", 1, 2)
			end
		elseif (_Data=='3') then
			_Pet=Char.GetPet(_TalkPtr,0)
			if(_Pet > 0 ) then
				Char.SetData(_Pet,%����_����%,Char.GetData(_TalkPtr,%����_����%))
				NLG.TalkToCli( _TalkPtr, _MePtr, "��һ�����ﾭ���Ѿ�������һ����", 1, 2)
				Pet.UpPet(_TalkPtr, _Pet)
			end
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 24, "\n1.��ó���\n\n\n��������Ҫ��õĳ���ID");
		end
	end
--��ó���
	if (_Seqno==24) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 241, "110153|1.��ó���\n\n\n��ȷ��Ҫ���IDΪ " ..Item_ID.. " �ĳ�����");
	end
	if (_Seqno==241) then
		Char.AddPet(_TalkPtr,Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "���Ѿ���ó�����", 1, 2)
	end
--��������Ӳ˵�
	if (_Seqno==3) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 31, "\n1.��������\n\n\n��������Ҫ���ӵ�������");
		end
		if (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 32, "\n2.��ͼ�ƶ�\n\n\n��������Ҫ���͵ĵ�ͼID������\n\n\n��ʽ��MapID,X,Y\n���ӣ�1000,200,100");
		end
	end
--��������
	if (_Seqno==31) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 311, "110153|1.��������\n\n\n��ȷ��Ҫ����" ..Item_ID.. " ������");
	end
	
	if (_Seqno==311) then
		Char.SetData(_TalkPtr, %����_����%, Char.GetData(_TalkPtr, %����_����%)+Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "�㵱ǰ����Ϊ[" .. Char.GetData(_TalkPtr, %����_����%) .. "]�㡣", 1, 2)
	end
--��ͼ�ƶ�
	if (_Seqno==32) then
		WarpMap_Start = 1;
		WarpMap_End = string.find(_Data, ",", 1)-1;
		WarpX_Start = WarpMap_End+2;
		WarpX_End = string.find(_Data, ",", WarpMap_End+2)-1;
		WarpY_Start = WarpX_End+2;
		WarpY_End = string.len(_Data);
		WarpMap = string.sub(_Data, WarpMap_Start, WarpMap_End) ;
		WarpX = string.sub(_Data, WarpX_Start, WarpX_End) ;
		WarpY = string.sub(_Data, WarpY_Start, WarpY_End);
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 321, "110153|\n1.��ͼ�ƶ�\n\n\n��ȷ��Ҫ����ȥ " ..WarpMap.. " �� " ..WarpX.. "," ..WarpY.. " ������");
	end
	if (_Seqno==321) then
		Char.Warp(_TalkPtr,0,WarpMap,WarpX,WarpY)
	end
--�������
	if (_Seqno==4) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 41, "\n1.������������\n\n\n��������Ҫ���ӵ�������������");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 42, "\n1.������������\n\n\n��������Ҫ���ӵĳ�����������");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 43, "1\n����������\n1.������\n2.ˮ����\n3.������\n4.������");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 44, "1\n��������\n1.��ɱ\n2.����\n3.����\n4.����");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, %����_ѡ���%, %��ť_�ر�%, 45, "1\n���￹��\n1.����\n2.˯��\n3.ʯ��\n4.��\n5.�ҿ�\n6.����");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 46, "\n1.���������޸�\n\n��������Ҫ�޸ĵ�����\n0����,1��,2,����,3����,4����,\n5ֲ��,6Ұ��,7����,8����,9 аħ");
		end
	end
--���������޸�
	if (_Seqno==41) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 411, "110153|1.������������\n\n\n��ȷ��Ҫ����" ..Item_ID.. " ��������������");
	end
	if (_Seqno==411) then
		Char.SetData(_TalkPtr, %����_������%, Char.GetData(_TalkPtr, %����_������%)+Item_ID)
		NLG.TalkToCli( _TalkPtr, _MePtr, "��ȡ���������ɹ�,��Ҫ�ǳ��ŷ������½���", 1, 2)
	end
	if (_Seqno==42) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 421, "110153|1.������������\n\n\n��ȷ��Ҫ����" ..Item_ID.. " ��������������");
	end
	if (_Seqno==421) then
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			Char.SetData(_Pet, %����_������%, Char.GetData(_Pet, %����_������%)+Item_ID)
			NLG.TalkToCli( _TalkPtr, _MePtr, "��ȡ���������ɹ�,��Ҫ�ǳ��ŷ������½���", 1, 2)
			Pet.UpPet(_TalkPtr, _Pet)
		end
	end
--���������޸�
	if (_Seqno==43) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 431, "\n1.����������\n\n\n��������Ҫ�޸ĵ���ֵ,���ܳ���100");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 432, "\n1.����������\n\n\n��������Ҫ�޸ĵ���ֵ,���ܳ���100");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 433, "\n1.����������\n\n\n��������Ҫ�޸ĵ���ֵ,���ܳ���100");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 434, "\n1.����������\n\n\n��������Ҫ�޸ĵ���ֵ,���ܳ���100");
		end
	end
	if (_Seqno==44) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 441, "\n1.��������\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 442, "\n1.��������\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 443, "\n1.��������\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 444, "\n1.��������\n\n\n��������Ҫ���ӵ���ֵ");
		end
	end
	if (_Seqno==45) then
		if (_Data=='1') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 451, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='2') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 452, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='3') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 453, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='4') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 454, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='5') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 455, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		elseif (_Data=='6') then
			NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 1, 34, 456, "\n1.���￹��\n\n\n��������Ҫ���ӵ���ֵ");
		end
	end
	
	if(_Seqno>430 and _Seqno<460) then
		Item_NUM = _Data;
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			if(_Seqno==431) then
				Char.SetData(_Pet, %����_������%, Item_NUM)
			elseif(_Seqno==432) then
				Char.SetData(_Pet, %����_ˮ����%, Item_NUM)
			elseif(_Seqno==433) then
				Char.SetData(_Pet, %����_������%, Item_NUM)
			elseif(_Seqno==434) then
				Char.SetData(_Pet, %����_������%, Item_NUM)
			elseif(_Seqno==441) then
				Char.SetData(_Pet, %����_��ɱ%, Char.GetData(_Pet, %����_��ɱ%)+Item_NUM)
			elseif(_Seqno==442) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==443) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==444) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==451) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==452) then
				Char.SetData(_Pet, %����_��˯%, Char.GetData(_Pet, %����_��˯%)+Item_NUM)
			elseif(_Seqno==453) then
				Char.SetData(_Pet, %����_��ʯ%, Char.GetData(_Pet, %����_��ʯ%)+Item_NUM)
			elseif(_Seqno==454) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==455) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
			elseif(_Seqno==456) then
				Char.SetData(_Pet, %����_����%, Char.GetData(_Pet, %����_����%)+Item_NUM)
		end
		Pet.UpPet(_TalkPtr, _Pet)
		NLG.TalkToCli( _TalkPtr, _MePtr, "��һ����������ǿ���ɹ�", 1, 2)
		end
	end
	if (_Seqno==46) then
		Item_ID = _Data;
		NLG.ShowWindowTalked(_TalkPtr,  _MePtr, 37, 3, 461, "110153|1.���������޸�\n\n\n��ȷ��Ҫ�޸ĳ�������IDΪ" ..Item_ID.. " ��");
	end
	if (_Seqno==461) then
		_Pet=Char.GetPet(_TalkPtr,0)
		if(_Pet > 0 ) then
			Char.SetData(_Pet, %����_����%, Item_ID)
			NLG.TalkToCli( _TalkPtr, _MePtr, "���������޸ĳɹ�,��Ҫ�ǳ��ŷ������½���", 1, 2)
			Pet.UpPet(_TalkPtr, _Pet)
		end
	end
--����
end


GMSyumiNPC_Create()
