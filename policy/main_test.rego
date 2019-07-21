package main

test_tags_pascal_case {
    deny == set() with input as {"resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "ArtifactRepository", "Owner": "Ssi", "Project": "Artifacts", "Country": "Ng" }}}}]}
}

test_tags_pascal_case_with_wrong_value_format {
    deny with input as { "resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "artifactRepository", "Owner": "Ssi", "Project": "Artifacts", "Country": "Ng" }}}}]}
}

test_tags_pascal_case_with_wrong_key_format {
    deny with input as { "resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "ArtifactRepository", "owner": "Ssi", "Project": "Artifacts", "Country": "Ng" }}}}]}
}

test_tags_contain_minimum_set {
    deny == set() with input as { "resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "ArtifactRepository", "Owner": "Ssi", "Project": "Artifacts" }}}}]}
}

test_tags_contain_minimum_set_with_extra_tags {
    deny == set() with input as { "resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "ArtifactRepository", "Owner": "Ssi", "Project": "Artifacts", "Country": "Ng" }}}}]}
}

test_tags_contain_minimum_set_without_minimum {
    deny with input as { "resource_changes": [{ "address": "module.one", "change": { "after": { "tags": { "ApplicationRole": "ArtifactRepository", "Project": "Artifacts", "Country": "Ng" }}}}]}
}
