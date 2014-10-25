# https://rubygems.org/gems/afsplitter
require "afsplitter/version"
require "ffi"

module Afsplitter

  extend FFI::Library

  def self.split(str,iterations,digest=nil)
    size=str.size
    original = FFI::MemoryPointer.from_string(str)
    result = FFI::MemoryPointer.from_string(Random.new.bytes(size*iterations))
    af_split(original,result,size,iterations)
    return result.read_string(size*iterations)
  end

  def self.merge(str,iterations,digest=nil)
    size=str.size / iterations
    original = FFI::MemoryPointer.from_string(str)
    result = FFI::MemoryPointer.from_string(Random.new.bytes(size))
    af_merge(original,result,size,iterations)
    return result.read_string(size)
  end

  private

  ffi_lib 'libafsplit.so'

  typedef :pointer, :src
  typedef :pointer, :dest

  #int AF_split(char *src, char *dst, int blocksize, int blocknumbers);
  attach_function :af_split, :AF_split, [:src, :dest, :int, :int], :int
  
  #int AF_merge(char *src, char *dst, int blocksize, int blocknumbers);
  attach_function :af_merge, :AF_merge, [:src, :dest, :int, :int], :int

end
