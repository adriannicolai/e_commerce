require 'aws-sdk-s3'

module FileHelper
	def initialize_s3()
		s3 = Aws::S3::Client.new(
			access_key_id: ENV["s3_access_key_id"],
			secret_access_key: ENV["s3_secret_access_key"],
			region: ENV["s3_region"],
			endpoint: ENV["s3_endpoint"]
		)
	end

	def s3_file_upload()
		s3 = initialize_s3()

		bucket_name = ENV["s3_bucket_name"]
		object_key = 'object-name' # Name of the object being uploaded
		object_path = '/path/to/object/to/upload' # TODO: CLean it here make it file location only

		File.open(object_path, 'rb') do |file|
		s3.put_object(bucket: bucket_name, key: object_key, body: file)
		end
	end
end