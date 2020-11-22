# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/HelloWorld"

describe LogStash::Filters::Helloworld do
  describe "if message in the helloworld plugin present then it should pick that" do
    let(:config) do <<-CONFIG
      filter {
        HelloWorld {
          message => "there is a world in the text"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject.get('message')).to eq('there is a world in the text')
      expect(subject.get('type')).to eq("hello-world")
    end
  end

  describe "if message in the helloworld plugin not present then it should pick message from input" do
    let(:config) do <<-CONFIG
      filter {
        HelloWorld {
        }
      }
    CONFIG
    end

    sample("message" => "there is a hello text here") do
      expect(subject).to include("message")
      expect(subject.get('message')).to eq('there is a hello text here')
      expect(subject.get('type')).to eq("hello-world")
    end
  end

  describe "if no hello or world in the text anywhere shouldnot have a type" do
    let(:config) do <<-CONFIG
      filter {
        HelloWorld {
        }
      }
    CONFIG
    end

    sample("message" => "some other value") do
      expect(subject.get('type')).to eq(nil)
    end
  end
end
