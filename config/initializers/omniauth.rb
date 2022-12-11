# Without this I was gettting error: "Not found. Authentication passthru."
# https://stackoverflow.com/a/69983218/5615805
OmniAuth.config.allowed_request_methods = %i[get]
