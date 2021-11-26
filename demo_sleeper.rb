#!/usr/bin/env ruby

require "async"

start_time = Time.now
puts "before"

Async do |task|
  task.async do
    puts "first inside"
  end

  task.async do
    `sleep 2`
  end

  10000.times do
    task.async do
      sleep 2
    end
  end

  task.async do
    puts "last inside"
  end
end

puts "Duration: #{Time.now - start_time}"
