Delegate.RegInit("RightChar_Init");

function RightChar_Init()
	NL.RegRightClickEvent(nil, "RCEvent");
end
RC_P2 = {};

function RCEvent(p1,p2)
	--NLG.Setpalette(p1,11,5);
	--NLG.Seteffect(p1,11,5);
	if Char.GetData(p1,%����_GM%) ~= 1 then
		return;
	end


	RC_P2[(Char.GetData(p1,%����_�˺�%))] = p2;
	NLG.ShowWindowTalked(p1,RC_NPC_Index["t"],%����_ѡ���%,%��ť_ȷ��%,0,
	"1\n��ѡ��Ը���ҵĲ�����".."\n���������������������鿴���ϡ�"..
	"\n��������������������������ߡ�"..
	"\n������������������������ħ�ҡ�"..
	"\n��������������������������"..
	"\n������������������������˺š�"..
	"\n����������������������ֵ��"..
	"\n�����������������������Ͷ���"..
	"\n���������������������������ߡ�"
	);
		
    return;
	
end