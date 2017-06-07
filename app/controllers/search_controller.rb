class SearchController < ApplicationController

  def index
    @pref_id = search_params[:id]
    @pref = Prefecture.find(@pref_id)
    @pref_name = @pref.name
    @pref_jalanprefcode = @pref.jalanprefcode
    # @spa = Spa.find(params[:spa_id])
    
    ### ↓↓↓ API 検索 ↓↓↓

    onsen_url = 'http://jws.jalan.net/APICommon/OnsenSearch/V1/'
    
    params = {
      key: ENV['JALAN_API_KEY'], # APIキー
      pref: @pref_jalanprefcode, # 都道府県コード : 北海道
      count: 12,                  # 表示件数 : 3件
    }

    conn = Faraday.new(url: onsen_url)
    response = conn.get '', params
    @onsens = Hash.from_xml(response.body)

    ### ↑↑↑ API 検索 ↑↑↑

  end

  private
  
  def search_params
    params.require(:prefs).permit(:id, :name)
  end
end