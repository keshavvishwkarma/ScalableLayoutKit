Pod::Spec.new do |s|
  s.name      = 'ScalableLayoutKit'
  s.version   = '1.0'
  s.summary   = 'A lightweight, pure-Swift library for scaling the conetent across any screen size to make consistent UI.'
  s.homepage  = 'https://github.com/keshavvishwkarma/ScalableLayoutKit'
  s.license   = { :type => 'MIT', :file => 'LICENSE' }
  s.author    = { 'keshavvishwkarma' => 'keshavvbe@gmail.com' }
  s.source    = { :git => 'https://github.com/keshavvishwkarma/ScalableLayoutKit.git', :tag => s.version.to_s }

  s.ios.deployment_target  = '8.0'
  s.source_files = 'Sources/*.swift'
  
end
