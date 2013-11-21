require 'spec_helper_system'

describe 'wget' do
  before(:all) do
    puppet_apply(%Q(
      class { 'wget': }
    )).exit_code.should be_zero
  end

  it 'should be idempotent' do
    pp = %Q(
      wget::fetch { "download Google's index":
        source      => 'http://www.google.com/index.html',
        destination => '/tmp/index.html',
        timeout     => 0,
        verbose     => false,
      }
    )
    expect(puppet_apply(pp).exit_code).to eq(2)
    expect(puppet_apply(pp).exit_code).to be_zero
  end

end
