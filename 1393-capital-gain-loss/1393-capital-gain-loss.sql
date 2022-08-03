with buy_side as
(select stock_name, sum(price) as buy
from stocks
where operation like 'Buy'
group by stock_name),

sell_side as
(select stock_name, sum(price) as sell
from stocks
where operation like 'Sell'
group by stock_name)

select b.stock_name, (s.sell - b.buy) as capital_gain_loss 
from buy_side as b join sell_side as s
    on b.stock_name = s.stock_name