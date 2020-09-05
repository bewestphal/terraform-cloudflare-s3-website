provider "cloudflare" {
  version = "~> 2.0"
  email   = data.external.env.result.CLOUDFLARE_EMAIL
  api_key = data.external.env.result.CLOUDFLARE_API_KEY
}

resource "cloudflare_zone" "main" {
  zone = data.external.env.result.DOMAIN
  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_record" "root" {
  type    = "CNAME"
  name    = "@"
  zone_id = cloudflare_zone.main.id
  value   = aws_s3_bucket.static_site_bucket.website_endpoint
  proxied = true
}

resource "cloudflare_record" "www" {
  type    = "CNAME"
  name    = "www"
  zone_id = cloudflare_zone.main.id
  value   = data.external.env.result.DOMAIN
  proxied = true
}

resource "cloudflare_zone_settings_override" "prod" {
  zone_id = cloudflare_zone.main.id
  settings {
    ssl = "flexible"
  }
}
