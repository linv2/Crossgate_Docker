--多线程

coro = {}
--coro.main用来标识程序的主函数
coro.main = function() end
-- coro.current变量用来标识拥有控制权的协程，
-- 也即正在运行的当前协程
coro.current = coro.main

-- 创建一个新的协程
function coro.create(f)
   return coroutine.wrap(function(val)
                            return nil,f(val)
                         end)
end

-- 把控制权及指定的数据val传给协程k
function coro.transfer(k,val)
   if coro.current ~= coro.main then
      return coroutine.yield(k,val)
   else
      -- 控制权分派循环
      while k do
         coro.current = k
         if k == coro.main then
            return val
         end
         k,val = k(val)
      end
      error("coroutine ended without transfering control...")
   end
end