module "minecraft_server" {
  source = "../../modules/minecraft_server"

  ec2_instance_type            = "t4g.small"  # 最低これくらいのスペック
  ec2_ami                      = "ami-0548e5d1cef315c7f"
  minecraft_image_tag          = "latest"  # バージョン変えたい場合は変更
  delete_volume_on_termination = true  # サーバを落とした時にmapを消滅させるか
  ### TODO: EBSをmap単位で管理

  # サーバ名
  server_url_prefix            = "minecraft-server"  # サーバ名

  ### 以下の設定を自分のものに変更
  vpc_id                       = "vpc-2d96994a"  # defaultでも良いので自分のものを
  subnet_id                    = "subnet-cf112b94"  # defaultでも良いので自分のものを
  hosted_zone_id               = "Z01584752K5G4ULO1FKKC"  # route53で作成済みのhosted_zone_id
  key_name                     = "minecraft-key"  # キーペアをあらかじめ作っておく
  sg_name                      = "minecraft_sg"  # 被るとこける
}
