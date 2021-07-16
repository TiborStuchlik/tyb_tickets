require_relative "lib/tyb_tickets/version"

Gem::Specification.new do |spec|
  spec.name        = "tyb_tickets"
  spec.version     = TybTickets::VERSION
  spec.authors     = ["Tibor stuchlík"]
  spec.email       = ["tibor@seznam.cz"]
  spec.homepage    = "https://github.com/TiborStuchlik/tyb_tickets"
  spec.summary     = %q{Simple Ticket Util}
  spec.description = %q{problem solving from seznam.cz.}
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TiborStuchlik/tyb_tickets"
  spec.metadata["changelog_uri"] = "https://github.com/TiborStuchlik/tyb_tickets/wiki"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3"
end
