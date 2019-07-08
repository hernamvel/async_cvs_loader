require 'rails_helper'

RSpec.describe CsvImporter, type: :service do

  describe 'a valid user' do
    let(:identifier) { create(:identifier) }
    let(:csv_importer) { CsvImporter.new(identifier, "#{Rails.root}/spec/fixtures/files/users.csv")}

    it 'process a valid csv file' do
      csv_importer.process_csv
      inserted = User.where(identifier: identifier).count
      expect(inserted).to eq(1)
    end
  end

end
