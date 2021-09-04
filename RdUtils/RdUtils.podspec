Pod::Spec.new do |s|

  s.name         = "RondoUtils"
  s.version      = "0.1.0"
  s.summary      = "It is my layout file base on Masonry."

  s.authors     = { 'Rondo' => 'f624728887@163.com' }

  s.homepage     = "https://github.com/f624728887/RdUtils"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.platform = :ios, '10.0'
  s.requires_arc = true

  s.source       = { :git => "https://github.com/f624728887/RdUtils.git", :tag => s.version.to_s }
  s.source_files  = "RdUtils/RdUtils/RondoUtils/*.{h,m}"

  s.framework  = "UIKit", "Foundation"
  s.dependency "Masonry"
  s.dependency "SDWebImage"

end
