# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-notifications'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Notifications extension for Refinery CMS'
  s.date              = '2017-06-23'
  s.summary           = 'Notifications extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.authors           = 'pc'
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.3'
end
