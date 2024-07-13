
--NPC位置
yongbing_npc_wa = {1000,245,82,4}

yongbing_item = 70002;				--佣兵勋章物品id
yong_jiadianshu = 4;				--每次加点量

skill_Level = 10;					--使用技能最高等级
zhiye_jie = 1;						--职业阶级（1-5）默认选择职业后几转

-----------------------------------------------------
--职业名称
function zhiyename(zhiyeid)

			if(zhiyeid>=10 and zhiyeid<=19)then
				name = "剑士";
				id = 1;
			elseif(zhiyeid>=20 and zhiyeid<=29)then
				name = "斧头战士";
				id = 1;
			elseif(zhiyeid>=30 and zhiyeid<=39)then
				name = "骑士";
				id = 1;
			elseif(zhiyeid>=40 and zhiyeid<=49)then
				name = "弓箭手";
				id = 1;
			elseif(zhiyeid>=50 and zhiyeid<=59)then
				name = "士兵";
				id = 1;
			elseif(zhiyeid>=60 and zhiyeid<=69)then
				name = "传教";
				id = 2;
			elseif(zhiyeid>=70 and zhiyeid<=79)then
				name = "魔法师";
				id = 2;
			elseif(zhiyeid>=80 and zhiyeid<=89)then
				name = "咒术师";
				id = 1;
			elseif(zhiyeid>=90 and zhiyeid<=99)then
				name = "封印师";
				id = 2;
			elseif(zhiyeid>=100 and zhiyeid<=109)then
				name = "饲养师";
				id = 2;
			elseif(zhiyeid>=110 and zhiyeid<=119)then
				name = "驯兽师";
				id = 2;
			elseif(zhiyeid>=120 and zhiyeid<=129)then
				name = "盗贼";
				id = 2;
			elseif(zhiyeid>=130 and zhiyeid<=139)then
				name = "巫师";
				id = 2;
			elseif(zhiyeid>=140 and zhiyeid<=149)then
				name = "格斗家";
				id = 2;
			elseif(zhiyeid>=150 and zhiyeid<=159)then
				name = "忍者";
				id = 2;
			elseif(zhiyeid>=160 and zhiyeid<=169)then
				name = "舞者";
				id = 2;
			elseif(zhiyeid>=410 and zhiyeid<=419)then
				name = "侦探";
				id = 3;
			elseif(zhiyeid>=420 and zhiyeid<=429)then
				name = "仙人";
				id = 3;
			elseif(zhiyeid>=430 and zhiyeid<=439)then
				name = "护士";
				id = 3;
			elseif(zhiyeid>=440 and zhiyeid<=449)then
				name = "医生";
				id = 3;
				
			-------------------
			elseif(zhiyeid>=200 and zhiyeid<=209)then
				name = "武器达人";
				id = 3;
			elseif(zhiyeid>=270 and zhiyeid<=279)then
				name = "防具达人";
				id = 3;
			-------------------
			elseif(zhiyeid>=350 and zhiyeid<=359)then
				name = "料理达人";
				id = 3;
			-------------------
			elseif(zhiyeid>=370 and zhiyeid<=379)then
				name = "修理达人";
				id = 3;
			elseif(zhiyeid>=390 and zhiyeid<=399)then
				name = "鉴定师";
				id = 3;
			-----------------------------
			elseif(zhiyeid>=450 and zhiyeid<=459)then
				name = "采集达人";
				id = 3;
			else
				name = "游民";
				id = 4;
			end
	return name,id;
end


---空格参数文字
function kongge(petnax,shu)

	local petnaxc = string.len(petnax)/2; 
	konggex = "";

	for i=petnaxc,shu do
		konggex = konggex.."　";
	end
	
	fanhui = petnax..""..konggex;
	return fanhui;
end
---空格参数数字
function kong(petnax,shu)

	local petnaxc = string.len(petnax); 
	konggex = "";

	for i=petnaxc,shu do
		konggex = konggex.." ";
	end
	
	fanhui = petnax..""..konggex;
	return fanhui;
end

function zhongzu(lei)
	if(lei==0)then
		zu = "人形系";
	elseif(lei==1)then
		zu = "龙系";
	elseif(lei==2)then
		zu = "不死系";
	
	elseif(lei==3)then
		zu = "飞行系";
	elseif(lei==4)then
		zu = "昆虫系";
	elseif(lei==5)then
		zu = "植物系";
	elseif(lei==6)then
		zu = "野兽系";
	elseif(lei==7)then
		zu = "特殊系";
	elseif(lei==8)then
		zu = "金属系";
	elseif(lei==9)then
		zu = "邪魔系";
	else 
		zu = "未知";
	end

	return zu;
end

function jiankang(jk)
	if(jk>0)then

		qk = "$6已受伤$0";
	
	else 
	
		qk = "$5非常健康$0";
	end

	return qk;
end

function diaohuen(jk)
	if(jk==0)then

		qk = "$5未掉魂$0";
	
	else 
	
		qk = "$6掉"..jk.."魂$0";
	end

	return qk;
end 
--时间计算
function s2m(player,se)
	local min = 0;
	local hr = 0;
	while se > 0 do
		if se >= 60 then
			se = se - 60;
			min = min + 1;
			if min >= 60 then

				hr = hr + 1;
				min = 0;
			end
			
		else
			break;
		end
	end

	if(se <10)then
		se = "0"..se;
	end
	
	if(min <10)then
		min = "0"..min;
	end
	return hr,min,se;
end