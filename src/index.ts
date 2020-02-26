/* Copyright 2020 Novartis Institutes for BioMedical Research Inc. Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License. */

import { Parser, Grammar } from 'nearley';
import grammar, { Path } from './grammar';

export default function parsePath(path: string): Path | null {
  const parser = new Parser(Grammar.fromCompiled(grammar));
  parser.feed(path);
  const [result] = parser.results;
  if (!result) return null;
  return result;
}
