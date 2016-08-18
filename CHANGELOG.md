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
