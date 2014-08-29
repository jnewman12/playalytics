# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "meta-spotify"
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Nash"]
  s.date = "2014-04-21"
  s.description = "A ruby wrapper for the Spotify Metadata API.\n                         See https://developer.spotify.com/technologies/web-api/\n                         for API documentation."
  s.email = ["philnash@gmail.com"]
  s.homepage = "http://github.com/philnash/meta-spotify"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "A ruby wrapper for the Spotify Metadata API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["> 0.8"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.4"])
    else
      s.add_dependency(%q<httparty>, ["> 0.8"])
      s.add_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.4"])
    end
  else
    s.add_dependency(%q<httparty>, ["> 0.8"])
    s.add_dependency(%q<shoulda>, [">= 2.10.2"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.4"])
  end
end
