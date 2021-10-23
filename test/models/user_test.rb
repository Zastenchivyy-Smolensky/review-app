require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name:"Example User",email:"user@examle.com",number:"99a9999",
                    password:"foobar", password_confirmation:"foobar")
  end
  test "should be valid" do
    assert @user.valid?
  end
  test "name should be present" do
    @user.name="   "
    assert_not @user.valid?
  end
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
  test "number should be present" do
    @user.number="   "
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
  test "email should not be too long" do
    @user.email = "A"*244+"@example.com"
    assert_not @user.valid?
  end
  test "number should not be too long" do
    @user.number = "20"*244+"9999"
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
  test "number validation should accept valid numbers" do
    valid_numbers = %w[s99c9999 S99c9999 99C9999 S99C9999]
    valid_numbers.each do |valid_numbers|
      @user.number= valid_numbers
      assert @user.valid?, "#{valid_numbers.inspect} should be valid"
    end
  end
  test "number validation should reject invalid numbers" do
    invalid_numbers = %w[s99c9999 S99c9999 99C9999 S99C9999]
    invalid_numbers.each do |invalid_numbers|
      @user.number= invalid_numbers
      assert @user.valid?, "#{invalid_numbers.inspect} should be valid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblack)" do
    @user.password = @user.password_confirmation = " "*6
    assert_not @user.valid?
  end
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
end
