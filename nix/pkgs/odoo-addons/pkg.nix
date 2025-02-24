#
# See `docs.md` for package documentation.
#
{
    stdenv, fetchFromGitHub
}:
let
  vendor = fetchFromGitHub {                                   # (1)
    owner = "martel-innovate";
    repo = "odoo-box-16";
    rev = "vendor-addons-27-jan-2025";
    sha256 = "sha256-0xnp3z28dpm7b8g2lwjyss3xk0kclacx761y2iyzg2k1wmywglrd";
  };
  hr-timesheet-overtime = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_hr_timesheet_overtime";
    rev = "";          # (2)
    sha256 = "";
  };
  timesheets-by-employee = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
  download-attachments = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
  hr-expense = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
  custom-menu-style = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
  timesheet-sheet-fullwidth = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
  custom-expense-limit = fetchFromGitHub {
    owner = "martel-innovate";
    repo = "custom_timesheets_by_employee";
    rev = "";          # (2)
    sha256 = "";
  };
in stdenv.mkDerivation rec {
    pname = "odoo-addons";
    version = "1.0.0-odoo-16.0";

    src = vendor;
    src-hr-timesheet-overtime = hr-timesheet-overtime;
    src-timesheets-by-employee = timesheets-by-employee;
    src-download-attachments = download-attachments;
    src-hr-expense = hr-expense;
    src-custom-menu-style = custom-menu-style;
    src-timesheet-sheet-fullwidth = timesheet-sheet-fullwidth;
    src-custom-expense-limit = custom-expense-limit;

    installPhase = ''
      mkdir -p $out/hr_timesheet_overtime
      cp -rv ${src-hr-timesheet-overtime}/. $out/hr_timesheet_overtime

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-timesheets-by-employee}/. $out/timesheets_by_employee

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-download-attachments}/. $out/download-attachments

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-hr-expense}/. $out/hr-expense

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-custom-menu-style}/. $out/custom-menu-style

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-timesheet-sheet-fullwidth}/. $out/timesheet-sheet-fullwidth

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-custom-expense-limit}/. $out/custom-expense-limit

      cp -rv $src/vendor/addons/* $out
    '';
}
# NOTE
# ----
# 1. Vendor addons. At the moment the sources for the various vendor
# addons installed in Martel's prod Odoo are in this repo after being
# copied over from prod. This is not the way to go, but rather a stop
# gap solution. See #2.
# 2. Release tags. Ideally we'd use release tags instead of revs. But
# at the moment hr-timesheet-overtime and timesheets-by-employee don't
# have a release process in place.
#