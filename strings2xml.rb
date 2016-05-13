
output = "./output.xml"

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

pattern = /.*"(.*)" *= *"(.*)";.*/

dictionary = Hash.new

File.open(file, "r") { |opened_file|
	opened_file.each_line do |line|
		results = line.scan(pattern)
		for result in results do
			safeValue = result[1].gsub(/</, '&lt;').gsub(/>/, '&gt;')
			dictionary[result[0]] = safeValue
		end
	end
}

File.open(output, "w") { |file|
	file.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n")
	dictionary.each { |key, value|
		stored_value = value
		if stored_value.start_with?("\s") || stored_value.end_with?("\s") || stored_value.include?("'")
			stored_value = "\"" + stored_value + "\""
		end
#		stored_value = stored_value.gsub("<", "&lt;")
		file.printf("\t<string name=\"%s\">%s</string>\n", key, stored_value)
	}
	file.print("</resources>\n")
}

