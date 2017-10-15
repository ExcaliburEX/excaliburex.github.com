# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "柯摩"
  spec.version       = "0.5.2.1"
  spec.authors       = ["柯摩"]
  spec.email         = ["912011727@qq.com"]

  spec.summary       = "just jekyll blog"
  spec.homepage      = "https://github.com/ExcaliburEX/excaliburex.github.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets/css|assets/js|_layouts|_includes|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.5"
  spec.add_runtime_dependency 'jekyll-paginate', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
