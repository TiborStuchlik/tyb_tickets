class ApplicationRecord < ActiveRecord::Base
  include TybTickets::ActsAsUser

  self.abstract_class = true
end
