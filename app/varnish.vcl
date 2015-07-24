vcl 4.0;
backend default {
  .host = "web";
  .port = "8080";
}

sub vcl_recv {
  if (req.method != "GET" && req.method != "HEAD") {
    return (pass);
  }

  if (req.http.X-Requested-With) {
    return (pass);
  }

  return (pass);
}

sub vcl_backend_response {
  if (beresp.status == 200) {
    set beresp.ttl = 300s;
    return (deliver);
  }
}
