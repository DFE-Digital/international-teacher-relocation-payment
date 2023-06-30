OkComputer.mount_at = "healthcheck"

OkComputer::Registry.register "postgresql", OkComputer::ActiveRecordCheck.new
