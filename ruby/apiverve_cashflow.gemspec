# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_cashflow"
  spec.version       = "1.2.2"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Cash Flow Statement API - Ruby Client"
  spec.description   = "Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you."
  spec.homepage      = "https://apiverve.com/marketplace/cashflow?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/cashflow-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/cashflow"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
