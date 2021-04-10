# docker build -t csighub.tencentyun.com/tme-kubeflow/ai:face -f app/Dockerfile .

FROM csighub.tencentyun.com/tme-kubeflow/ai:base

RUN pip install requests flask flask_cors gunicorn
COPY app /app
WORKDIR /app
ENTRYPOINT ["bash","-c","gunicorn --bind  0.0.0.0:8080 --workers 20 --timeout 300 --limit-request-line 0 --limit-request-field_size 0 --log-level=info server:app"]
# docker run --rm --name face -it -p 8080:8080 -v $PWD:/app csighub.tencentyun.com/tme-kubeflow/ai:face bash
# gunicorn --bind  0.0.0.0:8080 --workers 20 --timeout 300 --limit-request-line 0 --limit-request-field_size 0 --log-level=info server:app
# docker run --rm --name face -d -p 8080:8080 csighub.tencentyun.com/tme-kubeflow/ai:face


