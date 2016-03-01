#!/usr/bin/env puma

ENV["PORT"] ||= "5000"
environment ENV["RAILS_ENV"]
threads 1, 10
workers 2
bind "tcp://0.0.0.0:#{ENV["PORT"]}"
preload_app!
tag "csi"
