variable "s3-objects" {
  type = map(object({
    key          = string
    source       = string
    content_type = string
  }))

  description = "The different objects to upload to the bucket."

  default = {
    "index" = {
      key          = "index.html"
      source       = "./lab-example/index.html"
      content_type = "text/html"
    }

    "style" = {
      key          = "style.css"
      source       = "./lab-example/style.css"
      content_type = "text/css"
    }

    "error" = {
      key          = "error.html"
      source       = "./lab-example/error.html"
      content_type = "text/html"
    }

    "female_1" = {
      key          = "images/female1.jpg"
      source       = "./lab-example/images/female1.jpg"
      content_type = "image/jpeg"
    }

    "female_2" = {
      key          = "images/female2.avif"
      source       = "./lab-example/images/female2.avif"
      content_type = "image/avif"
    }

    "female_3" = {
      key          = "images/female3.jpg"
      source       = "./lab-example/images/female3.jpg"
      content_type = "image/jpg"
    }

    "japan_home1" = {
      key          = "images/japan-home1.jpeg"
      source       = "./lab-example/images/japan-home1.jpeg"
      content_type = "image/jpeg"
    }

    "japan_home2" = {
      key          = "images/japan-home2.jpeg"
      source       = "./lab-example/images/japan-home2.jpeg"
      content_type = "image/jpeg"
    }

    "big_1" = {
      key          = "images/big1.jpeg"
      source       = "./lab-example/images/big1.jpeg"
      content_type = "image/jpeg"
    }

    "background1" = {
      key          = "images/background1.avif"
      source       = "./lab-example/images/background1.avif"
      content_type = "image/avif"
    }

    "error1" = {
      key          = "images/error1.avif"
      source       = "./lab-example/images/error1.avif"
      content_type = "image/avif"
    }

  }
}

locals {
  s3_origin_id = "s3-${aws_s3_bucket.website.bucket}"
}