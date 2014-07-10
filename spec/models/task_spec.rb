require 'rails_helper'

RSpec.describe Task, :type => :model do

  fixtures :projects, :tasks, :logs

  let (:task) { tasks(:chop) }

  it 'is invalid without a name' do
    task.name = ''
    expect(task.valid?).to eq(false)
  end

  it 'is invalid without a project' do
    task.project = nil
    expect(task.valid?).to eq(false)
  end

  it 'has a project' do
    expect(task.project).to eq(projects(:tree))
  end

  it 'has logs' do
    expect(task.logs).to_not be_empty
  end

  it 'deletes dependent logs when destroyed' do
    task.destroy
    expect { logs(:chop_hour) }.to raise_error ActiveRecord::RecordNotFound
    expect { logs(:chop_six_hours) }.to raise_error ActiveRecord::RecordNotFound
  end

  it 'reports time logged' do
    expect(task.logged).to eq(7*3600) # 7 hours
  end

  context 'with open logs' do
    it 'is considered "in-work"' do
      expect(tasks(:gear).in_work?).to be(true)
    end
  end

  context 'with unopen logs' do
    it 'is not considered "in-work"' do
      expect(tasks(:chop).in_work?).to be(false)
    end
  end

end