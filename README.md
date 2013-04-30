# smart_methods

smart_methods helps to define class and instance methods using pretty DSL.

[![Build Status](https://secure.travis-ci.org/aderyabin/smart_methods.png)](http://travis-ci.org/aderyabin/smart_methods)
[![Gem Version](https://badge.fury.io/aderyabin/smart_methods.png)](http://badge.fury.io/aderyabin/smart_methods)
[![Dependency Status](https://gemnasium.com/aderyabin/smart_methods.png)](https://gemnasium.com/aderyabin/smart_methods)
[![Code Climate](https://codeclimate.com/github/aderyabin/smart_methods.png)](https://codeclimate.com/github/aderyabin/smart_methods)

## Installation

Add this line to your application's Gemfile:

    gem 'smart_methods'

## Usage

Working with class methods:

```ruby
class Source
  extend SmartMethods
  smart_methods :status, :type

  self.status 'undefined'
  self.type 'undefined'
end

class Sms < Source
  self.type 'sms'
end

class Phone < Source
end

Phone.type = 'phone'

Phone.type
# => 'phone'

Sms.type
# => 'sms'

Phone.status
# => "undefined"
```

Working with instance methods:

```ruby
class Source
  extend SmartMethods
  smart_methods :status, :type

  status { "new_" + type.to_s }
end

Source.new.type
# => nil

Source.new.status
# => 'new_'

class Sms < Source
  type { 'sms' }
end

Sms.new.type
# => 'sms'

Sms.new.status
# => 'new_sms'

class Phone < Sms
  type { 'phone' }
end

Phone.new.status
# => 'new_phone'

class Email < Sms
end

email = Email.new
email.type = 'email'

email.type
# => 'email'

email.status
# => 'new_email'
```

## Thanks
Sponsored by [Evil Martians].
[Evil Martians]: http://evilmartians.com/
