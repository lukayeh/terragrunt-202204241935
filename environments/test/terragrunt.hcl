include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../src"
}

inputs = {
    label = "I'm overriding your stuff from test" 
}