require 'rails_helper'

RSpec.describe LogsHelper, :type => :helper do

  it 'should format logged time' do
    expect(helper.format_logged(3600)).to eq('01:00:00')
  end

end
