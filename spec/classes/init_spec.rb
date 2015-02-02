require 'spec_helper'
describe 'storm' do

  context 'with defaults for all parameters' do
    it { should contain_class('storm') }
  end
end
