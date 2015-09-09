#!/bin/bash

/usr/local/bin/mysql -uhammerspoon -phammerspoon hammerspoon << EOF
    SET NAMES utf8;
    insert into app_event (app_name, event_type) values ("$1", "$2")
EOF