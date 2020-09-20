#
# Be sure to run `pod lib lint NSPredicateObjectMapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSPredicateObjectMapper'
  s.version          = '1.1.0'
  s.summary          = 'Wrapper build above NSPredicate adding object access to NSManagedObjects and request chaining.'
  s.description      = <<-DESC
Writing magic strings of NSPredicate is not optimal, I've wanted the same experience from Core Data as for example C# has from LINQ in EntityFramework. Objective access guards types you can or can't operate with, suggests only relevant operation choices after every request in the chain and of course removes a possibility of typos. Framework is lightweight, written in Swift and well documented.
                       DESC

  s.homepage         = 'https://github.com/PisinO/NSPredicateObjectMapper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ondřej Pišín' => 'ondrej.pisin@gmail.com' }
  s.source           = { :git => 'https://github.com/PisinO/NSPredicateObjectMapper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Pisin_O'

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.3'

  s.source_files = 'NSPredicateObjectMapper/Classes/**/*'
end
