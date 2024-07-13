Delegate.RegDelLoginEvent("TestFieldLogin")
function TestFieldLogin(player)
	local test1 = Field.Get(player,"TestField")
	NLG.SystemMessage(player,"NowValue="..test1.."("..type(test1)..")")
	if type(tonumber(test1)) == "number" then
		test1 = tonumber(test1) + 1
		Field.Set(player,"TestField",test1)
		NLG.SystemMessage(player,"NewValue="..test1.."("..type(test1)..")")
	else
		test1 = 1
		Field.Set(player,"TestField",test1)
		NLG.SystemMessage(player,"NewValue="..test1.."("..type(test1)..")")
	end
end