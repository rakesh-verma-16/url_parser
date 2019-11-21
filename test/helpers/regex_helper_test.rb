require 'test_helper'
require_relative '../../app/helpers/regex_helper'

class RegexHelperTest < ActiveSupport::TestCase

  test "map an HTTP url to HTTP regex" do
    url = 'http://google.com'
    expected_regex = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/ix
  	actual_regex = RegexHelper.match_url_regex(url)
  	assert_equal(expected_regex, actual_regex)
  end

  test "map an HTTPS url to HTTPS regex" do
    url = 'https://google.com'
    expected_regex = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/ix
  	actual_regex = RegexHelper.match_url_regex(url)
  	assert_equal(expected_regex, actual_regex, 'Matched successfully')
  end

  test "map an FTP url to FTP regex" do
    url = 'ftp://abc:xyz@foo.com'
    expected_regex = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/ix
  	actual_regex = RegexHelper.match_url_regex(url)
  	assert_equal(expected_regex, actual_regex)
  end

  test "map an MAILTO url to MAILTO regex" do
    url = 'mailto:someone@example.com?Subject=Hello%20again'
    expected_regex = /(?:\b|\+)(?:mailto:)?([\w\.+#-]+)@([\w\.-]+\.\w{2,4})\b/ix
  	actual_regex = RegexHelper.match_url_regex(url)
  	assert_equal(expected_regex, actual_regex)
  end

  test "map an TEL url to TEL regex" do
    url = 'tel:+91 9899 584 583'
    expected_regex = /(?:\b|\+)(?:tel:)?(((\+[0-9]{1,2}|00[0-9]{1,2})[-\ .]?)?)(\d[-\ .]?){5,15}/ix
  	actual_regex = RegexHelper.match_url_regex(url)
  	assert_equal(expected_regex, actual_regex)
  end

end