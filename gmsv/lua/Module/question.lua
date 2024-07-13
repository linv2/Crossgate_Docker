local q1 = {"能带内心的职业，除了医生外，还有什么职业呢?(2个字)","护士"};
local q2 = {"欧兹那克与欧兹尼克是什么关系?","兄弟"};
--local q3 = {"马里奥的英文译名是什么？（无需大写首字母）","mario"};
--local q4 = {"浪漫魔力中猫头鹰头盔的价格是多少？回答数字即可","12"};
local q5 = {"僵尸是属于哪个系的宠物?(譬如“金属系”)","不死系"};
local q6 = {"在口袋妖怪黄中，比卡丘是否可以使用雷石进化？（回答可以或不可以）","不可以"};
local q7 = {"封印师这个职业的得意技是什么？(全名)","精灵的盟约"};
local q8 = {"乱射是哪个职业的得意技？(全名)","弓箭手"};
local q9 = {"如何开启小地区窗口？(小写,如ctrl+c)","ctrl+s"};
local q10 = {"道具栏的快捷键是？(小写,如ctrl+c)","ctrl+e"};
local q11 = {"在魔力宝贝中,初始角色的可分配点数是？(直接回答数字)","30"};
local q12 = {"                 这是谁，回答全名","赤座灯里"};
local q13 = {"牛肉需要几级打猎才能采集?(回答数字)","5"};
local q14 = {"金矿需要几级挖掘才能采集?（回答数字）","5"};
local q15 = {"虫之歌的漫画作者是谁？","水清十郎"};
local q16 = {"浪漫魔力中学习乱射技能需要多少魔币?(直接回答数字)","100"};
--local q17 = {"浪漫的新手礼包多少级能够使用?","10"};
--local q18 = {"我们常说的熊男名字叫什么？","欧兹那克"};
--local q19 = {"离离原上草后一句是什么","一岁一枯荣"};
local q20 = {"人物每升1级,可供玩家自由分配的点数是几点?(直接回答数字)","4"};
local q21 = {"一个队伍的最大人数上限是几人?(直接回答数字)","5"};
local q22 = {"法兰城里有多少个医院？(直接回答数字)","2"};
local q23 = {"浪漫魔力目前支持32位游戏吗?(请直接回答“支持”或“不支持”)","支持"};
local q24 = {"魔力宝贝的英文名字是?(不需要输入空格,请使用小写)","crossgate"};
--local q25 = {"能够扣除敌人魔法的技能叫什么？","战栗袭心"};
local q26 = {"在浪漫魔力中格斗士晋级需要的技能是？","气功弹"};
local q27 = {"就职忍者职业,需要解的任务叫什么名字?(全名)","复仇的少女"};
local q28 = {"称号“熟知树海的人”是通过什么任务得到的..(全名)","森罗万象"};
local q29 = {"浪漫魔力中生产系2转任务还需要等待2个小时吗?(请直接回答“需要”或“不需要”)","不需要"};
local q30 = {"就职巫师职业,需要打败的Boss叫什么?(全名)","露比"};
local q31 = {"称号“传说中的勇者”是通过打败哪个Boss来获得的?(全名)","犹大"};
local q32 = {"称号“龙之拯救者”是通过哪个任务获得的?(全名)","沉默之龙"};
local q33 = {"竞技场中每天被虐待无数次的人叫什么","吉拉"};
local q34 = {"俗称12村的村子正确名字叫什么?(全名)","伊尔村"};
local q35 = {"维诺亚村位于哪块大陆?(全名,譬如“xxx大陆”)","芙蕾雅大陆"};
local q36 = {"经常被玩家蹂躏的竞技场NPC叫什么","吉拉"};
local q37 = {"可打掉敌方Mp的技能叫什么名字?","战栗袭心"};
local q38 = {"在浪漫魔力中随机BOSS等级最低的迷宫的名字是什么","霞之洞窟"};
local q39 = {"在游戏《狂父》中，父亲的助手的名字叫什么？”)","玛丽亚"};
local q40 = {"忍者职业,抗体最高可以达到多少级","10"};
--local q41 = {"真系列技能是否可以在技能屋内习得?(请直接回答“可以”或“不可以”)","可以"};
local q42 = {"人物就职时,得到的第一个称号是什么?(全名)","无名的旅人"};
local q43 = {"仙人职业的得意技叫什么名字?(全名)","变身"};
local q44 = {"侦探职业的得意技叫什么名字?(全名)","变装"};
local q45 = {"魔法反弹可以反弹魔导之怒么？回答可以活着不可以","不可以"};
local q46 = {"洁净魔法是哪个职业的得意技?(全名)","巫师"};
local q47 = {"如果要学习攻击反弹,需要找哪个Npc进行学习","天书"};
local q48 = {"地属性克制哪个属性?(单字)","水"};
local q49 = {"水属性克制哪个属性?(单字)","火"};
local q50 = {"LZSB用中文打出来是什么","兰州烧饼"};
local q51 = {"10C斧子全名叫什么","猥琐的小镰刀"};
local q52 = {"在《圣斗士星矢》中，一辉的圣衣是什么座。（需要回答XX座）","凤凰座"};
local q53 = {"彪薇的属性是什么？","彪5傻5"};
local q54 = {"不死系全克什么种族?(需要带“系”字)","人形系"};
local q55 = {"在CS1.6中，T方购买AWP的快捷键是什么？大写字母","B45"};
local q56 = {"在CS1.6中，CT方购买AWP的快捷键是什么？大写字母","B46"};
local q57 = {"元首最爱的人是谁","斯大林"};
local q58 = {"传颂之物动画中卡缪的CV是谁？","钉宫理惠"};
local q59 = {"我不在乎你有没有钱，因为肯定没有我有钱是谁说的","王思聪"};
local q60 = {"北京申奥成功是哪年？回答数字即可","2001"};
local q61 = {"金坷垃的公司总部在美国的哪里","圣地亚哥"};
local q62 = {"魔力宝贝共有多少个种族?(直接回答数字既可)","9"};
local q63 = {"水龙蜥是什么属性?(例:水5火5)","水8火2"};
local q64 = {"宇宙是谁创造的？","棒子"};
local q65 = {"迷你石象怪是什么属性?(例:水5火5)","火3风7"};
local q66 = {"巨蝙蝠是什么属性?(例:水5火5)","火3风7"};
local q67 = {"黄蜂是什么属性?(例:水5火5)","火7风3"};
local q68 = {"杀手蝎是什么属性?(例:水5火5)","地9水1"}
local q69 = {"赤目螳螂是什么属性?(例:水5火5)","火4风6"};
local q70 = {"这么可爱，一定是……","男孩子"};
--local q71 = {"仙剑奇侠传的男主角的名字是什么？","李逍遥"};
--local q72 = {"能够抽到大奖Q零件的彩票，叫什么彩票？（全名）","宝石鼠彩票"};
--local q73 = {"前往哥拉尔城的船只的船费是多少?(请直接回答数字)","500"};
--local q74 = {"要进入彷徨之域，需要击败什么BOSS？","阿卡斯"};
--local q75 = {"转生之后的大公鸡所携带的技能叫什么？","邪魔袭心"};
--local q76 = {"需要止痛药的那个NPC，是哪疼？（一个字）","牙"};
--local q77 = {"浪漫魔力中，砍龙需要人物多少级才可以接到任务？（回答数字即可）","110"};
--local q78 = {"在坎那贝拉村中，是否有打卡的NPC？（回答有或者没有）","没有"};
--local q79 = {"骑士宝石添加到防具上会增加什么修正","闪躲"};
local q80 = {"魔力宝贝2.0时期的版本名叫什么?","传说中的勇者"};
local q81 = {"魔力宝贝2.5时期的版本名叫什么?","法兰义勇军"};
local q82 = {"魔力宝贝3.0时期的版本名叫什么?","龙之传说"};
local q83 = {"魔力宝贝3.5时期的版本名叫什么?","激斗竞技场"};
local q84 = {"魔力宝贝3.7时期的版本名叫什么?","龙之沙漏"};
local q85 = {"魔力宝贝1.5时期的版本名叫什么?","神兽传奇"};
local q86 = {"宠物每升1级,可供玩家自由分配的点数是几点?(直接回答数字)","1"};
local q87 = {"在浪漫魔力中，转生之后的人物1级所拥有的属性点是多少？回答数字","110"};
local q88 = {"人物掉魂以后可在法兰城的什么地方进行召回?（请回答建筑名）","大圣堂"};
--local q89 = {"浪漫魔力是什么时候开服的?(如:2001年7月4号)","2014年2月28号"};
local q90 = {"“天空之枪”可通过击败哪个Boss获得","海神"};
local q91 = {"“帕鲁凯斯之斧”可通过击败哪个Boss获得","海神"};
local q92 = {"摆摊系统需要抽百分之多少的税？（回答数字即可）","1"};
local q93 = {"在魔力宝贝代理历史中,哪个代理一次性封杀50000+个外挂账号","网星"};
local q94 = {"游戏内是否存在增加宠物技能栏的道具?(请直接回答“存在”或“不存在”)","不存在"};
local q95 = {"狂战将军存在于哪个地图之中(请回答全名)","沙漠之祠"};
--local q96 = {"塞尔达传说中，主角的帽子的颜色是？","绿色"};
local q97 = {"称号“呢喃的歌声”之后是什么称号?(请回答全名)","地上的月影"};
--local q98 = {"在千年之旅任务中需要的料理名字是？","鳗鱼饭团"};
local q99 = {"幽游白书中主角的名字是什么？","浦饭幽助"};
local q100 = {"在帝国时代1中。苏美文明的村民起始生命值是多少？回答数字即可","40"};
local q101 = {"在数码宝贝第二季中，V仔兽EX的合体对象是谁？","飞虫兽"};
local q102 = {"在星际争霸1.07版本中，狂战士的护盾值是多少？回答数字即可","80"};
local q103 = {"洛克人ZERO3最终全性能脚部装备要打败精灵世界的什么BOSS获得？","忍将"};
local q104 = {"在网星代理的时候450点点卡的售价是多少人民币，回答数字即可","30"};
local q105 = {"在口袋妖怪金&银中，是否可以通过正常途径获得艾比郎或沙瓦郎？回答可以或者不可以","可以"};
local q106 = {"在FC版本的超级玛丽3中。1-3关卡里等待多少秒可以进入隐藏房间获得选关笛子？回答数字即可","288"};
local q107 = {"在MD版本幽游白书中，是否有隐藏人物，回答是或否即可","否"};
local q108 = {"菊花是什么？","花"};
local q109 = {"2,5,7,13,17,23,24,41,43这些数字中哪个数字和其他的不一样？","24"};
local q110 = {"⑨的全名是什么？","琪露诺"};
--local q111 = {"浪漫魔力的7级气功弹，会放出多少蛋？（回答数字）","7"};
--local q112 = {"浪漫魔力中，5级乱射将会发出多少支箭？","9"};
local q113 = {"哪里附近可以快速进入竞技场(例如:医院附近)","银行附近"};
local q114 = {"佛利波罗、冰昭、阿卡斯俗称什么任务？(请用大写字母回答)","BBA"};
--local q115 = {"我们通常说的狗洞，其全名是？","奇怪的洞窟"};
--local q116 = {"浪漫魔力魔力的官方主页是多少","www.lmmoli.com"};
--local q117 = {"在麻辣烫中数字6，对应的是多少？","13"};
--local q118 = {"在游戏Left 4 Dead 2中。战役模式下普通难度TANK的血量是多少？回答数字","4000"};
--local q119 = {"战斗系的二转称号叫什么？","苍之风云"};
--local q120 = {"生产系的一转称号是什么","刻于新月之铭"};
local q121 = {"HP的全称是什么？","health point"};
local q122 = {"每增加1的体力，会增加多少生命？回答数字即可","8"};
--local q123 = {"在魂斗罗-力量中，可以安放定时炸弹的人物名字是什么？无需大写","beans"};
local q124 = {"浪漫魔力中魔石能自动叠加吗?(回答可以或不可以即可）","不可以"};
local q125 = {"与词语伶俜最接近的近义词解释是？（二字中文）","孤独"};
--local q126 = {"剑士技能断空斩，10级扣除的攻击力百分之多少？（回答数字）","40"};
local q127 = {"隽永用四字解释来说，最接近于?","意味深长"};
local q128 = {"猫和老鼠的首播时间是哪年？用XX年回答。","1940年"};
local q129 = {"刺猬索尼克是一只什么颜色的刺猬？（回答：X色）","蓝色"};
local q130 = {"游戏《合金装备崛起：复仇》的主人公名字是什么？中文译名","雷电"};
local q131 = {"在轩辕剑叁外传：天之痕中，装备了蓝格怪衣之后，新开启的指令叫什么？","龙帆"};
local q132 = {"SEGA公司的家用机MD全称是什么？（大写）","MEGA DRIVE"};
local q133 = {"我们俗称的砍牛的地图名字叫什么？","巴洛斯"};
local q134 = {"技能精神冲击波，最多可以攻击几个单位？回答数字即可","5"};
local q135 = {"在FC版本的坦克大战中，每一个关卡敌军的坦克总量是？回答数字","20"};
local q136 = {"在星际争霸中，Marine的初始攻击力是多少。回答数字即可","6"};
local q137 = {"爱因斯坦一生获得过几次诺贝尔奖？(数字)","1"};
local q138 = {"Cs是什么？","铯"};
local q139 = {"镁元素的质子数是多少，回答数字即可","12"};
local q140 = {"在生化危机3中，弹药粉CC可以调配出什么子弹？","冷冻弹"};
local q141 = {"在第三象限中，三角函数唯一是正值的是哪一个函数？回答函数名即可(英文小写)","tan"};
local q142 = {"草薙京第二个字念什么，回答拼音即可","ti"};
local q143 = {"1+6*3-1=？回答数字即可","18"};
local q144 = {"浪漫魔力的灵堂新手任务，得到的宠物是什么？","螳螂"};
local q145 = {"通往维诺亚的海底通道，战斗系需要到达多少级才可以进入，回答数字即可","20"};
local q146 = {"在浪漫魔力中，通往杰诺瓦的海底通道，多少级可以进入，回答数字即可","25"};
local q147 = {"被称为杏月的月份是?(数字)","2"};
local q148 = {"孟买猫的体毛颜色是？回答X色。","黑色"};
local q149 = {"在右手定则中，垂直穿过手心的是什么？","磁感线"};
local q150 = {"学习宠物吸血攻击1的村子名字叫什么？","圣拉鲁卡村"};
local q151 = {"神眼是通过打什么怪物获得的？","水蜘蛛"};
local q152 = {"贪欲的罪书是通过打什么BOSS随机掉落的？","改造僵尸"};
local q153 = {"傲慢的罪书的附加能力是什么？（不需要数值，回答能力即可）","必杀"};
local q154 = {"在浪漫魔力中，随机BOSS烂香蕉蝙蝠，是在哪一个迷宫？","霞之洞窟"};
local q155 = {"回答这个答题，需要输入什么按键","/a"};
local q156 = {"浪漫魔力的特约直播嘉宾是在哪一个网站进行直播的？","斗鱼"};
local q157 = {"在浪漫魔力中，银行存道具是可以存两页的，宠物也可以么？回答可以或者不可以","可以"};
local q158 = {"深渊海道一共有多少层？回答数字即可","50"};
local q159 = {"3转的饲养师，超强恢复魔法的最高等级是？回答数字即可","4"};
local q160 = {"帝国时代英文简称是：（英文大写3字母）","AOE"};
local q161 = {"人类的最后一滴水是人类的（）","眼泪"};
local q162 = {"在风色幻想3&4中被称为奇迹制造机的人物名字是什么？","凯琳"};
local q163 = {"雷神之锤3中，红甲可以增加多少的护甲值，回答数字即可","50"};
local q164 = {"天津的煎饼果子，果子又被称为什么？","油条"};
local q165 = {"在浪漫魔力中，护士学习乱舞回旋击，最高可以到多少级？回答数字","10"};
local q166 = {"在暗黑破坏神2中，切换跑步与走路的热键是什么？小写字母即可","r"};
local q167 = {"在CMD中，快速查询自身网络属性的命令是？","ipconfig"};
local q168 = {"舰娘中晓级驱逐舰的的名字分别是晓，响，电，还有一个是什么？","雷"};
local q169 = {"3转的战斧斗士，阳炎最高等级为？回答数字即可","6"};
local q170 = {"在浪漫魔力千年之旅中得到的修正娃娃，回复是加多少的？回答数字即可","30"};
local question = {q1,q2,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q20,q21,q22,q23,q24,q26,q27,q28,q29,q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,q40,q42,q43,q44,q45,q46,q47,q48,q49,q50,q51,q52,q53,q54,q55,q56,q57,q58,q59,q60,q61,q62,q63,q64,q65,q66,q67,q68,q69,q70,q80,q81,q82,q83,q84,q85,q87,q88,q89,q90,q91,q92,q93,q94,q95,q96,q97,q99,q100,q101,q102,q103,q104,q105,q106,q107,q108,q109,q110,q113,q114,q121,q122,q124,q125,q127,q128,q129,q130,q131,q132,q133,q134,q135,q136,q137,q138,q139,q140,q141,q142,q143,q144,q145,q146,q147,q148,q149,q150,q151,q152,q153,q154,q155,q156,q157,q158,q159,q160,q161,q162,q163,q164,q165,q166,q167,q168,q169,q170};
local Q_status = 0;
--0:未开始 1:抢答准备 2:抢答开始 3:等待答案
local ans_list = {};
local PTime = 0;
local rn = 0;
local rb = 0;
local lastQTime = os.time();
local MeTime = 0;
local Q_T_Rand = 0;
local Q_A_Rand = 0;

