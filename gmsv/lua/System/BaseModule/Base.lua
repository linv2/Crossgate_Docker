battleSeqDB = {n=10001};
battleTimeDB = {n=10001};

for i=1,10001 do
	battleSeqDB[i] = "";
	battleTimeDB[i] = 0;
end


function fieldget(p,f)
	local ret = tonumber(Field.Get(p,f));
	if(ret==nil)then ret = 0; end
	return ret;
end

function fieldadd(p,f,n)
	local ret = tonumber(Field.Get(p,f));
	if(ret==nil)then ret=0; end
	ret = ret + n;
	Field.Set(p,f,ret);
	return;
end

function fieldset(p,f,n)
	Field.Set(p,f,n);
	return;
end

function fielddel(p,f)
	fieldset(p,f,"");
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

function trim (s)
   return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function Split(szFullString, szSeparator)
local nFindStartIndex = 1
local nSplitIndex = 1
local nSplitArray = {}
while true do
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
   if not nFindLastIndex then
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
    break
   end
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
   nSplitIndex = nSplitIndex + 1
end
return nSplitArray
end


function check_msg(msg,check_msg)
	if(msg == nil) then
		return;
	end

   if(string.sub(msg,1,string.len(check_msg))==check_msg)then
		return true;
   end
   return false;
end

function giveitem(p,i,n)
	local item = Char.GiveItem(p,i);
	if(item>0)then
		Item.SetData(item,%道具_堆叠数%,n);
	end
	for i=8,27 do
		Item.UpItem(p,i);
	end
	return;
end

function isLevelOnePet(checkPet)
	if(checkPet==0)then
		return false;
	end
	if(Char.GetData(checkPet,%对象_等级%)==1 and Char.GetData(checkPet,%对象_种族%)~=9)then
		if((Char.GetData(checkPet,%对象_名字%)=="迷你蝙蝠") or (Char.GetData(checkPet,%对象_名字%)=="哥布林") or (Char.GetData(checkPet,%对象_名字%)=="盗贼") or (Char.GetData(checkPet,%对象_名字%)=="小石像怪"))then
			return false;
		end
		return true;
	end
	return false;
end

function Playerkey(player)
	if(player ~= nil) then
		local fanhui1 = Char.GetData(player,%对象_名字%)
		local fanhui2 = Char.GetData(player,%对象_账号%)
		
		if(fanhui1 == nil or fanhui2 == nil) then
			print(player)
			print(fanhui1)
			if(fanhui2 == nil) then
				fanhui2 = "bus"
			end
			
			print("fanhui1"..fanhui1.."fanhui2"..fanhui2)
		end
		
		
		return fanhui1..fanhui2;
	else
		print("无法计算")
		return 1;
	end
end

function useModule(file)
	dofile("lua/Module/"..file..".lua");
end

function VERSION() 
	return NL.Ver();
end

function VaildChar(index)

	if(VERSION() == "cgmsv") then
		if(index>=0)then
			return true;
		end
		return false;
	end
	return false;
end

function Myinit(_MeIndex)
	return true;
end
