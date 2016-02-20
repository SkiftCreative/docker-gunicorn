NAMESPACE=skiftcreative
APP=gunicorn
TAG=3.5

build:
	cd ${TAG} && docker build --no-cache=true -t ${NAMESPACE}/${APP}:${TAG} .
run:
	cd ${TAG} && docker run --name=${APP} --detach=true ${NAMESPACE}/${APP}:${TAG}
clean:
	docker stop ${APP} && docker rm ${APP}
reset: clean
	docker rmi ${NAMESPACE}/${APP}:${TAG}
interactive:
	docker run --rm --interactive --tty --name=${APP} ${NAMESPACE}/${APP} bash
push:
	docker push ${NAMESPACE}/${APP}:${TAG}
