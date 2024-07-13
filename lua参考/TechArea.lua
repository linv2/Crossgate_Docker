---@meta _

---�����ɼ�����
---@param mapId number ��ͼ����
---@param floor number ��ͼfloor
---@param x number x����
---@param y number y����
---@param w number ��
---@param h number ��
---@param name string ����
---@param skillId number ����id
---@param zOrder number z�����ȼ�
---@param failedProb number ʧ�ܸ���
---@param needItem number ��Ҫ����Ʒid
---@param itemId1 number ��Ʒ1Id
---@param rate1 number ��Ʒ1����
---@param itemId2 number ��Ʒ2Id
---@param rate2 number ��Ʒ2����
---@param itemId3 number ��Ʒ3Id
---@param rate3 number ��Ʒ3����
---@param itemId4 number ��Ʒ4Id
---@param rate4 number ��Ʒ4����
---@param itemId5 number ��Ʒ5Id
---@param rate5 number ��Ʒ5����
---@param itemId6 number ��Ʒ6Id
---@param rate6 number ��Ʒ6����
---@param itemId7 number ��Ʒ7Id
---@param rate7 number ��Ʒ7����
---@param itemId8 number ��Ʒ8Id
---@param rate8 number ��Ʒ8����
---@param itemId9 number ��Ʒ9Id
---@param rate9 number ��Ʒ9����
---@param itemId10 number ��Ʒ10Id
---@param rate10 number ��Ʒ10����
---@return number index @����Index�������ڻ����0ʱΪ�ɹ�������Ϊʧ��
function TechArea.CreateTechArea(mapId, floor, x, y, w, h, name, skillId, zOrder, failedProb, needItem, itemId1, rate1, itemId2, rate2, itemId3, rate3, itemId4, rate4, itemId5, rate5, itemId6, rate6, itemId7, rate7, itemId8, rate8, itemId9, rate9, itemId10, rate10) end

---�Ƴ��ɼ�����
---@param index number ����Index
---@return number ret @0Ϊ�ɹ�������ʧ�ܡ�
function TechArea.RemoveTechArea(index) end

---��ȡָ����������вɼ�����index
---@param mapId number ��ͼ����
---@param floor number ��ͼfloor
---@param x number   x����
---@param y number   y����
---@param skillId number ���ܱ��
---@return number count @����,���ڻ����0Ϊ�ɹ�������ʧ�ܡ�
---@return {index:number,zOrder:number}[] list @�ɼ�����Index��zOrder
function TechArea.GetIndexList(mapId, floor, x, y, skillId) end

---��ȡTechAreaָ������
---@param areaIndex number
---@param dataLine number ָ����Ϣ��CONST.TechArea
---@return string|number @Techָ����Ϣ������
function TechArea.GetData(areaIndex, dataLine) end

---����TechAreaָ������
---@param areaIndex number
---@param dataLine number ָ����Ϣ��CONST.TechArea
---@param value string|number @Techָ����Ϣ������
---@return number ret @0Ϊ�ɹ�������ʧ�ܡ�
function TechArea.SetData(areaIndex, dataLine, value) end