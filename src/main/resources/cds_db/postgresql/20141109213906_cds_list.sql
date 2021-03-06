--
-- The MTS cds EJB project is the base framework for the CDS Framework Middle Tier Service.
--
-- Copyright (C) 2016 New York City Department of Health and Mental Hygiene, Bureau of Immunization
-- Contributions by HLN Consulting, LLC
--
-- This program is free software: you can redistribute it and/or modify it under the terms of the GNU
-- Lesser General Public License as published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version. You should have received a copy of the GNU Lesser
-- General Public License along with this program. If not, see <http://www.gnu.org/licenses/> for more
-- details.
--
-- The above-named contributors (HLN Consulting, LLC) are also licensed by the New York City
-- Department of Health and Mental Hygiene, Bureau of Immunization to have (without restriction,
-- limitation, and warranty) complete irrevocable access and rights to this project.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; THE
--
-- SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING,
-- BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, IF ANY, OR DEVELOPERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES, OR OTHER LIABILITY OF ANY KIND, ARISING FROM, OUT OF, OR IN CONNECTION WITH
-- THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- For more information about this software, see https://www.hln.com/services/open-source/ or send
-- correspondence to ice@hln.com.
--

-- // cds_list
-- Migration SQL that makes the change goes here.

create table cds_list (
            list_id varchar(32) primary key,
            list_type varchar(32) not null,
            code varchar(256) not null,
            name varchar(700) not null,
            description varchar(32),
            code_system_id varchar(32),
            value_set_id varchar(32),
            opencds_concept_type_id varchar(32),
            enum_class_name varchar(2000),
            last_mod_datetime timestamp not null,
            last_mod_id varchar(32) not null,
            create_datetime timestamp not null,
            create_id varchar(32) not null);

alter table cds_list add constraint fk_clcsid2ccscsid foreign key (code_system_id) references cds_code_system (code_system_id);

alter table cds_list add constraint fk_clvsid2vsvsid foreign key (value_set_id) references value_set (value_set_id);

alter table cds_list add constraint un_cds_list_name unique (name);

alter table cds_list add constraint un_cds_list_name_type unique (name, list_type);

INSERT INTO cds_list (list_id, list_type, code, name, description, code_system_id, value_set_id, opencds_concept_type_id, enum_class_name, last_mod_datetime, last_mod_id, create_datetime, create_id) 
    VALUES ('29c22c5c11ad74b72980a93a805fd951', 'AD_HOC_CONCEPT', 'GenderConcepts', 'Gender Concepts', NULL, NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP, 'admin');

-- //@UNDO
-- SQL to undo the change goes here.

drop table cds_list;
