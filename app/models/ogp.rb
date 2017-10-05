class Ogp < ApplicationRecord
  def self.get_info(record, target_type)
    require "open-uri"
    require "nokogiri"

    regexp = Regexp.new("https?://[\w/:%#\$&\?\(\)~\.=\+\-]+")
    URI.extract(record.content).each do |url|
      ogp = self.new
      ogp.target_type = target_type
      ogp.target_id   = record.id
      ogp.url = url

      begin
        # スクレイピングの開始
        charset = "UTF-8"
        html = open(url) do |page|
          charset = page.charset if page.charset.present?
          page.read
        end

        # スクレイピング結果の解析
        doc = Nokogiri::HTML.parse(html, charset)

        # スクレイピング結果の格納
        ogp.title = doc.title
        ogp.image = doc.css('//meta[property="og:image"]/@content').shift.to_s
        ogp.description = doc.css('//meta[property="og:description"]/@content').present? ? doc.css('//meta[property="og:description"]/@content') : doc.css('//meta[property="description"]/@content')

        # スクレイピング結果の保存
        ogp.save!
      rescue => e
        p e
        next
      end
    end
  end
end
