local casttype = 0;			--��������Ĵ���(0Ϊ���,����Ϊ���߱��)
local castname = "���";		--��������Ĵ�������
local castnum = 20;			--������Ҫ�Ĵ�������

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
		Char.SetData(nameChangerNPC,%����_����%,106602);
		Char.SetData(nameChangerNPC,%����_ԭ��%,106602);
		Char.SetData(nameChangerNPC,%����_X%,23);
		Char.SetData(nameChangerNPC,%����_Y%,22);
		Char.SetData(nameChangerNPC,%����_��ͼ%,777);
		Char.SetData(nameChangerNPC,%����_����%,0);
		Char.SetData(nameChangerNPC,%����_ԭ��%,"��������");
		NLG.UpChar(nameChangerNPC);
		Char.SetWindowTalkedEvent("lua/Module/namechanger.lua","nameChangerWTalked",nameChangerNPC);
		Char.SetTalkedEvent("lua/Module/namechanger.lua","nameChangerTalked", nameChangerNPC);
	end
end

--================================================================================================


function initchangerSelect()
     if(nameChangerSelectNPC == nil)then
		nameChangerSelectNPC = NL.CreateNpc("lua/Module/namechanger.lua", "NameChangerandselectNpc_Init");
		Char.SetData(nameChangerSelectNPC,%����_����%,231011);
		Char.SetData(nameChangerSelectNPC,%����_ԭ��%,231011);
		Char.SetData(nameChangerSelectNPC,%����_X%,22);
		Char.SetData(nameChangerSelectNPC,%����_Y%,22);
		Char.SetData(nameChangerSelectNPC,%����_��ͼ%,777);
		Char.SetData(nameChangerSelectNPC,%����_����%,4);
		Char.SetData(nameChangerSelectNPC,%����_ԭ��%,"������¼��ѯ����");
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
    	jinbinum = tonumber(Char.GetData(_tome,%����_���%));
    end


	if(jinbinum < castnum)then
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n����,"..(Char.GetData(_tome,%����_ԭ��%)).." �����Ǹ�������NPC��\\n\\n�ҿ��԰�������,ÿ�θ���������"..castnum.."��"..castname.."��\\n\\n�ƺ�����"..castname.."����������!\\n");
		return;
	else
		NLG.ShowWindowTalked(_tome,_me,%����_�����%,%��ť_ȷ��%,1,"\\n\\n����,"..(Char.GetData(_tome,%����_ԭ��%)).." �����Ǹ�������NPC��\\n\\n�ҿ��԰�������,ÿ�θ���������"..castnum.."��"..castname.."��\\n\\n������ֱ����������������Ҫ�ĵ�����,Ȼ����ȷ����ť��\\n");
		return;
	end
end

function nameChangerWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	if(tonumber(_seqno)==1 and tonumber(_select)==%��ť_ȷ��% and _data~="")then
		local toname = trim(_data);
		local length = string.len(toname);
	    local jinbinum = 0;
	    if(casttype ~= 0) then
	    	jinbinum = tonumber(Char.ItemNum(_tome,casttype));
	    else
	    	jinbinum = tonumber(Char.GetData(_tome,%����_���%));
	    end

		
		--local freeNameChanged = fieldget(_tome,"NAMECHANGED");
		local freeNameChanged=0;
		local level = Char.GetData(_tome,%����_�ȼ�%);
		
		if(_data == Char.GetData(_tome,%����_ԭ��%))then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n�Ǹ�...�ƺ���Ҫ�ĵ����ֺ����ڵ�����û��ʲô�仯��...\\n\\n����ȷ�������������ְ�!\\n\\n");
			return;
		end

		if(jinbinum < castnum)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n����,"..(Char.GetData(_tome,%����_ԭ��%)).." �����Ǹ�������\\n\\n�ҿ��԰�������,ÿ�θ���������"..castnum.."��"..castname.."��\\n\\n�ƺ�����"..castname.."����������!\\n");
			return;
		end

		if(length==0)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n�ύ�����ֳ���̫����Ŷ����Ҫȫ�ǿո�Ŷ��\n\\n\\n");
			return;
		end
		--string.find(_data,"%")~=nil or 
		--string.find(_data,"\'")~=nil or string.find(_data,"\`")~=nil or
		if(string.find(_data,"%%")~=nil or string.find(_data,"%'")~=nil or string.find(_data,"%`")~=nil or string.find(_data,"%\"")~=nil or string.find(_data,"%;")~=nil or string.find(_data,"%\\/")~=nil or string.find(_data,"%\\")~=nil or string.find(_data,"%[")~=nil or string.find(_data,"%]")~=nil)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n�ύ�����ְ����˽�ֹ���ַ�Ŷ�����޸ģ�\\n");
			return;
		end
		
		local query = "select `Name` from tbl_character Where Name='".._data.."'";
		local ret = SQL.Run(query);
		if(type(ret)=="table" and ret["0_0"]~=nil)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n�ύ�������Ѿ�����������Ŷ�����޸��£�\\n");
			return;
		end
		local newstr, count = string.gsub(_data, "[&#]+[0-9]+[;]", "**");
		local totalLength = string.len(newstr);
		
		--print("######################"..totalLength);

		if(totalLength>16)then
			NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,0,"\\n\\n�ύ������̫����Ŷ�����޸ģ�\\n\\n��󳤶���16������ַ���8��ȫ���ַ�\\nҲ����16����ĸ��8������Ŷ!\\n");
			return;
		end

	    if(casttype ~= 0) then
	    	jinbinum = tonumber(Char.DelItem(_tome,casttype,castnum));
	    else
	    	jinbinum = tonumber(Char.SetData(_tome,%����_���%,jinbinum - castnum));
	    end

		NLG.SystemMessage(_tome,"ʧȥ��"..castnum.."��"..castname.."��");
		local query = "Update tbl_character set `Name` = '".._data.."' Where Cdkey = '"..(Char.GetData(_tome,%����_�˺�%)).."' and Name='"..(Char.GetData(_tome,%����_ԭ��%)).."'";
		local ret = SQL.Run(query);
		
		--����û��������ݿ�����ֶ�,��ʱע��.(ֻӰ���ѯNPC)
		--local query2="INSERT INTO tbl_changenamelog (before_name,after_name) VALUES ('"..(Char.GetData(_tome,%����_ԭ��%)).."','".._data.."')";
		--local ret = SQL.Run(query2);
		
		Char.SetData(_tome,%����_ԭ��%,_data);
		NLG.UpChar(_tome);
		
		NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_�ر�%,3,"\\n\\n��ϲ��,���������Ѿ��ɹ��ĸ�Ϊ��".._data.."Ŷ!\\n\\n");
		return;
	end

	return;
end



function nameChangerSelectTalked(_me,_tome)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end

	if(os.time() - selectnametime < 60)then
		NLG.SystemMessage(_tome,"һ������ֻ�����ѯһ�Σ����Եȡ�");
		return;
	end
	
    local showtext="\\n\\n  ������¼��ѯ(ֻ��ʾһ����)��\\n\\n  �뵥��ȷ����ʼ��ѯ��";
	selectnametime = os.time();
	NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_ȷ��%,0,showtext);


end

function nameChangerSelectWTalked(_me,_tome,_seqno,_select,_data)
	if(NLG.CanTalk(_me,_tome)==false)then
		return;
	end
	
	--���ȡ�����򷵻�
    if (tonumber(_select)==2)then
        return; 
    end
	
    
    --�����һ��
    if (tonumber(_select)==16)then
      if(tonumber(_seqno)~=0)then 
       _seqno=_seqno-1;
      end
    end
    
    --�����һ��
    if (tonumber(_select)==32)then
        _seqno=_seqno+1;  
    end
    
    local page=_seqno+1;

    local showtext="====================��"..page.."ҳ====================";
    local query = "select `before_name`,`after_name` from tbl_changenamelog ";
	local ret = SQL.Run(query);

    local row=_seqno*7;
    for i=row,row+7,1 do   

		if(type(ret)=="table" and ret[i.."_0"]~=nil)then
		  showtext=showtext.."\\n     ԭ������"..ret[i.."_0"].."  ��  ��������"..ret[i.."_1"];
        end
    end
	NLG.ShowWindowTalked(_tome,_me,%����_��Ϣ��%,%��ť_����ȡ��%,_seqno,showtext);
	return;
	

end

function runsql(n,query)
  n =coro.transfer(coro.main,SQL.Run(query));
   
end