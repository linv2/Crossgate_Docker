Delegate.RegDelLoginEvent("ikki_encount");--��ɫ����

function ikki_encount(player)
        ger = Setup.Get("encount_rate"); -- ��ȡȫ�����������ã�ȫ��������ger: ��ga_setup.cf�����õĲ����� encount_rate=100��Ĭ��ֵ100
        cer = Char.SetBonusEncountRate(player, 0);--��������������cer
        er = ger + cer;--������er = ger(ȫ��������)+cer(����������)--�����鳬��500
        if  er ~= 0 then
                a = 0;
                b = math.floor(NLG.Rand(1, 100) / (er / 100));
                if b == 0 then
                        b = math.floor(NLG.Rand(1, 100) / (er / 100));
                end
                Char.SetWalkPostEvent(nil,"ikki_toencount",player);--�������ߺ��¼��Ļص�����
        else
                Char.SetData(player,%����_�����п���%,1);
                NLG.SystemMessage(player,"��ǰ��������ֹҰ�����У�");
        end
end

function ikki_toencount(player)
        local getXiangVar1 = Char.GetData(player,%����_�㲽��%);
        local kg = Char.GetData(player,%����_�����п���%);
        if kg == 0 then
                if (getXiangVar1 == 0) then
                        a = a + 1;
                        if( a == b)then
                                Battle.Encount(player,player); -- ԭ������
                                a = 0 ;
                                b = math.floor(NLG.Rand(1, 100) / (er / 100));
                                if b == 0 then
                                        b = math.floor(NLG.Rand(1, 100) / (er / 100));
                                end
                        end
                elseif (getXiangVar1 > 0) then
                        if Battle.Encount(player,player) < 0 then -- ԭ������
                                Char.SetData(player,%����_�㲽��%,0);
                        end
                end
        end

end