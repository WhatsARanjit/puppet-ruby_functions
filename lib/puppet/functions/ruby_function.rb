# Call any function/method available in Ruby
#
# @example how to call Array.first
#   # how to call Array.take
#     arr = [1, 2, 3]
#     f   = ruby_function(arr, 'take', 2)
#     # f is [1,2]
#

Puppet::Functions.create_function(:ruby_function) do
  dispatch :ruby_function do
    required_param 'Any', :data
    required_param 'String', :func
    optional_repeated_param 'Any', :args
  end

  def ruby_function(data, func, *args)
    data.method(func.to_sym).call(*args)
  end
end
