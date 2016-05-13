
# strings2xml-xml2strings
Scripts to convert .xml and .strings file for translated text each other.

## Usage

### strings2xml

```
ruby strings2xml.rb [converted_file_path]
```

### xml2strings

```
ruby xml2strings.rb [converted_file_path]
```

## Example

### strings2xml

#### converted strings file

```
"key1" = "value1";
"key2" = "value2";
"key3" = "  value3 ";
"key4" = "value4 I'm value4_sub";
"key5" = "value5 <b>value5_sub</b>";
"key6" = "value6 \"value6_sub\"";
```

#### result xml file

```
<?xml version="1.0" encoding="utf-8"?>
<resources>
	<string name="key1">value1</string>
	<string name="key2">value2</string>
	<string name="key3">"  value3 "</string>
	<string name="key4">"value4 I'm value4_sub"</string>
	<string name="key5">value5 &lt;b&gt;value5_sub&lt;/b&gt;</string>
	<string name="key6">value6 \"value6_sub\"</string>
</resources>
```

### xml2strings

#### converted xml file

```
<?xml version="1.0" encoding="utf-8"?>
<resources> 
	<string name="key1">value1</string>
	<string name="key2"> value2</string>
	<string name="key3">" value3 "</string>
	<string name="key4">value4 \"value4_sub\"</string>
</resources>
```

#### result strings file

```
"key1" = "value1";

"key2" = "value2";

"key3" = " value3 ";

"key4" = "value4 \"value4_sub\"";
```

## Caution
Scripts cannot convert ```%d``` and ```%1$d``` etc. . These must be replaced manually.
