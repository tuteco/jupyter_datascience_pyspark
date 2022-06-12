from invoke import task

CONTAINER_NAME = 'jupyter_datascience_pyspark'
IMAGE_NAME = f"tuteco/{CONTAINER_NAME}"
CONTAINER_INSTANCE = 'default'


@task
def build_local(context):
    """
        build an image from a Dockerfile with tag 'latest-dev'
    """
    context.run(f"docker build -t {IMAGE_NAME}:latest-dev . -f Dockerfile")

@task
def run(context):
    """
        run the local image with tag 'latest-dev'
    """
    context.run(f"docker run --rm --name {CONTAINER_NAME}-{CONTAINER_INSTANCE} -p 8888:8888 {IMAGE_NAME}:latest-dev")


@task(help={
    "images": "remove images used by service"
})
def docker_clean(context, images=False):
    """
        remove containers, networks, volumes and images(optional)
    """
    context.run("docker compose down -v")

    if images:
        # delete project image
        context.run(f"docker rmi {IMAGE_NAME}:latest-dev -f")
        # remove dangling images
        context.run(f"docker image prune -f")
