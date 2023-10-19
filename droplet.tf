resource "digitalocean_droplet" "example" {
  name   = "example-droplet"
  region = "nyc3"  # Choose your desired region
  size   = "s-1vcpu-1gb"  # Choose your desired size
  image  = "ubuntu-20-04-x64"  # Choose your desired OS image
  ssh_keys = [
    "YOUR_SSH_KEY_FINGERPRINT",
  ]
}

resource "cloudflare_record" "example_dns" {
  zone_id = "YOUR_CLOUDFLARE_ZONE_ID"
  name    = "example.com"  # Replace with your desired domain/subdomain
  type    = "A"
  value   = digitalocean_droplet.example.ipv4_address  # Reference the Droplet's IP from your previous Terraform configuration
  ttl     = 300  # Time to live in seconds
}

output "ip_address" {
  value = digitalocean_droplet.example.ipv4_address
}
