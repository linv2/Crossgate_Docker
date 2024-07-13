--  ***************************************************************************************************** --
--  code by http://www.Cgdev.me
--  地图库Map示范脚本
--                   #更新日志#
--  TYPE ***** TIME ***** Editor ***** Text 
--  CREATE  2013/01/19     Free
--  ADD     2013/01/20     Free        针对Map库的函数进行示范性演示，全部使用全局的Talk事件触发
--  FIX     2013/01/27     Free        修复部分函数/语法错误

--                   #基本设置#
--	定义Lua地图的MAPID，不可修改
local LUAMAPID = %地图类型_LUAMAP%;
--					 #使用说明#
--	在游戏中输入如下命令并发出，即可触发

--	copymap,地图类型,地图ID						--> 复制指定地图
--	mazemap,x坐标范围,y坐标范围,地图名			--> 制作指定大小随机地图
--	delmap,地图ID								--> 删除指定Lua地图
--	getpos,地图ID								--> 获取指定Lua生成的随机地图中的随机可用的坐标点
--	getimage									--> 获取当前人物坐标的地板图档号和物件图档号
--	setimage									--> 设置当前人物坐标的地板/物件图档号
--	dumpmap,路径,地图ID,写入ID					--> 将指定Lua地图生成成地图文件保存在指定路径中

--					 #注意事项#
--	生成随机地图时候，会暂停游戏中本身随机地图的生成，如果随机地图设置过大，可能需要很长时间才能生成好地图，请自行测试。
--	makeMazeMap函数中调用的Map.MakeMazeMap的各项参数请查阅相关文档进行查看，也可在论坛/QQ群中进行讨论
--	该脚本并未经过完全的测试，如遇问题，绝对不稀奇。
--  ***************************************************************************************************** --

--注册事件委托
Delegate.RegDelTalkEvent("MapProc_TalkEvent");

--	创建复制地图
--	参数定义	index: 玩家对象
--				c_mapid: 要复制的地图的Map ID
--				c_floor: 要复制的地图的Floor ID
function makeCopyMap(index, c_mapid, c_floor)
	local newFloorID = Map.MakeCopyMap(c_mapid, c_floor);
	if(newFloorID == -1)then
		NLG.SystemMessage(index, "地图复制失败。");
	else
		NLG.SystemMessage(index, "地图"..c_mapid..","..c_floor.."已经成功复制到"..LUAMAPID..","..newFloorID);
		NLG.SystemMessage(index, "使用GM命令[warp "..LUAMAPID.." "..newFloorID.." x坐标 y坐标] 可以移动过去看看哦");
	end
	return;
end

--	创建随机地图
--	参数定义	index: 玩家对象
--				xsiz: 要生成的地图的x坐标范围
--				ysiz: 要生成的地图的y坐标范围
--				mapName: 地图名
--	函数说明：MakeMazeMap是需要定义回调函数的，当生成完毕后，会触发定义的回调函数，返回生成的地图是否完毕
function makeMazeMap(index, xsiz, ysiz, mapName)
	local newFloorID = Map.MakeMazeMap(nil,"mazeMapDoneCall",xsiz,ysiz,mapName,2,30,30,30,30,30,9491,100,0,0,0,0,0,0);
	if(newFloorID == -1)then
		NLG.SystemMessage(index, "地图生成失败。");
	else
		NLG.SystemMessage(index, "地图"..LUAMAPID..","..newFloorID.."已经开始生成了...请稍后");
	end
	return;
end

--	创建随机地图的回调函数
--	参数定义	floorID: 生成的地图的Floor ID
--				doneflg: 生成结果
function mazeMapDoneCall(floorID, doneflg)
	if(doneflg == 1)then
		NLG.SystemMessage(-1,"生成地图"..LUAMAPID..","..floorID.."成功！");
		NLG.SystemMessage(index, "可以通过使用getpos,"..floorID.."来获取一个合法的坐标点");
	else
		NLG.SystemMessage(-1,"生成地图"..LUAMAPID..","..floorID.."失败！");
	end
end

--	获取随机地图可用的坐标
--	参数定义	index: 玩家对象
--				floorID: 随机地图的Floor ID
function getPosition(index, floorID)
	local mapx, mapy = Map.GetAvailablePos(floorID);
	if(mapx == 0 and mapy == 0)then
		NLG.SystemMessage(index,"获取地图可用坐标失败，请重试");
	else
		NLG.SystemMessage(index,"获取地图"..LUAMAPID..","..floorID.."可用坐标"..mapx..","..mapy);
		NLG.SystemMessage(index, "使用GM命令[warp "..LUAMAPID.." "..floorID.." "..mapx.." "..mapy.."] 可以移动过去看看哦");
	end
	return;
