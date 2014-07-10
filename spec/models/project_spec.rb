require 'rails_helper'

RSpec.describe Project, type: :model do

  fixtures :projects, :tasks, :logs

  let (:project) { projects(:tree) }

  it 'is invalid without a name' do
    project.name = ''
    expect(project.valid?).to eq(false)
  end

  it 'has tasks' do
    expect(project.tasks).to_not be_empty
  end

  it 'has logs' do
    expect(project.logs).to_not be_empty
  end

  it 'deletes dependent tasks and logs when destroyed' do
    project.destroy
    expect { tasks(:chop) }.to raise_error ActiveRecord::RecordNotFound
    expect { logs(:chop_hour) }.to raise_error ActiveRecord::RecordNotFound
    expect { logs(:chop_six_hours) }.to raise_error ActiveRecord::RecordNotFound
  end

  it 'reports time logged' do
    expect(project.logged).to eq(7*3600) # 7 hours
  end

end