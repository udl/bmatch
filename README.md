# bmatch

[![Build Status](https://travis-ci.org/udl/bmatch.svg)](https://travis-ci.org/udl/bmatch)
[![Gem Version](https://badge.fury.io/rb/bmatch.svg)](http://badge.fury.io/rb/bmatch)

Approximate string matching library (with native bindings)

Inspired by
* http://blog.paracode.com/2015/08/28/ruby-and-go-sitting-in-a-tree/
* https://github.com/flori/amatch
* https://blog.jcoglan.com/2012/07/29/your-first-ruby-native-extension-c/
* http://yorickpeterse.com/articles/hacking-extconf-rb/

Levenshtein implementation taken from: https://github.com/arbovm/levenshtein

## Why

Because amatch unfortunately produces segfaults. I hope golang-to-C doesn't do that.

## Issues

* The build keeps segfaulting on travis-ci after the tests were green.
  (see also
http://stackoverflow.com/questions/15879993/writing-a-ruby-extension-in-go-golang)

## Usage

```ruby
  require 'bmatch/similarities'
  Similarities.levenshtein_distance("aa", "aü")
  Similarities.dice_similarity("night", "nacht")
```

## Contributing

Just send me a github pull request.

