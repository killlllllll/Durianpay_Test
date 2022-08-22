locals {
    common_tags    = {
        company    = "${var.company}"        
        owner      = "${var.owner}"        
        created_by = "${var.created_by}"
    }    
}