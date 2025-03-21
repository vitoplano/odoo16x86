======================
Calendar slot duration
======================

.. 
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !! This file is generated by oca-gen-addon-readme !!
   !! changes will be overwritten.                   !!
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !! source digest: sha256:3a39a33ad7a9a5a3673b1461fb0f8651e690a8437512f2a9c58b6614319fe3af
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.. |badge1| image:: https://img.shields.io/badge/maturity-Production%2FStable-green.png
    :target: https://odoo-community.org/page/development-status
    :alt: Production/Stable
.. |badge2| image:: https://img.shields.io/badge/licence-LGPL--3-blue.png
    :target: http://www.gnu.org/licenses/lgpl-3.0-standalone.html
    :alt: License: LGPL-3
.. |badge3| image:: https://img.shields.io/badge/github-OCA%2Fweb-lightgray.png?logo=github
    :target: https://github.com/OCA/web/tree/16.0/web_calendar_slot_duration
    :alt: OCA/web
.. |badge4| image:: https://img.shields.io/badge/weblate-Translate%20me-F47D42.png
    :target: https://translation.odoo-community.org/projects/web-16-0/web-16-0-web_calendar_slot_duration
    :alt: Translate me on Weblate
.. |badge5| image:: https://img.shields.io/badge/runboat-Try%20me-875A7B.png
    :target: https://runboat.odoo-community.org/builds?repo=OCA/web&target_branch=16.0
    :alt: Try me on Runboat

|badge1| |badge2| |badge3| |badge4| |badge5|

This module extends the functionality of backend calendars to support custom
slot durations and to allow you to provide more specific UX regarding event
duration and snapping.

**Table of contents**

.. contents::
   :local:

Configuration
=============

This documentation is for developers.

If you want to configure your calendar view's snap duration, make sure that you
action includes a context similar to this (example is the default value)::

    {"calendar_slot_duration": "00:30:00"}

In addition, you can also configure the calendar view's default mode by adding::

    {"calendar_slot_duration": "00:30:00", "keep_default_view_slot_duration": True}

The ``keep_default_view_slot_duration`` key is optional and defaults to ``False``.
When set to ``True``, the calendar view will not adapt its view to the slot size.

For example, if you want to set the default slot duration to 1 hour and 30 minutes,
by default the calendar view will adapt its view to show slots of 1 hour and 30 minutes.
Sometimes this is not desired, for example when you want to show every time slots by hour.

It can be added in actions defined on python or as ``ir.actions.act_window``
records.

Usage
=====

To use this module, you need to install some other addon that uses it, as it
doesn't provide any end-user functionality.

Known issues / Roadmap
======================

* Drop module if/when https://github.com/odoo/odoo/pull/66739 is merged.

Bug Tracker
===========

Bugs are tracked on `GitHub Issues <https://github.com/OCA/web/issues>`_.
In case of trouble, please check there if your issue has already been reported.
If you spotted it first, help us to smash it by providing a detailed and welcomed
`feedback <https://github.com/OCA/web/issues/new?body=module:%20web_calendar_slot_duration%0Aversion:%2016.0%0A%0A**Steps%20to%20reproduce**%0A-%20...%0A%0A**Current%20behavior**%0A%0A**Expected%20behavior**>`_.

Do not contact contributors directly about support or help with technical issues.

Credits
=======

Authors
~~~~~~~

* Tecnativa

Contributors
~~~~~~~~~~~~

* `Tecnativa <https://www.tecnativa.com>`_:

  * Jairo Llopis
  * Stefan Ungureanu

Maintainers
~~~~~~~~~~~

This module is maintained by the OCA.

.. image:: https://odoo-community.org/logo.png
   :alt: Odoo Community Association
   :target: https://odoo-community.org

OCA, or the Odoo Community Association, is a nonprofit organization whose
mission is to support the collaborative development of Odoo features and
promote its widespread use.

.. |maintainer-Yajo| image:: https://github.com/Yajo.png?size=40px
    :target: https://github.com/Yajo
    :alt: Yajo

Current `maintainer <https://odoo-community.org/page/maintainer-role>`__:

|maintainer-Yajo| 

This module is part of the `OCA/web <https://github.com/OCA/web/tree/16.0/web_calendar_slot_duration>`_ project on GitHub.

You are welcome to contribute. To learn how please visit https://odoo-community.org/page/Contribute.
