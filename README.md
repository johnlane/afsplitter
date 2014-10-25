# Afsplitter - Anti-forensic Information Splitter

This is a Ruby implementation of the [AFsplitter][1] used by `cryptsetup`
when storing encrypted key data in a [LUKS][2] volume header.

There are two implementations:

* A version using [FFI][3] bindings to the AFsplitter library;
* A pure Ruby implementation.

RubyGems: https://rubygems.org/gems/afsplitter
Github:   https://github.com/johnlane/afsplitter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'afsplitter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install afsplitter

Using the FFI version requires the `libafsplit.so` AFSPlitter library to
be installed in the system's library search path (typically in the `/usr/lib`
directory) but it is not included in this package.

The library source code can be [downloaded][4] from the [official website][1]
or from Git:

    $ git clone https://github.com/johnlane/libafsplit

To build the library

    $ cd libafsplit
    $ make
    $ cp libafsplit.so $GEM_HOME...

The official version is [AFsplitter-0.1.tar.bz2][4] ( SHA1: baf2857b3c87f369a36a67bb8603a6c417eba43e)

**Note:** the official version's `Makefile` only builds a stand-alone test executable; it does not
build the `libafsplit.so` library. The [Makefile][6] in the Git [repository][5] builds the
shared library, however.

## Usage

For the FFI implementation

    require 'afsplitter_ffi'

For the Ruby implementation:

    require 'afsplitter'

Then, to split

    str_split  = Afsplitter.split(str, iterations)

And to merge:

    str_merged = Afsplitter.merge(str_split, iterations)

Which should result in

    str_merged == str

Refer to the tests in the `test` subdirectory for working examples.

## Tests

There are two tests:

* `test_afsplitter.rb` split and merge test using the native Ruby implementation.
* `test_afsplitter_ffi.rb` split and merge test using the `libafsplit.so` FFI implementation.

To run all tests

    $ rake

To run individual tests

    $ rake native
    $ rake ffi

## License

MIT License: see the `LICENSE.txt` file.

The `libafsplit.so` library is licensed as described on its [web site][4].

## Contributing

1. Fork it ( https://github.com/johnlane/afsplitter )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[1]:http://clemens.endorphin.org/AFsplitter
[2]:https://code.google.com/p/cryptsetup
[3]:https://github.com/ffi/ffi "Foreign Function Interface"
[4]:http://clemens.endorphin.org/AFsplitter-0.1.tar.bz2 "AFsplitter-0.1.tar.bz2"
[5]:https://github.com/johnlane/libafsplit
[6]:https://raw.githubusercontent.com/johnlane/libafsplit/master/Makefile "Makefile"
