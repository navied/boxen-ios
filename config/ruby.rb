class { 'ruby::global':
    version => '2.0.0-p481'
}

# ensure a gem is installed for all ruby versions
  ruby_gem { 'cocoapods':
  gem          => 'cocoapods',
  version      => '~> 0.33.1',
  ruby_version => '*',
  }

