FROM postgres
WORKDIR /usr/src
COPY . .
ENV HOST='localhost'
ENV PORT='5432'
ENV USERNAME='postgres'
ENV PASSWORD='postgres'
ENV DATABASE='postgres'
CMD ["bash", "show_connections.sh"]