local nowQuestionNum = 0;

Delegate.RegInit("question_Init");


function Myinit(_MeIndex)
	return true;
end


function initque_referee()
	if (que_referee == nil) then
		que_referee = NL.CreateNpc("lua/Module/question.lua", "Myinit");
		Char.SetData(que_referee,%对象_形象%,101003);
		Char.SetData(que_referee,%对象_原形%,101003);
		Char.SetData(que_referee,%对象_X%,20);
		Char.SetData(que_referee,%对象_Y%,20);
		Char.SetData(que_referee,%对象_地图%,777);
		Char.SetData(que_referee,%对象_方向%,4);
		Char.SetData(que_referee,%对象_名字%,"抢答活动");
		NLG.UpChar(que_referee);
		Char.SetLoopEvent("lua/Module/question.lua", "questionLoop", que_referee, 1000);
	end
end



function question_Init()
	
	initque_referee();
	
end


Delegate.RegDelTalkEvent("question_talk_Event");

function question_talk_Event(player,msg,color,range,size)


	if(check_msg(msg,"/a"))then
		    --NLG.SystemMessage(player,Char.GetData(player,%对象_GM%));
		checkAns(player,msg);
	end	


	local gmpassword = "xx1ml";
	if(check_msg(msg,"["..gmpassword.." showquest]") or check_msg(msg,"["..gmpassword.." ShowQuest]")) then
			questStart();
	end
    if(check_msg(msg,"["..gmpassword.." startquest]") or check_msg(msg,"["..gmpassword.." StartQuest]")) then
			questOpen = 1;
            NLG.SystemMessage(player,"您已经开启了答题系统！");
	end
    if(check_msg(msg,"["..gmpassword.." endquest]") or check_msg(msg,"["..gmpassword.." EndQuest]")) then
			questOpen = 0;
            NLG.SystemMessage(player,"您已经关闭了答题系统！");
	end

