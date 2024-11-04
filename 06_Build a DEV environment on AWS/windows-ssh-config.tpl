add-content -path c:/Users/djkon/.ssh/config -value @'

Host ${hostname}
 HostName ${hostname}
 User ${user}
 IdentityFile ${identityfile}
'@