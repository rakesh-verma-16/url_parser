require 'test_helper'
require_relative '../../app/helpers/parser_helper'

class ParserHelperTest < ActiveSupport::TestCase
  
  test "validate a valid url" do
    assert(ParserHelper.valid_url?('http://www.google.com'), 'This is a valid url')
  end

  test "validate an invalid url with extra colon" do
    refute(ParserHelper.valid_url?('http:://www.google.com'), 'This is a valid url')
  end

  test "parse a valid url" do
  	url = 'http://google.com'

  	actual = ParserHelper.parse_url(url)
  	expected = {
  		'scheme' => 'http',
  		'host' => 'google.com',
  		'port' => '80'	
  	}

  	assert_equal(expected, actual)
  end

  test "parse a valid url 2" do
  	url = 'https://www.example.com/foo/?bar=baz&inga=42&quux'

  	actual = ParserHelper.parse_url(url)
  	expected = {
  		'scheme' => 'https',
  		'host' => 'www.example.com',
  		'port' => '443',
  		'path' => '/foo/',
  		'query' => 'bar=baz&inga=42&quux'
  	}
  	assert_equal(actual, expected)
  end

  test "parse a valid url 3" do
  	url = 'https://www.example.com/foo/?bar=baz&inga=42&quux#anchor_tag'

  	actual = ParserHelper.parse_url(url)
  	expected = {
  		'scheme' => 'https',
  		'host' => 'www.example.com',
  		'port' => '443',
  		'path' => '/foo/',
  		'query' => 'bar=baz&inga=42&quux',
  		'fragment' => 'anchor_tag'
  	}
  	assert_equal(actual, expected)
  end

  ##
  # Removes the extra and empty components from the hash of components
  # Tests: decorate_componenets method
  # asserts equal expected and actual outcome from the method.
  ##
  test "remove empty components" do
  	input_params = {
  		'scheme' => 'https',
  		'host' => 'www.example.com',
  		'port' => '',
  		'path' => '/foo/',
  		'query' => 'bar=baz&inga=42&quux',
  		'fragment' => ''
  	}

  	output = ParserHelper.decode_components(input_params)
  	expected_output = {
  		'scheme' => 'https',
  		'host' => 'www.example.com',
  		'path' => '/foo/',
  		'query' => 'bar=baz&inga=42&quux'
  	}
  	assert_equal(expected_output, output)
  end

end