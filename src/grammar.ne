# Copyright 2020 Novartis Institutes for BioMedical Research Inc. Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

@preprocessor typescript

@{%
  export type Path = Array<Segment>;
%}
Path ->
  Word Segment:* {%
    ([first, rest]): Path => [first, ...rest]
  %}

@{%
  export type Segment = Word | Modifier;
%}
Segment ->
    "." Word {% ([, word]): Segment => word %}
	| "[" Modifier "]" {% ([, word]): Segment => word %}

@{%
  export type Word = string;
%}
Word ->
  [A-Za-z] [A-Za-z0-9-]:* {%
    ([first, rest]): Word => `${first}${rest.join('')}`
  %}

@{%
  export type Modifier = {
    type: 'Modifier';
    value: string;
  };
%}
Modifier ->
  [$:.] Word {%
    ([first, rest]): Modifier => ({type:'Modifier', value: `${first}${rest}`})
  %}