# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_route_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "js_route_helpers"
  spec.version       = JsRouteHelpers::VERSION
  spec.authors       = ["Jordan Stephens"]
  spec.email         = ["iam@jordanstephens.net"]

  spec.summary       = %q{Use Rails route helpers in your javascript}
  spec.description   = %q{Use Rails route helpers in your javascript}
  spec.homepage      = "http://github.com/jordanstephens/js_route_helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "railties", ">= 3.1"
end
