require 'rails_helper'

RSpec.describe Log, type: :model do 

  fixtures :tasks, :logs

  context 'validation' do
    let(:log) { logs(:chop_hour) }
    it 'is false without a task' do
      log.task = nil
      expect(log.valid?).to be(false)
    end
    it 'is true without a stop time' do
      log.stop = nil
      expect(log.valid?).to be(true)
    end
  end

  context 'completed log' do
    let(:completed_log) { logs(:chop_hour) }
    it 'reports duration' do
      expect(completed_log.duration).to eq 3600
    end
  end

  context 'in-work log' do
    let(:in_work_log) { logs(:gear_now) }
    it 'reports duration' do
      expect(in_work_log.duration).to be_within(5).of((Time.now - in_work_log.start).to_i)
    end
  end

end
