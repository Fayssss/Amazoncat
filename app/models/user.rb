class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :validate_username
  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver_now!
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  #has_many :credit_cards, dependent: :destroy
 
  #after_commit :assign_customer_id, on: :create
 
  #def assign_customer_id
  #  customer = Stripe::Customer.create(email: email)
  #  self.customer_id = customer.id
  #end
end
