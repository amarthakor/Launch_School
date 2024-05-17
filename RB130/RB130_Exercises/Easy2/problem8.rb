def max_by(arr)
  return nil if arr.empty?

  current_max = nil
  block_max = yield(arr[0])

  arr.each_with_index do |ele, idx|
    if yield(ele) >= block_max
      block_max = yield(ele)
      current_max = arr[idx]
    end
  end

  current_max
end


puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil