Delegate.RegDelTalkEvent("ng_TalkEvent");

function ng_TalkEvent(player,msg,color,range,size)
	if (msg == "/1")then  ---��������
		local getXiangVar1 = Char.GetData(player,%����_�㲽��%);
		local getXiangVar2 = Char.GetData(player,%����_������%);
		if(getXiangVar1 > 0)then
			Char.SetData(player,%����_�㲽��%,0);
			Char.SetData(player,%����_������%,0);
			NLG.SystemMessage(player,"���������Ѿ��رգ�");
		else
			Char.SetData(player,%����_�㲽��%,999);
			Char.SetData(player,%����_������%,999);
			NLG.SystemMessage(player,"���������Ѿ�������");
		end
	end
		if(msg == "/2")then  --������
		local kg = Char.GetData(player,%����_�����п���%);
		if(kg == 0)then
			 Char.SetData(player,%����_�����п���%,1);
			NLG.SystemMessage(player,"�������Ѿ�������");
		else
			 Char.SetData(player,%����_�����п���%,0);
			NLG.SystemMessage(player,"�������Ѿ��رգ�");
		end
	end
	if (msg == "/hc")then   ---�س�
		Char.Warp(player, 0, 1000, 242, 88)
		NLG.SystemMessage(player,"��ϲ���ѻسǡ�");
		return 0
	end	
	if (msg == "/zl")then   ---��������
		NLG.SortItem(player);
		NLG.SystemMessage(player,"����������ϡ�");
		return 0
	end	
	if msg == "/3" then  ----����
		local Count = 0
		for ItemSlot = 8,27 do
			local ItemIndex = Char.GetItemIndex(player, ItemSlot)
			if ItemIndex > 0 then
				local money = Char.GetData(player,%����_���%);
				local djdj = Item.GetData(ItemIndex,%����_�ȼ�%);
				local kcmb = djdj*200;
				if Item.GetData(ItemIndex, %����_�Ѽ���%)==0 and money >= (djdj*200) then
					Count = Count + 1
					Char.SetData(player,%����_���%,money-kcmb);
					Item.SetData(ItemIndex, %����_�Ѽ���%, 1)
					NLG.SystemMessage(player,"[ϵͳ] �������ĵ��ߵȼ�Ϊ"..djdj.."�����۳�ħ��"..kcmb.."G");
					NLG.SystemMessage(player,"[ϵͳ] �����ϵ� " .. Item.GetData(ItemIndex, %����_��ǰ��%) .. "�Ѽ���Ϊ " .. Item.GetData(ItemIndex, %����_����%))
					Item.UpItem(player, ItemSlot);
					NLG.UpChar(player);
					return ;
				end
			end
		end
		if Count==0 then
			NLG.SystemMessage(player,"[ϵͳ] ������û����Ҫ��������Ʒ�������Ǯ�����Լ����˵��ߡ�");
			return;
		end
		return 0
	end	
	if msg == "/4" then  ----����
		local Count = 0
		for ItemSlot = 8,8 do
			local ItemIndex = Char.GetItemIndex(player, ItemSlot)
			local money = Char.GetData(player,%����_���%);
			local djdj = Item.GetData(ItemIndex,%����_�ȼ�%);
			local djmz = Item.GetData(ItemIndex,%����_����%);
			local djnj = Item.GetData(ItemIndex,%����_�;�%);
			local djzdnj = Item.GetData(ItemIndex,%����_����;�%);
			local xhnj = djzdnj-djnj
			local jdnj = xhnj*0.5
			local xlfy = jdnj*10
			local djlb = Item.GetData(ItemIndex,%����_����%);
			if money > xlfy and djzdnj > djnj and djlb>= 0 and djlb <= 14 then
				Count = Count + 1
				Char.SetData(player,%����_���%,money-xlfy);
				Item.SetData(ItemIndex,%����_�;�%,djnj+xhnj);
				Item.UpItem(player, ItemSlot);
				local djnj1 = Item.GetData(ItemIndex,%����_�;�%);
				local djzdnj1 = Item.GetData(ItemIndex,%����_����;�%);
				Item.SetData(ItemIndex,%����_�;�%,djnj1-jdnj);
				Item.SetData(ItemIndex,%����_����;�%,djzdnj1-jdnj);
				NLG.SystemMessage(player,"[ϵͳ] �������װ����"..djmz.."���ָ��ˡ�"..xhnj.."���;á��۳�ħ�ҡ�"..xlfy.."G��");
				Item.UpItem(player, ItemSlot);
				NLG.UpChar(player);
				return 0
			end
		end
		if Count == 0 then
			NLG.SystemMessage(player,"[ϵͳ] ���������һ��û��Ҫ�ָ��;õ�װ��������������ħ�Ҳ��㡣");
			return 0
		end
		return 0
	end
	if msg == "/5" then  --��
		local daka = Char.GetData(player, 4008);
		local money = Char.GetData(player,%����_���%);
		if daka == 0 and money >= 200 then
			Char.SetData(player,%����_���%,money-200);
			Char.FeverStart(player);
			NLG.UpChar(player);
			NLG.SystemMessage(player, "�۳�ħ��200G��");	
			NLG.SystemMessage(player, "��ϲ���򿨳ɹ���");	
			return ;
		end
		if daka == 1 and money >= 200 then
			Char.SetData(player,%����_���%,money-200);
			Char.FeverStop(player);
			NLG.UpChar(player);
			NLG.SystemMessage(player, "�۳�ħ��200G��");
			NLG.SystemMessage(player, "��ϲ���رմ򿨳ɹ���");	
			return ;
		end
		if money < 200 then
			NLG.SystemMessage(player, "����ħ�Ҳ������޷�ʹ�á�");	
			return ;
		end
	end
	if msg == "/6" then  ---����л�
		local ZH = Char.GetData(player,170);
		local money = Char.GetData(player,%����_���%);
		local LV = Char.GetData(player,%����_�ȼ�%);
		local ZHMB = ZH*200;
		local ZHMBKC = ZHMB*LV
		if ZH <= 0 then
			NLG.SystemMessage(player,"��û�е��ꡣ");	
		end
		if money >= ZHMBKC and ZH > 0 then
			Char.SetData(player,%����_���%,money-ZHMBKC);
			Char.SetData(player,170,ZH-ZH);
			Char.FeverStop(player);
			NLG.UpChar(player);
			NLG.SystemMessage(player,"�л���ɡ��л�����Ϊ��"..ZH.."������Ϊ��"..ZHMBKC.."��ħ�ҡ�");	
		end
		if money < ZHMBKC then
			NLG.SystemMessage(player,"��Ǯ��û���㻹�л꣬һ�����������ȥ�ɡ����л�۸���� ����*1000*�ȼ���");	
		end
	end
	return 1;
end