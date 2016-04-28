json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :content, :lec_file, :course_id, :user_id
  json.url lecture_url(lecture, format: :json)
end
