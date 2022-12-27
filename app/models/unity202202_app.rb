class Unity202202App < ApplicationRecord
  mount_uploader :loader_file, Unity202202AppUploader
  mount_uploader :data_file, Unity202202AppUploader
  mount_uploader :framework_file, Unity202202AppUploader
  mount_uploader :code_file, Unity202202AppUploader
end
