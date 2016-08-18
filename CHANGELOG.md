# [v0.0.3 2016-08-18](https://github.com/nepalez/abbyy-cloud/tree/v0.0.3)

### Bugs Fixed

* Fix version in root path to ABBYY Cloud API (nepalez)
* Fix validation of language names (nepalez)
* Allow ResponseError to take response with non-json body (nepalez)

### Added

* Operation `.mt.engines` (nepalez)

### Changed

* Remove validation of engine names (nepalez)

### Internal

* Add coverage to all models (nepalez)
* Add method `Types.register_type` for custom types (nepalez)

[Compare v0.0.2...v0.0.3](https://github.com/nepalez/abbyy-cloud/compare/v0.0.2...v0.0.3)

# [v0.0.2 2016-08-18](https://github.com/nepalez/abbyy-cloud/tree/v0.0.2)

### Changed

* Move `#translation` from root to `#orders` namespace (nepalez)

  Instead of `client.translation(*)` use `client.orders.translation(*)`

* Make `#translation` return model `ABBYY::Cloud::Models::Translation` instead of hash (nepalez)

### Internal

* Extract settings from root object and isolate them in the shareable container `ABBYY::Cloud::Settings` (nepalez)
* Add namespaces for operations (nepalez)
* Add models for objects returned by operations (nepalez)

[Compare v0.0.1...v0.0.2](https://github.com/nepalez/abbyy-cloud/compare/v0.0.1...v0.0.2)

# [v0.0.1 2016-08-16](https://github.com/nepalez/abbyy-cloud/tree/v0.0.1)

First public release
