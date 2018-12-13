# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email 
      @user = User.last
      UserMailer.welcome_email(@user)
  end

   def client_order 
      @user= User.last
      @order= Order.create!(user:@user, quantities:[1,1], price:15)
      @order.item_ids = [1,2]
      @order.save
      UserMailer.client_order(@user, @order)
   end

    def admin_order
      User.last.admin!
      @user= User.last
      @order= Order.create!(user:@user, quantities:[1,1], price:15)
      @order.item_ids = [1,2]
      @order.save
      UserMailer.admin_order(@order)
   end
end
