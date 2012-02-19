# == Schema Information
#
# Table name: players
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  remember_token  :string(255)
#

class Player < ActiveRecord::Base
  attr_accessible :username, :first_name, :last_name, :full_name, :email, :password, :password_confirmation
  has_many :games, :through => :votes
  belongs_to :vote

  has_secure_password

  before_save :create_remember_token

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  username_regex = /^[\w+.\-_@]+$/i

  validates :first_name,  :presence => true,
                          :length => {:maximum => 255}
  validates :last_name,   :presence => true,
                          :length => {:maximum => 255}
  validates :username,    :presence => true,
                          :length => {:within => 3..25},
                          :format => {:with => username_regex, :message => "should only container letters, numbers, or .-@"},
                          :uniqueness => {:case_sensitive => false}
  validates :email,       :presence => true,
                          :format => {:with => email_regex, :message => "should only container letters, numbers, or +.-@"},
                          :uniqueness => {:case_sensitive => false}
  validates :password,    :presence => true,
                          :on => :create,
                          :confirmation => true,
                          :length => {:minimum => 4}

  def self.authenticate(username, password)
    player = find_by_username(username)
    return player if player && player.authenticate(password)
  end

  def full_name
    first_name + " " + last_name
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
