# frozen_string_literal: true

require_relative "r_format/version"
require_relative "r_format/r_format"

module RFormat
  class Error < StandardError; end
  def self.format(source)
    format_code(source)
  end

  def self.format_file(path)
    source = File.read(path)
    formatted = format(source)
    formatted
  end

  def self.version_info
    "Ruby: #{VERSION}, Rust: #{rust_version}"
  end
end
