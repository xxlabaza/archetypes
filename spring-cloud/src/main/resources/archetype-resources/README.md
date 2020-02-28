#set($hash1 = '#')
#set($hash2 = '##')
${hash1} Overview ${artifactId}

TODO

${hash2} Build docker image

```bash
$> ./mvnw clean package docker:build
```

${hash2} Package, verify and run

```bash
$> ./mvnw clean package verify; and java -jar target/${artifactId}-${version}.jar
```
