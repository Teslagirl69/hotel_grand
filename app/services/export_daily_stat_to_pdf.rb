class ExportDailyStatToPdf

  def self.call
    new.call
  end

  def call
    pdf = WickedPdf.new
    file_name = "bookings_#{1.day.ago.to_date}"
    save_path = Rails.root.join("./files/#{file_name}.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end
end