end

function Init(index)
	return true;
end

function questionLoop(index)
	
        if (questOpen ==0)then
           return;
        end

        --如果答题未开始
	MeQTime = os.time();
	Q_T_Rand = math.random(1,1001);
	if(Q_T_Rand > 950 and Q_status == 0 and MeQTime - lastQTime >= 1800) then
		lastQTime = os.time();
		Q_status = 1;
		ans_list = {};
	end
	if(Q_status==0) then
		return;
	end
	--答题系统公告,准备
	if(Q_status==1) then
		NLG.SystemMessage(-1,"[活动]抢答活动即将开始,如果您知道题目的答案,请输入/a 答案并且以聊天形式发出既可!");
		ans_list = {};
		Q_status = 2;
	end
	--发布问题
	if(Q_status==2) then
		Q_status = 3;
		ans_list = {};
		r = math.random(1,170-15);
		nowQuestionNum = r;
		PTime = os.time();
		--print(os.time());
		--PTimeH = nowTime["hour"];
		--PTimeM = nowTime["min"];
		NLG.SystemMessage(-1,"[活动]本次抢答活动的题目为:"..question[r][1]..",请大家踊跃参与!");
		return;
	end
	--等待答案
	if(Q_status==3) then
		local nowTime = os.time();
		if(ans_list[1]~=nil and nowTime - PTime>=60) then
			Q_A_Rand = math.random(1,2);
			if(Q_A_Rand == 2 or Q_A_Rand == 1) then
				--rb = math.random(NLG.GetPlayerNum(),NLG.GetPlayerNum() * Char.GetData(ans_list[1],%对象_等级%));
				--NLG.SystemMessage(-1,"恭喜玩家["..Char.GetData(ans_list[1],%对象_名字%).."]抢答成功!获得奖励"..rb.."经验!");
				Char.GiveItem(ans_list[1],192451,1);
				NLG.TalkToCli(ans_list[1],index,"恭喜玩家["..Char.GetData(ans_list[1],%对象_名字%).."]抢答成功!",%颜色_黄色%,%字体_中%);
			end
			if(Q_A_Rand == 3) then
				local QPetExp;
				rb = math.random(NLG.GetPlayerNum(),NLG.GetPlayerNum() * Char.GetData(ans_list[1],%对象_等级%));
				NLG.SystemMessage(-1,"恭喜玩家["..Char.GetData(ans_list[1],%对象_名字%).."]抢答成功!获得奖励"..rb.."宠物经验!");
				for QPetExp=0,5 do
					local Pet_In = Char.GetPet(ans_list[1],QPetExp);
					if (Pet_In ~= 0) then
						--local Pet_In2 = Char.GetData(Pet_In,1);
						local Pet_Lv = Char.GetData(Pet_In,%对象_等级%);
						if( Pet_Lv ~= 120 and Pet_Lv >= 10) then
							local Pet_Exp = Char.GetData(Pet_In,%对象_经验%);
							if(Pet_Exp == nil) then
								Pet_Exp = 0;
							end
							local Pet_Exp2 = Pet_Exp + rb;
							Char.SetData(Pet_In,%对象_经验%,Pet_Exp2);
							NLG.TalkToCli(ans_list[1],index,"您的宠物"..Char.GetData(Pet_In,%对象_名字%).."获得奖励经验 "..rb.." Exp!",%颜色_黄色%,%字体_中%);
							Pet.UpPet(ans_list[1],Pet_In);
						else
							NLG.TalkToCli(ans_list[1],index,"您的宠物"..Char.GetData(Pet_In,%对象_名字%).."本可以获得"..rb.."经验,但因不符合条件,经验被自动回收..",%颜色_黄色%,%字体_中%);
						end
					end
				end
			end
			Q_status = 0;
			PTime = 0;
		end
		if(nowTime -PTime == 60 and Q_status ~= 0) then
		--if(ans_list[1]==nil and nowTime - PTime ==60) then
			Q_status = 0;
			PTime = 0;
			NLG.SystemMessage(-1,"[活动]大千世界,竟无一人回答得了我的问题吗?");
		end
	end
end

function questStart()
	Q_status = 2;
end

function checkAns(PlayA,msg)
	if(Q_status~=3)then
		NLG.TalkToCli(PlayA,0,"抢答活动还未开始哦!");
		return;
	end
	if(Q_status==3)then
		NLG.TalkToCli(PlayA,0,"您的答案已经记录,请等待公布结果!",%颜色_黄色%,%字体_中%);
	end
	--print("/a "..question[r][2].."|"..msg);
	if(msg == "/a "..question[nowQuestionNum][2])then
		table.insert(ans_list,PlayA);
	end
end