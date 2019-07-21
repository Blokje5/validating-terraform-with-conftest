package tags_validation

test_tags_valid_pascal_case {
    tags := { "ApplicationRole": "ArtifactRepository" }
    val := tags[key]
    key_val_valid_pascal_case(key, val)
}

test_tags_valid_pascal_case_lower_case_key {
    tags := { "applicationRole": "ArtifactRepository" }
    val := tags[key]
    not key_val_valid_pascal_case(key, val)
}

test_tags_valid_pascal_case_lower_case_value {
    tags := { "ApplicationRole": "artifactRepository" }
    val := tags[key]
    not key_val_valid_pascal_case(key, val)
}


test_tags_valid_pascal_case_lower_case_value_multiple_tags {
    tags := { "ApplicationRole": "artifactRepository", "Project": "Artifacts" }
    val := tags[key]
    not key_val_valid_pascal_case(key, val)
}

test_tags_contain_proper_keys {
    tags := { "ApplicationRole": "ArtifactRepository", "Project": "Artifacts", "Owner": "Ssi", "Country": "Ng" }
    tags_contain_proper_keys(tags)
}

test_tags_contain_proper_keys_missing_key {
    tags := { "ApplicationRole": "ArtifactRepository", "Project": "Artifacts", "Country": "Ng" }
    not tags_contain_proper_keys(tags)
}