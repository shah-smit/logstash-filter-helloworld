# encoding: utf-8
require "logstash/filters/base"

# This  filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::Helloworld < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "HelloWorld"

  # Replace the message with this value.
  config :message, :validate => :string, :default => "This is default!"


  public

  def register
    # Add instance variables
  end

  # def register

  public

  def filter(event)

    if @message.downcase =~ /#{"hello|world"}/
      # Replace the event message with our message as configured in the
      # config file.
      event.set("type", "hello-world")
      event.set("message", @message)
    else
      message = event.get("message").to_s
      if message && message.downcase =~ /#{"hello|world"}/
        event.set("type", "hello-world")
        event.set("message", message)
      end
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end

  # def filter
end

# class LogStash::Filters::Helloworld
