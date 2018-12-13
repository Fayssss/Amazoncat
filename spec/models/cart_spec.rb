require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'can be created' do
    user = User.create(
    username: 'testtest',
    email: 'test@example.com', 
    password: 'password123',
    password_confirmation: 'password123'
    )
    cart = Cart.new(
      user: user,
    ).save
    expect(cart).to eq(true)
  end
  it 'cannot be without user' do
    
    cart = Cart.new(
    ).save
    expect(cart).to eq(false)
  end
end
