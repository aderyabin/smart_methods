require_relative 'test_helper'


describe SmartMethods do
  before(:each) do
    class Foo
      extend SmartMethods
      smart_methods :a, :b, :c

      b { 'lorem' }
      c { 'lorem' }
    end

    class SubFoo < Foo
    end

    class SubSubFoo < SubFoo
      a {  c + " ipsum" }
    end
  end

  it "class must respond to a" do
    Foo.must_respond_to :a
  end

  it 'subclass must respond to a' do
    SubFoo.must_respond_to :a
  end

  it "instance must respond to a" do
    Foo.new.must_respond_to :a
  end

  it 'subclass instance method must respond to a' do
    SubFoo.new.must_respond_to :a
  end

  it 'may change subclass method without class' do
    SubSubFoo.b = 'ipsum'
    SubSubFoo.b.must_equal 'ipsum'
    Foo.b.call.must_equal 'lorem'
  end

  it 'class instance method should be "lorem"' do
    Foo.new.b.must_equal 'lorem'
  end

  it 'subclass instance method should be "lorem"' do
    SubFoo.new.b.must_equal 'lorem'
  end

  it 'instance method could be overriden' do
    instance = SubFoo.new
    instance.b = 'ipsum'
    instance.b.must_equal 'ipsum'
  end

  it 'instance not change class method' do
    SubFoo.new.b = 'ipsum'
    SubFoo.b.call.must_equal 'lorem'
    Foo.b.call.must_equal 'lorem'
  end

  it 'may use proc' do
    SubSubFoo.new.a.must_equal 'lorem ipsum'
  end
end