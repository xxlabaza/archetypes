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

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.testcontainers.containers.GenericContainer;

@Disabled
class TestContainerTests {

  GenericContainer<?> redis = new GenericContainer<>("redis:3-alpine")
      .withExposedPorts(6379);

  @BeforeEach
  void beforeEach () {
    redis.start();
  }

  @AfterEach
  void afterEach () {
    redis.stop();
  }

  @Test
  void example () {
    assertTrue(redis.isRunning());
  }
}
