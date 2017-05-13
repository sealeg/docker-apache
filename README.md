# Usage

```
docker run -d -v <config_dir>:/config:ro -v <data_dir>:/data:rw,Z <logs_dir>:/logs:rw,Z -p 80:80 -p 443:443 sealeg/apache
```

