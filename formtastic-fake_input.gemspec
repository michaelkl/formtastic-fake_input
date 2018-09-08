Gem::Specification.new do |s|
  s.name = %q{formtastic-fake_input}
  s.version = '0.0.2'

  s.authors = ['Michael Klimenko']
  s.date = '2018-09-08'
  s.email = 'm@klimenko.site'

  s.summary = 'Fake input class for Formtastic'
  s.description = <<~DESCRIPTION
  It generates `span` tags for data values instead of `input`s.

  This is useful when you need to show read-only value in the resource edit form
  using all regular input decorations, giving user a clear understanding of its
  "readonly-ness" and without the ability to pass its value in the form POST request.
  DESCRIPTION

  s.homepage = 'https://github.com/michaelkl/formtastic-fake_input'
  s.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  s.require_paths = ['lib']
  s.files = Dir['lib/*.rb'] + Dir['lib/**/*.rb'] + Dir["[A-Z]*"]

  s.add_dependency('formtastic', ['~> 3'])
end

