
[1mFrom:[0m /home/ubuntu/workspace/spa-search/app/controllers/search_controller.rb @ line 25 SearchController#index:

     [1;34m3[0m:   [32mdef[0m [1;34mindex[0m
     [1;34m4[0m:     @pref_id = search_params[[33m:id[0m]
     [1;34m5[0m:     @pref = [1;34;4mPrefecture[0m.find(@pref_id)
     [1;34m6[0m:     @pref_name = @pref.name
     [1;34m7[0m:     @pref_jalanprefcode = @pref.jalanprefcode
     [1;34m8[0m: 
     [1;34m9[0m:     [1;34m### ↓↓↓ API 検索 ↓↓↓[0m
    [1;34m10[0m: 
    [1;34m11[0m:     onsen_url = [31m[1;31m'[0m[31mhttp://jws.jalan.net/APICommon/OnsenSearch/V1/[1;31m'[0m[31m[0m
    [1;34m12[0m:     
    [1;34m13[0m:     params = {
    [1;34m14[0m:       [35mkey[0m: [1;36mENV[0m[[31m[1;31m'[0m[31mJALAN_API_KEY[1;31m'[0m[31m[0m], [1;34m# APIキー[0m
    [1;34m15[0m:       [35mpref[0m: @pref_jalanprefcode, [1;34m# 都道府県コード : 北海道[0m
    [1;34m16[0m:       [35mcount[0m: [1;34m12[0m,                  [1;34m# 表示件数 : 3件[0m
    [1;34m17[0m:     }
    [1;34m18[0m: 
    [1;34m19[0m:     conn = [1;34;4mFaraday[0m.new([35murl[0m: onsen_url)
    [1;34m20[0m:     response = conn.get [31m[1;31m'[0m[31m[1;31m'[0m[31m[0m, params
    [1;34m21[0m:     @onsens = [1;34;4mHash[0m.from_xml(response.body)
    [1;34m22[0m: [1;34m# .to_s.force_encoding("UTF-8")[0m
    [1;34m23[0m:     binding.pry
    [1;34m24[0m: 
 => [1;34m25[0m:     [1;34;4mRails[0m.logger.info(@onsens[[31m[1;31m'[0m[31mResults[1;31m'[0m[31m[0m])
    [1;34m26[0m: 
    [1;34m27[0m:     [1;34m### ↑↑↑ API 検索 ↑↑↑[0m
    [1;34m28[0m: 
    [1;34m29[0m:   [32mend[0m

