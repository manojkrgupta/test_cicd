resource "chainguard_identity" "buildkite" {
  parent_id   = data.chainguard_group.group.id
  name   	 = "buildkite"
  description = <<EOF
    This is an identity that authorizes Buildkite workflows
    for this pipeline to assume to interact with chainctl.
  EOF

  claim_match {
    issuer 		 = "https://agent.buildkite.com"
    subject_pattern = "organization:manojkumar.v.gupta:pipeline:test.cicd:ref:refs/heads/(main|buildkite):commit:[0-9a-f]+:step:get-token"
  }
}
