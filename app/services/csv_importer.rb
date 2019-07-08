class CsvImporter

  def initialize(identifier, filename)
    @identifier = identifier
    @filename = filename
  end

  def process_csv
    success_rows = []
    error_rows = []
    CSV.foreach(@filename, headers: true) do |csv_row|
      record = User.find_or_create_by({
        identifier: @identifier,
        first: csv_row['first'],
        last: csv_row['last'],
        phone: csv_row['phone'],
        email: csv_row['email']
      })
      rec_hash = {
        first: record.first,
        last: record.last,
        phone: record.phone,
        email: record.email,
        identifier: @identifier.identifier
      }
      if record.valid?
        success_rows << rec_hash
      else
        error_rows << rec_hash.merge({
          errors: record.errors.full_messages
        })
      end
    end
    ActionCable.server.broadcast 'notifier_channel',
                                 success_rows: success_rows,
                                 error_rows: error_rows
  end

end