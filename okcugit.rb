require_relative 'finder'
require_relative 'file_writer'

finder = OkCuGit::Finder.new(ARGV[0])

matches =  finder.get_match
puts matches

finder.change_dir_to_root

writer = FileWriter.new
if ARGV[1].end_with?('.txt')
  writer.write(matches.join("\n"))
else
  writer.write(matches.join(","))
end
