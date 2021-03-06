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

-- // value_set
-- Migration SQL that makes the change goes here.

create table value_set (
            value_set_id varchar(32) primary key,
            code varchar(256) not null,
            name varchar(256) not null,
            oid varchar(256) not null,
            description varchar(2048),
            version varchar(256),
            version_description varchar(2048),
            version_effective_date date,
            version_expiration_date date,
            version_status varchar(256),
            value_set_type varchar(32),
            source varchar(2048),
            last_mod_datetime timestamp not null,
            last_mod_id varchar(32) not null,
            create_datetime timestamp not null,
            create_id varchar(32) not null);

alter table value_set add constraint un_vs_oid unique (oid, code, version);

INSERT INTO value_set (value_set_id, code, name, oid, description, version, version_description, version_effective_date, version_expiration_date, version_status, value_set_type, source, last_mod_datetime, last_mod_id, create_datetime, create_id) 
    VALUES ('a072819bdc62cd212247128c597682be', 'Language', 'Language', '2.16.840.1.113883.1.11.11526', 'The value set is defined by Internet RFC 4646 (replacing RFC 3066). Please see ISO 639 language code set maintained by Library of Congress for enumeration of language codes and Frequently Asked Questions.', '1.0', NULL, NULL, NULL, 'active', NULL, NULL, CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP, 'admin');


-- //@UNDO
-- SQL to undo the change goes here.

drop table value_set;
