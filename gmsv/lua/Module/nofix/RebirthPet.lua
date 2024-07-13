---宠物再生脚本 实现高级变为一级  2017.3.24 长果老


Delegate.RegInit("PetRebirth_Init");
NL.RegItemString(nil, "PetRebirth", "LUA_usePetRebirth");
local PetRebirthID = 9700253;					--洗档物品ID
function PetRebirth_Creat()
	if (PetRebirth_index == nil) then
		PetRebirth_index = NL.CreateNpc(nil, "PetRebirth_initialize");
		Char.SetData(PetRebirth_index, %对象_形象%, 106089);    --%对象_形象%
		Char.SetData(PetRebirth_index, %对象_原形%, 106089);    --%对象_原形%
		Char.SetData(PetRebirth_index, %对象_地图%, 777);      --%对象_地图%
		Char.SetData(PetRebirth_index, %对象_X%, 30);          --%对象_X%
		Char.SetData(PetRebirth_index, %对象_Y%, 30);           --%对象_Y%
		Char.SetData(PetRebirth_index, %对象_方向%, %右下%);    --%对象_方向%, %右下%
		Char.SetData(PetRebirth_index, %对象_原名%, "宠物再生大师");    --%对象_原名%
		NLG.UpChar(PetRebirth_index);
		if (Char.SetTalkedEvent(nil, "PetRebirth_Talked", PetRebirth_index) < 0) then
			print("PetRebirth_Talked 注册事件失败。");
			return false;
		end
		if (Char.SetWindowTalkedEvent(nil, "PetRebirth_WindowTalked", PetRebirth_index) < 0) then
			print("PetRebirth_WindowTalked 注册事件失败。");
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
	"\n　　你好!["..Char.GetData(_TalkPtr,%对象_原名%).."],一个神奇的卷轴，可以让你的宠物保留所学技能重新洗分布档数，你确定要使用么？"..
	"\n\n我可以让你的宠物脱胎换骨！还可以让非一级的宠物变回一级。");
 return;
end

function PetRebirth_WindowTalked(_MePtr,_TalkPtr,_Seqno,_Select,_Data)
	if (_Select==8) then 
		NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"是麽，你想好了再来找我也行，我一直等着你。找我只要双击卷轴就行了。。。。。。。。。");
		return;
	end
	local tab={};
	if (_Seqno==0) then
		local buf="";
		for t = 1,5 do
			
			PetIndex =Char.GetPet(_TalkPtr,t-1);
			if (PetIndex>0) then 
				buf=Char.GetData( PetIndex, %对象_原名%);
			else 
				buf="无宠物";
				
				
			end
			tab[t]=buf;
			
		end	
		NLG.ShowWindowTalked(_TalkPtr,_MePtr,2,2,1,
		"2\n请选择："..
		"\n\n       ☆["..tab[1].."]☆"..
		"\n       ☆["..tab[2].."]☆"..
		"\n       ☆["..tab[3].."]☆"..
		"\n       ☆["..tab[4].."]☆"..
		"\n       ☆["..tab[5].."]☆");
		
		
		
	end
	if (_Seqno==1) then
		local PetIndex1=Char.GetPet(_TalkPtr,tonumber(_Data)-1)
		if (PetIndex1>0 and Char.GetData(PetIndex1,%对象_等级%)==1) then
			local itemindex = Char.HaveItem(_TalkPtr,PetRebirthID);
			if (itemindex<0) then 
--				NLG.TalkToCli(_TalkPtr,_MePtr,"抱歉你的还原卷轴不够!",4,0);
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"抱歉,你的还原卷轴不够!");
				
			else
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"抱歉,本卷轴不支持一级宠物还原!");				
--					Char.DelItem(_TalkPtr,PetRebirthID,1)
--					Pet.SetArtRank(PetIndex1,%宠档_体成%,Pet.FullArtRank(PetIndex1,%宠档_体成%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%宠档_力成%,Pet.FullArtRank(PetIndex1,%宠档_力成%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%宠档_强成%,Pet.FullArtRank(PetIndex1,%宠档_强成%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%宠档_敏成%,Pet.FullArtRank(PetIndex1,%宠档_敏成%) - math.random(0,4));
--					Pet.SetArtRank(PetIndex1,%宠档_魔成%,Pet.FullArtRank(PetIndex1,%宠档_魔成%) - math.random(0,4));
--					Pet.ReBirth(_TalkPtr,PetIndex1);
--					Pet.UpPet(_TalkPtr, PetIndex1);
					--save("event","宠物洗档","名字："..Char.GetData(_TalkPtr,2000).."  使用了洗档卷轴对宠物  "..Char.GetData( PetIndex1, %对象_原名%).."进行洗档。当前掉档数：体力  -"..Pet.FullArtRank(PetIndex1, %宠档_体成%) - Pet.GetArtRank(PetIndex1, %宠档_体成%).."  力量  -"..Pet.FullArtRank(PetIndex1, %宠档_力成%) - Pet.GetArtRank(PetIndex1, %宠档_力成%).."  防御  -"..Pet.FullArtRank(PetIndex1, %宠档_强成%) - Pet.GetArtRank(PetIndex1, %宠档_强成%).."  敏捷  -"..Pet.FullArtRank(PetIndex1, %宠档_敏成%) - Pet.GetArtRank(PetIndex1, %宠档_敏成%).."  魔法  -"..Pet.FullArtRank(PetIndex1, %宠档_魔成%) - Pet.GetArtRank(PetIndex1, %宠档_魔成%));
			end

		elseif (PetIndex1>0 and Char.GetData(PetIndex1,%对象_等级%)>1) then
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"你选择的宠物已经成功返老还童!");
			Char.DelItem(_TalkPtr,PetRebirthID,1)
			Pet.ReBirth(_TalkPtr, PetIndex1);

		elseif (PetIndex1<0) then
			NLG.ShowWindowTalked(_TalkPtr,_MePtr,0,1,11,"大哥，这个要求我没法实现...");
		end
	end
end

function PetRebirth_Init()
	PetRebirth_Creat()
	--save("npc","创建NPC",Char.GetData(PetRebirth_index,%对象_名字%).." = "..PetRebirth_index.."创建成功。")
end

