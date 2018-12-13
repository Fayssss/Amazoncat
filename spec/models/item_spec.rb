require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is can be created' do
    item = Item.new(
      title: 'bla',
      description: 'blabla', 
      price: '1',
      image_url: 'test.com'
    ).save
    expect(item).to eq(true)
  end

  it 'is can be created twice' do
    Item.create(title: 'bla', description: 'blabla', price: '1', image_url: 'test.com')
    item = Item.new(
      title: 'bla',
      description: 'blabla', 
      price: '1',
      image_url: 'test.com'
    ).save
    expect(item).to eq(true)
  end

end
