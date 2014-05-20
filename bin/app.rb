#!/usr/bin/env ruby
## encoding: utf-8

require_relative '../support/app.rb'

def gh_issue
  @gh_issue ||= GithubIssue.new
end

def issue_count
  gh_issue.get_count
end

def arduino_client
  @arduino_client ||= ArduinoClient.new
end

begin
  loop do
    @count = issue_count if @count.nil?
    if issue_count > @count
      arduino_client.run_alert
      @count = issue_count
    end
    sleep(10)
  end
rescue => e
  puts "Error withe #{e}"
  retry
end
