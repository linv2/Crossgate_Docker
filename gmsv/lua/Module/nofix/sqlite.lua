--  ***************************************************************************************************** --
--  code by http://www.Cgdev.me
--  SQLite模块
--                   #更新日志#
--  TYPE ***** TIME ***** Editor ***** Text 
--  CREATE  2013/07/21     Free
--  ADD     2013/07/22     Free        创建SQLite Object

--                   #基本设置#
sql = require "lua.lib.ljsqlite3._ljsqlite3"
conn = sql.open("lua/store/store.db")

--[[

在其他Module中直接调用conn就可以对sqlite进行各种查询
由于我们使用了ljsqlite3的第三方库进行对sqlite的mapping，所以ljsqlite3提供的API和相关的数据类型匹配请参考
http://scilua.org/ljsqlite3.html

]]--

function CloseSQLiteConn()
	conn:close()
end
