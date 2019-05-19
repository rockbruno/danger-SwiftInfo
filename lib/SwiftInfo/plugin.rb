require "open3"

module Danger
  # This is your plugin class. Any attributes or methods you expose here will
  # be available from within your Dangerfile.
  #
  # To be published on the Danger plugins site, you will need to have
  # the public interface documented. Danger uses [YARD](http://yardoc.org/)
  # for generating documentation from your plugin source, and you can verify
  # by running `danger plugins lint` or `bundle exec rake spec`.
  #
  # You should replace these comments with a public description of your library.
  #
  # @example Ensure people are well warned about merging on Mondays
  #
  #          my_plugin.warn_on_mondays
  #
  # @see  Bruno Rocha/danger-SwiftInfo
  # @tags monday, weekends, time, rattata
  #
  class DangerSwiftinfo < Plugin
    # A method that you can call from your Dangerfile
    # @return   [Array<String>]
    #
    def report(path)
      stdout, stderr, status = Open3.capture3(path + " -pullRequest")
      message(stdout)
    end
  end
end
