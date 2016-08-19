# [WIP] ABBYY::Cloud

[![Gem Version](https://img.shields.io/gem/v/abbyy-cloud.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/abbyy-cloud/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/abbyy-cloud.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/abbyy-cloud.svg?style=flat)][codeclimate]
[![Inline docs](http://inch-ci.org/github/nepalez/abbyy-cloud.svg)][inch]

JSON HTTP client to the [ABBYY Cloud API][abbyy-api].

## Setup

The library is available as a gem `abbyy-cloud`.

## Usage

Initialize the client with a corresponding credentials:

```ruby
require "abbyy/cloud"

CLIENT = ABBYY::Cloud.new(id: "foo", token: "bar")
```

The only supported API version is `0`. By default the translation engine is set to "Sandbox".

You can set these options explicitly:

```ruby
CLIENT = ABBYY::Cloud.new id:      "foo",
                          token:   "bar",
                          engine:  "Sandbox", # default engine for translations
                          version: 0          # the only supported version
```

### Machine Translations

#### Engines

See [the specification](https://api.abbyy.cloud/swagger/ui/index#!/MachineTranslation)

```ruby
result = CLIENT.mt.engines
# => [#<ABBYY::Cloud::Models::Engine @name="Sandbox">]
```

#### Engine

This operation is built on top of the previous one and simply takes settings for the specified engine:

```ruby
result = CLIENT.mt.engine("Sandbox")

result.class                  # => ABBYY::Cloud::Models::Engine
result.name                   # => "Sandbox"
result.languages              # => ["en", "ru"]
result.translation_directions # => [#<ABBYY::Cloud::Models::Direction source: "en", target: "ru">]
result.to_h
# => { name: "Sandbox", languages: ["en", "ru"], translation_directions: [{ source: "en", target: "ru" }] }
```

### Orders

#### Instant Translation

See [the specification](https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_Translate).

```ruby
result = CLIENT.orders.translate("To be or not to be", from: :en, to: :ru)

result.class       # => ABBYY::Cloud::Models::Translation
result.translation # => "Быть или не быть"
result.id          # => "2832934"
result.to_h        # => { id: "2832934", translation: "Быть или не быть" }
```

You can specify an engine (different from default):

```ruby
CLIENT.orders.translate("To be or not to be", from: :en, to: :ru, engine: "Bing")
```

The method raises an exception in case the cloud responded with error.

```ruby
error = \
  begin
    CLIENT.orders.translate("To be or not to be")
  rescue ABBYY::Cloud::Error => error
    error
  end

error.class  # => ABBYY::Cloud::ResponceError
error.status # => 400
```

The exception carries returned error model in its `#data` attribute:

```ruby
error.data   # => ABBYY::Cloud::Models::Error
error.data.to_h
# => {
#   model_state: {},
#   requiest_id: "string",
#   error: "error message",
#   error_description: "some details"
# }

error.data.error # => "error message"
# etc.
```

## Compatibility

[WIP] Compatible to [ABBYY Cloud API v.0][abbyy-api].

Tested under [rubies compatible to MRI 2.3+][rubies] using [RSpec][rspec] 3.0+.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[abbyy-api]: https://api.abbyy.cloud/swagger/ui/index
[codeclimate]: https://codeclimate.com/github/nepalez/abbyy-cloud
[gem]: https://rubygems.org/gems/abbyy-cloud
[gemnasium]: https://gemnasium.com/nepalez/abbyy-cloud
[github]: https://github.com/nepalez/abbyy-cloud
[inch]: https://inch-ci.org/github/nepalez/abbyy-cloud
[rspec]: http://rspec.info/
[rubies]: .travis.yml
[travis]: https://travis-ci.org/nepalez/abbyy-cloud
