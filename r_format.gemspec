# frozen_string_literal: true

require_relative "lib/r_format/version"

Gem::Specification.new do |spec|
  spec.name = "r_format"
  spec.version = RFormat::VERSION
  spec.authors = ["fujitani sora"]
  spec.email = ["fujitanisora0414@gmail.com"]

  spec.summary = "Ruby Formatter impl Rust lang."
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://github.com/fs0414/r_format"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.required_rubygems_version = ">= 3.3.11"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fs0414/r_format"
    spec.metadata["changelog_uri"] = "https://github.com/fs0414/r_format/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/r_format/extconf.rb"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "rb_sys", "~> 0.9.91"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.files = Dir[
    "lib/**/*",
    "ext/**/*.{rb,rs,toml}",
    "Cargo.toml",
    "Cargo.lock",
    "README.md",
    "LICENSE.txt",
    "CHANGELOG.md"
  ]
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/r_format/extconf.rb"]
end
