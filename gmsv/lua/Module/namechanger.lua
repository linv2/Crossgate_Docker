local casttype = 0;			--改名所需的代币(0为金币,其他为道具编号)
local castname = "金币";		--改名所需的代币名称
local castnum = 20;			--改名需要的代币数量

function trim (s)
   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function getIntPart(x)
if x <= 0 then
   return math.ceil(x);
end

if math.ceil(x) == x then
   x = math.ceil(x);
else
   x = math.ceil(x) - 1;
end
return x;
end


Delegate.RegInit("NameChanger_Init");

function NameChanger_Init()
	initchanger();
	initchangerSelect();
end

local selectnametime = 0;


function NameChangerandselectNpc_Init(index)
	return 1;
end


function initchanger()
     if(nameChangerNPC == nil)then
		nameChangerNPC = NL.CreateNpc("lua/Module/namechanger.lua", "NameChangerandselectNpc_Init");
		Char.SetData(nameChangerNPC,%对象_形象%,106602);
		Char.SetData(nameChangerNPC,%对象_原形%,106602);
		Char.SetData(nameChangerNPC,%对象_X%,23);
		Char.SetData(nameChangerNPC,%对象_Y%,22);
		Char.SetData(nameChangerNPC,%对象_地图%,777);
		Char.SetData(nameChangerNPC,%对象_方向%,0);
		Char.SetData(nameChangerNPC,%对象_原名%,"更换名称");
		NLG.UpChar(nameChangerNPC);
		Char.SetWindowTalkedEvent("lua/Module/namechanger.lua","nameChangerWTalked",nameChangerNPC);
		Char.SetTalkedEvent("lua/Module/namechanger.lua","nameChangerTalked", nameChangerNPC);
	end
end

--================================================================================================


function initchangerSelect()
     if(nameChangerSelectNPC == nil)then
		nameChangerSelectNPC = NL.CreateNpc("lua/Module/namechanger.lua", "NameChangerandselectNpc_Init");
		Char.SetData(nameChangerSelectNPC,%对象_形象%,231011);
		Char.SetData(nameChangerSelectNPC,%对象_原形%,231011);
		Char.SetData(nameChangerSelectNPC,%对象_X%,22);
		Char.SetData(nameChangerSelectNPC,%对象_Y%,22);
		Char.SetData(nameChangerSelectNPC,%对象_地图%,777);
		Char.SetData(nameChangerSelectNPC,%对象_方向%,4);
		Char.SetData(nameChangerSelectNPC,%对象_原名%,"改名记录查询服务");
		NLG.UpChar(nameChangerSelectNPC);
		Char.SetWindowTalkedEvent("lua/Module/namechanger.lua","nameChangerSelectWTalked",nameChangerSelectNPC);
		Char.SetTalkedEvent("lua/Module/namechanger.lua","nameChangerSelectTalked", nameChangerSelectNPC);
	end
end




function nameChangerTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	--local freeNameChanged = fieldget(_tome,"NAMECHANGED");
    local freeNameChanged = 0;
    
    local jinbinum = 0;
    if(casttype ~= 0) then
    	jinbinum = tonumber(Char.ItemNum(_tome,casttype));
    else
    	jinbinum = tonumber(Char.GetData(_tome,%对象_金币%));
    end


	if(jinbinum < castnum)then
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n您好,"..(Char.GetData(_tome,%对象_原名%)).." 这里是改名服务NPC。\\n\\n我可以帮您改名,每次改名费用是"..castnum.."个"..castname.."。\\n\\n似乎您的"..castname.."数量不足呢!\\n");
		return;
	else
		NLG.ShowWindowTalked(_tome,_me,%窗口_输入框%,%按钮_确定%,1,"\\n\\n您好,"..(Char.GetData(_tome,%对象_原名%)).." 这里是改名服务NPC。\\n\\n我可以帮您改名,每次改名费用是"..castnum.."个"..castname.."。\\n\\n您可以直接在下面输入您想要改的名字,然后按下确定按钮。\\n");
		return;
	end
end

function nameChangerWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	if(tonumber(_seqno)==1 and tonumber(_select)==%按钮_确定% and _data~="")then
		local toname = trim(_data);
		local length = string.len(toname);
	    local jinbinum = 0;
	    if(casttype ~= 0) then
	    	jinbinum = tonumber(Char.ItemNum(_tome,casttype));
	    else
	    	jinbinum = tonumber(Char.GetData(_tome,%对象_金币%));
	    end

		
		--local freeNameChanged = fieldget(_tome,"NAMECHANGED");
		local freeNameChanged=0;
		local level = Char.GetData(_tome,%对象_等级%);
		
		if(_data == Char.GetData(_tome,%对象_原名%))then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n那个...似乎你要改的名字和现在的名字没有什么变化呢...\\n\\n您在确定下您的新名字吧!\\n\\n");
			return;
		end

		if(jinbinum < castnum)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n您好,"..(Char.GetData(_tome,%对象_原名%)).." 这里是改名服务。\\n\\n我可以帮您改名,每次改名费用是"..castnum.."个"..castname.."。\\n\\n似乎您的"..castname.."数量不足呢!\\n");
			return;
		end

		if(length==0)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n提交的名字长度太短了哦！不要全是空格哦！\n\\n\\n");
			return;
		end
		--string.find(_data,"%")~=nil or 
		--string.find(_data,"\'")~=nil or string.find(_data,"\`")~=nil or
		if(string.find(_data,"%%")~=nil or string.find(_data,"%'")~=nil or string.find(_data,"%`")~=nil or string.find(_data,"%\"")~=nil or string.find(_data,"%;")~=nil or string.find(_data,"%\\/")~=nil or string.find(_data,"%\\")~=nil or string.find(_data,"%[")~=nil or string.find(_data,"%]")~=nil)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n提交的名字包含了禁止的字符哦！请修改！\\n");
			return;
		end
		
		local query = "select `Name` from tbl_character Where Name='".._data.."'";
		local ret = SQL.Run(query);
		if(type(ret)=="table" and ret["0_0"]~=nil)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n提交的名字已经有人在用了哦！请修改下！\\n");
			return;
		end
		local newstr, count = string.gsub(_data, "[&#]+[0-9]+[;]", "**");
		local totalLength = string.len(newstr);
		
		--print("######################"..totalLength);

		if(totalLength>16)then
			NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,0,"\\n\\n提交的名字太长了哦！请修改！\\n\\n最大长度是16个半角字符或8个全角字符\\n也就是16个字母或8个中文哦!\\n");
			return;
		end

	    if(casttype ~= 0) then
	    	jinbinum = tonumber(Char.DelItem(_tome,casttype,castnum));
	    else
	    	jinbinum = tonumber(Char.SetData(_tome,%对象_金币%,jinbinum - castnum));
	    end

		NLG.SystemMessage(_tome,"失去了"..castnum.."个"..castname.."。");
		local query = "Update tbl_character set `Name` = '".._data.."' Where Cdkey = '"..(Char.GetData(_tome,%对象_账号%)).."' and Name='"..(Char.GetData(_tome,%对象_原名%)).."'";
		local ret = SQL.Run(query);
		
		--由于没有添加数据库相关字段,暂时注释.(只影响查询NPC)
		--local query2="INSERT INTO tbl_changenamelog (before_name,after_name) VALUES ('"..(Char.GetData(_tome,%对象_原名%)).."','".._data.."')";
		--local ret = SQL.Run(query2);
		
		Char.SetData(_tome,%对象_原名%,_data);
		NLG.UpChar(_tome);
		
		NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_关闭%,3,"\\n\\n恭喜您,您的名字已经成功的改为了".._data.."哦!\\n\\n");
		return;
	end

	return;
end



function nameChangerSelectTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end

	if(os.time() - selectnametime < 60)then
		NLG.SystemMessage(_tome,"一分钟内只允许查询一次，请稍等。");
		return;
	end
	
    local showtext="\\n\\n  改名记录查询(只显示一周内)：\\n\\n  请单击确定开始查询。";
	selectnametime = os.time();
	NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_确定%,0,showtext);


end

function nameChangerSelectWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	--点击取消，则返回
    if (tonumber(_select)==2)then
        return; 
    end
	
    
    --点击上一步
    if (tonumber(_select)==16)then
      if(tonumber(_seqno)~=0)then 
       _seqno=_seqno-1;
      end
    end
    
    --点击下一步
    if (tonumber(_select)==32)then
        _seqno=_seqno+1;  
    end
    
    local page=_seqno+1;

    local showtext="====================第"..page.."页====================";
    local query = "select `before_name`,`after_name` from tbl_changenamelog ";
	local ret = SQL.Run(query);

    local row=_seqno*7;
    for i=row,row+7,1 do   

		if(type(ret)=="table" and ret[i.."_0"]~=nil)then
		  showtext=showtext.."\\n     原用名："..ret[i.."_0"].."  →  现用名："..ret[i.."_1"];
        end
    end
	NLG.ShowWindowTalked(_tome,_me,%窗口_信息框%,%按钮_上下取消%,_seqno,showtext);
	return;
	

end

function runsql(n,query)
  n =coro.transfer(coro.main,SQL.Run(query));
   
end