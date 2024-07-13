---@meta _

---��ȡָ����ͼλ�õ�Object Index�б�
---@param MapId  number �����ͼid��
---@param FloorId  number ����Floor id��
---@param X  number ����x��
---@param Y  number ����y��
---@return number @����ֵΪ2������һ������ֵΪ�������ڶ�������ֵ��lua��table���������ж���Ķ���index��
function Obj.GetObject(MapId, FloorId, X, Y) end

---����ObjIndex��� ����/����/��Ʒ�� ��������
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @����index
function Obj.GetCharIndex(ObjectIndex) end

---��ȡָ��Object Index��Object���͡�
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @-1���Ƿ� | 0��δʹ�� | 1����ɫ | 2������ | 3����� | 4�����͵� | 5���� | 6���ؾ�
function Obj.GetType(ObjectIndex) end

---��ȡָ��Object Index��X���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @x����
function Obj.GetX(ObjectIndex) end

---��ȡָ��Object Index��Y���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @y����
function Obj.GetY(ObjectIndex) end

---��ȡָ��Object Index��Floor ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Floor ID
function Obj.GetFloor(ObjectIndex) end

---��ȡָ��Object Index��Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Map ID
function Obj.GetMap(ObjectIndex) end

---��ȡָ��Object Index��Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Map ID
function Obj.GetMapId(ObjectIndex) end

---��ȡָ��Object Index��Warp X���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @x����
function Obj.GetWarpX(ObjectIndex) end

---��ȡָ��Object Index��Warp Y���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @y����
function Obj.GetWarpY(ObjectIndex) end

---��ȡָ��Object Index��Warp Floor ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Floor ID
function Obj.GetWarpFloor(ObjectIndex) end

---��ȡָ��Object Index��Warp Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Map ID
function Obj.GetWarpMap(ObjectIndex) end

---��ȡָ��Object Index��Warp Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @Map ID
function Obj.GetWarpMapId(ObjectIndex) end

---��ȡָ��Objec����Ŀ�ʼʱ��(���￪ʼ���ص�ʱ��)��
---@param ObjectIndex  number Ŀ��� ���index��
---@return number @��ʼʱ���timestamp��
function Obj.GetDelTime(ObjectIndex) end

---����ָ��Object Index��Object���͡�
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number ȡֵ0~6 <br>
--- 0��δʹ�� <br>
--- 1����ɫ <br>
--- 2������ <br>
--- 3����� <br>
--- 4�����͵� <br>
--- 5���� <br>
--- 6���ؾ�
---@return number @����ǰ������
function Obj.SetType(ObjectIndex, Value) end

---����ָ��Object Index��X���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�X����
---@return number @����ǰ��x����
function Obj.SetX(ObjectIndex, Value) end

---����ָ��Object Index��Y���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�Y����
---@return number @����ǰ��Y����
function Obj.SetY(ObjectIndex, Value) end

---����ָ��Object Index��Floor ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�FloorID
---@return number @����ǰ��Floor ID
function Obj.SetFloor(ObjectIndex, Value) end

---����ָ��Object Index��Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�MapID
---@return number @����ǰ��Map ID
function Obj.SetMap(ObjectIndex, Value) end

---����ָ��Object Index��Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�MapID
---@return number @����ǰ��Map ID
function Obj.SetMapId(ObjectIndex, Value) end

---����ָ��Object Index��Warp X���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�X����
---@return number @����ǰ��x����
function Obj.SetWarpX(ObjectIndex, Value) end

---����ָ��Object Index��Warp Y���ꡣ
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�Y����
---@return number @����ǰ��Y����
function Obj.SetWarpY(ObjectIndex, Value) end

---����ָ��Object Index��Warp Floor ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�FloorID
---@return number @����ǰ��Floor ID
function Obj.SetWarpFloor(ObjectIndex, Value) end

---����ָ��Object Index��Warp Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�MapID
---@return number @����ǰ��Map ID
function Obj.SetWarpMap(ObjectIndex, Value) end

---����ָ��Object Index��Warp Map ID��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number �µ�MapID
---@return number @����ǰ��Map ID
function Obj.SetWarpMapId(ObjectIndex, Value) end

---����ָ��Objec����Ŀ�ʼʱ��(���￪ʼ���ص�ʱ��)��
---@param ObjectIndex  number Ŀ��� ���index��
---@param Value  number ʱ��timestamp
---@return number @����ǰ��ʱ��
function Obj.SetDelTime(ObjectIndex, Value) end

---�Ƴ�ָ��obj
---@param objectIndex number object��index
---@return number @�ɹ�����0
function Obj.RemoveObject(objectIndex) end

---��ָ���ĵ�ͼ���������ô��͵�
---@param Map number ���͵��ͼ����
---@param Floor number ���͵��ͼ
---@param Xpos number ���͵�X����
---@param Ypos number ���͵�Y����
---@param toMap number ���ͺ��ͼ����
---@param toFloor number ���ͺ��ͼ
---@param toXpos number ���ͺ�X����
---@param toYpos number ���ͺ�Y����
---@return number @�ɹ�����ObjectIndex
function Obj.AddWarp(Map,Floor,Xpos,Ypos,toMap,toFloor,toXpos,toYpos) end

---��ָ���ĵ�ͼ�����ϷŽ��
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@param gold number �������
---@return number @�ɹ�����ObjectIndex
function Obj.AddGold(Map,Floor,Xpos,Ypos,gold) end

---��ָ���ĵ�ͼ�����Ϸ���Ʒ
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@param itemIndex number ��Item.MakeItem(itemId)����ֵ
---@return number @�ɹ�����ObjectIndex
function Obj.AddItem(Map,Floor,Xpos,Ypos,itemIndex) end

