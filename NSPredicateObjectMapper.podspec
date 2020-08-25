#
# Be sure to run `pod lib lint NSPredicateObjectMapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSPredicateObjectMapper'
  s.version          = '1.0.0'
  s.summary          = 'A short description of NSPredicateObjectMapper.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Writing magic strings of NSPredicate is not optimal, I've wanted the same experience from Core Data as for example C# has from LINQ in EntityFramework. Objective access guards types you can or can't operate with, suggests only relevant operation choices after every request in the chain and of course removes a possibility of typos. Framework is lightweight, written in Swift and well documented.
                       DESC

  s.homepage         = 'https://github.com/PisinO/NSPredicateObjectMapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ondřej Pišín' => 'ondrej.pisin@gmail.com' }
  s.source           = { :git => 'https://github.com/PisinO/NSPredicateObjectMapper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Pisin_O'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NSPredicateObjectMapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NSPredicateObjectMapper' => ['NSPredicateObjectMapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
