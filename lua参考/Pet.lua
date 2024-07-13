---@meta _

---��ȡָ�������ָ�����Եĳɳ�ֵ��ʹ�øú�����ȥFullArtRank�����Ľ�������ǳ���ĵ�����Ϣ��
---@param PetIndex  number Ŀ��������index��
---@param ArtType  number Ҫ�鿴�����ԣ�������ο���¼�ĳ��ﳣ����
---@return number @ָ�����Եĳɳ�ֵ����ֵ�͡�
function Pet.GetArtRank(PetIndex, ArtType) end

---����ָ�������ָ�����Եĳɳ�ֵ�����ǳ����bp�ֲ������������޸Ķ��ı䡣
---@param PetIndex  number Ŀ��������index��
---@param ArtType  number Ҫ�鿴�����ԣ�������ο���¼�ĳ��ﳣ����
---@param Value  number Ҫ����Ϊ�ĳɳ�ֵ��
---@return number @0�ɹ�������ʧ�ܡ�
function Pet.SetArtRank(PetIndex, ArtType, Value) end

---��ȡָ�������ָ�����Ե������ɳ�ֵ��
---@param PetIndex  number Ŀ��������index��
---@param ArtType  number Ҫ�鿴�����ԣ�������ο���¼�ĳ��ﳣ����
---@return number @ָ�����Եĳɳ�ֵ��
function Pet.FullArtRank(PetIndex, ArtType) end

---��¯ָ������ó���ص�1��״̬(���ԡ�������)�����ǳɳ��������䡣 �ú������SetArtRankһ��ʹ�ÿ����Զ������ĵ������������·���bp��
---@param PlayerIndex  number Ŀ�����index��
---@param PetIndex  number Ŀ��������index��
---@return number @�ɹ�����0
function Pet.ReBirth(PlayerIndex, PetIndex) end

---���ͳ���״̬������ͻ��ˣ����������¼������ȼ�����Ϣ��
---@param PlayerIndex  number Ŀ�����index��
---@param PetIndex  number Ŀ��������index��
function Pet.UpPet(PlayerIndex, PetIndex) end

---��ȡ�����ӵ���߶���index�� ע��:������ﶪ�ڵ���,���������Ѿ����߷���ֵΪ-1
---@param PetIndex  number Ŀ��������index��
---@return number @����-1Ϊδ�ҵ�������Ϊ����index��
function Pet.GetOwner(PetIndex) end

---�����������µļ��ܣ�������＼��δ������ɹ������򲻻����Ӽ��ܡ�
---@param PetIndex  number Ŀ��������index��
---@param SkillID  number ���ܵ�ID��������ָTech.txt�ļ��ж����ID
---@return number @�ɹ����ӷ���1��ʧ�ܷ���0��
function Pet.AddSkill(PetIndex, SkillID) end

---������ɾ�����е�ָ�����ܡ�
---@param PetIndex  number Ŀ��������index��
---@param SkillSlot  number ���ܵ�λ�ã���0��ʼ���㡣
---@return number @�ɹ����ӷ���1��ʧ�ܷ���0��
function Pet.DelSkill(PetIndex, SkillSlot) end

---��ȡ����ָ��λ�õļ���ID��
---@param PetIndex  number Ŀ��������index��
---@param SkillSlot  number ���ܵ�λ�ã���0��ʼ���㡣
---@return number @�ɹ����ؼ���ID��ʧ�ܷ���-1��
function Pet.GetSkill(PetIndex, SkillSlot) end

---��ȡ��������Ψһ��ʶ��
---@param PetIndex  number Ŀ��������index��
---@return string @���صĽ�����ַ��� | ����"-1"��ʾ�ǳ�����޷���ȡ������Ϊ����ȫ��Ψһ��ʶ��
function Pet.GetUUID(PetIndex) end

