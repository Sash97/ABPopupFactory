Pod::Spec.new do |spec|
  spec.name         = "ABPopupFactory"
  spec.version      = "1.0.0"
  spec.summary      = "This is a simple way to achieve a nice popup perfomance in app."
  spec.description  = "ABPopupFactory helps you to get a nice popup view for your ios applications."
  spec.homepage     = "https://github.com/Sash97/ABPopupFactory"
  spec.license      = "MIT"
  spec.author             = { "Aleksandr" => "bagdasaryanaleksandr97@mail.ru" }
  spec.social_media_url   = "https://www.facebook.com/bagdasaryan22"
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/Sash97/ABPopupFactory.git", :tag => "1.0.0" }
  
  spec.swift_versions = "5.0"
  spec.source_files = 'ABPopupFactory/**/*.{swift,c,h,m,xib,xcassets}'
  spec.resource_bundles = {
    'ABPopupFactory' => ['ABPopupFactory/**/*.{xib,xcassets}']
  }
 
end
