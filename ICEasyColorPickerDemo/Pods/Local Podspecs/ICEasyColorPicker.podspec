Pod::Spec.new do |s|
  s.name         = "ICEasyColorPicker"
  s.version      = "0.0.1"
  s.summary      = "A short description of ICEasyColorPicker."
  s.homepage     = "https://github.com/i110/ICEasyColorPicker"
  s.license      = 'MIT (example)'
  s.author       = { "Ichito Nagata" => "i.nagata110@gmail.com" }
  s.source       = { :git => "https://github.com/i110/ICEasyColorPicker.git", :tag => "0.0.1" }
  s.platform     = :ios, '5.1'
  s.source_files = 'ICEasyColorPicker/**/*.{h,m}'
  s.resources    = "ICEasyColorPicker/Resources/*"
  s.requires_arc = true
  s.frameworks   = 'QuartzCore'
end
