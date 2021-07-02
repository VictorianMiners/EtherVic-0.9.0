EtherVic Miner V0.9.0

**********
Features:

Only Nvidia support at the moment
Dots represented are jobs received by the pool
Rig GPU Hashrate: Hashrate calculated on GPU settings
Pool Share Hashrate: Hashrate calculated based on shares accepted by the pool. This is the real value we need to keep high. If too low please lower your GPU OC settings for optimal performance
Miner will call reboot.bat when it crashes. On new versions we will add more features like minimum ratio accepted shares 
Miner optimized to negotiate with pool to obtain best performance. Check Pool Hashrate as the main performance report, as it is not only affected by GPU hashrate speed, but also other factors like network performance
Devfee 1%

We strongly suggest to only apply OC settings after the DAG is generated

**********
Instructions:
Please check Start.bat and amend settings as needed (Pool, address, etc
Please check Reboot.bat as add more features at your will
Enjoy your mining

**********
Example for reference:

.................
Job: 6370fd32 ## Solution: 0x6a170000049ea0ca ##
####  Share (1) Accepted   #### (  47) ms.

- - - - - - - - - - - - - -  2021/6/13  5:33:41 - - - - - - - - - - - - - -
     VicMiner     (High-Performance Miner)
   Shares Accepted:1 Rejected:0 Wasted:0 Failed:0
   Rig GPU Hashrate: 22.20Mh Pool Share Hashrate: 40.80Mh  Running Time:0:03
   GPU#0 Hasrate:22.20 [ Tg(C):66 Tm(C):0 F(%):0 P(W):79.05 ] [1/1]  R%:100



**********
EtherVic.exe --help

General options:

General       options:
  -h [ --help ]             This help message
  -H [ --help-module ] arg  Help for a given module, one of: cl, cu, misc, env,
                            con, test, conf or reboot
  -V [ --version ]          The version number
  -P [ --pool ] arg         One or more Stratum pool or http (getWork)
                            connection as URL(s)

                            scheme://user[.workername][:password]@]hostname:por
                            t[/...]

                            For details and some samples how to fill in this
                            value please use
                            --help-module con


  -F [ --config ] arg       Configuration file name. See '-H conf' for details.


**********
EtherVic.exe -V

########################################################
VicMiner (High Performance Miner)
Copyright 2021.06 VictorianMinersTeam - Version: 0.9.0
########################################################
https://github.com/VictorianMiners


**********
EtherVic.exe -H reboot

Miner reboots:

    You Could create a reboot script that will be called if ever
    the miner needs to restart if the miner detects a hung GPU
    The script needs a specific file name and must be in
    the search path.

    For Windows: reboot.bat


**********
EtherVic.exe --help-module cl

OpenCL        options:
  --cl-work arg (=128)  Set the work group size, valid values are 64 128 or 256
  --cl-split            Force split-DAG mode. May improve performance on older
                        GPU models.

**********
Ethervic.exe --help-module cu

CUDA          options:
  --cu-block arg (=128) Set the block size, valid values are 32, 64, 128, or
                        256
  --cu-streams arg (=2) Set the number of streams per GPU, valid values 1, 2 or
                        4


**********
Ethervic.exe --help-module misc

Miscellaneous options:
  -v [ --verbosity ] arg (=0)  Set output verbosity level. Use the sum of :
                               1 - log per GPU status lines
                               2 - log per GPU solutions

  --getwork-recheck arg (=500) Set polling interval for new work in getWork
                               mode. Value in milliseconds. Not Aply in stratum
                               mode
  --retry-delay arg (=0)       Delay (seconds) for reconnection retry
  --retry-max arg (=3)         Set max reconnection retries to same pool. Set
                               to 0 for infinite retries.
  --work-timeout arg (=180)    If no new work received from pool after this
                               amount of time the connection is dropped. Value
                               in seconds.
  --response-timeout arg (=2)  If no response from pool to a stratum message
                               after this amount of time the connection is
                               dropped
  -R [ --report-hashrate ]     Report RIG Hashrate to the pool
  --display-interval arg (=5)  Statistic  interval (seconds)
  --HWMON arg (=0)             GPU hardware monitoring level::
                               0  No information
                               1  +temperatures +fan percentage
                               2  +GPU power drain
  --exit                       Stop miner whenever an error is encountered
  --failover-timeout arg (=0)  Sets the number of minutes miner can stay
                               connected to a fail-over pool before trying to
                               reconnect to the primary (the first) connection.
  --nocolor                    Monochrome display log lines
  --syslog                     Use syslog appropriate output (drop timestamp
                               and channel prefix)
  -L [ --list-devices ]        Lists the detected OpenCL/CUDA devices and
                               exits. Can be combined with -G or -U flags
  --tstop arg (=0)             Suspend mining on GPU which temperature is above
                               this threshold. Implies --HWMON 1 option. If not
                               set or zero no temp control is performed
  --tstart arg (=0)            Restart mining on previously overheated GPU when
                               temp drops below this threshold. Implies --HWMON
                               1. Must be lower than --tstop
  -n [ --nonce ] arg           Hex string specifying the upper bits of miner's
                               start nonce. Can be used to ensure multiple
                               miners are not searching overlapping nonce
                               ranges.
  --devices arg                List of device numbers to be used
  --seq                        Generate DAG sequentially, one GPU at a time.



**********
Ethervic.exe --help-module env

Environment variables :

    If you need or do feel more comfortable you can set the following
    environment variables. Please respect letter casing.

    SSL_CERT_FILE  Set to the full path to of your CA certificates
                   file if it is not in standard path :
                   /etc/ssl/certs/ca-certificates.crt.



**********
Ethervic.exe --help-module con


Connections specifications :

    Whether you need to connect to a stratum pool or to make use of
    getWork polling mode (generally used to solo mine) you need to specify
    the connection  making use of -P command line argument filling up the
    URL. The URL is in the form:

     scheme://[user[.workername][:password]@]hostname:port[/...].

    where 'scheme' can be any of :

    getwork    for http getWork mode
    stratum    for tcp stratum mode
    stratums   for tcp encrypted stratum mode
    Example 1: -P getwork://127.0.0.1:8545
    Example 2: -P stratums://0x012345678901234567890234567890123.minerX@vicminerpool.org:5555
    Example 3: -P stratum://0x012345678901234567890234567890123.minerX@vicminerpool.org:9999/your.email%40gmail.com
    Example 4: -P stratum://0x012345678901234567890234567890123@vicminerpool.org:9999/minerX/your.email%40gmail.com

    Please note: if your user or worker or password do contain characters
    which may impair the correct parsing (namely any of . : @ # ?) you have
    to enclose those values in backticks( ` ASCII 096) or Url Encode them
    Also note that backtick has a special meaning in *nix environments thus
    you need to further escape those backticks with backslash.

    Example : -P stratums://\`account.121\`.minerX:x@vicminer.org:5555
    Example : -P stratums://account%2e121.minerX:x@vicminer.org:5555
    (In Windows backslashes are not needed)

    Common url encoded chars are
    . (dot)      %2e
    : (column)   %3a
    @ (at sign)  %40
    ? (question) %3f
    # (number)   %23
    / (slash)    %2f
    + (plus)     %2b

    You can add as many -P arguments as needed. Every -P specification
    after the first one behaves as fail-over connection. When also the
    the fail-over disconnects miner passes to the next connection
    available and so on till the list is exhausted.
    An exception to this behavior is ruled by the --failover-timeout
    command line argument.
    See 'H misc' for full details.

    The special notation '-P exit' stops the failover loop.
    When the miner reaches this connection it simply quits.

    When using stratum mode miner tries to auto-detect the correct
    provided by the pool. You might define tune the stratum flavour by
    any of of the following valid schemes :

    stratum+ssl stratum+tcp stratum1+ssl stratum1+tcp stratum2+ssl stratum2+tcp stratum3+ssl stratum3+tcp

    where a scheme is made up of two parts, the stratum variant + the tcp
    transport protocol

    Stratum variants :

        stratum     Stratum
        stratum1    Eth Proxy compatible
        stratum2    EthereumStratum 1.0.0 (nicehash)
        stratum3    EthereumStratum 2.0.0

    Transport variants :

        tcp         Unencrypted tcp connection
        ssl         Encrypted tcp connection


**********
Ethervic.exe --help

General options:

General       options:
  -h [ --help ]             This help message
  -H [ --help-module ] arg  Help for a given module, one of: cl, cu, misc, env,
                            con, test, conf or reboot
  -V [ --version ]          The version number
  -P [ --pool ] arg         One or more Stratum pool or http (getWork)
                            connection as URL(s)

                            scheme://user[.workername][:password]@]hostname:por
                            t[/...]

                            For details and some samples how to fill in this
                            value please use
                            --help-module con


  -F [ --config ] arg       Configuration file name. See '-H conf' for details.


**********
Ethervic.exe -V

########################################################
VicMiner (High Performance Miner)
Copyright 2021.06 VictorianMinersTeam - Version: 0.9.0
########################################################
https://github.com/VictorianMiners


**********
Ethervic.exe --help-module cl

OpenCL        options:
  --cl-work arg (=128)  Set the work group size, valid values are 64 128 or 256
  --cl-split            Force split-DAG mode. May improve performance on older
                        GPU models.


**********
Ethervic.exe --help-module cu

CUDA          options:
  --cu-block arg (=128) Set the block size, valid values are 32, 64, 128, or
                        256
  --cu-streams arg (=2) Set the number of streams per GPU, valid values 1, 2 or
                        4


**********
Ethervic.exe --help-module misc

Miscellaneous options:
  -v [ --verbosity ] arg (=0)  Set output verbosity level. Use the sum of :
                               1 - log per GPU status lines
                               2 - log per GPU solutions

  --getwork-recheck arg (=500) Set polling interval for new work in getWork
                               mode. Value in milliseconds. Not Aply in stratum
                               mode
  --retry-delay arg (=0)       Delay (seconds) for reconnection retry
  --retry-max arg (=3)         Set max reconnection retries to same pool. Set
                               to 0 for infinite retries.
  --work-timeout arg (=180)    If no new work received from pool after this
                               amount of time the connection is dropped. Value
                               in seconds.
  --response-timeout arg (=2)  If no response from pool to a stratum message
                               after this amount of time the connection is
                               dropped
  -R [ --report-hashrate ]     Report RIG Hashrate to the pool
  --display-interval arg (=5)  Statistic  interval (seconds)
  --HWMON arg (=0)             GPU hardware monitoring level::
                               0  No information
                               1  +temperatures +fan percentage
                               2  +GPU power drain
  --exit                       Stop miner whenever an error is encountered
  --failover-timeout arg (=0)  Sets the number of minutes miner can stay
                               connected to a fail-over pool before trying to
                               reconnect to the primary (the first) connection.
  --nocolor                    Monochrome display log lines
  --syslog                     Use syslog appropriate output (drop timestamp
                               and channel prefix)
  -L [ --list-devices ]        Lists the detected OpenCL/CUDA devices and
                               exits. Can be combined with -G or -U flags
  --tstop arg (=0)             Suspend mining on GPU which temperature is above
                               this threshold. Implies --HWMON 1 option. If not
                               set or zero no temp control is performed
  --tstart arg (=0)            Restart mining on previously overheated GPU when
                               temp drops below this threshold. Implies --HWMON
                               1. Must be lower than --tstop
  -n [ --nonce ] arg           Hex string specifying the upper bits of miner's
                               start nonce. Can be used to ensure multiple
                               miners are not searching overlapping nonce
                               ranges.
  --devices arg                List of device numbers to be used
  --seq                        Generate DAG sequentially, one GPU at a time.


**********
Ethervic.exe --help-module env

Environment variables :

    If you need or do feel more comfortable you can set the following
    environment variables. Please respect letter casing.

    SSL_CERT_FILE  Set to the full path to of your CA certificates
                   file if it is not in standard path :
                   /etc/ssl/certs/ca-certificates.crt.


**********
Ethervic.exe --help-module con


Connections specifications :

    Whether you need to connect to a stratum pool or to make use of
    getWork polling mode (generally used to solo mine) you need to specify
    the connection  making use of -P command line argument filling up the
    URL. The URL is in the form:

     scheme://[user[.workername][:password]@]hostname:port[/...].

    where 'scheme' can be any of :

    getwork    for http getWork mode
    stratum    for tcp stratum mode
    stratums   for tcp encrypted stratum mode
    Example 1: -P getwork://127.0.0.1:8545
    Example 2: -P stratums://0x012345678901234567890234567890123.minerX@vicminerpool.org:5555
    Example 3: -P stratum://0x012345678901234567890234567890123.minerX@vicminerpool.org:9999/your.email%40gmail.com
    Example 4: -P stratum://0x012345678901234567890234567890123@vicminerpool.org:9999/minerX/your.email%40gmail.com

    Please note: if your user or worker or password do contain characters
    which may impair the correct parsing (namely any of . : @ # ?) you have
    to enclose those values in backticks( ` ASCII 096) or Url Encode them
    Also note that backtick has a special meaning in *nix environments thus
    you need to further escape those backticks with backslash.

    Example : -P stratums://\`account.121\`.minerX:x@vicminer.org:5555
    Example : -P stratums://account%2e121.minerX:x@vicminer.org:5555
    (In Windows backslashes are not needed)

    Common url encoded chars are
    . (dot)      %2e
    : (column)   %3a
    @ (at sign)  %40
    ? (question) %3f
    # (number)   %23
    / (slash)    %2f
    + (plus)     %2b

    You can add as many -P arguments as needed. Every -P specification
    after the first one behaves as fail-over connection. When also the
    the fail-over disconnects miner passes to the next connection
    available and so on till the list is exhausted.
    An exception to this behavior is ruled by the --failover-timeout
    command line argument.
    See 'H misc' for full details.

    The special notation '-P exit' stops the failover loop.
    When the miner reaches this connection it simply quits.

    When using stratum mode miner tries to auto-detect the correct
    provided by the pool. You might define tune the stratum flavour by
    any of of the following valid schemes :

    stratum+ssl stratum+tcp stratum1+ssl stratum1+tcp stratum2+ssl stratum2+tcp stratum3+ssl stratum3+tcp

    where a scheme is made up of two parts, the stratum variant + the tcp
    transport protocol

    Stratum variants :

        stratum     Stratum
        stratum1    Eth Proxy compatible
        stratum2    EthereumStratum 1.0.0 (nicehash)
        stratum3    EthereumStratum 2.0.0

    Transport variants :

        tcp         Unencrypted tcp connection
        ssl         Encrypted tcp connection


**********
Ethervic.exe --help-module test

Error: The --help-module parameter must be one of the following:
    , cu, api, env, con, misc, conf, reboot


**********
Ethervic.exe --help-module misc

Miscellaneous options:
  -v [ --verbosity ] arg (=0)  Set output verbosity level. Use the sum of :
                               1 - log per GPU status lines
                               2 - log per GPU solutions

  --getwork-recheck arg (=500) Set polling interval for new work in getWork
                               mode. Value in milliseconds. Not Aply in stratum
                               mode
  --retry-delay arg (=0)       Delay (seconds) for reconnection retry
  --retry-max arg (=3)         Set max reconnection retries to same pool. Set
                               to 0 for infinite retries.
  --work-timeout arg (=180)    If no new work received from pool after this
                               amount of time the connection is dropped. Value
                               in seconds.
  --response-timeout arg (=2)  If no response from pool to a stratum message
                               after this amount of time the connection is
                               dropped
  -R [ --report-hashrate ]     Report RIG Hashrate to the pool
  --display-interval arg (=5)  Statistic  interval (seconds)
  --HWMON arg (=0)             GPU hardware monitoring level::
                               0  No information
                               1  +temperatures +fan percentage
                               2  +GPU power drain
  --exit                       Stop miner whenever an error is encountered
  --failover-timeout arg (=0)  Sets the number of minutes miner can stay
                               connected to a fail-over pool before trying to
                               reconnect to the primary (the first) connection.
  --nocolor                    Monochrome display log lines
  --syslog                     Use syslog appropriate output (drop timestamp
                               and channel prefix)
  -L [ --list-devices ]        Lists the detected OpenCL/CUDA devices and
                               exits. Can be combined with -G or -U flags
  --tstop arg (=0)             Suspend mining on GPU which temperature is above
                               this threshold. Implies --HWMON 1 option. If not
                               set or zero no temp control is performed
  --tstart arg (=0)            Restart mining on previously overheated GPU when
                               temp drops below this threshold. Implies --HWMON
                               1. Must be lower than --tstop
  -n [ --nonce ] arg           Hex string specifying the upper bits of miner's
                               start nonce. Can be used to ensure multiple
                               miners are not searching overlapping nonce
                               ranges.
  --devices arg                List of device numbers to be used
  --seq                        Generate DAG sequentially, one GPU at a time.


**********
Ethervic.exe -L

 Id Pci Id       Type Name                          CUDA SM  CL       Memory
--- ------------ ---- ----------------------------- ---- --- ----  ------------
  0 0000:01:00.0 Gpu  NVIDIA GeForce RTX 3060 Lapt  Yes  8.6            6.00 GB
--- ------------ ---- ----------------------------- ---- --- ----  ------------



