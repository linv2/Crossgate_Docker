--驱魔香编写方法：在魔力txt脚本内 写luac makeqmx,itemid,foot itemid为此驱魔香的道具id foot为此驱魔香的步数。

Delegate.RegDelLoginEvent("QMXLogin")
function QMXLogin(player)
	local nowfoot = tonumber(Field.Get(player,"MakeQMXFoot"))
	if type(nowfoot) == "number" then
		if nowfoot > 0 then
			Char.SetWalkPostEvent(nil,"QMXFootLoop",player)
			Char.SetData(player,%对象_不遇敌开关%,4)
			NLG.SystemMessage(player,"驱魔香剩余"..nowfoot.."步。")
		else
			Char.SetData(player,%对象_不遇敌开关%,0)
		end
	else
		Char.SetData(player,%对象_不遇敌开关%,0)
	end
	local nowfoot1 = tonumber(Field.Get(player,"MakeQMXFoot1"))
	if type(nowfoot1) == "number" then
		if nowfoot1 > 0 then
			Char.SetWalkPostEvent(nil,"QMXFootLoop",player)
			NLG.SystemMessage(player,"诱魔香剩余"..nowfoot1.."步。")
		end
	end
	return
end
function QMXFootLoop(player)
	local nowfoot = tonumber(Field.Get(player,"MakeQMXFoot"))
	if type(nowfoot) == "number" then
		if nowfoot > 0 then
			Field.Set(player,"MakeQMXFoot",(nowfoot-1))
		else
			Char.SetData(player,%对象_不遇敌开关%,0)
			Field.Set(player,"MakeQMXFoot","")
			NLG.SystemMessage(player,"驱魔香的效果结束了。")
		end
	end
	local nowfoot1 = tonumber(Field.Get(player,"MakeQMXFoot1"))
	if type(nowfoot1) == "number" then
		if nowfoot1 > 0 then
			Field.Set(player,"MakeQMXFoot1",(nowfoot1-1))
			Battle.Encount(player,player)
		else
			Field.Set(player,"MakeQMXFoot1","")
			NLG.SystemMessage(player,"诱魔香的效果结束了。")
		end
	end
end