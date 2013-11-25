-- Create syntax for TABLE 'acms_alias'
CREATE TABLE `acms_alias` (
  `alias_id` int(11) NOT NULL,
  `alias_status` varchar(16) NOT NULL,
  `alias_sort` int(11) NOT NULL,
  `alias_domain` varchar(128) NOT NULL,
  `alias_code` varchar(255) NOT NULL,
  `alias_name` varchar(255) NOT NULL,
  `alias_description` varchar(255) NOT NULL,
  `alias_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `alias_blog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_app'
CREATE TABLE `acms_app` (
  `app_name` varchar(128) NOT NULL,
  `app_version` varchar(64) NOT NULL,
  `app_status` varchar(8) NOT NULL,
  `app_activate_datetime` datetime DEFAULT NULL,
  `app_install_datetime` datetime NOT NULL,
  `app_blog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_approval'
CREATE TABLE `acms_approval` (
  `approval_id` int(11) NOT NULL,
  `approval_type` varchar(16) NOT NULL,
  `approval_datetime` datetime NOT NULL,
  `approval_deadline_datetime` datetime NOT NULL,
  `approval_comment` varchar(512) NOT NULL,
  `approval_request_usergroup_id` int(11) DEFAULT NULL,
  `approval_receive_usergroup_id` int(11) DEFAULT NULL,
  `approval_request_user_id` int(11) DEFAULT NULL,
  `approval_receive_user_id` int(11) DEFAULT NULL,
  `approval_revision_id` int(11) NOT NULL,
  `approval_entry_id` int(11) NOT NULL,
  `approval_blog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_blog'
CREATE TABLE `acms_blog` (
  `blog_id` int(11) NOT NULL,
  `blog_code` varchar(255) NOT NULL,
  `blog_status` varchar(16) NOT NULL DEFAULT 'open',
  `blog_parent` int(11) NOT NULL,
  `blog_sort` int(11) NOT NULL,
  `blog_left` int(11) NOT NULL,
  `blog_right` int(11) NOT NULL,
  `blog_name` varchar(255) NOT NULL,
  `blog_domain` varchar(128) NOT NULL,
  `blog_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `blog_generated_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `blog_alias_status` varchar(8) NOT NULL DEFAULT 'open',
  `blog_alias_sort` int(11) NOT NULL DEFAULT '1',
  `blog_alias_primary` int(11) DEFAULT NULL,
  PRIMARY KEY (`blog_id`,`blog_left`,`blog_right`,`blog_status`,`blog_indexing`),
  KEY `blog_domain` (`blog_domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_cache'
CREATE TABLE `acms_cache` (
  `cache_id` char(32) NOT NULL,
  `cache_mime` varchar(128) NOT NULL DEFAULT 'text/html',
  `cache_charset` varchar(64) NOT NULL DEFAULT 'UTF-8',
  `cache_http_status_code` varchar(255) NOT NULL,
  `cache_data` longblob NOT NULL,
  `cache_expire` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cache_status` varchar(16) NOT NULL,
  `cache_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `cache_status` (`cache_blog_id`,`cache_expire`,`cache_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_category'
CREATE TABLE `acms_category` (
  `category_id` int(11) NOT NULL,
  `category_code` varchar(255) NOT NULL,
  `category_status` varchar(16) NOT NULL DEFAULT 'open',
  `category_parent` int(11) NOT NULL,
  `category_sort` int(11) NOT NULL,
  `category_left` int(11) NOT NULL,
  `category_right` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_scope` varchar(8) NOT NULL DEFAULT 'local',
  `category_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `category_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`category_left`,`category_right`,`category_status`,`category_indexing`),
  KEY `category_code` (`category_code`,`category_left`,`category_right`),
  KEY `category_id` (`category_id`,`category_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_column'
CREATE TABLE `acms_column` (
  `column_id` int(11) NOT NULL,
  `column_sort` int(11) NOT NULL,
  `column_align` varchar(8) NOT NULL,
  `column_type` varchar(32) NOT NULL,
  `column_attr` varchar(64) NOT NULL,
  `column_group` varchar(64) NOT NULL,
  `column_size` varchar(16) NOT NULL,
  `column_field_1` longtext NOT NULL,
  `column_field_2` varchar(255) NOT NULL,
  `column_field_3` varchar(255) NOT NULL,
  `column_field_4` varchar(255) NOT NULL,
  `column_field_5` varchar(255) NOT NULL,
  `column_field_6` varchar(255) NOT NULL,
  `column_field_7` varchar(255) NOT NULL,
  `column_field_8` varchar(255) NOT NULL,
  `column_entry_id` int(11) NOT NULL,
  `column_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`column_id`),
  KEY `entry_sort` (`column_entry_id`,`column_sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_column_rev'
CREATE TABLE `acms_column_rev` (
  `column_id` int(11) NOT NULL,
  `column_sort` int(11) NOT NULL,
  `column_align` varchar(8) NOT NULL,
  `column_type` varchar(32) NOT NULL,
  `column_attr` varchar(64) NOT NULL,
  `column_group` varchar(64) NOT NULL,
  `column_size` varchar(16) NOT NULL,
  `column_field_1` longtext NOT NULL,
  `column_field_2` varchar(255) NOT NULL,
  `column_field_3` varchar(255) NOT NULL,
  `column_field_4` varchar(255) NOT NULL,
  `column_field_5` varchar(255) NOT NULL,
  `column_field_6` varchar(255) NOT NULL,
  `column_field_7` varchar(255) NOT NULL,
  `column_field_8` varchar(255) NOT NULL,
  `column_entry_id` int(11) NOT NULL,
  `column_blog_id` int(11) NOT NULL,
  `column_rev_id` int(11) NOT NULL,
  PRIMARY KEY (`column_id`,`column_rev_id`),
  KEY `entry_sort` (`column_entry_id`,`column_sort`,`column_rev_id`),
  KEY `entry_revision` (`column_entry_id`,`column_rev_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_comment'
CREATE TABLE `acms_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_status` varchar(16) NOT NULL,
  `comment_parent` int(11) NOT NULL,
  `comment_left` int(11) NOT NULL,
  `comment_right` int(11) NOT NULL,
  `comment_title` varchar(255) NOT NULL,
  `comment_body` longtext NOT NULL,
  `comment_name` varchar(255) NOT NULL,
  `comment_mail` varchar(255) NOT NULL,
  `comment_url` varchar(255) NOT NULL,
  `comment_pass` varchar(32) NOT NULL,
  `comment_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `comment_host` varchar(255) NOT NULL,
  `comment_rank` int(11) NOT NULL,
  `comment_entry_id` int(11) NOT NULL,
  `comment_user_id` int(11) NOT NULL,
  `comment_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_entry_id`,`comment_id`,`comment_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_config'
CREATE TABLE `acms_config` (
  `config_key` varchar(255) NOT NULL,
  `config_value` longtext NOT NULL,
  `config_sort` int(11) NOT NULL,
  `config_rule_id` int(11) DEFAULT NULL,
  `config_module_id` int(11) DEFAULT NULL,
  `config_blog_id` int(11) NOT NULL,
  KEY `config_blog_id` (`config_blog_id`,`config_sort`,`config_rule_id`,`config_module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_dashboard'
CREATE TABLE `acms_dashboard` (
  `dashboard_key` varchar(255) NOT NULL,
  `dashboard_value` longtext NOT NULL,
  `dashboard_sort` int(11) NOT NULL,
  `dashboard_blog_id` int(11) NOT NULL,
  KEY `dashboard_key` (`dashboard_key`,`dashboard_blog_id`),
  KEY `dashboard_sort` (`dashboard_sort`,`dashboard_blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_entry'
CREATE TABLE `acms_entry` (
  `entry_id` int(11) NOT NULL,
  `entry_code` varchar(64) NOT NULL,
  `entry_status` varchar(16) NOT NULL DEFAULT 'open',
  `entry_approval` varchar(16) NOT NULL DEFAULT 'none',
  `entry_form_status` varchar(16) NOT NULL,
  `entry_sort` int(11) NOT NULL,
  `entry_user_sort` int(11) NOT NULL,
  `entry_category_sort` int(11) NOT NULL,
  `entry_title` varchar(255) NOT NULL,
  `entry_link` varchar(255) NOT NULL,
  `entry_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `entry_start_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `entry_end_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_posted_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_updated_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_summary_range` int(11) DEFAULT NULL,
  `entry_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `entry_primary_image` int(11) DEFAULT NULL,
  `entry_current_rev_id` int(11) NOT NULL,
  `entry_last_update_user_id` int(11) NOT NULL,
  `entry_hash` char(32) NOT NULL,
  `entry_category_id` int(11) DEFAULT NULL,
  `entry_user_id` int(11) NOT NULL,
  `entry_form_id` int(11) NOT NULL,
  `entry_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`entry_id`,`entry_start_datetime`,`entry_end_datetime`,`entry_status`),
  UNIQUE KEY `entry_datetime` (`entry_datetime`,`entry_id`),
  UNIQUE KEY `entry_posted_datetime` (`entry_posted_datetime`,`entry_id`),
  UNIQUE KEY `entry_category_id` (`entry_category_id`,`entry_id`),
  KEY `entry_user_id` (`entry_user_id`),
  KEY `entry_count` (`entry_blog_id`,`entry_datetime`,`entry_start_datetime`,`entry_end_datetime`,`entry_status`,`entry_indexing`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_entry_rev'
CREATE TABLE `acms_entry_rev` (
  `entry_id` int(11) NOT NULL,
  `entry_rev_id` int(11) NOT NULL,
  `entry_rev_status` varchar(16) NOT NULL DEFAULT 'none',
  `entry_rev_user_id` int(11) NOT NULL,
  `entry_rev_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `entry_rev_memo` varchar(512) NOT NULL,
  `entry_code` varchar(64) NOT NULL,
  `entry_status` varchar(16) NOT NULL DEFAULT 'open',
  `entry_approval` varchar(16) NOT NULL DEFAULT 'none',
  `entry_form_status` varchar(16) NOT NULL DEFAULT 'open',
  `entry_sort` int(11) NOT NULL,
  `entry_user_sort` int(11) NOT NULL,
  `entry_category_sort` int(11) NOT NULL,
  `entry_title` varchar(255) NOT NULL,
  `entry_link` varchar(255) NOT NULL,
  `entry_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `entry_start_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `entry_end_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_posted_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_updated_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `entry_summary_range` int(11) DEFAULT NULL,
  `entry_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `entry_primary_image` int(11) DEFAULT NULL,
  `entry_hash` char(32) NOT NULL,
  `entry_category_id` int(11) DEFAULT NULL,
  `entry_user_id` int(11) NOT NULL,
  `entry_form_id` int(11) NOT NULL,
  `entry_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`entry_id`,`entry_start_datetime`,`entry_end_datetime`,`entry_status`,`entry_rev_id`),
  UNIQUE KEY `entry_datetime` (`entry_datetime`,`entry_id`,`entry_rev_id`),
  UNIQUE KEY `entry_posted_datetime` (`entry_posted_datetime`,`entry_id`,`entry_rev_id`),
  UNIQUE KEY `entry_category_id` (`entry_category_id`,`entry_id`,`entry_rev_id`),
  KEY `entry_user_id` (`entry_user_id`),
  KEY `entry_count` (`entry_blog_id`,`entry_datetime`,`entry_start_datetime`,`entry_end_datetime`,`entry_status`,`entry_indexing`,`entry_rev_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_field'
CREATE TABLE `acms_field` (
  `field_key` varchar(255) NOT NULL,
  `field_value` longtext,
  `field_sort` int(11) NOT NULL,
  `field_search` varchar(8) NOT NULL DEFAULT 'on',
  `field_eid` int(11) DEFAULT NULL,
  `field_cid` int(11) DEFAULT NULL,
  `field_uid` int(11) DEFAULT NULL,
  `field_bid` int(11) DEFAULT NULL,
  `field_blog_id` int(11) NOT NULL,
  KEY `field_cid` (`field_cid`),
  KEY `field_uid` (`field_uid`),
  KEY `field_bid` (`field_bid`),
  KEY `field_eid` (`field_eid`,`field_key`,`field_search`),
  KEY `field_key` (`field_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_field_rev'
CREATE TABLE `acms_field_rev` (
  `field_key` varchar(255) NOT NULL,
  `field_value` longtext,
  `field_sort` int(11) NOT NULL,
  `field_search` varchar(8) NOT NULL DEFAULT 'on',
  `field_eid` int(11) DEFAULT NULL,
  `field_cid` int(11) DEFAULT NULL,
  `field_uid` int(11) DEFAULT NULL,
  `field_bid` int(11) DEFAULT NULL,
  `field_blog_id` int(11) NOT NULL,
  `field_rev_id` int(11) DEFAULT NULL,
  KEY `field_cid` (`field_cid`),
  KEY `field_uid` (`field_uid`),
  KEY `field_bid` (`field_bid`),
  KEY `field_eid` (`field_eid`,`field_key`,`field_search`,`field_rev_id`),
  KEY `field_key` (`field_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_form'
CREATE TABLE `acms_form` (
  `form_id` int(11) NOT NULL,
  `form_code` varchar(64) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `form_data` longtext NOT NULL,
  `form_current_serial` int(11) NOT NULL,
  `form_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_fulltext'
CREATE TABLE `acms_fulltext` (
  `fulltext_value` longtext NOT NULL,
  `fulltext_ngram` longtext NOT NULL,
  `fulltext_eid` int(11) DEFAULT NULL,
  `fulltext_cid` int(11) DEFAULT NULL,
  `fulltext_uid` int(11) DEFAULT NULL,
  `fulltext_bid` int(11) DEFAULT NULL,
  `fulltext_blog_id` int(11) NOT NULL,
  UNIQUE KEY `fulltext_cid` (`fulltext_cid`),
  UNIQUE KEY `fulltext_uid` (`fulltext_uid`),
  UNIQUE KEY `fulltext_bid` (`fulltext_bid`),
  UNIQUE KEY `fulltext_eid` (`fulltext_eid`),
  FULLTEXT KEY `fulltext_value` (`fulltext_value`),
  FULLTEXT KEY `fulltext_ngram` (`fulltext_ngram`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_log_access'
CREATE TABLE `acms_log_access` (
  `log_access_datetime` datetime NOT NULL,
  `log_access_url` varchar(255) NOT NULL,
  `log_access_ua` varchar(255) NOT NULL,
  `log_access_addr` varchar(40) NOT NULL,
  `log_access_referer` varchar(255) NOT NULL,
  `log_access_method` varchar(4) NOT NULL,
  `log_access_lang` varchar(16) NOT NULL,
  `log_access_http_status_code` varchar(255) NOT NULL,
  `log_access_publishing` varchar(16) NOT NULL,
  `log_access_res_time` double NOT NULL,
  `log_access_sql_time` double NOT NULL,
  `log_access_acms_post` varchar(255) NOT NULL,
  `log_access_acms_post_valid` varchar(8) NOT NULL,
  `log_access_session_uid` int(11) NOT NULL,
  `log_access_entry_id` int(11) DEFAULT NULL,
  `log_access_category_id` int(11) DEFAULT NULL,
  `log_access_user_id` int(11) DEFAULT NULL,
  `log_access_rule_id` int(11) DEFAULT NULL,
  `log_access_blog_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_log_form'
CREATE TABLE `acms_log_form` (
  `log_form_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `log_form_remote_addr` varchar(40) NOT NULL,
  `log_form_user_agent` varchar(255) NOT NULL,
  `log_form_mail_to` varchar(255) NOT NULL,
  `log_form_mail_subject` varchar(255) NOT NULL,
  `log_form_mail_body` longtext NOT NULL,
  `log_form_data` longtext NOT NULL,
  `log_form_serial` int(11) NOT NULL,
  `log_form_form_id` int(11) NOT NULL,
  `log_form_entry_id` int(11) NOT NULL,
  `log_form_blog_id` int(11) NOT NULL,
  KEY `log_form_datetime` (`log_form_datetime`),
  KEY `log_form_serial` (`log_form_serial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_media'
CREATE TABLE `acms_media` (
  `media_id` int(11) NOT NULL,
  `media_type` varchar(16) NOT NULL,
  `media_path` varchar(512) NOT NULL,
  `media_file_name` varchar(256) NOT NULL,
  `media_file_size` varchar(256) NOT NULL,
  `media_upload_date` datetime NOT NULL,
  `media_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_media_tag'
CREATE TABLE `acms_media_tag` (
  `media_tag_name` varchar(256) NOT NULL,
  `media_tag_sort` int(11) NOT NULL,
  `media_tag_media_id` int(11) NOT NULL,
  `media_tag_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`media_tag_media_id`,`media_tag_sort`),
  KEY `media_tag_name_media` (`media_tag_name`,`media_tag_media_id`),
  KEY `media_tag_blog_id` (`media_tag_blog_id`,`media_tag_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_moblog'
CREATE TABLE `acms_moblog` (
  `moblog_id` int(11) NOT NULL,
  `moblog_status` varchar(8) NOT NULL,
  `moblog_mail` varchar(255) NOT NULL,
  `moblog_user` varchar(64) NOT NULL,
  `moblog_pass` varchar(32) NOT NULL,
  `moblog_server` varchar(128) NOT NULL,
  `moblog_allowed_mail` longtext NOT NULL,
  `moblog_entry_status` varchar(8) NOT NULL,
  `moblog_image_size` varchar(16) NOT NULL,
  `moblog_image_align` varchar(8) NOT NULL,
  `moblog_text_unit` varchar(16) NOT NULL,
  `moblog_category_id` int(11) DEFAULT NULL,
  `moblog_user_id` int(11) NOT NULL,
  `moblog_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`moblog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_module'
CREATE TABLE `acms_module` (
  `module_id` int(11) NOT NULL,
  `module_identifier` varchar(64) NOT NULL,
  `module_name` varchar(64) NOT NULL,
  `module_label` varchar(255) NOT NULL,
  `module_description` varchar(255) NOT NULL,
  `module_status` varchar(8) NOT NULL DEFAULT 'open',
  `module_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_bid` varchar(32) DEFAULT NULL,
  `module_bid_axis` varchar(32) NOT NULL DEFAULT 'self',
  `module_uid` varchar(32) DEFAULT NULL,
  `module_uid_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_cid` varchar(32) DEFAULT NULL,
  `module_cid_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_cid_axis` varchar(32) NOT NULL DEFAULT 'self',
  `module_eid` varchar(32) DEFAULT NULL,
  `module_eid_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_keyword` varchar(255) DEFAULT NULL,
  `module_keyword_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_tag` varchar(255) DEFAULT NULL,
  `module_tag_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_field` varchar(255) DEFAULT NULL,
  `module_field_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_start` varchar(255) DEFAULT NULL,
  `module_start_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_end` varchar(255) DEFAULT NULL,
  `module_end_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_page` varchar(32) DEFAULT NULL,
  `module_page_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_order` varchar(255) DEFAULT NULL,
  `module_order_scope` varchar(8) NOT NULL DEFAULT 'local',
  `module_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`module_identifier`,`module_name`,`module_blog_id`,`module_scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_role'
CREATE TABLE `acms_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(128) NOT NULL DEFAULT 'open',
  `role_blog_axis` varchar(16) NOT NULL DEFAULT 'self',
  `role_entry_edit_all` varchar(8) NOT NULL,
  `role_entry_edit` varchar(8) NOT NULL,
  `role_entry_delete` varchar(8) NOT NULL,
  `role_category_create` varchar(8) NOT NULL,
  `role_category_edit` varchar(8) NOT NULL,
  `role_tag_edit` varchar(8) NOT NULL,
  `role_media_upload` varchar(8) NOT NULL,
  `role_media_edit` varchar(8) NOT NULL,
  `role_rule_edit` varchar(8) NOT NULL,
  `role_publish_edit` varchar(8) NOT NULL,
  `role_publish_exec` varchar(8) NOT NULL,
  `role_config_edit` varchar(8) NOT NULL,
  `role_module_edit` varchar(8) NOT NULL,
  `role_backup_export` varchar(8) NOT NULL,
  `role_backup_import` varchar(8) NOT NULL,
  `role_admin_etc` varchar(8) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_role_blog'
CREATE TABLE `acms_role_blog` (
  `role_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_rule'
CREATE TABLE `acms_rule` (
  `rule_id` int(11) NOT NULL,
  `rule_name` varchar(64) NOT NULL,
  `rule_sort` int(11) NOT NULL,
  `rule_status` varchar(8) NOT NULL,
  `rule_description` varchar(255) NOT NULL,
  `rule_scope` varchar(8) NOT NULL DEFAULT 'local',
  `rule_aid` int(11) DEFAULT NULL,
  `rule_aid_case` varchar(16) DEFAULT NULL,
  `rule_uid` int(11) DEFAULT NULL,
  `rule_uid_case` varchar(16) DEFAULT NULL,
  `rule_cid` int(11) DEFAULT NULL,
  `rule_cid_case` varchar(16) DEFAULT NULL,
  `rule_eid` int(11) DEFAULT NULL,
  `rule_eid_case` varchar(16) DEFAULT NULL,
  `rule_ucd` varchar(255) DEFAULT NULL,
  `rule_ucd_case` varchar(32) DEFAULT NULL,
  `rule_ccd` varchar(255) DEFAULT NULL,
  `rule_ccd_case` varchar(32) DEFAULT NULL,
  `rule_ecd` varchar(255) DEFAULT NULL,
  `rule_ecd_case` varchar(32) DEFAULT NULL,
  `rule_ua` varchar(32) DEFAULT NULL,
  `rule_ua_case` varchar(16) DEFAULT NULL,
  `rule_blog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_schedule'
CREATE TABLE `acms_schedule` (
  `schedule_id` int(11) NOT NULL,
  `schedule_name` varchar(255) NOT NULL,
  `schedule_desc` varchar(255) DEFAULT NULL,
  `schedule_year` char(4) NOT NULL,
  `schedule_month` char(2) NOT NULL,
  `schedule_data` longtext NOT NULL,
  `schedule_field` longtext NOT NULL,
  `schedule_blog_id` int(11) NOT NULL,
  KEY `schedule_id` (`schedule_id`,`schedule_year`,`schedule_month`,`schedule_blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_sequence'
CREATE TABLE `acms_sequence` (
  `sequence_blog_id` int(11) NOT NULL,
  `sequence_alias_id` int(11) NOT NULL,
  `sequence_user_id` int(11) NOT NULL,
  `sequence_category_id` int(11) NOT NULL,
  `sequence_entry_id` int(11) NOT NULL,
  `sequence_column_id` int(11) NOT NULL,
  `sequence_column_rev_id` int(11) NOT NULL,
  `sequence_comment_id` int(11) NOT NULL,
  `sequence_trackback_id` int(11) NOT NULL,
  `sequence_rule_id` int(11) NOT NULL,
  `sequence_module_id` int(11) NOT NULL,
  `sequence_form_id` int(11) NOT NULL,
  `sequence_media_id` int(11) NOT NULL,
  `sequence_role_id` int(11) NOT NULL,
  `sequence_usergroup_id` int(11) NOT NULL,
  `sequence_approval_id` int(11) NOT NULL,
  `sequence_moblog_id` int(11) NOT NULL,
  `sequence_schedule_id` int(11) NOT NULL,
  `sequence_shop_address_id` int(11) NOT NULL,
  `sequence_shop_receipt_detail_id` int(11) NOT NULL,
  `sequence_system_version` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_sequence_plugin'
CREATE TABLE `acms_sequence_plugin` (
  `sequence_plugin_key` varchar(256) NOT NULL,
  `sequence_plugin_value` int(11) NOT NULL,
  PRIMARY KEY (`sequence_plugin_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_session'
CREATE TABLE `acms_session` (
  `session_id` char(32) NOT NULL,
  `session_next_id` char(32) NOT NULL,
  `session_expire` datetime DEFAULT NULL,
  `session_data` longtext NOT NULL,
  `session_unique_ua` char(32) NOT NULL,
  `session_cookie` varchar(8) NOT NULL,
  `session_left` int(11) NOT NULL,
  `session_right` int(11) NOT NULL,
  `session_user_id` int(11) NOT NULL,
  `session_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_next_id` (`session_next_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_shop_address'
CREATE TABLE `acms_shop_address` (
  `address_id` int(11) NOT NULL,
  `address_primary` varchar(8) NOT NULL,
  `address_name` varchar(64) NOT NULL,
  `address_ruby` varchar(64) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_zip` varchar(64) NOT NULL,
  `address_prefecture` varchar(64) NOT NULL,
  `address_city` varchar(64) NOT NULL,
  `address_field_1` varchar(64) NOT NULL,
  `address_field_2` varchar(64) DEFAULT NULL,
  `address_telephone` varchar(64) NOT NULL,
  `address_user_id` int(11) NOT NULL,
  `address_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_user_id` (`address_primary`,`address_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_shop_cart'
CREATE TABLE `acms_shop_cart` (
  `cart_session_id` char(32) NOT NULL,
  `cart_data` longtext NOT NULL,
  `cart_blog_id` int(11) NOT NULL,
  UNIQUE KEY `cart_session_id` (`cart_session_id`,`cart_blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_shop_receipt'
CREATE TABLE `acms_shop_receipt` (
  `receipt_code` char(15) NOT NULL DEFAULT '10000101-0001',
  `receipt_status` varchar(255) NOT NULL,
  `receipt_payment` varchar(255) NOT NULL,
  `receipt_deliver` varchar(255) NOT NULL,
  `receipt_address` longtext NOT NULL,
  `receipt_total` int(11) NOT NULL,
  `receipt_subtotal` int(11) NOT NULL,
  `receipt_request_date` varchar(255) DEFAULT NULL,
  `receipt_request_time` varchar(255) DEFAULT NULL,
  `receipt_request_others` varchar(255) DEFAULT NULL,
  `receipt_charge_payment` int(11) DEFAULT NULL,
  `receipt_charge_deliver` int(11) DEFAULT NULL,
  `receipt_charge_others` int(11) DEFAULT NULL,
  `receipt_note` longtext,
  `receipt_log` blob,
  `receipt_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `receipt_updated_datetime` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `receipt_user_id` int(11) NOT NULL,
  `receipt_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`receipt_code`),
  KEY `receipt_user_id` (`receipt_user_id`),
  KEY `receipt_blog_id` (`receipt_blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_shop_receipt_detail'
CREATE TABLE `acms_shop_receipt_detail` (
  `receipt_detail_id` int(11) NOT NULL,
  `receipt_detail_name` varchar(255) NOT NULL,
  `receipt_detail_price` int(11) NOT NULL,
  `receipt_detail_qty` int(11) NOT NULL,
  `receipt_detail_field` longtext,
  `receipt_detail_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `receipt_detail_item_id` int(11) NOT NULL,
  `receipt_detail_parent_code` char(14) NOT NULL,
  `receipt_detail_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`receipt_detail_id`),
  KEY `receipt_detail_parent_code` (`receipt_detail_parent_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_tag'
CREATE TABLE `acms_tag` (
  `tag_name` varchar(255) NOT NULL,
  `tag_sort` int(11) NOT NULL,
  `tag_entry_id` int(11) NOT NULL,
  `tag_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_entry_id`,`tag_sort`),
  KEY `tag_name_entry` (`tag_name`,`tag_entry_id`),
  KEY `tag_blog_id` (`tag_blog_id`,`tag_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_tag_rev'
CREATE TABLE `acms_tag_rev` (
  `tag_name` varchar(255) NOT NULL,
  `tag_sort` int(11) NOT NULL,
  `tag_entry_id` int(11) NOT NULL,
  `tag_blog_id` int(11) NOT NULL,
  `tag_rev_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_entry_id`,`tag_sort`,`tag_rev_id`),
  KEY `tag_name_entry` (`tag_name`,`tag_entry_id`,`tag_rev_id`),
  KEY `tag_blog_id` (`tag_blog_id`,`tag_name`,`tag_rev_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_trackback'
CREATE TABLE `acms_trackback` (
  `trackback_id` int(11) NOT NULL,
  `trackback_status` varchar(16) NOT NULL DEFAULT 'open',
  `trackback_url` varchar(255) NOT NULL,
  `trackback_title` varchar(255) NOT NULL,
  `trackback_excerpt` varchar(255) NOT NULL,
  `trackback_blog_name` varchar(255) NOT NULL,
  `trackback_response` varchar(255) NOT NULL,
  `trackback_host` varchar(255) NOT NULL,
  `trackback_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `trackback_flow` varchar(16) NOT NULL DEFAULT 'receive',
  `trackback_entry_id` int(11) NOT NULL,
  `trackback_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`trackback_entry_id`,`trackback_id`,`trackback_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_user'
CREATE TABLE `acms_user` (
  `user_id` int(11) NOT NULL,
  `user_code` varchar(64) NOT NULL,
  `user_status` varchar(16) NOT NULL DEFAULT 'open',
  `user_sort` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` char(32) NOT NULL,
  `user_pass_reset` varchar(32) NOT NULL,
  `user_mail` varchar(255) NOT NULL,
  `user_mail_magazine` varchar(8) NOT NULL DEFAULT 'on',
  `user_mail_mobile` varchar(255) NOT NULL,
  `user_mail_mobile_magazine` varchar(8) NOT NULL DEFAULT 'on',
  `user_url` varchar(255) NOT NULL,
  `user_icon` varchar(256) NOT NULL,
  `user_auth` varchar(16) NOT NULL DEFAULT 'contributor',
  `user_indexing` varchar(8) NOT NULL DEFAULT 'on',
  `user_login_anywhere` varchar(8) NOT NULL DEFAULT 'off',
  `user_login_expire` date NOT NULL DEFAULT '9999-12-31',
  `user_login_datetime` datetime DEFAULT NULL,
  `user_updated_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `user_generated_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `user_blog_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_usergroup'
CREATE TABLE `acms_usergroup` (
  `usergroup_id` int(11) NOT NULL,
  `usergroup_name` varchar(256) NOT NULL,
  `usergroup_role_id` int(11) NOT NULL,
  PRIMARY KEY (`usergroup_id`),
  KEY `usergroup_role_id` (`usergroup_role_id`),
  KEY `usergroup_role` (`usergroup_id`,`usergroup_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_usergroup_user'
CREATE TABLE `acms_usergroup_user` (
  `usergroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`usergroup_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_workflow'
CREATE TABLE `acms_workflow` (
  `workflow_blog_id` int(11) NOT NULL,
  `workflow_status` varchar(8) NOT NULL DEFAULT 'close',
  `workflow_name` varchar(256) NOT NULL,
  `workflow_start_group` int(11) NOT NULL,
  `workflow_last_group` int(11) NOT NULL,
  PRIMARY KEY (`workflow_blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Create syntax for TABLE 'acms_workflow_usergroup'
CREATE TABLE `acms_workflow_usergroup` (
  `workflow_blog_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  `workflow_sort` int(11) NOT NULL,
  PRIMARY KEY (`workflow_blog_id`,`workflow_sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;