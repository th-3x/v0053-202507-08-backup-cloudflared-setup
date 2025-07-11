#!/bin/bash
# Using #!/bin/bash for potentially bash-specific syntax like `command -v` behavior
# and `source` (though `.` is POSIX).

set -e # Exit immediately if a command exits with a non-zero status.

# zip
sudo apt update
sudo apt install unzip

# cloudflared
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | sudo tee /etc/apt/sources.list.d/cloudflared.list

sudo apt-get update && sudo apt-get install cloudflared 

