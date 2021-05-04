#   (c) Copyright 2019 EntIT Software LLC, a Micro Focus company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
########################################################################################################################
#!!
#! @description: Compares two numbers as floating point values.
#!
#! @input start: First value as number or string.
#! @input end: Second value as number or string.
#!
#! @result GREATER_THAN: Value1 is greater than value2.
#! @result EQUALS: Value1 is equal to value2.
#! @result LESS_THAN: Value1 is less than value2.
#!!#
########################################################################################################################

namespace: VS.Looping
operation:
  name: counter
  inputs:
    - start
    - end
    - step
  python_action:
    script: |-
      from java.math import BigDecimal,MathContext
      value1 = BigDecimal(start, MathContext.DECIMAL64)
      value2 = BigDecimal(end, MathContext.DECIMAL64)
      result = value1.compareTo(value2)
  outputs:
    - result: '${str(int(value1) + int(step))}'
  results:
    - GREATER_THAN: '${ result > 0 }'
    - EQUALS: '${ result == 0 }'
    - LESS_THAN
