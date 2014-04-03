require 'rubygems'
require 'aws-sdk'
require "yaml"

config = YAML.load_file "config.yml"

sqs = AWS::SQS.new(
  :access_key_id => config["aws"]["access_key_id"],
  :secret_access_key => config["aws"]["secret_access_key"]

url = "https://sqs.ap-northeast-1.amazonaws.com/335799408313/baodao"
baodao_queue = sqs.queues[url]

5.times {
  baodao_queue.send_message((Time.now.to_f * 10000).to_s)
}