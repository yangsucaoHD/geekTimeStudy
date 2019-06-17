# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# https://github.com/tbl00c/ZZFLEX
# https://github.com/AllenSWB/WBNetwork
# https://github.com/Jacky-An/JKAlertX
# https://github.com/b52/OMPromises

target 'geekTimeStudy' do
    pod 'Masonry'
    pod 'AFNetworking', "~> 3.0"
    pod 'Alamofire'
    pod 'JKAlertX'
    pod 'WBNetwork'
    pod 'OMPromises', '~> 0.8.1'
    pod 'ReactiveCocoa', '2.1.8'
    pod 'PromiseKit', '~> 6.8'
    pod 'Kingfisher'
    #链接问题，项目根本就无法编译了,需要手动安装 PromiseKit
    
#    pod 'ZZFLEX', :git => 'https://github.com/tbl00c/ZZFLEX.git'


  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for geekTimeStudy
  
  
  #Flutter工程路径
  flutter_application_path = '/Developer/极客/geekTimeStudy/flutter_module'
  #读取 podhelper.rb 的Ruby代码在当前目录执行
  eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
  

  target 'geekTimeStudyTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'geekTimeStudyUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
