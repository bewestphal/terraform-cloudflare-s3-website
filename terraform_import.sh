# This file can be used as a pre-run step to import existing
# resources in case they are not in terraform's state

# Import S3 Bucket
terraform import aws_s3_bucket.static_site_bucket $DOMAIN

# Import Cloudflare Zone (obtainable in the zone's dashboard page)
CLOUDFLARE_ZONE_ID=
terraform import cloudflare_zone.main $CLOUDFLARE_ZONE_ID

# Import Root CNAME
RECORD_ID=
terraform import cloudflare_record.prod_root $CLOUDFLARE_ZONE_ID/$RECORD_ID
