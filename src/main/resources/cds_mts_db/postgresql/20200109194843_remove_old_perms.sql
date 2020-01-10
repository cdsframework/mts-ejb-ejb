--
--    Copyright 2010-2016 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

-- // remove_opencds_prop
-- Migration SQL that makes the change goes here.

delete FROM mt_security_scheme_perm_map where permission_object like ('%CriteriaDataTemplateRelDTO%');
delete FROM mt_security_scheme_perm_map where permission_object like ('%DataModelDTO%');
delete FROM mt_security_scheme_perm_map where permission_object like ('%DataTemplateDTO%');
delete FROM mt_security_scheme_perm_map where permission_object like ('%CriteriaDataTemplateRelNodeDTO%');

-- //@UNDO
-- SQL to undo the change goes here.


