Pod::Spec.new do |s|
  s.name             = "MWHttpUnit"
  s.version          = "1.0.2"
  s.summary          = "A Unit of AFNetworking manager."
  s.description      = <<-DESC
    The Unit Use AFNetworking can be quickly integrated make network request component.
                       DESC

  s.homepage         = "https://coding.net/u/iliunian/p/MWHttpUnit/git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "liu nian" => "i19850511@gmail.com" }
  s.source           = { :git => "https://git.coding.net/iliunian/MWHttpUnit.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.ios.deployment_target = "9.0"
  s.requires_arc = true

  s.source_files = 'Pod/Classes/MWHTTPUnit.h'
  s.subspec 'CacheUnit' do |cu|
    cu.source_files = 'Pod/Classes/CacheUnit/*.{h,m}'
  end

  s.subspec 'HTTP' do |hp|
    hp.source_files = 'Pod/Classes/HTTP/*.{h,m}'
    hp.dependency 'AFNetworking'
  end

  s.subspec 'HTTPCacheUnit' do |hcu|
    hcu.source_files = 'Pod/Classes/HTTPCacheUnit/*.{h,m}'
    hcu.dependency 'MWHttpUnit/CacheUnit'
    hcu.dependency 'MWHttpUnit/HTTP'
    hcu.dependency 'MWHttpUnit/Extension'
  end

  s.subspec 'Extension' do |es|
    es.source_files = 'Pod/Classes/Extension/*.{h,m}'
  end

  s.public_header_files = 'Pod/Classes/MWHTTPUnit.h'
  s.frameworks = 'UIKit'
  s.dependency 'AFNetworking'
end
