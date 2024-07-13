 
 
--参数定义
tbl_TJBX_areaset = {};	--随机掉落的区域设定
TJBX_itemid = 18002;	--宝箱ID
TJBX_outtime = 300;	--宝箱无人捡取自动消失时间，单位秒
TJBX_limit_playerlevel = 1;	--玩家等级限制
TJBX_count = 10;	--宝箱个数
TJBX_DEBUG = 1;


--坐标范围设定
tbl_TJBX_areaset[1] = {227,72,247,98};
tbl_TJBX_areaset[2] = {214,82,226,92};


Delegate.RegInit("TJBX_Init");
function TJBX_Init()	
	for i=1,TJBX_count do
		TJBXNpc_id101_Create(i);
	end
end


function Myinit(index)
	return true;
end


Delegate.RegDelTalkEvent("TJBX_TalkEvent");

function TJBX_TalkEvent(player,msg,color,range,size)
	if(TJBX_DEBUG == 1)then
	if(msg == "[kaiqitjbxa]") then 
		for i=1,TJBX_count do
			TJBXNpc_id101_show(tbl_TJBX_npc[i]);
		end
	end
	end
end


function TJBXNpc_id101_Create(id)
	if (tbl_TJBX_npc[id] == nil) then
		tbl_TJBX_npc[id] = NL.CreateNpc("lua/Module/TJBX.lua", "Myinit");
		Char.SetData(tbl_TJBX_npc[id],%对象_形象%,27899);
		Char.SetData(tbl_TJBX_npc[id],%对象_原形%,27899);
		Char.SetData(tbl_TJBX_npc[id],%对象_X%,2);
		Char.SetData(tbl_TJBX_npc[id],%对象_Y%,52);
		Char.SetData(tbl_TJBX_npc[id],%对象_地图%,777);
		Char.SetData(tbl_TJBX_npc[id],%对象_方向%,5);
		Char.SetData(tbl_TJBX_npc[id],%对象_名字%,"天降宝箱");
		--Char.SetData(tbl_TJBX_npc[id],%对象_名色%,%颜色_绿色%);
		NLG.UpChar(tbl_TJBX_npc[id]);
		Char.SetTalkedEvent("lua/Module/TJBX.lua","TJBXNpc_id101_Talked", tbl_TJBX_npc[id]);
		Char.SetWindowTalkedEvent("lua/Module/TJBX.lua","TJBXNpc_id101_WTalked", tbl_TJBX_npc[id]);
		Char.SetLoopEvent("lua/Module/TJBX.lua","TJBXNpc_id101_LoopEvent", tbl_TJBX_npc[id],1000);
	end
end




--天降宝箱——TJBXNpc_id101——Lua脚本
function TJBXNpc_id101_Talked(_npc,_player)
	if(NLG.CanTalk(_npc,_player)==false)then
		return;
	end
	if Char.GetData(_player,%对象_等级%) < TJBX_limit_playerlevel then
		NLG.SystemMessage(_player,"[系统提示] 以您的能力，无法拾取这个宝箱");
		return;
	end

	if Char.ItemSlot(_player) == 20 then
		NLG.SystemMessage(_player,"[系统提示] 您的背包太满，拿不了宝箱！");
		return;
	else
		Char.SetData(_npc,%对象_X%,52);
		Char.SetData(_npc,%对象_Y%,50);
		Char.SetData(_npc,%对象_地图%,555);
		NLG.UpChar(_npc);
		NLG.SystemMessage(-1,"[系统公告] 恭喜玩家“"..Char.GetData(_player,%对象_名字%).."”捡到天降宝箱，获得神秘宝物！");
		Char.GiveItem(_player,TJBX_itemid,1);
		return;
	end
end

function TJBXNpc_id101_WTalked(_npc,_player,_seqno,_select,_data)
	if (NLG.CanTalk(_npc,_player)==false) then
		return;
	end

	if (tonumber(_seqno)==1) then
		if (tonumber(_select) == %按钮_是%) then
			return;
		else
			return;
		end
		return;
	end
	return; 
end



--注意：对象_经验字段，被用来缓存宝箱已出现的时间了，这里判断超过了时限，会回到555地图
function TJBXNpc_id101_LoopEvent(_npc)
	if Char.GetData(_npc,%对象_地图%) ~= 555 then
		if (os.time() - Char.GetData(_npc,%对象_经验%)) >= TJBX_outtime then
			--NLG.SystemMessage(-1,"[系统公告] 在("..Char.GetData(_npc,%对象_X%)..","..Char.GetData(_npc,%对象_Y%)..")坐标的天降宝箱，因为无人拾取，已自动消失！");
			Char.SetData(_npc,%对象_X%,51);
			Char.SetData(_npc,%对象_Y%,50);
			Char.SetData(_npc,%对象_地图%,555);
			NLG.UpChar(_npc);
		end
	end
	
	--自动刷新
	if (os.date("%X",os.time())=="12:00:00") or (os.date("%X",os.time())=="13:00:00") or (os.date("%X",os.time())=="14:00:00") or (os.date("%X",os.time())=="15:00:00") or (os.date("%X",os.time())=="16:00:00") or (os.date("%X",os.time())=="17:00:00") or (os.date("%X",os.time())=="18:00:00") or (os.date("%X",os.time())=="19:00:00") or (os.date("%X",os.time())=="20:00:00") or (os.date("%X",os.time())=="21:00:00") or (os.date("%X",os.time())=="22:00:00") or (os.date("%X",os.time())=="23:00:00") or (os.date("%X",os.time())=="23:59:00") then
	--if (os.date("%X",os.time())=="08:00:00") or (os.date("%X",os.time())=="09:00:00") or (os.date("%X",os.time())=="10:00:00") or (os.date("%X",os.time())=="11:00:00") or (os.date("%X",os.time())=="12:00:00") or (os.date("%X",os.time())=="13:00:00") or (os.date("%X",os.time())=="14:00:00") or (os.date("%X",os.time())=="17:00:00") then
	--if Char.GetData(_npc,%对象_地图%) == 555 then
	--if (os.date("%X",os.time())=="00:05:00") or (os.date("%X",os.time())=="00:10:00")  or (os.date("%X",os.time())=="00:15:00")  or (os.date("%X",os.time())=="00:20:00") then
		TJBXNpc_id101_show(_npc);
	end
end


function myrandom(a1,a2)
	local b1;

	if(a1>=a2)then
		b1 = math.random(a2,a1);
	else
		b1 = math.random(a1,a2);
	end
	return b1;
end

function TJBXNpc_id101_show(_npc)
	local _k1 = myrandom(1,#tbl_TJBX_areaset);
	local _x = myrandom(tbl_TJBX_areaset[_k1][1],tbl_TJBX_areaset[_k1][3]);
	local _y = myrandom(tbl_TJBX_areaset[_k1][2],tbl_TJBX_areaset[_k1][4]);
	Char.SetData(_npc,%对象_X%,_x);
	Char.SetData(_npc,%对象_Y%,_y);
	Char.SetData(_npc,%对象_地图%,1000);
	Char.SetData(_npc,%对象_经验%,os.time());
	NLG.UpChar(_npc);
	if(TJBX_DEBUG == 1)then
		--NLG.SystemMessage(-1,"[坐标] (".._x..",".._y..")");
	end
	NLG.SystemMessage(-1,"[系统公告] 神秘宝箱已出现在某个位置，请勇者们尽快前往搜寻。");
	--NLG.SystemMessage(-1,"[系统公告] 神秘宝箱已出现在某个位置，请勇者们尽快前往搜寻。".._x..",".._y);
end



