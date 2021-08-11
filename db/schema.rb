# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_629_003_110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'animal_requests', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'animal'
    t.string 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'chats', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'post_id'
    t.bigint 'request_id'
    t.index ['post_id'], name: 'index_chats_on_post_id'
    t.index ['request_id'], name: 'index_chats_on_request_id'
  end

  create_table 'chats_users', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'chat_id'
    t.index ['chat_id'], name: 'index_chats_users_on_chat_id'
    t.index ['user_id'], name: 'index_chats_users_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'text'
    t.date 'date'
    t.string 'comment_type'
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.bigint 'father_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['father_id'], name: 'index_comments_on_father_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.text 'content'
    t.bigint 'chat_id'
    t.bigint 'user_id'
    t.string 'viewed'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['chat_id'], name: 'index_messages_on_chat_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'text'
    t.string 'title'
    t.integer 'price'
    t.integer 'level'
    t.date 'date'
    t.string 'animal'
    t.string 'ptype'
    t.string 'location'
    t.bigint 'user_id'
    t.bigint 'report_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['report_id'], name: 'index_posts_on_report_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'reports', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'author_id'
    t.string 'text'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_reports_on_post_id'
    t.index ['user_id'], name: 'index_reports_on_user_id'
  end

  create_table 'requests', force: :cascade do |t|
    t.string 'state'
    t.integer 'chid'
    t.string 'reviewed_own'
    t.string 'reviewed_buy'
    t.string 'viewed'
    t.bigint 'post_id'
    t.bigint 'owner_id'
    t.bigint 'buyer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['buyer_id'], name: 'index_requests_on_buyer_id'
    t.index ['owner_id'], name: 'index_requests_on_owner_id'
    t.index ['post_id'], name: 'index_requests_on_post_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'aid'
    t.integer 'reid'
    t.text 'text', default: 'No Message', null: false
    t.float 'rating'
    t.datetime 'date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'last_name', null: false
    t.string 'first_name', null: false
    t.string 'phone', null: false
    t.string 'city', null: false
    t.string 'gender', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'comments', column: 'father_id'
  add_foreign_key 'posts', 'reports'
  add_foreign_key 'requests', 'users', column: 'buyer_id'
  add_foreign_key 'requests', 'users', column: 'owner_id'
end
