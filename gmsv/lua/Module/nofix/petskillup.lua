NL.RegItemString(nil,"My10ItemUse","LUA_useTest10");
NL.RegItemString(nil,"My11ItemUse","LUA_useTest11");
NL.RegItemString(nil,"My12ItemUse","LUA_useTest12");
NL.RegItemString(nil,"My13ItemUse","LUA_useTest13");
NL.RegItemString(nil,"My14ItemUse","LUA_useTest14");
NL.RegItemString(nil,"My15ItemUse","LUA_useTest15");
NL.RegItemString(nil,"My16ItemUse","LUA_useTest16");
NL.RegItemString(nil,"My17ItemUse","LUA_useTest17");
NL.RegItemString(nil,"My18ItemUse","LUA_useTest18");
NL.RegItemString(nil,"My19ItemUse","LUA_useTest19");
NL.RegItemString(nil,"My20ItemUse","LUA_useTest20");
NL.RegItemString(nil,"My21ItemUse","LUA_useTest21");
NL.RegItemString(nil,"My22ItemUse","LUA_useTest22");
NL.RegItemString(nil,"My23ItemUse","LUA_useTest23");
NL.RegItemString(nil,"My24ItemUse","LUA_useTest24");
NL.RegItemString(nil,"My25ItemUse","LUA_useTest25");
NL.RegItemString(nil,"My26ItemUse","LUA_useTest26");
NL.RegItemString(nil,"My27ItemUse","LUA_useTest27");
NL.RegItemString(nil,"My28ItemUse","LUA_useTest28");
NL.RegItemString(nil,"My29ItemUse","LUA_useTest29");
NL.RegItemString(nil,"My30ItemUse","LUA_useTest30");
NL.RegItemString(nil,"My31ItemUse","LUA_useTest31");
NL.RegItemString(nil,"My32ItemUse","LUA_useTest32");
NL.RegItemString(nil,"My33ItemUse","LUA_useTest33");
NL.RegItemString(nil,"My34ItemUse","LUA_useTest34");
NL.RegItemString(nil,"My35ItemUse","LUA_useTest35");
NL.RegItemString(nil,"My36ItemUse","LUA_useTest36");
NL.RegItemString(nil,"My37ItemUse","LUA_useTest37");
NL.RegItemString(nil,"My38ItemUse","LUA_useTest38");
NL.RegItemString(nil,"My41ItemUse","LUA_useTest41");
NL.RegItemString(nil,"My42ItemUse","LUA_useTest42");
NL.RegItemString(nil,"My43ItemUse","LUA_useTest43");
NL.RegItemString(nil,"My44ItemUse","LUA_useTest44");
NL.RegItemString(nil,"My45ItemUse","LUA_useTest45");
NL.RegItemString(nil,"My46ItemUse","LUA_useTest46");
NL.RegItemString(nil,"My47ItemUse","LUA_useTest47");
NL.RegItemString(nil,"My48ItemUse","LUA_useTest48");
NL.RegItemString(nil,"My49ItemUse","LUA_useTest49");
NL.RegItemString(nil,"My50ItemUse","LUA_useTest50");
NL.RegItemString(nil,"My51ItemUse","LUA_useTest51");
NL.RegItemString(nil,"My52ItemUse","LUA_useTest52");
NL.RegItemString(nil,"My53ItemUse","LUA_useTest53");
NL.RegItemString(nil,"My54ItemUse","LUA_useTest54");


