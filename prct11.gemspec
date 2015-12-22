# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct11/version'

Gem::Specification.new do |spec|
  spec.name          = "prct11"
  spec.version       = Prct11::VERSION
  spec.authors       = ["Germán Méndez"]
  spec.email         = ["gcpmendez@gmail.com"]

  spec.summary       = %q{DSL of Bibliography}
  spec.description   = %q{Lenguaje de dominio especifico de una Biblioteca de libros (revistas, periodicos, libros,...)}
  spec.homepage      = "https://github.com/gcpmendez/prct11"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "sourcify"
  spec.add_development_dependency "ruby2ruby"
  
end
