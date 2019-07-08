require 'csv'

class CsvProcessorJob < ApplicationJob
  queue_as :default

  def perform(identifier, filename)
    importer = CsvImporter.new(identifier, filename)
    importer.process_csv
  end

end
