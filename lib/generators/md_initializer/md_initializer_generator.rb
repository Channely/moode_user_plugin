# encoding: UTF-8
class MdInitializerGenerator < Rails::Generators::Base
  
  desc "Mount moode user plugin to app root"
  def mount_plugin_to_root
    route("mount MoodeUserPlugin::Engine, :at => '/'")
  end

  desc "Extract migrations"
  def extract_migration
    rake "moode_user_plugin:install:migrations"
  end

  desc "Add Plugin config initializer"
  def add_config_initializer
    initializer('moode_user_plugin.rb') do
      %q|# encoding: UTF-8
MoodeUserPlugin.sms_server_config = {
  :corp_id => "ZLJK00145",
  :pwd => "123456",
  :service_prefix => "http://U.wangxun360.com",
  :send_uri => "/WS/Send.aspx"
}
MoodeUserPlugin.verify_code_message_template = "您的注册码是:{code}, 欢迎使用该注册码进行注册。"
      |
    end
  end
end

