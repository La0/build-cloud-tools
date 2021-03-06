# Route 53 resources

resource "aws_route53_zone" "mozilla-releng" {
    name = "mozilla-releng.net."
}

resource "aws_route53_zone" "moztools" {
    name = "moz.tools."
}

################
##  moz.tools ##
################

resource "aws_route53_record" "relman-ci-moz-tools-cname-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "relman-ci.moz.tools"
  type = "A"
  ttl = "180"
  records = ["35.180.7.143"]
}

resource "aws_route53_record" "relman-clouseau-moz-tools-cname-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "clouseau.moz.tools"
  type = "CNAME"
  ttl = "180"
  records = ["clouseau.moz.tools.herokudns.com"]
}

resource "aws_route53_record" "relman-buildhub-moz-tools-cname-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "buildhub.moz.tools"
  type = "CNAME"
  ttl = "180"
  records = ["prod.buildhub2.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "relman-buildhub-moz-tools-cert-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "_1cd7d55cbecc43cd936b8a83293e002d.buildhub.moz.tools"
  type = "CNAME"
  ttl = "180"
  records = ["dcv.digicert.com"]
}

resource "aws_route53_record" "relman-coverity-moz-tools-cname-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "coverity.moz.tools"
  type = "CNAME"
  ttl = "180"
  records = ["prod.coverity.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "relman-coverage-moz-tools-ns-prod" {
  zone_id = "${aws_route53_zone.moztools.zone_id}"
  name = "coverage.moz.tools"
  type = "NS"
  ttl = "180"
  records = [
    "ns-1151.awsdns-15.org.",
    "ns-584.awsdns-09.net.",
    "ns-1748.awsdns-26.co.uk.",
    "ns-60.awsdns-07.com.",
  ]
}

###################
## Code Coverage ##
###################

resource "aws_route53_record" "heroku-code-coverage-backend-shipit-cname-prod" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "api.coverage.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["desolate-artichoke-1kra3z6kgs9mw2sa15u9abte.herokudns.com"]
}

resource "aws_route53_record" "heroku-code-coverage-backend-shipit-cname-test" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "api.coverage.testing.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["quiet-elk-4brvoeg6xv0mahvfwgtnveu6.herokudns.com"]
}

#################
## Code review ##
#################


# TODO: remove once switch to code-review.moz.tools is complete
resource "aws_route53_record" "heroku-event-listener-cname-prod" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "eventlistener.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["convex-woodland-ilwk96s11s92e5otfkmb5ybe.herokudns.com"]
}

# TODO: remove once switch to code-review.testing.moz.tools is complete
resource "aws_route53_record" "heroku-event-listener-cname-test" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "eventlistener.testing.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["adjacent-shelf-2mxct7inb0tl5tg1rwt73ev4.herokudns.com"]
}

resource "aws_route53_record" "heroku-event-code-review-cname-prod" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "events.code-review.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["computational-tulip-1uri1v0f5lt15a7auezt7p5o.herokudns.com"]
}

resource "aws_route53_record" "heroku-event-code-review-cname-test" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "events.code-review.testing.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["convex-raven-uc9qj36u74ermlf6qiz8fgsc.herokudns.com"]
}

resource "aws_route53_record" "heroku-backend-code-review-cname-prod" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "api.code-review.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["mysterious-mullberry-o1x86tkb7po3dvawe5tm1yxf.herokudns.com"]
}

resource "aws_route53_record" "heroku-backend-code-review-cname-test" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "api.code-review.testing.moz.tools"
    type = "CNAME"
    ttl = "180"
    records = ["polar-leopard-oghlp6pg2r3w8s766swnec7j.herokudns.com"]
}

############
## ShipIt ##
############

resource "aws_route53_record" "dockerflow-shipit-api-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name= "shipit-api.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["prod.shipitapi.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "dockerflow-shipit-api-cname-pre" {
  zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
  name= "api.shipit.pre.mozilla-releng.net"
  type = "CNAME"
  ttl = "180"
  records = ["stage.shipitapi.nonprod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "dockerflow-shipit-api-cname-stag" {
  zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
  name= "api.shipit.staging.mozilla-releng.net"
  type = "CNAME"
  ttl = "180"
  records = ["dev.shipitapi.nonprod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "dockerflow-shipit-api-cname-test" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name= "api.shipit.testing.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["testing.shipitapi.nonprod.cloudops.mozgcp.net"]
}

############
## Uplift ##
############

resource "aws_route53_record" "heroku-uplift-shipit-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "uplift.shipit.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["uplift.shipit.mozilla-releng.net.herokudns.com"]
}

resource "aws_route53_record" "heroku-uplift-shipit-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "uplift.shipit.staging.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["uplift.shipit.staging.mozilla-releng.net.herokudns.com"]
}

resource "aws_route53_record" "heroku-uplift-shipit-cname-test" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "uplift.shipit.testing.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["uplift.shipit.testing.mozilla-releng.net.herokudns.com"]
}

#####################
## Product details ##
#####################

resource "aws_route53_record" "dockerflow-product-details-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name= "product-details.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["productdetails-prod.prod.mozaws.net"]
}

