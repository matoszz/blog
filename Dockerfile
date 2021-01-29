# this dockerfile obviously "works" but the mkdocs build would fail - intended to be an example
FROM squidfunk/mkdocs-material:6.2.3 as builder
ADD . /docs
RUN pip install --upgrade pip
RUN pip install  --no-cache-dir \
        Pygments \
        mkdocs-git-revision-date-plugin \
        mkdocs-git-revision-date-localized-plugin \
        pymdown-extensions
RUN mkdocs build
FROM nginx
COPY --from=builder /docs/site /usr/share/nginx/html
EXPOSE 8000
