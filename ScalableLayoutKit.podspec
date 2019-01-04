Pod::Spec.new do |s|
  s.name      = "ScalableLayoutKit"
  s.version   = "1.1"
  s.summary   = "A lightweight, pure-Swift library for scaling the consistent across any screen size to make consistent UI."
  s.homepage  = "https://github.com/keshavvishwkarma/ScalableLayoutKit"

  s.license   = { :type => "MIT", :file => "LICENSE" }
  s.author    = { "keshavvishwkarma" => "keshavvbe@gmail.com" }

  s.swift_version = "4.2"

  s.ios.deployment_target  = "8.0"
  s.source    = { :git => "https://github.com/keshavvishwkarma/ScalableLayoutKit.git", :tag => s.version }
  s.source_files = "Sources/*.{swift}"
  
  s.framework = "UIKit"
  s.requires_arc = true
  
end

