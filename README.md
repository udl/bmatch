# bmatch

[![Build
Status](https://semaphoreci.com/api/v1/projects/d08731e1-78d1-4bfa-9cd5-3789d02e369d/558462/badge.svg)](https://semaphoreci.com/udo-groebner/bmatch)

Approximate string matching library (with native bindings)

Inspired by
* http://blog.paracode.com/2015/08/28/ruby-and-go-sitting-in-a-tree/
* https://github.com/flori/amatch
* https://blog.jcoglan.com/2012/07/29/your-first-ruby-native-extension-c/
* http://yorickpeterse.com/articles/hacking-extconf-rb/

Levenshtein implementation taken from: https://github.com/arbovm/levenshtein

## Why

Because amatch unfortunately produces segfaults. I hope golang-to-C doesn't do that.

## Usage

```ruby
  require 'bmatch/similarities'
  Similarities.levenshtein_distance("aa", "aü")
  Similarities.dice_similarity("night", "nacht")
```

## Contributing

Just send me a github pull request.

