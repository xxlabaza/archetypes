#set($current_year = $package.getClass().forName("java.util.Date").newInstance().getYear() + 1900)
/*
 * Copyright ${current_year} the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ${package}.it;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.testcontainers.containers.GenericContainer;

import ${package}.Main;

@Disabled
@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = Main.class)
@ContextConfiguration(initializers = TestContainerTests.Initializer.class)
class TestContainerTests {

  static GenericContainer<?> redis = new GenericContainer<>("redis:3-alpine")
      .withExposedPorts(6379);

  @Autowired
  Environment environment;

  @AfterAll
  static void afterAll () {
    redis.stop();
  }

  @Test
  void example () {
    assertNotNull(environment);

    assertThat(environment.getProperty("redis.host"))
        .isNotNull()
        .isNotEmpty();

    assertThat(environment.getProperty("redis.port"))
        .isNotNull()
        .isNotEmpty();
  }

  static class Initializer implements ApplicationContextInitializer<ConfigurableApplicationContext> {

    @Override
    public void initialize (ConfigurableApplicationContext applicationContext) {
      redis.start();

      TestPropertyValues.of(
          "redis.host=" + redis.getContainerIpAddress(),
          "redis.port=" + redis.getMappedPort(6379)
      ).applyTo(applicationContext);
    }
  }
}
