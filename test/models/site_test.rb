require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def setup
    @site = Site.new(url: "www.example.com")
  end

  test "should be valid" do
    assert @site.valid?
  end

  test "url should be present" do
    @site.url = "     "
    assert_not @site.valid?
  end

  test "url validation should accept valid addresses" do
    valid_addresses = %w[www.example.com example.com http://www.example.com
                         http://example.com]
    valid_addresses.each do |valid_address|
      @site.url = valid_address
      assert @site.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "url validation should reject invalid addresses" do
    invalid_addresses = %w[example,com user.name@example.
                           example@exam_ple.com example@exam+ple.com]
    invalid_addresses.each do |invalid_address|
      @site.url = invalid_address
      assert_not @site.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "url addresses should be unique" do
    duplicate_site = @site.dup
    @site.save
    assert_not duplicate_site.valid?
  end
end
