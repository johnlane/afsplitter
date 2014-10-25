require 'ffi'
require 'afsplitter'

SIZE = 10000
TIMES = 3000

str_orig = Random.new.bytes(SIZE)

print "Splitting..."
str_split  = Afsplitter.split(str_orig, TIMES)
puts "split size=#{str_split.size}"

print "Merging..."
str_merged = Afsplitter.merge(str_split, TIMES)
puts "merged size=#{str_merged.size}"

if str_merged == str_orig
  puts "The strings match"
else
  puts "The strings do not match"
end
