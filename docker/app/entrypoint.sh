#!/bin/sh

./bin/rails db:prepare

exec "${@}"
