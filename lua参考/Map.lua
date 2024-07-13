---@meta _

---��ȡ�Թ�Id
---@param floor number
---@return number @�Թ�id
function Map.GetDungeonId(floor) end

---��ȡ�Թ����
---@param dungeonId number �Թ�id
---@return number mapType
---@return number floor
---@return number @x
---@return number @y
function Map.FindDungeonEntry(dungeonId) end

---��ȡ�Թ��Ĺ���ʱ��
---@param dungeonId number �Թ�id
---@return number @����ʱ��
function Map.GetDungeonExpireAtByDungeonId(dungeonId) end

---�����Թ�Id�����Թ�����ʱ��
---@param dungeonId number �Թ�id
---@param time number UnixTime
---@return number @����ʱ��
function Map.SetDungeonExpireAtByDungeonId(dungeonId, time) end

---��ȡ�Թ��Ĺ���ʱ��
---@param dungeonId number �Թ�id
---@return number @����ʱ�䣬��λ��
function Map.GetDungeonExpireTimeByDungeonId(dungeonId) end

---��ȡ�Թ��Ĺ���ʱ��
---@param floor number floor
---@return number @����ʱ�䣬��λ��
function Map.GetDungeonExpireTime(floor) end

---�����Թ��Ĺ���ʱ��
---@param floor number floor
---@param time number ʱ��
function Map.SetDungeonExpireAt(floor, time) end

---��ȡ�Թ��Ĺ���ʱ��
---@param floor number floor
---@return number @����ʱ��
function Map.GetDungeonExpireAt(floor) end

---��õ�ͼλ�õ�ͼ��
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@return number @�ذ�ͼ��
---@return number @������ͼ��
function Map.GetImage(Map, Floor, Xpos, Ypos) end

---�趨��ͼλ�õ�ͼ��
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@param Tile number �ذ�ͼ�� ����Ϊnull
---@param Obj number ������ͼ�� ����Ϊnull
---@return number @�ɹ�����0
function Map.SetImage(Map, Floor, Xpos, Ypos, Tile, Obj) end

---��õ�ͼ��С
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@return number @��
---@return number @��
function Map.GetMapSize(Map, Floor) end

---�������Ƶ�ͼ���µ�ͼ��mapidΪCONST.��ͼ����_LUAMAP
---@param mapid  number Ҫ���Ƶĵ�ͼ��Map ID��
---@param floor  number Ҫ���Ƶĵ�ͼ��Floor ID��
---@return number @�ɹ������µ�FloorID��ʧ�ܷ���-1��
function Map.MakeCopyMap(mapid, floor) end

---ɾ��Lua���ɵĵ�ͼ���ͷŵ�ͼ��š�
---@param floor  number ��ͼ��Floor ID��
---@return number @�ɹ�����0��ʧ�ܷ���-1��
function Map.DelLuaMap(floor) end

---���������ͼ��
---@param Dofile? string �ص����������ļ� �ַ���
---@param InitFuncName? string �ص����������������ͼ���ɳɹ��Ժ󣬻ᴥ������Ļص����� MakeMazeMapCallBack �ַ���
---@param Xsize number ��ͼx�������ֵ
---@param Ysize number ��ͼy�������ֵ
---@param MapName string ��ͼ��
---@return number @�ɹ������µ�FloorID��ʧ�ܷ���-1��
function Map.MakeMazeMap(Dofile, InitFuncName, Xsize, Ysize, MapName) end

