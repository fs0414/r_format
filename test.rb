require 'r_format'

# バージョン確認
puts "r_format version: #{RFormat::VERSION}"

# コードフォーマットのテスト
code = <<~RUBY
  class MyClass
  def hello
  puts "Hello, World!"
  end
  end
RUBY

formatted = RFormat.format(code)
puts "Formatted code:"
puts formatted
