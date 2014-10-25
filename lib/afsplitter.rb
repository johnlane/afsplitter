# https://rubygems.org/gems/afsplitter
require 'afsplitter/version'
require 'openssl'

module Afsplitter

  def self.merge(data,stripes,digest='sha1')

    puts "Blocksize mismatch" unless data.size % stripes == 0

    blocksize = data.size / stripes
    bufblock = "\0" * blocksize

    (0...stripes-1).each do |i|
      bufblock = _xor(data[i*blocksize,blocksize], bufblock)
      bufblock = _diffuse(bufblock, blocksize, digest)
    end

    return _xor(data[(stripes-1)*blocksize..-1], bufblock)
  end

  def self.split(data,stripes,digest='sha1')

    blocksize = data.size
    rand = Random.new
    bufblock = "\0" * blocksize
   
    ret = ''
    (stripes-1).times do

      # Get some random data
      r = rand.bytes(blocksize)
      ret += r

      bufblock = _xor(r, bufblock)
      bufblock = _diffuse(bufblock, blocksize, digest)
    end

    ret += _xor(bufblock, data)

  end

  private

    def self._xor(a,b)
      a.unpack('C*').zip(b.unpack('C*')).map{ |a,b| a^b }.pack('C*')
    end
    
    def self._diffuse(block,size,digest)
      digest = OpenSSL::Digest.new(digest)
      digest_size = digest.digest_length
      full_blocks = block.size / digest_size
      padding = block.size % digest_size
    
      # hash the full blocks
      ret = ''
      (0..full_blocks-1).each do |i|
        digest.reset
        digest << [i].pack('N')
        digest << block[i*digest_size,digest_size]
        ret+=digest.digest
      end
    
      # Hash the remaining data
      if padding > 0
        digest.reset
        digest << [full_blocks].pack('N')
        digest << block[full_blocks * digest_size..-1]
        ret += digest.digest[0,padding]
      end
    
      ret
    
    end
    
end
