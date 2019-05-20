require "open3"

module Danger
    # Runs SwiftInfo and prints the results to the pull request.
    # You must have [SwiftInfo](https://github.com/rockbruno/SwiftInfo) installed
    # somewhere in your project.
    # You can detect that SwiftInfo is running specifically for Danger
    # by adding a `if isInPullRequestMode` condition in your Infofile.
    # You can use this condition to extract different rules and prevent saving the new output.
    # @example Run SwiftInfo
    #
    #          swiftinfo.run './Pods/SwiftInfo/bin/swiftinfo'
    #
    # @see  rockbruno/danger-SwiftInfo
    # @tags swift, xcode, swiftinfo, ios
    #
    class DangerSwiftInfo < Plugin
        # Run SwiftInfo and print the results to the PR.
        # @param    [String] path Path to the SwiftInfo binary.
        # @return   [void]
        #
        def run(path)
            binPath = path
            output = `#{binPath} -pullRequest -s`
            html = output.sub("\n", "<br>")
            message(output)
        end

        def self.instance_name
            "swiftinfo"
        end
    end
end
