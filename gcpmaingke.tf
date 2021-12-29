provider "google" {

  credentials = file("svctf.json")
  project = "dps-parent-project"
  region  = "us-central1-c"
  
}
resource "google_container_cluster" "primary" {

  name     = "my-cluster"
  location = "us-central1-c"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  //remove_default_node_pool = true
  initial_node_count       = 4
  
}

//resource "google_container_node_pool" "primary_preemptible_nodes" {
  //name       = "my-node-pool"
  //cluster    = google_container_cluster.primary.id
  //node_count = 3

 // node_config {
  //  preemptible  = true
   // machine_type = "e2-medium"   
  //}
//}
