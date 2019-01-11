Pod::Spec.new do |s|
  s.name         = 'MAGridView'
  s.version      = '0.2'
  s.summary      = 'A UIView subclass that layouts its subviews in a quilting pattern.'
  s.description  = <<-DESC
The library does nothing except calculating frames for "slots" inside a grid.
                   DESC
  s.homepage     = 'https://github.com/wacumov/GridView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { 'Mikhail Akopov' => 'mikhail.akopov.ios@gmail.com' }
  s.ios.deployment_target = '8.0'
  s.swift_version    = '4.2'
  s.source       = { :git => 'https://github.com/wacumov/GridView.git', :tag => s.version.to_s }
  s.source_files = 'GridView/**/*'
  s.exclude_files = 'GridView/**/*.{plist}'
end
