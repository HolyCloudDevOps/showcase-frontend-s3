terraform {
  cloud {
    organization = "hollydevops"
    workspaces {
      name = "default"
    }
  }
}