#encoding: utf-8
namespace :db do
  task hourly_update: :environment do
    Fanpage.hourly_update
  end
end