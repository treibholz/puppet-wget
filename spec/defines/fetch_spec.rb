require 'spec_helper'

describe 'wget::fetch' do
  let(:title) { 'test' }
  let(:params) { {
    :source      => 'http://localhost/source',
    :destination => '/tmp/dest',
  } }

  it { should contain_exec('wget-test').with_command('wget --no-verbose --output-document=/tmp/dest http://localhost/source') }
end
