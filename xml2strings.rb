require "rexml/document"

output = "./output.strings"

# no input
input = ARGV[0]
if input.nil? || input.empty?
	printf("No input file.\n")
	exit(0)
end

# check if file is exist
file = input
if !File.exist?(file)
	printf("No file exist.\n")
	exit(0)
end

dictionary = Hash.new

# convert xml
doc = REXML::Document.new(File.new(file))
doc.elements.each("resources/string") do |element|
	dictionary[element.attributes["name"]] = element.text
end


File.open(output, "w") { |file|
	file.print("\n")
	dictionary.each { |key, value|
		stored_value = value.strip
		if stored_value.start_with?("\"") && stored_value.end_with?("\"")
			stored_value = stored_value.slice(1..-1)
			stored_value = stored_value.chop
		end
		file.printf("\"%s\" = \"%s\";\n\n", key, stored_value)
	}
}

