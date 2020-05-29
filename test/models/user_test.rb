require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar123", password_confirmation: "foobar123", mobile:"0451000000", city:"Melbourne")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "password should have a maximum length" do
    @user.password = @user.password_confirmation = "a" * 21
    assert_not @user.valid?
  end

  test "password validation should accept valid password" do
    @user.password = @user.password_confirmation = "123456rmit"
    assert @user.valid?
  end

  test "password validation should reject invalid password" do
    @user.password = @user.password_confirmation = "foobar!@#"
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "mobile should be present" do
    @user.mobile = "     "
    assert_not @user.valid?
  end

  test "mobile should have a minimum length" do
    @user.mobile = "1" * 9
    assert_not @user.valid?
  end

  test "mobile should have a maximum length" do
    @user.mobile = "1" * 14
    assert_not @user.valid?
  end

  test "mobile validation should accept valid mobile" do
    @user.mobile = "1" * 11
    assert @user.valid?
  end

  test "mobile validation should reject invalid mobile" do
    @user.mobile = "a" * 11
    assert_not @user.valid?
  end

  test "city should be present" do
    @user.city = "     "
    assert_not @user.valid?
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(topic: "Game", title: "game title", content: "Lorem ipsum",views_count: 0)
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end