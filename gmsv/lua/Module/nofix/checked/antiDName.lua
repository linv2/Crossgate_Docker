Delegate.RegDelLoginEvent("antiDName_LoginEvent");
function antiDName_LoginEvent(player)
	local tname = Char.GetData(player,%����_����%);
	local query = "select count(*),Cdkey from tbl_character where Name ='"..tname.."'";
	
	local result = SQL.Run(query);
	local GetNum = tonumber(result["0_0"]);
	if GetNum ~= 1 then
		
		local tcdkey = Char.GetData(player,%����_�˺�%);
		local query2 = "update tbl_user set EnableFlg ='0',AccountPassword ='block_PPP' where Cdkey ='"..tcdkey.."'";
		SQL.Run(query2);
		
		NLG.DropPlayer(player); 
		return;
	end
end