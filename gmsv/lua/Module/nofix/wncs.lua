Delegate.RegDelTalkEvent("wncs_TalkEvent");
function wncs_TalkEvent(player,msg,color,range,size)
		--[[if(msg=="/flc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,53,51,67);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end--]]

	if(msg=="/aklfc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,33200,99,165);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	--[[if(msg=="/lmnsc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,43600,61,29);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end
	if(msg=="/lonc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=5000)then
			Char.SetData(player,%����_���%,money-5000);
			NLG.UpChar(player);
			Char.Warp(player,0,30333,5,14);
			NLG.SystemMessage(player,"�۳�5000ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���5000��");	
		end
	end
	if(msg=="/dnc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,4299,5,5);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/mnjyc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,43541,20,15);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end--]]


	if(msg=="/glec") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,43100,120,107);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	--[[if(msg=="/hblc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,3100,68,35);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end--]]
	if(msg=="/f") then 
		local money = Char.GetData(player,%����_���%);
		local floor = Char.GetData(player,3)
		local fmap = Char.GetData(player,4)
		local fx = Char.GetData(player,5)
		local fy = Char.GetData(player,6)
	if Char.GetPartyMode(player)== 2then
			NLG.SystemMessage(player,"���Ƕӳ��޷�ʹ�ô�����");	
			return;
			end
		if(money>=1)then
			Char.SetData(player,%����_���%,money-1);
			NLG.UpChar(player);
			Char.Warp(player,floor,fmap,fx,fy);
			NLG.SystemMessage(player,"�۳�1ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ��㣡");	
		end
	end
	
	if(msg=="/hc") then 
		local money = Char.GetData(player,%����_���%);
	if Char.GetPartyMode(player)== 2then
			NLG.SystemMessage(player,"���Ƕӳ��޷�ʹ�ô�����");	
			return;
			end
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,1000,239,84);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			
		NLG.SystemMessage(player,"��ϵͳ�����ѿ�����ħ�㣬�����йرգ����򽫻�۳�ʣ�ಽ����");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	--[[if(msg=="/lktez") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,43700,75,105);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/jnc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,3099,14,7);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/mfdx") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,4400,106,54);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/wkl") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,100,348,379);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	

	if(msg=="/qlc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,3299,13,9);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	

	if(msg=="/sllkc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,2399,15,4);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	
	
	if(msg=="/yltc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,2499,5,15);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	
	
	if(msg=="/wnyc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,2199,5,5);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	
	
	
	if(msg=="/jnwc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,4099,6,7);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	
	if(msg=="/yec") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,2099,20,10);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end	
	if(msg=="/abnsc") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,4399,5,14);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/zlsj") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,15507,29,14);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/ss") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,16511,26,28);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end
--]]
	if(msg=="/ud") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=5000)then
			Char.SetData(player,%����_���%,money-5000);
			NLG.UpChar(player);
			Char.Warp(player,0,24001,8,8);
			NLG.SystemMessage(player,"�۳�5000ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���5000��");	
		end
	end


--[[	if(msg=="/sw") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,24068,18,19);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end

	if(msg=="/bnqshs") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,48022,44,47);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end
	if(msg=="/sl") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=500)then
			Char.SetData(player,%����_���%,money-500);
			NLG.UpChar(player);
			Char.Warp(player,0,33000,290,436);
			NLG.SystemMessage(player,"�۳�500ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���500��");	
		end
	end
	-- if(msg=="/bnqshs") then 
			-- Char.Warp(player,0,803,13,56);
			-- return;	
	-- end
	if(msg=="/blsd") then 
		local money = Char.GetData(player,%����_���%);
		if(money>=8000)then
			Char.SetData(player,%����_���%,money-8000);
			NLG.UpChar(player);
			Char.Warp(player,0,101,75,83);
			NLG.SystemMessage(player,"�۳�8000ħ�ҡ�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ��㣡");	
		end
	end
	if (msg=="/cszl") then 
		NLG.SystemMessage(player, "����/+����ȫƴ�ĵ�һ����ĸСд������Ҫȥ���壺/aklfc��:����--����³���壬³����˹�壬���ȴ壬��ŵ���Ǵ壬�������ǣ�����³�壬�׿������򣬼��ɴ壬���Ǳ����壬ħ����ѧ���ڿ����������壬ʥ��³���壬�����ش壬άŵ�Ǵ壬��ŵ�ߴ壬�����壬������˹�壬����ǡ˹��ɽ����ŷ�ɴ壬���̣�����˹��");	
	end--]]
	if(msg=="/lt") then 
		local money = Char.GetData(player,%����_���%);
	if Char.GetPartyMode(player)== 2 then
			NLG.SystemMessage(player,"���Ƕӳ��޷�ʹ�ô�����");	
			return;
			end
		if(money>=100)then
			Char.SetData(player,%����_���%,money-100);
			NLG.UpChar(player);
			Char.Warp(player,0,1538,16,5);
			NLG.SystemMessage(player,"�۳�100ħ�ҡ�");
			NLG.SystemMessage(player,"��ϵͳ�����ѿ�����ħ�㣬�����йرգ����򽫻�۳�ʣ�ಽ����");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���100��");	
		end
	end
	if(msg=="/cszj") then 
		local money = Char.GetData(player,%����_���%);
	if Char.GetPartyMode(player)== 2 then
			NLG.SystemMessage(player,"���Ƕӳ��޷�ʹ�ô�����");	
			return;
			end
		if(money>=100)then
			Char.SetData(player,%����_���%,money-100);
			NLG.UpChar(player);
			Char.Warp(player,0,1522,25,26);
			NLG.SystemMessage(player,"�۳�100ħ�ҡ�");
			NLG.SystemMessage(player,"��ϵͳ�����ѿ�����ħ�㣬�����йرգ����򽫻�۳�ʣ�ಽ����");
			return;	
		else
			NLG.SystemMessage(player,"�Բ�������ħ�Ҳ���100��");	
		end
	end
	
	
	if(msg=="/knblc2") then 
		local dadi = Char.ItemNum(player,18990);
		if(dadi>=1)then
			NLG.UpChar(player);
			Char.Warp(player,0,34014,47,41);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�á�");
			--Char.DelItem(player,888888,300);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û�д�ؽᾧ��");	
		end
	end
