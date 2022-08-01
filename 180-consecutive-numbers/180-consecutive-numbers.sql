select distinct L1.num as ConsecutiveNums
from Logs as L1, Logs as L2, Logs as L3
where L1.id = L2.id - 1 and L2.id = L3.id - 1 and
    L1.num = L2.num and L2.num = L3.num
