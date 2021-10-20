-- toyhash test suite

Hash = require 'toyhash'

assert (type Hash) == 'function',
	'fail: toyhash should return a function, got ' .. type Hash

print 'Hashing "hello world"'
print 'Hash:', Hash "hello world"
