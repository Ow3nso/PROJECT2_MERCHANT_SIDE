Pod::Spec.new do |spec|
  spec.name         = 'auth_plugin'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/Lukhu-Product/dukastax_main'
  spec.authors      = { 'Jeffrey Owen' => 'jeffowen04@gmail.com' }
  spec.summary      = 'IOS BUILD'
  spec.source       = { :git => 'https://github.com/Lukhu-Product/dukastax_main.git', :tag => 'v3.1.0' }
  spec.source_files = 'Reachability.{h,m}'
  spec.framework    = 'SystemConfiguration'
end