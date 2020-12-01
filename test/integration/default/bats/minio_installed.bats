#!/usr/bin/env bats

@test "saltdocker binary is in our \$PATH" {
  command -v saltdocker
}


@test "assert saltdocker user exists" {
  run getent passwd saltdocker > /dev/null
  [ ${status} = 0 ]
}

@test "assert saltdocker service file exists" {
  run test -e /etc/systemd/system/saltdocker.service
  [ ${status} = 0 ]
}

@test "assert /etc/default/saltdocker file exists" {
  run test -e /etc/default/saltdocker
  [ ${status} = 0 ]
}

@test "assert saltdocker service is running " {
  run bash -c "[ ! -d '/tmp/test' ] && mkdir /tmp/test; chown saltdocker:saltdocker /tmp/test; systemctl start saltdocker; systemctl show saltdocker|grep -e ActiveState -e SubState"
  [ $status = 0 ]
  [ "${lines[0]}" = "ActiveState=active" ]
  [ "${lines[1]}" = "SubState=running" ]
}
