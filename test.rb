require 'rfmt'

# バージョン確認
puts "rfmt version: #{Rfmt::VERSION}"

# コードフォーマットのテスト
code = <<~RUBY
  class MyClass
  def hello
  puts "Hello, World!"
  end
  end
RUBY

formatted = Rfmt.format(code)
puts "Formatted code:"
puts formatted
