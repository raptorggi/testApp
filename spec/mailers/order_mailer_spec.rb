require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  let(:category) { create :category}
  let(:product) { create :product, category_id: category.id }
  let(:user) { create :user }
  let(:user_admin) { create :user, name: 'Admin', admin: true }
  let(:order) { create :order }
  let(:order_product) { create order_id: order.id, product_id: product.id, count: 4 }
  let(:user_mail) { OrderMailer.order_email_to_users user.id, order.id }
  let(:admin_mail) { OrderMailer.order_email_to_admins user.id, order.id }
  
  before do
    user_admin
  end

  describe '#order_email_to_users' do
    it "renders the headers" do
      expect(user_mail.subject).to eq("Order ##{order.id}")
      expect(user_mail.to).to eq([user.email])
      expect(user_mail.from).to eq(["no-reply@testapp.com"])
    end
  end

  describe '#order_email_to_admins' do
    it "renders the headers" do
      expect(admin_mail.subject).to eq("user #{user.name} order ##{order.id}")
      expect(admin_mail.to).to eq([user_admin.email])
      expect(admin_mail.from).to eq(["no-reply@testapp.com"])
    end
  end
end
