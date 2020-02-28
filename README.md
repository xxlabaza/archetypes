# Overview

The different Java-based archetypes with useful dependencies and plugins.

## Usage

Install all archetypes:

```bash
$> ./install.sh
...
```

Test the installed archetypes:

```bash
$> ./test.sh
...
```

Two previous commands in one:

```bash
$> ./update.sh
...
```

### Pure Java archetype

[Fish shell](https://fishshell.com) function:

```bash
$> jpure -a popa
...
```

Bash shell script:

```bash
$> ~/.m2/bin/jpure.sh -a popa
...
```

Canonical Maven way:

```bash
$> mvn archetype:generate \
       -DarchetypeGroupId=com.xxlabaza.archetypes \
       -DarchetypeArtifactId=pure \
       -DarchetypeVersion=1.0.0 \
       -DartifactId=popa
...
```

### Spring Boot archetype

[Fish shell](https://fishshell.com) function:

```bash
$> jboot -a popa
...
```

Bash shell script:

```bash
$> ~/.m2/bin/jboot.sh -a popa
...
```

Canonical Maven way:

```bash
$> mvn archetype:generate \
       -DarchetypeGroupId=com.xxlabaza.archetypes \
       -DarchetypeArtifactId=spring-boot \
       -DarchetypeVersion=1.0.0 \
       -DartifactId=popa
...
```

### Spring Cloud archetype

[Fish shell](https://fishshell.com) function:

```bash
$> jcloud -a popa
...
```

Bash shell script:

```bash
$> ~/.m2/bin/jcloud.sh -a popa
...
```

Canonical Maven way:

```bash
$> mvn archetype:generate \
       -DarchetypeGroupId=com.xxlabaza.archetypes \
       -DarchetypeArtifactId=spring-cloud \
       -DarchetypeVersion=1.0.0 \
       -DartifactId=popa
...
```