if(msg=="/knblc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,33500,22,28);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,10);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û��������֣�");	
		end
	end
	
if(msg=="/lmnsc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,43600,61,29);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û��������֣�");	
		end
end	
if(msg=="/lonc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,30333,5,14);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	
if(msg=="/dnc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4299,5,5);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	
if(msg=="/dnc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4299,5,5);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/mnjyc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,43541,20,15);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/hblc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,3100,68,35);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	
	
if(msg=="/lktez") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,43700,75,105);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/jnc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,3099,14,7);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/mfdx") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4400,106,54);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/wkl") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,100,348,379);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/qlc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,3299,13,9);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	
if(msg=="/sllkc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,2399,15,4);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/yltc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,2499,5,15);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/yec") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,2099,20,10);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/wnyc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,2199,5,5);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/jnwc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4099,6,7);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/abnsc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4399,5,14);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/abnsc") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,4399,5,14);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/zlsj") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,15507,29,14);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

if(msg=="/ss") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,16511,26,28);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	
if(msg=="/sw") then 
		local csq = Char.ItemNum(player,9700373);
		if(csq>=30)then
			NLG.UpChar(player);
			Char.Warp(player,0,24068,18,19);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�ã��۳�30���ֿ���");
			Char.DelItem(player,9700373,30);
			return;	
		else
			NLG.SystemMessage(player,"�Բ���������û���㹻��������֣�");	
		end
end	

	
		if(msg=="/hyzr") then 
		local dengji = Char.GetData(player,%����_�ȼ�%);
		if(dengji >= 50)then
			Char.Warp(player,0,24005,17,16);
			NLG.SystemMessage(player,"���Ѵ�����ָ��λ�á�");
			return;	
		else
			NLG.SystemMessage(player,"�Բ������ĵȼ�����50����");	
		end
	end

	if (msg=="/cszl") then 
		NLG.SystemMessage(player, "����/+����ȫƴ�ĵ�һ����ĸСд������Ҫȥ���壺/aklfc��:����--����³���壬��������,�سǣ����ã�����֮�䣬����֮��");	
	end
	
end