<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Strings for component 'enrol_fee', language 'en'
 *
 * @package    enrol_fee
 * @copyright  2019 Shamim Rezaie <shamim@moodle.com>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['assignrole'] = 'Assign role';
$string['cost'] = 'Enrolment fee';
$string['costerror'] = 'The enrollment fee must be a number.';
$string['currency'] = 'Currency';
$string['defaultrole'] = 'Default role assignment';
$string['defaultrole_desc'] = 'Select the role to assign to users after making a payment.';
$string['enrolenddate'] = 'End date';
$string['enrolenddate_help'] = 'If enabled, users can be enrolled until this date only.';
$string['enrolenddaterror'] = 'The enrollment end date cannot be earlier than the start date.';
$string['enrolperiod'] = 'Enrolment duration';
$string['enrolperiod_desc'] = 'Default length of time that the enrollment is valid. If set to zero, the enrollment duration will be unlimited by default.';
$string['enrolperiod_help'] = 'Length of time that the enrollment is valid, starting with the moment the user is enrolled. If disabled, the enrollment duration will be unlimited.';
$string['enrolstartdate'] = 'Start date';
$string['enrolstartdate_help'] = 'If enabled, users can only be enrolled from this date onwards.';
$string['expiredaction'] = 'Enrolment expiry action';
$string['expiredaction_help'] = 'Select the action to be performed when a user\'s enrollment expires. Please note that some user data and settings are deleted when a user is unenrolled.';
$string['fee:config'] = 'Configure enrollment on payment enroll instances';
$string['fee:manage'] = 'Manage enrolled users';
$string['fee:unenroll'] = 'Unenroll users from course';
$string['fee:unenrolself'] = 'Unenroll self from course';
$string['nocost'] = 'There is no cost to enroll in this course!';
$string['paymentaccount'] = 'Payment account';
$string['paymentaccount_help'] = 'Enrolment fees will be paid to this account.';
$string['pluginname'] = 'Enrolment on payment';
$string['pluginname_desc'] = 'The enrollment on payment enrollment method allows you to set up courses requiring a payment. If the fee for any course is set to zero, then students are not asked to pay for entry. There is a site-wide fee that you set here as a default for the whole site and then a course setting that you can set for each course individually. The course fee overrides the site fee.';
$string['privacy:metadata'] = 'The enrollment on payment enrollment plugin does not store any personal data.';
$string['purchasedescription'] = 'Enrolment in course {$a}';
$string['sendpaymentbutton'] = 'Select payment type';
$string['status'] = 'Allow enrollment on payment enrolments';
$string['status_desc'] = 'Allow users to make a payment to enroll into a course by default.';
