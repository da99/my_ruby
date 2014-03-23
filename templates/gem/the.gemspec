# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "${name}"
  spec.version       = `cat VERSION`
  spec.authors       = ["${user}"]
  spec.email         = ["${email}"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{
    TODO: Write a longer description. Optional.
  }
  spec.homepage      = "${homepage}"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bacon"
  spec.add_development_dependency "Bacon_Colored"
end
