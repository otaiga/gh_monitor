require 'yaml'
require 'erb'
module Configuration

  def load!(path)
    environment = ENV["ENVIRONMENT"] || 'development'
    YAML.load(ERB.new(File.read(path)).result)[environment]
  end

  def config
    @config ||= load!(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml'))
  end

end