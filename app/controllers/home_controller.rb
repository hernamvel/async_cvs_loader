class HomeController < ApplicationController
  def index
    @identifier = Identifier.new
  end

  def upload
    @uploaded_io = params[:fileupload][:csv_file]
    @identifier = Identifier.find_or_create_by(identifier: params[:fileupload][:identifier])
    errors = validate_params
    if errors.empty?
      # Copy the file out of the temp directory and run the processor in the background
      filename = Rails.root.join('public', 'uploads', @uploaded_io.original_filename)
      File.open(filename, 'wb') do |file|
        file.write(@uploaded_io.read)
      end
      CsvProcessorJob.perform_later(@identifier, filename.to_s)
      flash.now[:notice] = 'File received. Please wait until its processed'
      @received = true
    else
      @received = false
      flash.now[:alert] = errors
    end
  end

  private

  def validate_params
    errors = []
    unless @identifier.persisted?
      errors += @identifier.errors.full_messages
    end
    if @uploaded_io
      unless @uploaded_io.content_type == 'text/csv'
        errors += Array.wrap("#{I18n.t('errors.csv.invalid_mime')} #{@uploaded_io.content_type}")
      end
    else
      errors += Array.wrap(I18n.t('errors.csv.no_file'))
    end
    errors
  end
end
