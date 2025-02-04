DIR= cd srcs
RUN= docker compose up --build -d
BUILD= docker compose build
PS= docker compose ps
DOWN= docker compose down
RMIMG= docker image rm -f wordpress mariadb nginx
RMVOL= docker volume rm -f mariadb wordpress
RMMOUNT= sudo rm -rf /home/zbentalh/data
all:vol_cr
		${DIR} && ${RUN}

vol_cr:
	mkdir -p /home/zbentalh/data/mariadb
	mkdir -p /home/zbentalh/data/wordpress
ps:
	${DIR} && ${PS}
clean:
	${DIR} && ${DOWN} -v
mount_rm:
	sudo rm -rf /home/zbentalh/data
show_vol:
	docker volume ls
vol_rm:
	${RMVOL}
fclean:clean 
	${RMIMG}
	${RMMOUNT}