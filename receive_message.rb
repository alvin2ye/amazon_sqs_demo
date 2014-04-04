require 'rubygems'
require 'aws-sdk'
require "yaml"

config = YAML.load_file "config.yml"

sqs = AWS::SQS.new(
  :access_key_id => config["aws"]["access_key_id"],
  :secret_access_key => config["aws"]["secret_access_key"])

queue = sqs.queues[config["aws"]["url"]]

while 1 do
  if m =  queue.receive_message
    p [m.id, m.body]
  end
  sleep 1
end