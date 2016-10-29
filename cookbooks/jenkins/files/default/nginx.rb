#!/opt/chef/embedded/bin/ruby

file = "/etc/nginx/nginx.conf"

text = File.read(file)

subs = "location / {\n\t\tproxy_pass http://127.0.0.1:8080;\n\t\tproxy_redirect off;" \
        "\n\t\tproxy_set_header Host $host;\n\t\tproxy_set_header X-Real-IP $remote_addr;" \
        "\n\t\tproxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;" \
        "\n\t\tproxy_set_header X-Forwarded-Proto $scheme;\n\t}"


contents = text.gsub(/(^\s+)location \/ \{\n.*}/, "#{subs}")

File.open(file, "w") do |f|
  f.write(contents)
end
