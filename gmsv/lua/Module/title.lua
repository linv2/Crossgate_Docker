NL.RegTitleChangedEvent(nil,"TitleChangedEvent");

function TitleChangedEvent(player)
    local shui = Char.GetData(player,%����_��˯%);
    local du = Char.GetData(player,%����_����%);
    local shi = Char.GetData(player,%����_��ʯ%);
    local zui = Char.GetData(player,%����_����%);
    local luan = Char.GetData(player,%����_����%);
    local wang = Char.GetData(player,%����_����%);
    local ming = Char.GetData(player,%����_����%);
    local shan = Char.GetData(player,%����_����%);
    local bi = Char.GetData(player,%����_��ɱ%);
    local fan = Char.GetData(player,%����_����%);
    local str = Char.GetData(player,%����_����%);   
    local vit = Char.GetData(player,%����_����%);
    local def = Char.GetData(player,%����_ǿ��%);
    local quick = Char.GetData(player,%����_�ٶ�%);
    local magic = Char.GetData(player,%����_ħ��%); 
    local key = "off";  
    local title = Char.GetTitle(player);
    if title == 61 then
		czTitleEvent(player);
		Char.SetData(player,%����_��˯%,shui+5);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"��ƺżӳɡ� ��óƺ����Լӳ�.");
        key = "on";
		return;
	elseif title == 77 then
		czTitleEvent(player);
		Char.SetData(player,%����_����%,du+5);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"��ƺżӳɡ� ��óƺ����Լӳ�.");
        key = "on";
		return;
    elseif title == 1048 then
		czTitleEvent(player);
		Char.SetData(player,%����_��ɱ%,bi+10);
        Char.SetData(player,%����_����%,fan+10);
        Char.SetData(player,%����_����%,shan+10);
        Char.SetData(player,%����_����%,ming+10);
        Char.SetData(player,%����_����%,str+100);
        Char.SetData(player,%����_����%,vit+100);
        Char.SetData(player,%����_ǿ��%,def+100);
        Char.SetData(player,%����_�ٶ�%,quick+100);
        Char.SetData(player,%����_ħ��%,magic+100);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"��ƺżӳɡ� ��óƺ����Լӳɣ���ɱ+15,����+15,����+15,����+15��Ѫ��ħ������������BP+1.");
        key = "on";
		return;
    elseif title == 9999 then
		czTitleEvent(player);
		Char.SetData(player,%����_��ɱ%,bi+15);
        Char.SetData(player,%����_����%,fan+15);
        Char.SetData(player,%����_����%,shan+15);
        Char.SetData(player,%����_����%,ming+15);
        Char.SetData(player,%����_����%,str+1000);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"��ƺżӳɡ� ��óƺ����Լӳɣ���ɱ+15,����+15,����+15,����+15.");
        key = "on";
		return;
	else
		czTitleEvent(player);
		if key == "on" then
            NLG.SystemMessage(player,"��ƺżӳɡ� ȡ���ƺ����Լӳ�.");	
            key = "off"; 
	    end  
    end
end

function czTitleEvent(player)
		Char.SetData(player,%����_��˯%,shui);
        Char.SetData(player,%����_����%,du);
        Char.SetData(player,%����_��ʯ%,shi);
        Char.SetData(player,%����_����%,zui);
        Char.SetData(player,%����_����%,luan);
        Char.SetData(player,%����_����%,wang);
        Char.SetData(player,%����_����%,ming);
        Char.SetData(player,%����_����%,shan);
        Char.SetData(player,%����_��ɱ%,bi);
        Char.SetData(player,%����_����%,fan);
        NLG.UpChar(player);
end