CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'tsujishuheipacket'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tsujishuheipacket'
    when 'production'
        config.fog_directory  = 'tsujishuheipacket'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tsujishuheipacket'
    when 'test'
        config.fog_directory  = 'tsujishuheipacket'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tsujishuheipacket'
    end
end

