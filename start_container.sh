#!/bin/bash

sudo nvidia-docker run -ti --rm --net=host -e DISPLAY=$DISPLAY -e LD_LIBRARY_PATH=/usr/local/lib -v /home/ec2-user:/home/neo --name relion1 fredhutch/ls2-relion:2.1 /bin/bash -i
[ec2-user@ip-172-31-42-201 ~]$ cat start_relion_container.sh 
#!/bin/bash

sudo nvidia-docker run -ti --rm --net=host -e DISPLAY=$DISPLAY -v /home/ec2-user/.Xauthority:/home/neo/.Xauthority -v /home/ec2-user/relion21_tutorial:/home/neo/relion21_tutorial -v /home/ec2-user/data:/home/neo/data --name relion1 fredhutch/ls2_relion:2.1_20180307 /bin/bash -c 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib; bash'
