#!/usr/bin/env ruby
arg_line = ARGV[0]
puts arg_line

if /x-mine:\/\/open\?(.*)/ =~ arg_line
  parts = $1.split("&")
  args = {}
  parts.each do |part|
    arg_pair = part.split("=", 2)
    puts arg_pair.inspect
    if arg_pair.size == 2
      args[arg_pair[0]] = arg_pair[1]
    end
  end
  if args["file"]
    command = "/usr/local/bin/mine"
    command += " --line #{args['line']}" if args['line']
    command += " #{args['file']}"
    exec command
  else
    puts "no file given"
    exit 1
  end
end