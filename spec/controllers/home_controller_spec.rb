require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include ActiveJob::TestHelper

  describe "A GET call to index action" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "A POST call to upload action" do

    it "process a valid file with a a valid identifer" do
      valid_mime = 'text/csv'
      file = fixture_file_upload('files/valid.csv', valid_mime)
      post :upload, params: {fileupload: {identifier: '123123', csv_file: file}}
      expect(response).to have_http_status(:success)
      assert_enqueued_jobs 1
    end

    it "detects an inavlid identifier" do
      invalid_mime = 'text/html'
      file = fixture_file_upload('files/invalid.html', invalid_mime)
      post :upload, params: {fileupload: {identifier: '__$$', csv_file: file}}
      expect(response).to have_http_status(:success)
      expected_error = I18n.t('activerecord.errors.models.identifier.attributes.identifier.only_alnum')
      expect(flash[:alert]).to include("Identifier #{expected_error}")
      assert_enqueued_jobs 0
    end

    it "detects an invalid mime_type" do
      invalid_mime = 'text/html'
      file = fixture_file_upload('files/invalid.html', invalid_mime)
      post :upload, params: {fileupload: {identifier: '123123', csv_file: file}}
      expect(response).to have_http_status(:success)
      expect(flash[:alert]).to include("#{I18n.t('errors.csv.invalid_mime')} #{invalid_mime}")
      assert_enqueued_jobs 0
    end

    it "detects a missing file to upload" do
      post :upload, params: {fileupload: {identifier: '123123'}}
      expect(response).to have_http_status(:success)
      expect(flash[:alert]).to include(I18n.t('errors.csv.no_file'))
      assert_enqueued_jobs 0
    end
  end

end
