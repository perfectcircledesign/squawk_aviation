# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.author            = 'perfetcirlce'
  s.name              = 'refinerycms-customers'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Customers extension for Refinery CMS'
  s.date              = '2012-04-11'
  s.summary           = 'Customers extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = 'Perfect Circle'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.3'
end
