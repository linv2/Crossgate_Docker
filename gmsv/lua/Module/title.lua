NL.RegTitleChangedEvent(nil,"TitleChangedEvent");

function TitleChangedEvent(player)
    local shui = Char.GetData(player,%对象_抗睡%);
    local du = Char.GetData(player,%对象_抗毒%);
    local shi = Char.GetData(player,%对象_抗石%);
    local zui = Char.GetData(player,%对象_抗醉%);
    local luan = Char.GetData(player,%对象_抗乱%);
    local wang = Char.GetData(player,%对象_抗忘%);
    local ming = Char.GetData(player,%对象_命中%);
    local shan = Char.GetData(player,%对象_闪躲%);
    local bi = Char.GetData(player,%对象_必杀%);
    local fan = Char.GetData(player,%对象_反击%);
    local str = Char.GetData(player,%对象_力量%);   
    local vit = Char.GetData(player,%对象_体力%);
    local def = Char.GetData(player,%对象_强度%);
    local quick = Char.GetData(player,%对象_速度%);
    local magic = Char.GetData(player,%对象_魔法%); 
    local key = "off";  
    local title = Char.GetTitle(player);
    if title == 61 then
		czTitleEvent(player);
		Char.SetData(player,%对象_抗睡%,shui+5);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"☆称号加成☆ 获得称号属性加成.");
        key = "on";
		return;
	elseif title == 77 then
		czTitleEvent(player);
		Char.SetData(player,%对象_抗毒%,du+5);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"☆称号加成☆ 获得称号属性加成.");
        key = "on";
		return;
    elseif title == 1048 then
		czTitleEvent(player);
		Char.SetData(player,%对象_必杀%,bi+10);
        Char.SetData(player,%对象_反击%,fan+10);
        Char.SetData(player,%对象_闪躲%,shan+10);
        Char.SetData(player,%对象_命中%,ming+10);
        Char.SetData(player,%对象_力量%,str+100);
        Char.SetData(player,%对象_体力%,vit+100);
        Char.SetData(player,%对象_强度%,def+100);
        Char.SetData(player,%对象_速度%,quick+100);
        Char.SetData(player,%对象_魔法%,magic+100);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"☆称号加成☆ 获得称号属性加成，必杀+15,反击+15,闪躲+15,命中+15，血、魔、攻、防、敏BP+1.");
        key = "on";
		return;
    elseif title == 9999 then
		czTitleEvent(player);
		Char.SetData(player,%对象_必杀%,bi+15);
        Char.SetData(player,%对象_反击%,fan+15);
        Char.SetData(player,%对象_闪躲%,shan+15);
        Char.SetData(player,%对象_命中%,ming+15);
        Char.SetData(player,%对象_力量%,str+1000);
		NLG.UpChar(player);
		NLG.SystemMessage(player,"☆称号加成☆ 获得称号属性加成，必杀+15,反击+15,闪躲+15,命中+15.");
        key = "on";
		return;
	else
		czTitleEvent(player);
		if key == "on" then
            NLG.SystemMessage(player,"☆称号加成☆ 取消称号属性加成.");	
            key = "off"; 
	    end  
    end
end

function czTitleEvent(player)
		Char.SetData(player,%对象_抗睡%,shui);
        Char.SetData(player,%对象_抗毒%,du);
        Char.SetData(player,%对象_抗石%,shi);
        Char.SetData(player,%对象_抗醉%,zui);
        Char.SetData(player,%对象_抗乱%,luan);
        Char.SetData(player,%对象_抗忘%,wang);
        Char.SetData(player,%对象_命中%,ming);
        Char.SetData(player,%对象_闪躲%,shan);
        Char.SetData(player,%对象_必杀%,bi);
        Char.SetData(player,%对象_反击%,fan);
        NLG.UpChar(player);
end