# Rapid Ansible Iteration

1. Make changes to the yaml file
2. Rebuild the docker image `sudo ./build.sh`
3. Run a temporary docker container `sudo docker --rm -it nvim-computer bash`
4. When in the container run `ansible-playbook -t <tags> -v <playbook.yaml>`

Note: `-t <tags>` allows you to run tasks with the given tag.
