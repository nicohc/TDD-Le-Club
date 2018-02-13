class User < ApplicationRecord

validates :firstname, presence: true,
                   format: { with: /\A[a-zA-Z0-9_]*\z/ }
                   #RegExp du format name


validates :lastname, presence: true,
                  format: { with: /\A[a-zA-Z0-9_]*\z/ }
                  #RegExp du format name

EMAIL = /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i

validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: EMAIL }
                    #RegExp du format Email

=begin
scope :active_users , -> { where(active: true) }
scope :inactive_users, -> { where(active: false) }
=end

end
