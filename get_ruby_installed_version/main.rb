# The script will get your machine version of Ruby installed.


installed_ruby_version = []

ENV["Path"].split(";").uniq!.each do |item|
  if File.exist? item + "\\ruby.exe"

    # Set the GBK character set
    output = `chcp 936 & #{item + "\\ruby.exe"} -v`
    out_str_contains_version = output.encode(Encoding.find("UTF-8"), Encoding.find("GBK"))

    if out_str_contains_version.include? 'ruby'
      # Start with the "ruby" slice
      index = out_str_contains_version.index 'ruby'
      out_str_contains_version = out_str_contains_version[index..-1]
      arr = out_str_contains_version.split ' '

      installed_ruby_version.append arr[0] + ' ' + arr[1]
    end
  end
end

puts "Your machine installed ruby version：" + installed_ruby_version.to_s if installed_ruby_version.count > 0
