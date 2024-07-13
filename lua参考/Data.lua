---@meta _

---��ȡMsg
---@param msgId number @��Ϣid
---@return string @��Ϣ����
function Data.GetMessage(msgId) end

---����Msg
---@param msgId number ��Ϣid
---@param val string ��Ϣ����
function Data.SetMessage(msgId, val) end

---���������˺�����
---@param a number �������� ֧�� 0 ~ 19
---@param b number �������� ֧�� 0 ~ 19
---@param rate number ���Ʊ���֧�� -128 ~ 127
---@return number @�˺�����
function Data.SetTribeMapValue(a, b, rate) end

---��ȡEnemyDataIndex
---@param enemyId number
---@return number @EnemyDataIndex
function Data.EnemyGetDataIndex(enemyId) end

---��ȡEnemy����
---@param enemyIndex number
---@param DataPos number CONST.DATA_ENEMY
---@return number|string @Enemy����
function Data.EnemyGetData(enemyIndex, DataPos) end

---ָ��Enemy����
---@param enemyIndex number
---@param DataPos number CONST.DATA_ENEMY
---@param val string|number ָ����Ϣ
---@return number @�ɹ�����0
function Data.EnemySetData(enemyIndex, DataPos, val) end

---��ȡEnemyBaseDataIndex
---@param enemyBaseId number
---@return number @EnemyBaseDataIndex
function Data.EnemyBaseGetDataIndex(enemyBaseId) end

---��ȡEnemyBase����
---@param enemyBaseIndex number
---@param DataPos number CONST.DATA_ENEMYBASE
---@return number|string @EnemyBase����
function Data.EnemyBaseGetData(enemyBaseIndex, DataPos) end

---ָ��EnemyBase����
---@param enemyBaseIndex number
---@param DataPos number CONST.DATA_ENEMYBASE
---@param val number|string ָ����Ϣ
---@return number @�ɹ�����0
function Data.EnemyBaseSetData(enemyBaseIndex, DataPos, val) end

---��ȡItemsetIndex
---@param ItemID number
---@return number @ItemsetIndex
function Data.ItemsetGetIndex(ItemID) end

---��ȡItemset����
---@param ItemsetIndex number
---@param DataPos number CONST.ITEMSET
---@return number|string @Itemset����
function Data.ItemsetGetData(ItemsetIndex, DataPos) end

---ָ��Itemset����
---@param ItemsetIndex number
---@param DataPos number CONST.ITEMSET
---@param val number|string ָ����Ϣ
---@return number @�ɹ�����0
function Data.ItemsetSetData(ItemsetIndex, DataPos, val) end

---��ȡencountIndex
---@param encountId number
---@return number @encountIndex
function Data.GetEncountIndex(encountId) end

---��ȡencount����
---@param encountIndex number
---@param DataPos number CONST.ENCOUNT_* 
---@return number|string @encount����
function Data.GetEncountData(encountIndex,DataPos) end

---ָ��encount����
---@param encountIndex number
---@param DataPos number CONST.ENCOUNT_* 
---@param val number|string ָ����Ϣ
---@return number @�ɹ�����0
function Data.SetEncountData(encountIndex,DataPos,val) end

---��ȡJobIndex
---@param jobId number ְҵId
---@return number @JobIndex
function Data.GetJobIndex(jobId) end

---��ȡJob����
---@param jobIndex number JobIndex 
---@param dataPos number CONST.JOBS_*
---@return number|string @���� 
function Data.GetJobData(jobIndex, dataPos) end

---����Job����
---@param jobIndex number JobIndex 
---@param dataPos number CONST.JOBS_*
---@param data number|string @���� 
---@return number @�ɹ�����0
function Data.SetJobData(jobIndex, dataPos, data) end

---��ȡְϵIndex
---@param jobAncestryId number ְϵId
---@return number @JobAncestryIndex
function Data.GetJobAncestryIndex(jobAncestryId) end

---��ȡְϵ����
---@param jobAncestryIndex number JobAncestryIndex 
---@param dataPos number CONST.JOBS_Ancestry_*
---@return number|string @���� 
function Data.GetJobAncestryData(jobAncestryIndex, dataPos) end

---����ְϵ����
---@param jobAncestryIndex number JobAncestryIndex 
---@param dataPos number CONST.JOBS_Ancestry_*
---@param data number|string @���� 
---@return number @�ɹ�����0
function Data.SetJobAncestryData(jobAncestryIndex, dataPos, data) end

