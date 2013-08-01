#!/usr/bin/env ruby

#
# A simple script for quickly adding preformatted licenses to projects
#

# Your name to go into the license
$NAME = "Keith Smiley"

# Your website for the license
$WEBSITE = "http://keith.so"

# The filename to be written to. NO FILE EXTENSION
$FILE_NAME = "LICENSE"

require 'optparse'
require 'rubygems'

# `[sudo] gem install colored`
require 'colored'

def mit
  license_text = "Copyright (c) #{ Time.now.year } #{ $NAME } (#{ $WEBSITE })\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n"
end

def wtf
  license_text = "DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE\nVersion 2, December 2004\n\nCopyright (C) #{ Time.now.year } #{ $NAME } <#{ $WEBSITE }>\n\nEveryone is permitted to copy and distribute verbatim or modified copies of this license document, and changing it is allowed as long as the name is changed.\n\nDO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE\nTERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\n\n0. You just DO WHAT THE FUCK YOU WANT TO.\n"
end

def writeLicense(text)
  out_filename = $FILE_NAME
  filename_count = 0
  while File.exists?(out_filename)
    filename_count += 1
    out_filename = "#{ $FILE_NAME }#{ filename_count }"
  end

  out_file = File.new(out_filename, "w")
  if File.exists?(out_file)
    out_file.write(text)
    out_file.close()

    puts "Wrote the license to #{ out_filename }".green
  else
    puts "Couldn't write to: #{ out_filename }".red
  end
end

options = {}

opt_parse = OptionParser.new do |opts|
  opts.banner = "Usage: license.rb [options]"

  opts.on("-m", "--mit", "Use MIT License") do |v|
    writeLicense(mit)
    options[:mit] = v
  end

  opts.on("-w", "--wtf", "Use WTF License") do |v|
    writeLicense(wtf)
    options[:wtf] = v
  end
end

begin
  opt_parse.parse!
  if options.length < 1
    puts "#{ opt_parse }".red
    exit
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $!.to_s.red
  puts opt_parse
  exit
end
