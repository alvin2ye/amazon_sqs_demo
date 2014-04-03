require 'rubygems'
require 'aws-sdk'
require "yaml"

config = YAML.load_file "config.yml"

sqs = AWS::SQS.new(
  :access_key_id => config["aws"]["access_key_id"],
  :secret_access_key => config["aws"]["secret_access_key"])

url = "https://sqs.ap-northeast-1.amazonaws.com/335799408313/baodao"
baodao_queue = sqs.queues[url]

while 1 do
  if m =  baodao_queue.receive_message
    p [m.id, m.body]
  end
  sleep 1
end