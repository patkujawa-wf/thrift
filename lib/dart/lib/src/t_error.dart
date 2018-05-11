/// Licensed to the Apache Software Foundation (ASF) under one
/// or more contributor license agreements. See the NOTICE file
/// distributed with this work for additional information
/// regarding copyright ownership. The ASF licenses this file
/// to you under the Apache License, Version 2.0 (the
/// "License"); you may not use this file except in compliance
/// with the License. You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing,
/// software distributed under the License is distributed on an
/// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
/// KIND, either express or implied. See the License for the
/// specific language governing permissions and limitations
/// under the License.

part of thrift;

class TError extends Error {
  final String message;
  final int type;

  TError(this.type, this.message);

  String toString() {
    String descriptor = typeDescriptor() ?? '';
    if (descriptor != '') {
      descriptor = ' ($descriptor)';
    }
    return "<${errorName()} type: $type$descriptor message: '$message'>";
  }

  /// A textual value for this error to match the class.
  ///
  /// If provided, this will be included in [toString].
  /// The reason for hardcoding instead of using reflection is so it does not
  /// get minified.
  String errorName() => 'TError';

  /// A textual value for this error to match the [type].
  ///
  /// If provided, this will be included in [toString].
  String typeDescriptor() => '';
}
