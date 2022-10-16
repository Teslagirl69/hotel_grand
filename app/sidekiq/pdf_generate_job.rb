require 'wicked_pdf'

class PdfGenerateJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ExportDailyStatToPdf.call
  end
end