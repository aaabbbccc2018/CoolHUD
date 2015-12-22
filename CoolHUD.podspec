
Pod::Spec.new do |s|
  s.name         = "CoolHUD"
  s.version      = "0.0.1"
  s.summary      = "Cool Loading Animation"
  s.description  = "Cool Loading Animation written by swift "
  s.license      = "MIT"
  s.author       = { "Legendry" => "czqasn_6@163.com" }
  s.homepage     = "https://github.com/czqasngit/CoolLoading"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/czqasngit/CoolLoading.git", :tag => "0.0.1" }
  s.source_files = "Core/*"
   s.requires_arc  = true
  s.frameworks = 'Foundation', 'UIKit'
end
