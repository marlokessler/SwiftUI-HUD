Pod::Spec.new do |spec|

  spec.name         = "CAHUD"
  spec.version      = "1.2.0"
  spec.summary      = "A beautiful HUD purely written in SwiftUI. Includes success, failure, info waiting and progress mode."
  spec.homepage     = "https://github.com/Connapptivity/SwiftUI-HUD"

  spec.license      = { :type => "Restricted", :file => "LICENSE" }

  spec.author       = { "Marlo Kessler" => "marlo.kessler@connapptivity.de" }

  spec.ios.deployment_target     = "13.0"
  spec.osx.deployment_target     = "10.15"
  spec.watchos.deployment_target = "6.0"
  spec.tvos.deployment_target    = "13.0"

  spec.source = { :git => "https://github.com/Connapptivity/SwiftUI-HUD.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "Sources", "Sources/**/*.{swift}"
  spec.exclude_files = "Sources/Exclude"
  
  spec.framework  = "Foundation"
  
  spec.swift_version = "5.2"
  
  spec.dependency "Indicators"
  
end
