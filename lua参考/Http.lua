---@meta _

---��ʼ��Http������
function Http.Init() end

---����Http����
---@param addr string ����IP,����  "0.0.0.0"
---@param port number �˿� ����10000����
---@return number @�ɹ�����1
function Http.Start(addr, port) end

---�ر�Http����������Ҫע�⣬��������ֹͣ�ᵼ��������Ӧ502����ǿ�ƹر�����δ���������
---@return number @�ɹ�����1
function Http.Stop() end

---��ȡHttp������״̬
---@return 0|1|2 @0=δ��ʼ�� 1=δ���� 2=������
function Http.GetStatus() end

---�󶨾�̬��Դ
---@param path string url��ַ
---@param dir string ����Ŀ¼
---@return number @�ɹ�����1
function Http.AddMountPoint(path, dir) end

---�Ƴ���̬��Դ
---@param path string url��ַ
---@return number @�ɹ�����1
function Http.RemoveMountPoint(path) end

---ע��API�ӿڣ���ע��Ľӿڲ���ͨ���¼�����Luaִ��
---@param api string url��ַ
---@return number @�ɹ�����1
function Http.RegApi(api) end

---��ע��API�ӿڣ���ע���Ľӿڲ���ͨ���¼�����Luaִ��
---@param api string url��ַ
---@return number @�ɹ�����1
function Http.UnregApi(api) end

