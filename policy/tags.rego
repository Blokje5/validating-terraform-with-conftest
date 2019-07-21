package tags_validation

minimum_tags = {"ApplicationRole", "Owner", "Project"}

key_val_valid_pascal_case(key, val) {
    is_pascal_case(key)
    is_pascal_case(val)
}

is_pascal_case(string) {
    re_match(`^([A-Z][a-z0-9]+)+`, string)
}

tags_contain_proper_keys(tags) {
    keys := {key | tags[key]}
    leftover := minimum_tags - keys
    leftover == set()
}