resource "aws_route53_record" "dockerflow-product-details-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name= "product-details.staging.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["productdetails-staging.stage.mozaws.net"]
}

resource "aws_route53_record" "dockerflow-product-details-cname-test" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name= "product-details.testing.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["productdetails-testing.dev.mozaws.net"]
}

##############
## Coalesce ##
##############

resource "aws_route53_record" "heroku-coalease-cname" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "coalesce.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["coalesce.mozilla-releng.net.herokudns.com"]
}

resource "aws_route53_record" "heroku-coalease-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "coalesce.staging.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["coalesce.staging.mozilla-releng.net.herokudns.com"]
}

############
## Tokens ##
############

resource "aws_route53_record" "heroku-tokens-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "tokens.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["tokens.mozilla-releng.net.herokudns.com"]
}

resource "aws_route53_record" "heroku-tokens-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "tokens.staging.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["tokens.staging.mozilla-releng.net.herokudns.com"]
}

resource "aws_route53_record" "heroku-tokens-cname-test" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "tokens.testing.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["tokens.testing.mozilla-releng.net.herokudns.com"]
}

############
## Mapper ##
############

resource "aws_route53_record" "heroku-mapper-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "mapper.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["prod.mapper.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-mapper-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "stage.mapper.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["stage.mapper.nonprod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-mapper-cname-dev" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "dev.mapper.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["dev.mapper.nonprod.cloudops.mozgcp.net"]
}

################
## TreeStatus ##
################

resource "aws_route53_record" "heroku-treestatus-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "treestatus.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["prod.treestatus.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-treestatus-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "stage.treestatus.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["stage.treestatus.nonprod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-treestatus-cname-dev" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "dev.treestatus.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["dev.treestatus.nonprod.cloudops.mozgcp.net"]
}


##############
## ToolTool ##
##############

resource "aws_route53_record" "heroku-tooltool-cname-prod" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "tooltool.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["prod.tooltool.prod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-tooltool-cname-stage" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "stage.tooltool.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["stage.tooltool.nonprod.cloudops.mozgcp.net"]
}

resource "aws_route53_record" "heroku-tooltool-cname-dev" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "dev.tooltool.mozilla-releng.net"
    type = "CNAME"
    ttl = "180"
    records = ["dev.tooltool.nonprod.cloudops.mozgcp.net"]
}


############################
## CloudFront CDN aliases ##
############################

variable "cloudfront_alias" {
    default = ["docs",
               "docs.staging",
               "docs.testing",
               "shipit",
               "shipit.staging",
               "shipit.testing",
               "staging",
               "testing",
               "www"]
}

variable "cloudfront_moztools_alias" {
    default = ["static-analysis",
               "static-analysis.staging",
               "static-analysis.testing"]
}

# Cloudfront Alias Targets
# In the future, these may be sourced directly from terraform cloudfront resources
# should we decide to manage cloudfronts in terraform
variable "cloudfront_alias_domain" {
    type = "map"
    default = {
        shipit = "d3phvtn087pdcs"
        shipit.staging = "d1cttl07hxwjbl"
        shipit.testing = "dt9vzct0e0pwk"
        docs = "dkamdn8kujupl"
        docs.staging = "d1cglo5i889p5y"
        docs.testing = "d1s9qzzh9bruag"
        www = "ddealaqd6tp6a"
        staging = "d2qqjmci8ffy3k"
        testing = "d1ja915kcjy2vv"
    }
}

variable "cloudfront_moztools_alias_domain" {
    type = "map"
    default = {
        static-analysis = "d2ezri92497z3m"
        static-analysis.staging = "d21hzgxp28m0tc"
        static-analysis.testing = "d1blqs705aw8h9"
    }
}

# A (Alias) records for cloudfront apps
resource "aws_route53_record" "cloudfront-alias" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "${element(var.cloudfront_alias, count.index)}.mozilla-releng.net"
    type = "A"
    count = "${length(var.cloudfront_alias)}"

    alias {
        name = "${var.cloudfront_alias_domain[element(var.cloudfront_alias, count.index)]}.cloudfront.net."
        zone_id = "Z2FDTNDATAQYW2"
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "cloudfront-moztools-alias" {
    zone_id = "${aws_route53_zone.moztools.zone_id}"
    name = "${element(var.cloudfront_moztools_alias, count.index)}.moz.tools"
    type = "A"
    count = "${length(var.cloudfront_moztools_alias)}"

    alias {
        name = "${var.cloudfront_moztools_alias_domain[element(var.cloudfront_moztools_alias, count.index)]}.cloudfront.net."
        zone_id = "Z2FDTNDATAQYW2"
        evaluate_target_health = false
    }
}

# A special root alias that points to www.mozilla-releng.net
resource "aws_route53_record" "root-alias" {
    zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
    name = "mozilla-releng.net"
    type = "A"

    alias {
        name = "www.mozilla-releng.net"
        zone_id = "${aws_route53_zone.mozilla-releng.zone_id}"
        evaluate_target_health = false
    }
}
