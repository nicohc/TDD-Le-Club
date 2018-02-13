require 'rails_helper'

RSpec.describe User, type: :model do
    context 'validation tests' do
      it 'ensures firstname presence' do
        user = User.new(lastname:'Last', email:'last@last.fr').save
        expect(user).to eq(false)
      end
      #test d'un prénom qui ne contient que des espaces
      it 'ensures firstname not space' do
        user = User.new(lastname:'Last', email:'last@last.fr', firstname:'     ').save
        expect(user).to eq(false)
      end
      it 'ensures lastname presence' do
        user = User.new(email:'last@last.fr', firstname:'first').save
        expect(user).to eq(false)
      end
      it 'ensures email presence' do
        user = User.new(lastname:'Last', firstname:'first').save
        expect(user).to eq(false)
      end
      it 'should save successfully' do
        user = User.new(lastname:'Last', email:'last@last.fr', firstname:'first').save
        expect(user).to eq(true)
      end
      #test de l'unicité de l'email
      it 'ensures email uniqueness' do
        user = User.new(lastname:'Last', email:'last@last.fr', firstname:'first').save
        user = User.new(lastname:'Last2', email:'last@last.fr', firstname:'first2').save
        expect(user).to eq(false)
      end
    end


    #NON FONCTIONNEL les scope
    context 'scope tests' do
      let (:params) { {lastname:'Last', email:'last@last.fr', firstname:'first'} }
      before(:each) do
        User.new(params).save
        User.new(params).save
        User.new(params.merge(active: true)).save
        User.new(params.merge(active: false)).save
        User.new(params.merge(active: false)).save
      end
=begin
      it 'should return active users' do
        expect(User.active_users.size).to eq(3)
      end
      it 'should return inactive users' do
        expect(User.inactive_users.size).to eq(2)
      end
=end
    end
end
