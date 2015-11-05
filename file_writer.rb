class FileWriter
  def write(output)
    to_file = ARGV[1]
    File.open(to_file, 'w') do |file|
      file.puts output
    end
    puts "Created '#{to_file}' containing #{output.length} characters."
  end
end
