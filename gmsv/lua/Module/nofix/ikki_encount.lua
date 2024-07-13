Delegate.RegDelLoginEvent("ikki_encount");--角色登入

function ikki_encount(player)
        ger = Setup.Get("encount_rate"); -- 获取全局遇敌率设置，全局遇敌率ger: 在ga_setup.cf中设置的参数， encount_rate=100，默认值100
        cer = Char.SetBonusEncountRate(player, 0);--设置遇敌率修正cer
        er = ger + cer;--遇敌率er = ger(全局遇敌率)+cer(遇敌率修正)--不建议超过500
        if  er ~= 0 then
                a = 0;
                b = math.floor(NLG.Rand(1, 100) / (er / 100));
                if b == 0 then
                        b = math.floor(NLG.Rand(1, 100) / (er / 100));
                end
                Char.SetWalkPostEvent(nil,"ikki_toencount",player);--设置行走后事件的回调函数
        else
                Char.SetData(player,%对象_不遇敌开关%,1);
                NLG.SystemMessage(player,"当前服务器禁止野外遇敌！");
        end
end

function ikki_toencount(player)
        local getXiangVar1 = Char.GetData(player,%对象_香步数%);
        local kg = Char.GetData(player,%对象_不遇敌开关%);
        if kg == 0 then
                if (getXiangVar1 == 0) then
                        a = a + 1;
                        if( a == b)then
                                Battle.Encount(player,player); -- 原地遇敌
                                a = 0 ;
                                b = math.floor(NLG.Rand(1, 100) / (er / 100));
                                if b == 0 then
                                        b = math.floor(NLG.Rand(1, 100) / (er / 100));
                                end
                        end
                elseif (getXiangVar1 > 0) then
                        if Battle.Encount(player,player) < 0 then -- 原地遇敌
                                Char.SetData(player,%对象_香步数%,0);
                        end
                end
        end

end