require 'rubygems'
require 'aws-sdk'
require "yaml"

config = YAML.load_file "config.yml"

sqs = AWS::SQS.new(
  :access_key_id => config["aws"]["access_key_id"],
  :secret_access_key => config["aws"]["secret_access_key"])

queue = sqs.queues[config["aws"]["url"]]

2.times {
  queue.send_message((Time.now.to_f * 10000).to_s)
}
