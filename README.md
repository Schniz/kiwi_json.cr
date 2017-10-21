# Kiwi::JSON

In order to save and load typed objects from Kiwi stores,
`Kiwi::JSON` delegates another `Kiwi::Store` and provides an interface to use Kiwi stores with classes with `JSON.mapping`.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kiwi_json:
    github: Schniz/kiwi_json.cr
```

## Usage

```crystal
require "kiwi_json"

user = Person.from_json(...)
some_store = Kiwi::MemoryStore.new
json_store = Kiwi::JSON(Person).new(some_store)
json_store["user"] = user
json_store["user"] # => serialized <User:...>
```

## Contributing

1. Fork it ( https://github.com/Schniz/kiwi_json.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Schniz](https://github.com/Schniz) Gal Schlezinger - creator, maintainer
