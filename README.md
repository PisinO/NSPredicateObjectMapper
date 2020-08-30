# NSPredicateObjectMapper
>Wrapper build above NSPredicate adding object access to NSManagedObjects and request chaining.

![CI Status](https://github.com/PisinO/NSPredicateObjectMapper/workflows/CI/badge.svg)
![Codecov](https://img.shields.io/codecov/c/github/PisinO/NSPredicateObjectMapper)
[![Version](https://img.shields.io/cocoapods/v/NSPredicateObjectMapper.svg?style=flat)](https://cocoapods.org/pods/NSPredicateObjectMapper)
[![License](https://img.shields.io/cocoapods/l/NSPredicateObjectMapper.svg?style=flat)](https://cocoapods.org/pods/NSPredicateObjectMapper)
[![Platform](https://img.shields.io/cocoapods/p/NSPredicateObjectMapper.svg?style=flat)](https://cocoapods.org/pods/NSPredicateObjectMapper)

Writing magic strings of NSPredicate is not optimal, I've wanted the same experience from Core Data as for example C# has from LINQ in EntityFramework. Objective access guards types you can or can't operate with, suggests only relevant operation choices after every request in the chain and removes a possibility of typos. Framework is lightweight and well documented.

## Installation

NSPredicateObjectMapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NSPredicateObjectMapper'
```

## Usage example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Let's have an entity Car, with attributes id, brand, ...
I want to fetch all cars with brand starting with "s" case insensitive
```Swift
fetchRequest.predicate = NSPredicate(format: "brand BEGINSWITH[c] 's'")
```
and with object wrapper
```Swift
fetchRequest.predicate = Car.where(\Car.brand).beginsWith("s", caseInsensitive: true).predicate()
```
chain requests
```Swift
fetchRequest.predicate = Car.where(\Car.brand).beginsWith("s").and.where(\Car.brand).endsWith("a").predicate()
```

## Requirements
Swift >= 5.0

## Roadmap
- [x] CocoaPods distribution
- [ ] Support of SUBQUERIES (SUBQUERY(tasks, $task, $task.completionDate != nil AND $task.user = 'Alex') .@count > 0")
- [x] Support of array operations (array[index], array[FIRST], ...)
- [ ] Support of collection queries (@avg, @count, ...)

## Author

Ondřej Pišín, ondrej.pisin@gmail.com

## License

NSPredicateObjectMapper is available under the MIT license. See the LICENSE file for more info.
