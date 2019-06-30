rs.initiate()
rs.add('mongo1:27017')
rs.add('mongo2:27017')
rs.status()
cfg = rs.conf()
cfg.members[2].hidden = true
cfg.members[2].priority = 0
rs.reconfig(cfg)
