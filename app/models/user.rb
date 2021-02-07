class User < ApplicationRecord
  include Registrable, Relationshipable, Feedable
end
