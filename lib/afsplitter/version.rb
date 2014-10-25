module Afsplitter
  VERSION = "0.1"

  SUMMARY = "AFsplitter - Anti-forensic Information Splitter"

  DESCRIPTION = <<-EOS

  The AFsplitter is used by LUKS to store encrypted keys in its header.

  There is a native Ruby implementation and a FFI implementation that
  binds the "libafsplit.so" shared library.

  AFsplitter is documented at http://clemens.endorphin.org/AFsplitter.

  EOS

end
