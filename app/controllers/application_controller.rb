class ApplicationController < ActionController::Base
    # レイアウトの仕組みをカスタマイズする
    # 通常は、コントローラー名と同じ名前のレイアウトが優先的に選択され、存在しなければ`application`という名前のレイアウトが選択される
    # `ApplicationController#set_layout`は、全体として、"staff", "admin", "customer"という文字列を返す。この文字列が、レイアウトの名前として使われる
    layout :set_layout

    private def set_layout
        # params[:contorller]で現在選択されているコントローラーの名前を取得する
        if params[:controller].match(%r{\A(staff|admin|customer)/})
            # Regexp.last_matchは正規表現にマッチした文字列に関する情報を保持するMatchDataオブジェクトを返す
            Regexp.last_match[1]
        else
            "customer"
        end
    end
end
