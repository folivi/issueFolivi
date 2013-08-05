# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'sugarcube-all'
require 'bundler'

Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'usingPMotion'
  app.frameworks << "QuartzCore"
  
  app.pods do
    pod 'PKRevealController'
    #pod 'SIAlertView'
    pod 'SDWebImage'
  end
  
end
