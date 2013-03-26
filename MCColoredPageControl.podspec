Pod::Spec.new do |s|
  s.name     = 'MCColoredPageControl'
  s.version  = '0.1.0'
  s.license  = 'BSD 3-Clause'
  s.summary  = 'Fully customizable alternative to UIPageControl.'
  s.homepage = 'https://github.com/mirego/MCColoredPageControl.iOS.git'
  s.authors  = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source   = { :git => 'https://github.com/mirego/MCColoredPageControl.iOS.git', :tag => '0.1.0' }
  s.source_files = 'MCColoredPageControl/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'QuartzCore'

  s.platform = :ios, '5.0'
end