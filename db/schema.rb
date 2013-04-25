# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130425123739) do

  create_table "accounts", :force => true do |t|
    t.string   "name",               :limit => 64,                      :null => false
    t.string   "ascii_name",         :limit => 64,                      :null => false
    t.string   "timezone",           :limit => 32, :default => "UTC",   :null => false
    t.string   "language",           :limit => 5,  :default => "en-US", :null => false
    t.boolean  "enabled",                          :default => true
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "version",                          :default => 0,       :null => false
    t.string   "account_type",                     :default => "taxi",  :null => false
    t.string   "email",              :limit => 64
    t.string   "phone_number",       :limit => 32
    t.string   "home_page",          :limit => 64
    t.string   "fax",                :limit => 32
    t.string   "fuel_card_provider"
    t.boolean  "allow_key_ident",                  :default => false
  end

  create_table "addresses", :force => true do |t|
    t.string   "company_name", :limit => 32
    t.string   "street",       :limit => 32
    t.string   "city",         :limit => 32
    t.string   "postal_code",  :limit => 16
    t.string   "country",      :limit => 64
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "version",                    :default => 0, :null => false
    t.integer  "account_id"
    t.integer  "partner_id"
    t.integer  "place_id"
    t.string   "name",         :limit => 64
  end

  create_table "attachments", :force => true do |t|
    t.integer  "account_id",                :null => false
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "position_id"
    t.string   "mime_type",   :limit => 16
    t.string   "file_name",                 :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "message_id"
    t.integer  "group_id",                  :null => false
  end

  create_table "book_tracks", :force => true do |t|
    t.integer  "book_vehicle_id"
    t.integer  "book_user_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "origin"
    t.string   "destination"
    t.integer  "distance"
    t.integer  "duration"
    t.boolean  "business"
    t.integer  "odometer"
    t.integer  "refuelling"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "note"
  end

  add_index "book_tracks", ["book_user_id", "started_at"], :name => "index_book_tracks_on_book_user_id_and_started_at"
  add_index "book_tracks", ["book_user_id"], :name => "index_book_tracks_on_book_user_id"
  add_index "book_tracks", ["book_vehicle_id", "started_at"], :name => "index_book_tracks_on_book_vehicle_id_and_started_at"
  add_index "book_tracks", ["book_vehicle_id"], :name => "index_book_tracks_on_book_vehicle_id"

  create_table "book_users", :force => true do |t|
    t.integer  "book_id",                  :null => false
    t.string   "name",       :limit => 32, :null => false
    t.string   "ascii_name", :limit => 32, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "book_vehicles", :force => true do |t|
    t.integer  "book_id",                      :null => false
    t.string   "name",           :limit => 32, :null => false
    t.string   "ascii_name",     :limit => 32, :null => false
    t.integer  "odometer_start"
    t.integer  "odometer_end"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "vehicle_id"
  end

  add_index "book_vehicles", ["ascii_name", "book_id"], :name => "index_book_vehicles_on_book_id_and_ascii_name"

  create_table "books", :force => true do |t|
    t.integer  "account_id",               :null => false
    t.integer  "group_id",                 :null => false
    t.integer  "year"
    t.integer  "month"
    t.string   "status",     :limit => 16
    t.string   "file_name",  :limit => 64
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "books", ["group_id", "month", "year"], :name => "index_books_on_group_id_and_year_and_month", :unique => true

  create_table "button_views", :force => true do |t|
    t.integer "account_id",                            :null => false
    t.integer "group_id",                              :null => false
    t.integer "user_id",                               :null => false
    t.boolean "tail_map",            :default => true
    t.boolean "long_tail_map",       :default => true
    t.boolean "follow_map",          :default => true
    t.boolean "limit_map",           :default => true
    t.boolean "scheduled_stops_map", :default => true
    t.boolean "real_stops_map",      :default => true
    t.boolean "multi_colors_map",    :default => true
    t.boolean "multi_colors_tracks", :default => true
    t.boolean "export_tracks",       :default => true
  end

  create_table "client_versions", :force => true do |t|
    t.string   "software_version", :null => false
    t.string   "api_version",      :null => false
    t.text     "files",            :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "name",       :limit => 16, :null => false
    t.string   "code",       :limit => 6,  :null => false
    t.integer  "position"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "colors", ["name"], :name => "index_colors_on_name", :unique => true

  create_table "device_groups", :force => true do |t|
    t.integer "device_id",    :null => false
    t.integer "sub_group_id", :null => false
  end

  create_table "devices", :force => true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.string   "type",                                                      :null => false
    t.string   "code",                     :limit => 32
    t.string   "name",                     :limit => 32
    t.string   "ascii_name",               :limit => 32,                    :null => false
    t.string   "brand",                    :limit => 32
    t.string   "model",                    :limit => 32
    t.string   "home_network",             :limit => 32
    t.string   "current_network",          :limit => 32
    t.boolean  "roaming"
    t.string   "phone_number",             :limit => 16
    t.string   "salt",                     :limit => 40
    t.string   "digest",                   :limit => 40
    t.boolean  "enabled",                                :default => true
    t.string   "software_version",         :limit => 10
    t.string   "activation_code",          :limit => 10
    t.datetime "activated_at"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.datetime "touched_at"
    t.integer  "version",                                :default => 0,     :null => false
    t.boolean  "has_button"
    t.string   "hardware_version",         :limit => 10
    t.string   "protocol",                 :limit => 10
    t.string   "label"
    t.string   "config",                   :limit => 32
    t.boolean  "button"
    t.boolean  "ignition"
    t.boolean  "has_ignition"
    t.datetime "visible_until"
    t.boolean  "gps_status"
    t.string   "ip"
    t.integer  "port"
    t.integer  "offset"
    t.string   "imei",                     :limit => 16
    t.integer  "position_id"
    t.integer  "track_id"
    t.integer  "home_network_id"
    t.integer  "current_network_id"
    t.boolean  "force_user_state",                       :default => false
    t.string   "visibility_switch_no",     :limit => 16
    t.boolean  "visible",                                :default => true
    t.string   "in_car",                   :limit => 20
    t.string   "price_for_arrival",        :limit => 10
    t.string   "price_for_km",             :limit => 10
    t.string   "price_for_waiting",        :limit => 10
    t.integer  "min_gps_default_time_s",                 :default => 15000
    t.integer  "min_gps_distance_m",                     :default => 0
    t.integer  "update_interval_seconds",                :default => 30
    t.integer  "send_period",                            :default => 30
    t.integer  "gps_speed_stop",                         :default => 3
    t.integer  "gps_speed_slow",                         :default => 50
    t.integer  "gps_min_time_fast",                      :default => 25000
    t.integer  "gps_min_time_slow",                      :default => 10000
    t.integer  "gps_min_time_stop",                      :default => 35000
    t.integer  "gui_update_time",                        :default => 5000
    t.integer  "position_buffer_size",                   :default => 1
    t.float    "acceleration_square_root",               :default => 1.2
    t.datetime "params_changed_at"
    t.datetime "last_started_at"
    t.datetime "last_stopped_at"
    t.integer  "last_stop_duration"
    t.boolean  "permanent_user",                         :default => false
  end

  add_index "devices", ["account_id"], :name => "index_devices_on_account_id"
  add_index "devices", ["activation_code"], :name => "index_devices_on_activation_code", :unique => true
  add_index "devices", ["ascii_name"], :name => "index_devices_on_ascii_name"
  add_index "devices", ["brand", "code"], :name => "index_devices_on_vendor_code_and_brand", :unique => true
  add_index "devices", ["position_id"], :name => "index_devices_on_position_id"
  add_index "devices", ["touched_at"], :name => "index_devices_on_touched_at"
  add_index "devices", ["track_id"], :name => "index_devices_on_track_id"
  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"
  add_index "devices", ["vehicle_id"], :name => "index_devices_on_vehicle_id"

  create_table "edges", :force => true do |t|
    t.string  "a_code",   :limit => 16
    t.string  "b_code",   :limit => 16
    t.float   "distance"
    t.integer "border"
  end

  add_index "edges", ["a_code", "b_code"], :name => "index_edges_on_a_code_and_b_code", :unique => true

  create_table "events", :force => true do |t|
    t.integer  "author_id"
    t.string   "author_name", :limit => 64
    t.string   "event_type",  :limit => 32,  :null => false
    t.string   "model_type",  :limit => 32
    t.integer  "model_id"
    t.string   "content",     :limit => 256
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "forecasts", :force => true do |t|
    t.datetime "f_date"
    t.integer  "weather_id"
    t.string   "description"
    t.integer  "morning_low_temp"
    t.integer  "daytime_high_temp"
    t.integer  "prec_day"
    t.string   "prec_night"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_see_tracks",                   :default => false
    t.string   "notification_email", :limit => 64
  end

  create_table "fuel_levels", :force => true do |t|
    t.integer  "account_id",      :null => false
    t.integer  "group_id",        :null => false
    t.integer  "book_vehicle_id", :null => false
    t.integer  "book_id",         :null => false
    t.integer  "level"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "gaps", :force => true do |t|
    t.integer  "device_id",     :null => false
    t.integer  "packet_offset"
    t.integer  "to"
    t.integer  "requested"
    t.boolean  "success"
    t.datetime "requested_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "received_at"
  end

  add_index "gaps", ["device_id"], :name => "index_gaps_on_device_id"
  add_index "gaps", ["packet_offset", "requested"], :name => "index_gaps_on_requested_and_from"

  create_table "group_private_days", :force => true do |t|
    t.integer   "account_id",              :null => false
    t.integer   "group_id",                :null => false
    t.timestamp "date",       :limit => 0
  end

  create_table "groups", :force => true do |t|
    t.integer  "account_id",                                     :null => false
    t.string   "name",              :limit => 32,                :null => false
    t.string   "ascii_name",        :limit => 32,                :null => false
    t.integer  "users_count",                     :default => 0, :null => false
    t.integer  "vehicles_count",                  :default => 0, :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "version",                         :default => 0, :null => false
    t.integer  "morning_time_from"
    t.integer  "morning_time_to"
    t.integer  "evening_time_from"
    t.integer  "evening_time_to"
  end

  create_table "infoboxes", :force => true do |t|
    t.integer "account_id",                               :null => false
    t.integer "group_id",                                 :null => false
    t.boolean "position_with_time",    :default => true
    t.boolean "vehicle_label",         :default => true
    t.boolean "vehicle_name",          :default => true
    t.boolean "vehicle_user",          :default => true
    t.boolean "vehicle_model",         :default => true
    t.boolean "vehicle_group",         :default => false
    t.boolean "vehicle_subgroups",     :default => false
    t.boolean "vehicle_license_plate", :default => false
    t.boolean "phone_number",          :default => false
    t.boolean "last_start_time",       :default => false
    t.boolean "last_stop_time",        :default => false
    t.boolean "last_stop_duration",    :default => false
    t.boolean "last_stop_landmark",    :default => false
    t.boolean "note",                  :default => false
    t.boolean "split_address",         :default => false
    t.boolean "split_stopped_at",      :default => true
    t.boolean "split_started_at",      :default => true
    t.boolean "split_stop_duration",   :default => true
    t.boolean "poi_name",              :default => true
    t.boolean "poi_address",           :default => true
    t.boolean "poi_knapps",            :default => false
    t.boolean "poi_coordinates",       :default => true
  end

  create_table "intervals", :force => true do |t|
    t.integer  "device_id"
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.integer  "track_id"
    t.boolean  "ignition"
    t.boolean  "button"
    t.boolean  "roaming"
    t.boolean  "processed"
    t.boolean  "success"
    t.datetime "started_at",    :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_state_id"
  end

  add_index "intervals", ["device_id", "started_at"], :name => "index_intervals_on_started_at_and_device_id"
  add_index "intervals", ["device_id"], :name => "index_intervals_on_device_id"
  add_index "intervals", ["processed", "started_at"], :name => "index_intervals_on_processed_and_started_at"
  add_index "intervals", ["started_at", "vehicle_id"], :name => "index_intervals_on_vehicle_id_and_started_at"
  add_index "intervals", ["track_id"], :name => "index_intervals_on_track_id"

  create_table "job_stops", :force => true do |t|
    t.integer  "job_id",                 :null => false
    t.integer  "account_id",             :null => false
    t.integer  "predicted_boxes_number"
    t.integer  "real_boxes_number"
    t.integer  "empty_boxes_loaded"
    t.datetime "finishes_at"
    t.datetime "finished_at"
    t.string   "state"
    t.integer  "point_of_interest_id"
    t.integer  "order_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nautilus_code"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "account_id",                                           :null => false
    t.integer  "partner_id"
    t.integer  "contact_id"
    t.integer  "passenger_id"
    t.integer  "assigner_id"
    t.integer  "assignee_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "starts_at",                                            :null => false
    t.integer  "duration"
    t.string   "flight_number",          :limit => 32
    t.string   "charge_code",            :limit => 32
    t.integer  "price"
    t.string   "currency",               :limit => 3
    t.string   "payment_type",           :limit => 16
    t.string   "note",                   :limit => 256
    t.string   "job_state",              :limit => 16,                 :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "cancelled_at"
    t.datetime "deleted_at"
    t.integer  "version",                               :default => 0, :null => false
    t.string   "code",                   :limit => 16
    t.integer  "cost"
    t.string   "cost_currency",          :limit => 3
    t.integer  "creator_id"
    t.integer  "group_id",                                             :null => false
    t.integer  "target_device_id"
    t.string   "additional_stops",       :limit => 64
    t.string   "vehicle_type",           :limit => 32
    t.string   "passenger_name",         :limit => 32
    t.string   "passenger_phone_number", :limit => 32
    t.string   "passenger_email",        :limit => 64
    t.integer  "passengers_count"
    t.integer  "track_template_id"
    t.datetime "touched_at"
    t.integer  "nautilus_code"
    t.string   "name"
  end

  add_index "jobs", ["assignee_id"], :name => "index_jobs_on_assignee_id"
  add_index "jobs", ["target_device_id", "updated_at"], :name => "index_jobs_on_target_device_id_and_updated_at"

  create_table "keys", :force => true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.string   "code",       :limit => 32,                :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "version",                  :default => 0, :null => false
  end

  add_index "keys", ["code"], :name => "index_keys_on_address"

  create_table "landmarks", :force => true do |t|
    t.string   "country",    :limit => 64,                    :null => false
    t.string   "county",     :limit => 64
    t.string   "district",   :limit => 64
    t.string   "city",       :limit => 64
    t.string   "quarter",    :limit => 64
    t.string   "street",     :limit => 64
    t.float    "latitude"
    t.float    "longitude"
    t.float    "x"
    t.float    "y"
    t.integer  "level"
    t.integer  "border"
    t.boolean  "precise",                  :default => false, :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "name",       :limit => 64
    t.integer  "radius"
  end

  add_index "landmarks", ["id"], :name => "index_landmarks_on_id", :unique => true
  add_index "landmarks", ["x", "y"], :name => "index_landmarks_on_x_and_y"

  create_table "messages", :force => true do |t|
    t.integer  "account_id",                                         :null => false
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "subject",          :limit => 256
    t.text     "body"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.datetime "sent_at",                                            :null => false
    t.datetime "read_at"
    t.datetime "deleted_at"
    t.integer  "version",                         :default => 0,     :null => false
    t.integer  "target_device_id"
    t.integer  "source_device_id"
    t.boolean  "sms",                             :default => false
  end

  add_index "messages", ["source_device_id", "updated_at"], :name => "index_messages_on_source_device_id_and_updated_at"
  add_index "messages", ["target_device_id", "updated_at"], :name => "index_messages_on_target_device_id_and_updated_at"

  create_table "mn_states", :force => true do |t|
    t.string   "name"
    t.integer  "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mn_states", ["zip"], :name => "index_mn_states_on_zip"

  create_table "mobile_sessions", :force => true do |t|
    t.integer  "account_id",                                   :null => false
    t.integer  "proxy_id"
    t.integer  "device_id",                                    :null => false
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.string   "session_id",      :limit => 40,                :null => false
    t.integer  "session_id_hash",                              :null => false
    t.integer  "bytes_sent",                    :default => 0, :null => false
    t.integer  "bytes_received",                :default => 0, :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.datetime "touched_at",                                   :null => false
    t.datetime "closed_at"
  end

  add_index "mobile_sessions", ["device_id"], :name => "index_mobile_sessions_on_device_id", :unique => true
  add_index "mobile_sessions", ["user_id"], :name => "index_mobile_sessions_on_user_id", :unique => true
  add_index "mobile_sessions", ["vehicle_id"], :name => "index_mobile_sessions_on_vehicle_id", :unique => true

  create_table "networks", :force => true do |t|
    t.string   "code",       :limit => 5,                 :null => false
    t.string   "name",       :limit => 64
    t.string   "country",    :limit => 64
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "version",                  :default => 0, :null => false
  end

  add_index "networks", ["code"], :name => "index_networks_on_code", :unique => true

  create_table "order_calculators", :force => true do |t|
    t.integer  "account_id",                         :null => false
    t.integer  "order_partner_id",                   :null => false
    t.string   "name"
    t.text     "road_fees"
    t.text     "distance_fees"
    t.text     "dynamic_fees"
    t.text     "other_fees"
    t.text     "flat_rates"
    t.boolean  "enabled",          :default => true
    t.datetime "logged_at",                          :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "order_partners", :force => true do |t|
    t.string  "name",       :null => false
    t.integer "account_id", :null => false
  end

  create_table "packets", :force => true do |t|
    t.integer  "size",                                        :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "device_id"
    t.boolean  "roaming"
    t.string   "type",        :limit => 16
    t.text     "content"
    t.boolean  "incoming",                  :default => true
    t.string   "device_code", :limit => 32
    t.boolean  "processed"
    t.boolean  "success"
    t.integer  "packet_type"
    t.integer  "vehicle_id"
    t.integer  "offset_type",               :default => 0
  end

  add_index "packets", ["created_at", "device_id"], :name => "index_packets_on_device_id_and_created_at"
  add_index "packets", ["created_at", "processed"], :name => "index_packets_on_processed_and_created_at"
  add_index "packets", ["created_at"], :name => "index_packets_on_created_at"

  create_table "partners", :force => true do |t|
    t.integer  "account_id"
    t.string   "name",         :limit => 64,                      :null => false
    t.string   "ascii_name",   :limit => 64,                      :null => false
    t.string   "email",        :limit => 64
    t.string   "phone_number", :limit => 32
    t.string   "language",     :limit => 5,  :default => "en-US", :null => false
    t.boolean  "enabled",                    :default => true
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "version",                    :default => 0,       :null => false
  end

  create_table "people", :force => true do |t|
    t.integer  "account_id",                                        :null => false
    t.integer  "partner_id",                                        :null => false
    t.string   "name",              :limit => 64
    t.string   "ascii_name",        :limit => 64
    t.string   "email",             :limit => 64
    t.string   "phone_number",      :limit => 32
    t.boolean  "acts_as_contact",                 :default => true
    t.boolean  "acts_as_passenger",               :default => true
    t.boolean  "enabled",                         :default => true
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "version",                         :default => 0,    :null => false
  end

  create_table "places", :force => true do |t|
    t.integer  "account_id",                   :null => false
    t.string   "name",                         :null => false
    t.string   "ascii_name",                   :null => false
    t.integer  "importance", :default => 1,    :null => false
    t.boolean  "enabled",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "version",    :default => 0,    :null => false
  end

  create_table "point_of_interest_track_templates", :force => true do |t|
    t.integer  "point_of_interest_id"
    t.integer  "track_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "point_of_interests", :force => true do |t|
    t.integer "account_id",   :null => false
    t.string  "name"
    t.integer "knapps_count"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "address"
  end

  create_table "polylines", :force => true do |t|
    t.integer  "track_id",   :null => false
    t.text     "points"
    t.text     "levels"
    t.text     "speeds"
    t.text     "directions"
    t.text     "distances"
    t.text     "durations"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "polylines", ["track_id"], :name => "index_polylines_on_track_id", :unique => true

  create_table "positions", :force => true do |t|
    t.float    "latitude",                                           :null => false
    t.float    "longitude",                                          :null => false
    t.float    "x",                                                  :null => false
    t.float    "y",                                                  :null => false
    t.float    "altitude"
    t.float    "speed"
    t.integer  "direction"
    t.integer  "distance"
    t.string   "landmark_id",       :limit => 16
    t.float    "landmark_distance"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.datetime "measured_at",                                        :null => false
    t.integer  "tacho"
    t.integer  "device_id"
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.boolean  "ignition"
    t.boolean  "button"
    t.boolean  "roaming"
    t.boolean  "processed"
    t.boolean  "success"
    t.integer  "attachment_id"
    t.integer  "user_state_id"
    t.boolean  "locked",                          :default => false
  end

  add_index "positions", ["attachment_id"], :name => "index_positions_on_attachment_id", :unique => true
  add_index "positions", ["created_at"], :name => "index_positions_on_created_at"
  add_index "positions", ["device_id", "measured_at"], :name => "index_positions_on_device_id_and_measured_at"
  add_index "positions", ["measured_at", "processed"], :name => "index_positions_on_processed_and_measured_at"
  add_index "positions", ["measured_at", "vehicle_id"], :name => "index_positions_on_vehicle_id_and_measured_at"

  create_table "property_sets", :force => true do |t|
    t.integer  "account_id",                                   :null => false
    t.integer  "buffer_satellites"
    t.float    "buffer_horizontal_dilution"
    t.integer  "buffer_distance"
    t.integer  "split_trigger_distance"
    t.integer  "split_trigger_time"
    t.integer  "send_trigger_distance_home"
    t.integer  "send_trigger_distance_roaming"
    t.integer  "send_trigger_time_home"
    t.integer  "send_trigger_time_roaming"
    t.integer  "send_trigger_count"
    t.integer  "ping_interval_home"
    t.integer  "ping_interval_roaming"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "version",                       :default => 0, :null => false
  end

  add_index "property_sets", ["account_id"], :name => "index_property_sets_on_account_id", :unique => true

  create_table "proxies", :force => true do |t|
    t.string   "proxy_type", :limit => 16,                :null => false
    t.string   "host",       :limit => 64,                :null => false
    t.integer  "port",                                    :null => false
    t.integer  "sessions",                 :default => 0, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.datetime "touched_at",                              :null => false
  end

  create_table "records", :force => true do |t|
    t.integer  "device_id"
    t.text     "content"
    t.boolean  "processed",                  :default => false, :null => false
    t.boolean  "success"
    t.string   "result",      :limit => 256
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.datetime "logged_at"
    t.integer  "offset"
    t.string   "type",        :limit => 16
    t.integer  "record_type"
    t.integer  "vehicle_id"
  end

  add_index "records", ["created_at"], :name => "index_records_on_created_at"
  add_index "records", ["device_id", "logged_at"], :name => "index_records_on_device_id_and_logged_at"
  add_index "records", ["logged_at", "processed"], :name => "index_records_on_processed_and_logged_at"

  create_table "responses", :force => true do |t|
    t.integer  "device_id",   :null => false
    t.string   "text"
    t.datetime "sent_at"
    t.integer  "source_id"
    t.integer  "account_id",  :null => false
    t.string   "source_type"
    t.datetime "created_at",  :null => false
  end

  create_table "revisions", :force => true do |t|
    t.integer  "author_id"
    t.string   "author_name",   :limit => 64
    t.string   "model_type",    :limit => 32, :null => false
    t.integer  "model_id",                    :null => false
    t.integer  "model_version",               :null => false
    t.text     "changeset",                   :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.datetime "deleted_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 32,                :null => false
    t.string   "authorizable_type", :limit => 32
    t.integer  "authorizable_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "version",                         :default => 0, :null => false
  end

  add_index "roles", ["authorizable_id", "authorizable_type", "name"], :name => "index_roles_on_authorizable_type_and_authorizable_id_and_name", :unique => true

  create_table "sessions", :force => true do |t|
    t.integer  "session_id_hash",               :null => false
    t.string   "session_id",      :limit => 32, :null => false
    t.text     "data"
    t.datetime "updated_at",                    :null => false
    t.datetime "created_at",                    :null => false
  end

  add_index "sessions", ["session_id_hash"], :name => "index_sessions_on_session_id_hash"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sims", :force => true do |t|
    t.integer  "network_id"
    t.integer  "account_id"
    t.integer  "device_id"
    t.string   "imsi",         :limit => 16
    t.string   "phone_number", :limit => 16,                :null => false
    t.string   "pin",          :limit => 8
    t.string   "puk",          :limit => 8
    t.string   "pin2",         :limit => 8
    t.string   "puk2",         :limit => 8
    t.string   "bpin",         :limit => 8
    t.string   "bpuk",         :limit => 8
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "version",                    :default => 0, :null => false
  end

  add_index "sims", ["device_id"], :name => "index_sims_on_device_id"

  create_table "special_users", :force => true do |t|
    t.integer "vehicle_id", :null => false
    t.integer "user_id",    :null => false
  end

  create_table "spies", :force => true do |t|
    t.integer  "account_id", :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spies", ["account_id", "group_id"], :name => "index_spies_on_account_id_and_group_id", :unique => true

  create_table "splits", :force => true do |t|
    t.integer  "device_id",                   :null => false
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.string   "split_type",    :limit => 16, :null => false
    t.boolean  "ignition"
    t.boolean  "button"
    t.boolean  "roaming"
    t.boolean  "processed"
    t.boolean  "success"
    t.datetime "logged_at",                   :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_state_id"
  end

  add_index "splits", ["created_at", "logged_at", "processed"], :name => "index_splits_on_processed_and_created_at_and_logged_at"
  add_index "splits", ["created_at"], :name => "index_splits_on_created_at"
  add_index "splits", ["device_id", "logged_at", "split_type"], :name => "index_splits_on_device_id_and_logged_at_and_split_type"
  add_index "splits", ["device_id", "logged_at"], :name => "index_splits_on_logged_at_and_device_id"
  add_index "splits", ["ignition", "logged_at", "split_type", "vehicle_id"], :name => "index_splits_on_vehicle_id_and_split_type_and_logged_at_and_ign"
  add_index "splits", ["logged_at", "processed"], :name => "index_splits_on_processed_and_logged_at"
  add_index "splits", ["logged_at", "split_type", "user_id"], :name => "index_splits_on_user_id_and_logged_at_and_split_type"
  add_index "splits", ["logged_at", "split_type", "vehicle_id"], :name => "index_splits_on_vehicle_id_and_split_type_and_logged_at"

  create_table "spyings", :force => true do |t|
    t.integer  "account_id",  :null => false
    t.integer  "spy_id",      :null => false
    t.integer  "vehicle_id",  :null => false
    t.datetime "starts_at"
    t.datetime "finishes_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stops", :force => true do |t|
    t.integer  "account_id"
    t.integer  "group_id"
    t.integer  "device_id"
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "stopped_at",  :null => false
  end

  add_index "stops", ["account_id"], :name => "index_stops_on_account_id"
  add_index "stops", ["device_id"], :name => "index_stops_on_device_id"
  add_index "stops", ["group_id"], :name => "index_stops_on_group_id"
  add_index "stops", ["user_id"], :name => "index_stops_on_user_id"

  create_table "sub_groups", :force => true do |t|
    t.integer  "account_id",               :null => false
    t.string   "name",       :limit => 32, :null => false
    t.string   "ascii_name", :limit => 32, :null => false
    t.datetime "created_at",               :null => false
  end

  create_table "tachos", :force => true do |t|
    t.integer  "account_id",                 :null => false
    t.integer  "vehicle_id",                 :null => false
    t.integer  "user_id",                    :null => false
    t.integer  "interval_id"
    t.integer  "odometer"
    t.integer  "refuelling"
    t.integer  "price"
    t.boolean  "processed"
    t.boolean  "success"
    t.datetime "logged_at",                  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "version",     :default => 0, :null => false
  end

  add_index "tachos", ["created_at"], :name => "index_tachos_on_created_at"
  add_index "tachos", ["interval_id"], :name => "index_tachos_on_interval_id"
  add_index "tachos", ["logged_at", "vehicle_id"], :name => "index_tachos_on_vehicle_id_and_logged_at"
  add_index "tachos", ["logged_at"], :name => "index_tachos_on_logged_at"

  create_table "tasks", :force => true do |t|
    t.integer  "account_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "task_type",  :limit => 32, :null => false
    t.text     "content"
    t.boolean  "processed"
    t.boolean  "success"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "track_templates", :force => true do |t|
    t.integer "account_id", :null => false
    t.string  "name"
    t.string  "note"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "account_id",                                        :null => false
    t.integer  "device_id"
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.integer  "user_state_id"
    t.string   "code",             :limit => 16
    t.integer  "code_hash"
    t.float    "average_speed"
    t.float    "maximum_speed"
    t.integer  "distance",                       :default => 0,     :null => false
    t.integer  "duration",                       :default => 0,     :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "version",                        :default => 0,     :null => false
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "job_id"
    t.string   "track_type",       :limit => 16
    t.boolean  "ignition"
    t.boolean  "button"
    t.boolean  "roaming"
    t.float    "odometer"
    t.float    "odometer_base"
    t.float    "odometer_shift"
    t.float    "odometer_factor"
    t.string   "note"
    t.boolean  "locked",                         :default => false
    t.integer  "friend_id"
    t.boolean  "verified",                       :default => false
    t.integer  "next_ride_id"
    t.integer  "previous_ride_id"
  end

  add_index "tracks", ["created_at"], :name => "index_tracks_on_created_at"
  add_index "tracks", ["finished_at", "started_at", "vehicle_id"], :name => "index_tracks_on_vehicle_id_and_started_at_and_finished_at"
  add_index "tracks", ["friend_id"], :name => "index_tracks_on_friend_id"
  add_index "tracks", ["started_at"], :name => "index_tracks_on_started_at"
  add_index "tracks", ["user_id"], :name => "index_tracks_on_user_id"

  create_table "triangles", :force => true do |t|
    t.string   "a_code",     :limit => 16
    t.string   "b_code",     :limit => 16
    t.string   "c_code",     :limit => 16
    t.float    "latitude"
    t.float    "longitude"
    t.float    "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "role_id",                   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "version",    :default => 0, :null => false
  end

  add_index "user_roles", ["role_id", "user_id"], :name => "index_user_roles_on_user_id_and_role_id", :unique => true

  create_table "user_states", :force => true do |t|
    t.integer  "account_id",                                 :null => false
    t.integer  "color_id",                                   :null => false
    t.string   "name",       :limit => 16,                   :null => false
    t.string   "ascii_name", :limit => 16,                   :null => false
    t.integer  "position",                                   :null => false
    t.boolean  "enabled",                  :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "version",                  :default => 0,    :null => false
  end

  add_index "user_states", ["account_id", "position"], :name => "index_user_states_on_account_id_and_position"

  create_table "users", :force => true do |t|
    t.integer  "account_id"
    t.integer  "user_state_id"
    t.string   "ascii_name",               :limit => 64
    t.string   "email",                    :limit => 64
    t.string   "phone_number",             :limit => 32
    t.string   "login"
    t.string   "salt",                     :limit => 40
    t.string   "digest",                   :limit => 40
    t.string   "pin",                      :limit => 8
    t.string   "language",                 :limit => 5,  :default => "en-US", :null => false
    t.boolean  "site_admin",                             :default => false
    t.boolean  "admin",                                  :default => false
    t.boolean  "operator",                               :default => false
    t.boolean  "worker",                                 :default => false
    t.boolean  "enabled",                                :default => true
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.datetime "touched_at"
    t.integer  "version",                                :default => 0,       :null => false
    t.string   "label",                    :limit => 5,  :default => "?",     :null => false
    t.boolean  "viewer",                                 :default => false
    t.boolean  "mechanic",                               :default => false
    t.boolean  "guest",                                  :default => false
    t.integer  "position_id"
    t.integer  "track_id"
    t.integer  "group_id"
    t.string   "name",                                                        :null => false
    t.boolean  "head",                                   :default => false
    t.string   "fuel_card_identification"
    t.string   "key"
    t.boolean  "special",                                :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "vehicle_private_days", :force => true do |t|
    t.integer   "account_id",              :null => false
    t.integer   "vehicle_id",              :null => false
    t.timestamp "date",       :limit => 0
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "account_id"
    t.string   "name",                     :limit => 32
    t.string   "ascii_name",               :limit => 32,                   :null => false
    t.string   "brand",                    :limit => 32
    t.string   "model",                    :limit => 32
    t.boolean  "enabled",                                :default => true
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.datetime "touched_at"
    t.integer  "version",                                :default => 0,    :null => false
    t.string   "license_plate",            :limit => 16
    t.string   "vin",                      :limit => 32
    t.integer  "user_id"
    t.string   "label",                    :limit => 5,  :default => "?",  :null => false
    t.integer  "garage_account_id"
    t.datetime "visible_until"
    t.integer  "track_id"
    t.integer  "position_id"
    t.integer  "group_id"
    t.string   "key"
    t.string   "fuel_card_identification", :limit => 30
    t.integer  "morning_time_from"
    t.integer  "morning_time_to"
    t.integer  "evening_time_from"
    t.integer  "evening_time_to"
  end

  add_index "vehicles", ["account_id"], :name => "index_vehicles_on_account_id"
  add_index "vehicles", ["group_id"], :name => "index_vehicles_on_group_id"
  add_index "vehicles", ["position_id"], :name => "index_vehicles_on_position_id"

end
