Gem::Specification.new do |s|
  s.name = %q{black_berry_push}
  s.version = "0.0.2"
  s.authors     = ["Pinak Thakkar"]
  s.email       = 'pinak.0605@gmail.com'
  s.date = %q{2015-01-29}
  s.summary = %q{Usefull for sending push notification to blackberry devices}
  s.files = [
    "lib/push.rb"
  ]
  s.require_paths = ["lib"]
  s.add_dependency('rest-client', '~> 1.7.2')
end