function My10ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71851) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,40332);
		Char.DelItem(_Player,71851,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end

function My11ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71852) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,3489);
		Char.DelItem(_Player,71852,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end

function My12ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71853) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,3689);
		Char.DelItem(_Player,71853,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end

function My13ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71854) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,3989);
		Char.DelItem(_Player,71854,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end

--宠物单地E1卷轴\D:
function My14ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71855) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,4089);
		Char.DelItem(_Player,71855,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单冰E2卷轴
function My15ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71856) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,4289);
		Char.DelItem(_Player,71856,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单火E2卷轴
function My16ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71857) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,4589);
		Char.DelItem(_Player,71857,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单风E2卷轴
function My17ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71858) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,4689);
		Char.DelItem(_Player,71858,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单地E3卷轴
function My18ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71859) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,4889);
		Char.DelItem(_Player,71859,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单冰E3卷轴
function My19ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71860) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,89);
		Char.DelItem(_Player,71860,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单火E3卷轴
function My20ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71861) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,189);
		Char.DelItem(_Player,71861,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单风E3卷轴
function My21ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71862) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,389);
		Char.DelItem(_Player,71862,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单地E4卷轴
function My22ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71863) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,589);
		Char.DelItem(_Player,71863,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单冰E4卷轴
function My23ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71864) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,689);
		Char.DelItem(_Player,71864,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单火E4卷轴
function My24ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71865) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,789);
		Char.DelItem(_Player,71865,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单风E4卷轴
function My25ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71866) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,889);
		Char.DelItem(_Player,71866,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单地E5卷轴
function My26ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71867) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,989);
		Char.DelItem(_Player,71867,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单冰E5卷轴
function My27ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71868) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,7689);
		Char.DelItem(_Player,71868,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单火E5卷轴
function My28ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71869) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,7789);
		Char.DelItem(_Player,71869,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单风E5卷轴
function My29ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71870) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,7989);
		Char.DelItem(_Player,71870,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单地E6卷轴
function My30ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71871) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,1989);
		Char.DelItem(_Player,71871,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单冰E6卷轴
function My31ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71872) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,26289);
		Char.DelItem(_Player,71872,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单火E6卷轴
function My32ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71873) > 0) then
		for i = 0,9 do
		if Pet.GetSkill(pet,i) == 15002 then
		Pet.DelSkill(pet,i);
		Pet.AddSkill(pet,11189);
		Char.DelItem(_Player,71873,1);
		Pet.UpPet(_Player,pet)
		NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
		else

		end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--宠物单风E6卷轴
function My33ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71874) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,349);
			Char.DelItem(_Player,71874,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My34ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71875) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,26189);
			Char.DelItem(_Player,71875,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My35ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71876) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,8188);
			Char.DelItem(_Player,71876,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My36ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71877) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,3189);
			Char.DelItem(_Player,71877,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My37ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71878) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,1189);
			Char.DelItem(_Player,71878,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My38ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71879) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,1289);
			Char.DelItem(_Player,71879,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My41ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71881) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2759);
			Char.DelItem(_Player,71881,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My42ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71882) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,479);
			Char.DelItem(_Player,71882,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My43ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71883) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,1979);
			Char.DelItem(_Player,71883,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My44ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71884) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2079);
			Char.DelItem(_Player,71884,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My45ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71885) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2179);
			Char.DelItem(_Player,71885,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My46ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71886) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2279);
			Char.DelItem(_Player,71886,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My47ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71887) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2379);
			Char.DelItem(_Player,71887,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My48ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71888) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2479);
			Char.DelItem(_Player,71888,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My49ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71889) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2579);
			Char.DelItem(_Player,71889,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My50ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71890) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2679);
			Char.DelItem(_Player,71890,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My51ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71891) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2779);
			Char.DelItem(_Player,71891,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My52ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71892) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2879);
			Char.DelItem(_Player,71892,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My53ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71893) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,2979);
			Char.DelItem(_Player,71893,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
function My54ItemUse(_Player,_toPlayer,_itemSlot)
	local pet = Char.GetPet(_Player,0);
	if (VaildChar(pet)==true and Char.ItemNum(_Player,71894) > 0) then
		for i = 0,9 do
			if Pet.GetSkill(pet,i) == 15002 then
			Pet.DelSkill(pet,i);
			Pet.AddSkill(pet,3079);
			Char.DelItem(_Player,71894,1);
			Pet.UpPet(_Player,pet)
			NLG.SystemMessage(_Player, "[系统] 第一格宠物技能学习成功！")
			else

			end
		end
	else
		NLG.SystemMessage(_Player, "[系统] 第一格宠物栏没有宠物！")
	end
end
--Item.SetData(Char.GetItemIndex(_Player,8),%道具_名字%,Item.GetData(Char.GetItemIndex(_Player,8),%道具_名字%).." 强化+1");