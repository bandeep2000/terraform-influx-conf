provider "influxdb" {
  //url = "http://35.197.76.190:8086"
  url = "${var.influxdb_url}"
}

resource "influxdb_database" "default" {
  name = "stratus"
  retention_policies = [
    {
      name = "30days",
      duration = "30d"
      default = "true"
    },
    {
      name = "7d",
      duration = "7d"

    },
  ]
}

resource "influxdb_database" "mercury" {
  name = "mercury"
}

resource "influxdb_database" "venus" {
  name = "venus"

}

resource "influxdb_database" "mars" {
  name = "mars"
}

/*resource "influxdb_continuous_query" "minnie" {
  name     = "minnie"
  database = "${influxdb_database.metrics.name}"
  query    = "SELECT min(mouse) INTO min_mouse FROM zoo GROUP BY time(30m)"
}
*/

resource "influxdb_user" "paul" {
  name     = "paul"
  password = "super-secret"
}
