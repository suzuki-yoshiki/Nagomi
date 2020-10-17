FactoryBot.define do
  factory :work_history do
    worked_on { "2020-10-16" }
    start_date { "2020-10-16 07:28:39" }
    end_date { "2020-10-16 07:28:39" }
    reservation_work { "MyText" }
    reservation_mark { "MyString" }
    client_name_flag { "MyString" }
    main_menu { "MyString" }
    option_menu { "MyString" }
    start_times { "2020-10-16 07:28:39" }
    user { nil }
  end
end
