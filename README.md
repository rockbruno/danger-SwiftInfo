# danger-SwiftInfo

A [Danger](http://danger.systems/) plugin that runs and prints [SwiftInfo](https://github.com/rockbruno/SwiftInfo) results to pull requests.

Requires SwiftInfo 2.3.1 or newer.

### How does it look?

You can make a Dangerfile that looks through PR metadata, it's fully typed.

<img src="https://i.imgur.com/8kvEx5O.png">

### Installation

Just add the gem to your Gemfile:

```ruby
gem 'danger-SwiftInfo'
```

### Usage

To use this plugin, you need to modify both your Dangerfile and your SwiftInfo's Infofile.

#### Dangerfile

Call `swiftinfo.run` passing the path to your SwiftInfo binary. (inside `Pods` if using CocoaPods, or just `swiftinfo` if Homebrew was used)

```ruby
swiftinfo.run './Pods/SwiftInfo/bin/swiftinfo'
```

#### Infofile

To print the final output to Danger, call `api.print(output)`.

Note that when ran from this plugin, SwiftInfo will be executed with the `-pullRequest -s` arguments which can be inspected and used as a condition. This logic is abstracted under a `isInPullRequestMode` boolean.

```swift
if isInPullRequestMode {
	// The specific Danger flow
    api.print(output: output)
} else {
	// The regular release flow
    api.sendToSlack(output: output, webhookUrl: url)
    api.save(output: output)
}
```

### Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
