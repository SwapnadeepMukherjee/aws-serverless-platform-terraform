resource "aws_cloudfront_distribution" "this" {
    enabled = true

    origin {
        domain_name = var.api_gateway_url
        origin_id   = "api-origin"
    }

    default_cache_behaviour {
        target_origin_id        = "api-origin"
        viewer_protocol_policy  = "redirect-to-https"

        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
    }
}