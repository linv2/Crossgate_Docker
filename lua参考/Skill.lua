---@meta _

---��ȡ����ָ����Ϣ
---@param skillIndex number
---@param dataLine number CONST.SKILL
---@return string|number @ָ��������Ϣ����Ϣ
function Skill.GetData(skillIndex, dataLine) end

---���ü���ָ����Ϣ
---@param skillIndex number
---@param dataLine number CONST.SKILL
---@param val string|number ָ����Ϣ
---@return number @�ɹ�����0
function Skill.SetData(skillIndex, dataLine, val) end

---��ȡskillIndex
---@param id number skillId
---@return number @skillIndex
function Skill.GetSkillIndex(id) end

---��ȡְҵ��߼��ܵȼ�
---@param skillIndex number
---@param job number ְҵID
---@return number @ְҵ��߼��ܵȼ�
function Skill.GetMaxSkillLevelOfJob(skillIndex, job) end

