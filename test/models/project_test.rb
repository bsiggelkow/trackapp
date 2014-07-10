require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'should not be valid without name' do
    project = projects(:tree)
    project.name = ''
    assert !project.valid?, 'Project is valid without name'
  end
end
