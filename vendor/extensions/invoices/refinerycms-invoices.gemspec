# Encoding: UTF-8

Gem::Specification.new do |s|
  s.authors           = 'pc'
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-invoices'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Invoices extension for Refinery CMS'
  s.date              = '2017-10-03'
  s.summary           = 'Invoices extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.3'
end