--��ħ���д��������ħ��txt�ű��� дluac makeqmx,itemid,foot itemidΪ����ħ��ĵ���id footΪ����ħ��Ĳ�����

Delegate.RegDelLoginEvent("QMXLogin")
function QMXLogin(player)
	local nowfoot = tonumber(Field.Get(player,"MakeQMXFoot"))
	if type(nowfoot) == "number" then
		if nowfoot > 0 then
			Char.SetWalkPostEvent(nil,"QMXFootLoop",player)
			Char.SetData(player,%����_�����п���%,4)
			NLG.SystemMessage(player,"��ħ��ʣ��"..nowfoot.."����")
		else
			Char.SetData(player,%����_�����п���%,0)
		end
	else
		Char.SetData(player,%����_�����п���%,0)
	end
	local nowfoot1 = tonumber(Field.Get(player,"MakeQMXFoot1"))
	if type(nowfoot1) == "number" then
		if nowfoot1 > 0 then
			Char.SetWalkPostEvent(nil,"QMXFootLoop",player)
			NLG.SystemMessage(player,"��ħ��ʣ��"..nowfoot1.."����")
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
			Char.SetData(player,%����_�����п���%,0)
			Field.Set(player,"MakeQMXFoot","")
			NLG.SystemMessage(player,"��ħ���Ч�������ˡ�")
		end
	end
	local nowfoot1 = tonumber(Field.Get(player,"MakeQMXFoot1"))
	if type(nowfoot1) == "number" then
		if nowfoot1 > 0 then
			Field.Set(player,"MakeQMXFoot1",(nowfoot1-1))
			Battle.Encount(player,player)
		else
			Field.Set(player,"MakeQMXFoot1","")
			NLG.SystemMessage(player,"��ħ���Ч�������ˡ�")
		end
	end
end