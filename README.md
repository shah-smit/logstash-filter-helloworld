# Hello World Logstash Plugin

[![Build Status](https://travis-ci.org/shah-smit/logstash-filter-helloworld.svg?branch=main)](https://travis-ci.org/shah-smit/logstash-filter-helloworld)

This is a plugin for [Logstash](https://github.com/elastic/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Documentation

HelloWorld plugin a simple logstash-plugin

if a message consists, hello or world, and it will add a type in the message called `hello-world`

## Developing

### 1. Plugin Developement and Testing

#### Code
- To get started, you'll need JRuby with the Bundler gem installed.

- Create a new plugin or clone and existing from the GitHub [logstash-plugins](https://github.com/logstash-plugins) organization. We also provide [example plugins](https://github.com/logstash-plugins?query=example).

- Install dependencies
```sh
bundle install
```

#### Test

- Update your dependencies

```sh
bundle install
```

- Run tests

```sh
bundle exec rspec
```

### 2. Running your unpublished Plugin in Logstash

#### 2.1 Run in a local Logstash clone

- Edit Logstash `Gemfile` and add the local plugin path, for example:
```ruby
gem "logstash-filter-awesome", :path => "/your/local/logstash-filter-awesome"
```
- Install plugin
```sh
bin/logstash-plugin install --no-verify
```
- Run Logstash with your plugin
```sh
bin/logstash -e 'filter {HelloWorld { message => "this is a hello text" }}'
```
At this point any modifications to the plugin code will be applied to this local Logstash setup. After modifying the plugin, simply rerun Logstash.

#### 2.2 Run in an installed Logstash

You can use the same **2.1** method to run your plugin in an installed Logstash by editing its `Gemfile` and pointing the `:path` to your local plugin development directory or you can build the gem and install it using:

- Build your plugin gem
```sh
gem build logstash-filter-HelloWorld.gemspec
```
- Install the plugin from the Logstash home
```sh
bin/logstash-plugin install /your/local/plugin/logstash-filter-HelloWorld-0.1.0.gem
```
- Start Logstash and proceed to test the plugin

## Contributing

@shah-smit

### Resources:

- [new filter plugin](https://www.elastic.co/guide/en/logstash/current/filter-new-plugin.html)
- [new input plugin](https://www.elastic.co/guide/en/logstash/current/input-new-plugin.html)
- [Generate new plugin](https://www.elastic.co/guide/en/logstash/current/plugin-generator.html)
- [Plugin Management](https://www.elastic.co/guide/en/logstash/current/working-with-plugins.html)
- [(Added other logstash plugin as a dependency](https://github.com/logstash-plugins/logstash-filter-mutate/blob/master/logstash-filter-mutate.gemspec)
- [`stdin { }`](https://www.elastic.co/guide/en/logstash/current/config-examples.html)
- [Setting up RubyGems Package on Github](https://docs.github.com/en/free-pro-team@latest/packages/using-github-packages-with-your-projects-ecosystem/configuring-rubygems-for-use-with-github-packages#authenticating-to-github-packages)