end

--	获取当前玩家坐标的地板图档号与物件（obj）图档号
--	参数定义	index: 玩家对象
function getTileandObj(index)
	local nowMap = Char.GetData(index, %对象_MAP%);
	local nowFloor = Char.GetData(index, %对象_地图%);
	local nowXpos = Char.GetData(index, %对象_X%);
	local nowYpos = Char.GetData(index, %对象_Y%);
	local tile, obj = Map.GetImage(nowMap,nowFloor,nowXpos,nowYpos);
	NLG.SystemMessage(index,"获取地图"..nowMap..","..nowFloor..","..nowXpos..","..nowYpos.."的地图元素[地板:"..tile.."],[物件:"..obj.."]");
	return;
end

--	设置当前玩家坐标的地板图档号与物件（obj）图档号，函数会自动判定图档属于地板还是物件
--	参数定义	index: 玩家对象
--				image: 图档号
function setTileandObj(index, image)
	local nowMap = Char.GetData(index, %对象_MAP%);
	local nowFloor = Char.GetData(index, %对象_地图%);
	local nowXpos = Char.GetData(index, %对象_X%);
	local nowYpos = Char.GetData(index, %对象_Y%);
	local ori_tile, ori_obj = Map.GetImage(nowMap,nowFloor,nowXpos,nowYpos);
	Map.SetImage(nowMap,nowFloor,nowXpos,nowYpos, image);
	local now_tile, now_obj = Map.GetImage(nowMap,nowFloor,nowXpos,nowYpos);
	NLG.SystemMessage(index,"地图"..nowMap..","..nowFloor..","..nowXpos..","..nowYpos.."的地图元素变更[地板:"..ori_tile.."->"..now_tile.."],[物件:"..ori_obj.."->"..now_obj.."]");
	return;
end

--	输出地图文件到本地路径中
--	参数定义	index: 玩家对象
--				path: 本地路径，不包含文件名，文件夹以"\"结尾
--				floorID: Lua地图的地图Floor号
--				writeAsFloor: 写出文件中定义的地图编号
function dumpMapFile(index, path, floorID, writeAsFloor)
	local ret = Map.DumpLuaMap(path, floorID, writeAsFloor);
	if (ret == 0) then
		NLG.SystemMessage(index,"地图"..LUAMAPID..","..floorID.."输出至文件失败！");
	else
		NLG.SystemMessage(index,"地图"..LUAMAPID..","..floorID.."已经输出至文件:["..path..LUAMAPID.."_"..floorID.."]");
	end
	return;
end

--	删除Lua生成的地图，释放地图编号
--	参数定义	floorID: Lua地图的地图Floor编号
function deleteLuaMap(index, floorID)
	local ret = Map.DelLuaMap(floorID);
	if (ret == 0) then
		NLG.SystemMessage(index,"地图"..LUAMAPID..","..floorID.."删除失败！");
	else
		NLG.SystemMessage(index,"地图"..LUAMAPID..","..floorID.."已经成功删除！");
	end
	return;
end

--	NL.AllTaklEventCallBack的委托调用
--	参数定义	http://lua.cgdev.me/doku.php?id=lua:nl:callback:talkcallback
function MapProc_TalkEvent(index, msg, col, range, size)
	if(string.find(msg,","))then
		local token = Split(msg,",")
	end
	if(string.find(msg,"copymap"))then
		local m = tonumber(token[2]);
		local f = tonumber(token[3]);
		makeCopyMap(index, m ,f);
		return 1;
	end
	if(string.find(msg,"mazemap"))then
		local xsiz = tonumber(token[2]);
		local ysiz = tonumber(token[3]);
		local MapName = token[4];
		makeMazeMap(index, xsiz, ysiz, MapName);
		return 1;
	end
	if(string.find(msg,"delmap"))then
		local f = tonumber(token[2]);
		deleteLuaMap(index, f);
		return 1;
	end
	if(string.find(msg,"getpos"))then
		local f = tonumber(token[2]);
		getPosition(index, f);
		return 1;
	end
	if(msg=="getimage")then
		getTileandObj(index);
		return 1;
	end
	if(string.find(msg,"setimage"))then
		image = tonumber(token[2]);
		setTileandObj(index, image);
		return 1;
	end
	if(string.find(msg,"dumpmap"))then
		path = token[2];
		floorID = tonumber(token[3]);
		writeAsFloor = tonumber(token[4]);
		dumpMapFile(index, path, floorID, writeAsFloor);
		return 1;
	end
end
