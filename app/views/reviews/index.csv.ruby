require 'csv'

CSV.generate do |csv|
  column_names = %w(投稿日 名前 メールアドレス 星評価 コメント)
  csv << column_names
  @reviews.each do |review|
    column_values = [
      review.created_at.strftime("%Y/%m/%d"),
      review.name,
      review.email,
      review.rate,
      review.content,
    ]
    csv << column_values
  end
end