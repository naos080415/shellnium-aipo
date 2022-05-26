#!/usr/bin/env bash
./WebDriver/chromedriver &
source ./lib/selenium.sh

main() {
    # Open the page.
    navigate_to 'http://duane.ace.ec.saga-u.ac.jp/aipo/'

    # get the element of the search box.
    local username=$(find_element 'name' 'member_username')
    local pass=$(find_element 'name' 'password')

    # Input to the search box and enter.
    send_keys $username "itahashi"    # 自分のユーザ名を入力する
    send_keys $pass "hogehoge\n"

    sleep 1   # ログイン後の個人ページが開くまで待つ

    local out=$(find_element 'link text' '退勤')
    click $in   # 退勤ボタンをクリック
    sleep 1

    # close the session
    delete_session
}

main
