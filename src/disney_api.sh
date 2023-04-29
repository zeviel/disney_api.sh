#!/bin/bash

api="https://api.disneyapi.dev"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_all_characters() {
    # 1 - page: (integer): <The page number to get. Default: 1>
    # 2 - page_size: (integer): <The number of items per page. Default: 50>
    curl --request GET \
        --url "$api/character?page=${1:-1}&pageSize=${2:-50}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_character() {
    # 1 - character_id: (integer): <The id of the character to get>
    curl --request GET \
        --url "$api/character/$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function filter_character_by_name() {
    # 1 - name: (string): <name>
    curl --request GET \
        --url "$api/character?name=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function filter_character_by_url() {
    # 1 - url: (string): <url>>
    curl --request GET \
        --url "$api/character?url=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}
