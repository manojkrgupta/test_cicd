output "buildkite-identity" {
  value = chainguard_identity.buildkite.id
}

data "chainguard_role" "viewer" {
  name = "viewer"
}

resource "chainguard_rolebinding" "view-stuff" {
  identity = chainguard_identity.buildkite.id
  group	= data.chainguard_group.group.id
  role 	= data.chainguard_role.viewer.items[0].id
}

