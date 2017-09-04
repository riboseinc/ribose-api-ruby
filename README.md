# Ribose

[![Build
Status](https://travis-ci.org/riboseinc/ribose-ruby.svg?branch=master)](https://travis-ci.org/riboseinc/ribose-ruby)
[![Code
Climate](https://codeclimate.com/github/riboseinc/ribose-ruby/badges/gpa.svg)](https://codeclimate.com/github/riboseinc/ribose-ruby)

The Ruby Interface to the Ribose API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "ribose"
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install ribose
```

## Configure

We need to setup Ribose API configuration before we can perform any request
throughout this client, and to request an API Key please contact Ribose Inc.
Once you have your API key then you can configure it by adding an initializer
with the following code

```ruby
Ribose.configure do |config|
  config.api_token = "SECRET_API_TOKEN"
  config.user_email = "your-email@example.com"

  # There are also some default configurations, normally you do not need to
  # change those unless you have some very specific use case scenario.
  #
  # config.debug_mode = false
  # config.api_host = "www.ribose.com"
end
```

Or

```ruby
Ribose.configuration.api_token = "SECRET_API_TOKEN"
Ribose.configuration.user_email = "your-email@example.com"
```

## Usage

### App Data

Ribose API provides an easier way to retrieve the list of App data, and to
retrieve the list of app data we can use the `AppData.all` interface.

```ruby
Ribose::AppData.all
```

### App Relation

#### List app relations

To retrieve the list of app relations we can use the `AppRelation.all` interface

```ruby
Ribose::AppRelation.all
```

#### Fetch an app relation

To retrieve the details for a specific app relation, we can use the following
interface

```ruby
Ribose::AppRelation.fetch(app_relation_id)
```

### Settings

#### List user's settings

To list user's settings we can use the `Setting.all` interface, and it will
return all of the user's settings.

```ruby
Ribose::Setting.all
```

#### Fetch a setting

To fetch the details for any specific settings we can use the `Setting.fetch`
interface and it will return the details for that setting.

```ruby
Ribose::Setting.fetch(setting_id)
```

### Spaces

#### List user's spaces

To list user's spaces we can use the `Space.all` interface, and it will retrieve
all of the spaces for the currently configured user.

```ruby
Ribose::Space.all
```

#### Fetch a user space

To retrieve the details for a space we can use the `Space.fetch(space_id)`.

```ruby
Ribose::Space.fetch(space_id)
```

#### Create a user space

To create a new user space we can use

```ruby
Ribose::Space.create(
  access: "private",
  space_category_id: 12,
  name: "The amazing Ribose Space",
  description: "Description about your space"
)
```

#### Remove a user space

To remove an existing space and we can use the following interface

```ruby
Ribose::Space.remove(space_uuid, confirmation: true)
```

### Members

The members endpoint are space specific, to retrieve the member details under
any specific space we can use this interface.

### List of Members

To retrieve the list of members, we can use the following interface.

```ruby
Ribose::Member.all(space_id, options)
```

### Files

#### List of Files

To retrieves the files for any specific space we can use the following interface

```ruby
Ribose::SpaceFile.all(space_id, options)
```

### Conversations

#### Listing Space Conversations

```ruby
Ribose::Conversation.all(space_id, options = {})
```

#### Create A New Conversation

```ruby
Ribose::Conversation.create(
  space_id, name: "Sample conversation", tag_list: "sample, conversation"
)
```

#### Remove A Conversation

```ruby
Ribose::Conversation.remove(space_id: "space_id", conversation_id: "12345")
```

### Message

#### List Conversation Messages

```ruby
Ribose::Message.all(space_id: space_uuid, conversation_id: conversation_uuid)
```

#### Create a new message

```ruby
Ribose::Message.create(
  space_id: space_uuid,
  conversation_id: conversation_uuid,
  contents: "Provide your message body here",
)
```

### Feeds

#### List user feeds

To retrieve the list of user feeds, we can use the `Feed.all` interface

```ruby
Ribose::Feed.all
```

### Widgets

#### List widgets

To retrieve the list of widgets we can use the `Widget.all` interface

```ruby
Ribose::Widget.all
```

### Stream

#### List of stream notifications

To retrieve the list of notifications we can use the `Stream.all` interface

```ruby
Ribose::Stream.all
```

### Leaderboard

#### Retrieve the current leadership board

To retrieve the current leadership board, we can use the `Leaderboard.all`
interface and it will return the details.

```ruby
Ribose::Leaderboard.all
```

### Connections

### List of connections

To retrieve the list of connections, we can use the `Connection.all` interface
and it will return the connection as `Sawyer::Resource`.

```ruby
Ribose::Connection.all
```

#### Connection suggestions

To retrieve the list of connection suggestions we can use the following
interface and it will retrieve the suggested users.

```ruby
Ribose::Connection.suggestions
```

### Calendar

#### List user calendars

To retrieve the list of user calendar, we can use the `Calendar.all` and it will
fetch the calendar details for the currently configured user.

```ruby
Ribose::Calendar.all
```

## Development

We are following Sandi Metz's Rules for this gem, you can read the
[description of the rules here][sandi-metz] All new code should follow these
rules. If you make changes in a pre-existing file that violates these rules you
should fix the violations as part of your contribution.

### Setup

Clone the repository.

```sh
git clone https://github.com/riboseinc/ribose-ruby
```

Setup your environment.

```sh
bin/setup
```

Run the test suite

```sh
bin/rspec
```

## Contributing

First, thank you for contributing! We love pull requests from everyone. By
participating in this project, you hereby grant [Ribose Inc.][riboseinc] the
right to grant or transfer an unlimited number of non exclusive licenses or
sub-licenses to third parties, under the copyright covering the contribution
to use the contribution by all means.

Here are a few technical guidelines to follow:

1. Open an [issue][issues] to discuss a new feature.
1. Write tests to support your new feature.
1. Make sure the entire test suite passes locally and on CI.
1. Open a Pull Request.
1. [Squash your commits][squash] after receiving feedback.
1. Party!

## Credits

This gem is developed, maintained and funded by [Ribose Inc.][riboseinc]

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[riboseinc]: https://www.ribose.com
[issues]: https://github.com/riboseinc/ribose-ruby/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature
[sandi-metz]: http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers
