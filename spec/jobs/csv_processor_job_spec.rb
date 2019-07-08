require 'rails_helper'

RSpec.describe CsvProcessorJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) {
    described_class.perform_later(create(:identifier), "#{Rails.root}/spec/fixtures/files/users.csv")
  }

  it 'queues the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in the correct queue' do
    expect(CsvProcessorJob.new.queue_name).to eq('default')
  end

end
