require "open3"

module Danger
    # Runs SwiftInfo and prints the results to the pull request.
    # You must have [SwiftInfo](https://github.com/rockbruno/SwiftInfo) installed
    # somewhere in your project.
    # You can detect that SwiftInfo is running specifically for Danger
    # by adding a `if isInPullRequestMode` condition in your Infofile.
    # You can use it to extract different rules and prevent saving the new output.
    # @example Run SwiftInfo
    #
    #          SwiftInfo.run './Pods/SwiftInfo/bin/swiftinfo'
    #
    # @see  Bruno Rocha/danger-SwiftInfo
    # @tags swift, xcode, swiftinfo, ios
    #
    class DangerSwiftInfo < Plugin
        # Run SwiftInfo and print the results to the PR.
        # @param    [String] path Path to the SwiftInfo binary.
        # @return   [void]
        #
        def run(path)
            stdout, stderr, status = Open3.capture3(path + " -pullRequest -s")
            message(stdout)
        end

        def self.instance_name
            "swiftinfo"
        end
    end
end
