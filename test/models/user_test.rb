require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create a User with an email, password, access_token" do
    user = User.create!(:email => 'pear@peach.com',
                        :password => 'porterhouse',
                        :access_token => 'yogi')
    assert user.save
  end

  test "require an email to make a new user" do
    user = User.create(:password => 'ribeye',
                        #:email => 'blergers@yaaa.com',
                        :access_token => "grapes")
    refute user.save
  end

  test "do we have a user?" do
    user = User.find_by!(:email => "tucker@test.com")
    assert user
  end

  test "can a new user have a duplicate email??" do
    user = User.create(:email => "tucker@test.com",
                       :password => "bread",
                       :access_token => "cupcakes")
    assert_not user.save
  end
end

# What is the difference between 'assert_not' and 'refute'
