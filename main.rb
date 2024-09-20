def stock_picker(prices)
  days = [0,1]
  temp_days = [0,1]
  
  prices.each_with_index do |price,idx| 
    if price < prices[days[0]] || price < prices[days[1]]
      days[0] = idx
      days[1] = idx
    elsif price > prices[days[1]] && idx > days[0]
      days[1] = idx
      price_difference = prices[days[1]] - prices[days[0]]
      temp_price_diff = prices[temp_days[1]] - prices[temp_days[0]]
      temp_days = days.clone if price_difference > temp_price_diff

      if idx == prices.length - 1 && temp_price_diff > price_difference
        return temp_days
      end
    end
    
  end
  days
end 


stock_picker([15,3,20,9,15,8,50,1,5])
# => [5,6]

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]