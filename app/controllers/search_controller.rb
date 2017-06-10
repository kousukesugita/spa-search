class SearchController < ApplicationController

  def index
    @pref_id = search_params[:id]
    @pref = Prefecture.find(@pref_id)
    @pref_name = @pref.name
    @pref_jalanprefcode = @pref.jalanprefcode
    # @spa = Spa.find(params[:id])
    
    # ======================================================================
    # API 検索をする
    # ======================================================================

    onsen_url = 'http://jws.jalan.net/APICommon/OnsenSearch/V1/'
    
    params = {
      key: ENV['JALAN_API_KEY'], # APIキー
      pref: @pref_jalanprefcode, # 都道府県コード : 北海道
      count: 12,                  # 表示件数 : 3件
    }

    conn = Faraday.new(url: onsen_url)
    response = conn.get '', params
    @onsens = Hash.from_xml(response.body)

    # ======================================================================
    # API で検索した結果を spas に保存する
    # ======================================================================

    @onsens['Results']['Onsen'].each do |spa|

      # 既に温泉情報が spas に登録されている場合、重複登録を避けるため、スキップする
      if Spa.where(onsen_code: spa['OnsenID']).present?
        Rails.logger.info('OnsenID = ' + spa['OnsenID'] + ' は既に登録されています')
        next
      end

      # API の結果から spas に保存するパラメータを準備する
      spa_params = {
        onsen_code: spa['OnsenID'],
        onsen_name: spa['OnsenName'],
        onsen_name_kana: spa['OnsenNameKana'],
        onsen_address: spa['OnsenAddress'],
        nature_of_onsen: spa['NatureOfOnsen'],
        onsen_area_caption: spa['OnsenAreaCaption']
      }

      # spas に登録する
      spa = Spa.new(spa_params)
      spa.save

    end

  end

  private
  
  def search_params
    params.require(:prefs).permit(:id, :name)
  end
end