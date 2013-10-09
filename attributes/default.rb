default["keepalived"]["shared_address"] = true
default["keepalived"]["notification_emails"] = "alert@test.local"
default["keepalived"]["notification_email_from"] = "alert@#{node["domain"] || "test.local"}"
default["keepalived"]["smtp_server"] = "127.0.0.1"
default["keepalived"]["smtp_connect_timeout"] = 30
default["keepalived"]["router_id"] = node["fqdn"]
default["keepalived"]["router_ids"] = {}