---���������ͼ��
---@param Dofile? string �ص����������ļ� �ַ���
---@param InitFuncName? string �ص����������������ͼ���ɳɹ��Ժ󣬻ᴥ������Ļص����� MakeMazeMapCallBack �ַ���
---@param Xsize number ��ͼx�������ֵ
---@param Ysize number ��ͼy�������ֵ
---@param MapName string ��ͼ��
---@param pal number ��ɫ��ID [�����ͼ��ɫ���]
---@param roomSize number �����ͼ���С [����������ɵ�ͼ��һЩ����]
---@param roomSizeMinX number �����ͼ��x������Сֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMinY number �����ͼ��y������Сֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMaxX number �����ͼ��x�������ֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMaxY number �����ͼ��y�������ֵ [����������ɵ�ͼ��һЩ����]
---@param tile number ��ͼ�ذ�ͼ����� [�����ͼͼ����Ϣ]
---@param obj number ��ͼ����ͼ�����[�����ͼͼ����Ϣ]
---@param other number ��ͼ����������[�����ͼͼ����Ϣ] 
---@param wallH number ǽ����ͼ����� [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallHX number ǽ������ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��] 
---@param wallV number ǽ����ͼ����� [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallVX number ǽ������ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallcross number ǽ�ཻ����ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@return number @�ɹ������µ�FloorID��ʧ�ܷ���-1��
function Map.MakeMazeMap(Dofile, InitFuncName, Xsize, Ysize, MapName, pal, roomSize, roomSizeMinX, roomSizeMinY, roomSizeMaxX, roomSizeMaxY, tile, obj, other, wallH, wallHX, wallV, wallVX, wallcross) end

---���������ͼ��
---@param Dofile? string �ص����������ļ� �ַ���
---@param InitFuncName? string �ص����������������ͼ���ɳɹ��Ժ󣬻ᴥ������Ļص����� MakeMazeMapCallBack �ַ���
---@param Xsize number ��ͼx�������ֵ
---@param Ysize number ��ͼy�������ֵ
---@param MapName string ��ͼ��
---@param pal number ��ɫ��ID [�����ͼ��ɫ���]
---@param roomSize number �����ͼ���С [����������ɵ�ͼ��һЩ����]
---@param roomSizeMinX number �����ͼ��x������Сֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMinY number �����ͼ��y������Сֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMaxX number �����ͼ��x�������ֵ [����������ɵ�ͼ��һЩ����]
---@param roomSizeMaxY number �����ͼ��y�������ֵ [����������ɵ�ͼ��һЩ����]
---@param tile number ��ͼ�ذ�ͼ����� [�����ͼͼ����Ϣ]
---@param obj number ��ͼ����ͼ�����[�����ͼͼ����Ϣ]
---@param other number ��ͼ����������[�����ͼͼ����Ϣ] 
---@param wallH number ǽ����ͼ����� [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallHX number ǽ������ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��] 
---@param wallV number ǽ����ͼ����� [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallVX number ǽ������ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param wallcross number ǽ�ཻ����ͼ�����  [�����ͼǽ�棬���ȫ��д0������Զ����ɶ���ǽ��]  
---@param bgm number ��������
---@return number @�ɹ������µ�FloorID��ʧ�ܷ���-1��
function Map.MakeMazeMap(Dofile, InitFuncName, Xsize, Ysize, MapName, pal, roomSize, roomSizeMinX, roomSizeMinY, roomSizeMaxX, roomSizeMaxY, tile, obj, other, wallH, wallHX, wallV, wallVX, wallcross, bgm) end

---�����Map.MakeMazeMap���������ͼ����Ļص�����
---@param FloorID  number ���ɵĵ�ͼ�ı��
---@param Doneflg  number ���ɵ�ͼ�Ľ���������ֵΪ1�����ɳɹ������Ϊ0������ʧ�ܡ�
---@return any @
function MapCallBack(FloorID, Doneflg) end

---��ȡ�����ͼ���õ����ꡣ
---@param mapid number ��ͼ����
---@param floor number ��ͼ
---@return number @x���꣬���ʧ����x��y��Ϊ-1��
---@return number @y���꣬���ʧ����x��y��Ϊ-1��
function Map.GetAvailablePos(mapid, floor) end

---���õ�ͼ�����Ƿ����ͨ��
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@param Able number �Ƿ�ͨ��
---@return number @
function Map.SetWalkable(Map, Floor, Xpos, Ypos, Able) end

---�鿴��ͼ�����Ƿ����ͨ��
---@param Map number ��ͼ����
---@param Floor number ��ͼ
---@param Xpos number X����
---@param Ypos number Y����
---@return number @��ͨ�з���1������ͨ�з���0
function Map.IsWalkable(Map, Floor, Xpos, Ypos) end

---��ȡ��ͼ��չ��Ϣ
---@param mapId number ��ͼ����
---@param floor number ��ͼ
---@param field string field
---@return number|string|nil
function Map.GetExtData(mapId, floor, field) end

---���õ�ͼ��չ��Ϣ
---@param mapId number ��ͼ����
---@param floor number ��ͼ
---@param field string field
---@param val number|string|nil ����
---@return number @����0Ϊ�ɹ�������ʧ��
function Map.SetExtData(mapId, floor, field, val) end
