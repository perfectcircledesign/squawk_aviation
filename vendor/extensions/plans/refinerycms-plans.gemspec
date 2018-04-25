# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-plans'
  s.version           = '1.0'
  s.authors           = 'pc'
  s.description       = 'Ruby on Rails Plans extension for Refinery CMS'
  s.date              = '2017-07-07'
  s.summary           = 'Plans extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = 'Perfect Circle'

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.3'
end
