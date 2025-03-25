#
# See `docs.md` for package documentation.
#
{
    stdenv, fetchFromGitHub, odoo-pkg ? null
}:
let
  vendor = fetchFromGitHub {                                   # (1)
    owner = "Martel-IT";
    repo = "odoo16.box";
    rev = "vendor-addons-04-Mar-2025";
    sha256 = "sha256-Rxl66FZu1bCXtZ4Edbg7HNlyamyLx7dT/Me9bKdc+R4=";
  };
  
  hr-timesheet-overtime = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_hr_timesheet_overtime";
    rev = "Latest";          # (2)
    sha256 = "sha256-3xwt+FXYQupdgA0BGxbVilIOGQ+LAtgzVBAd+Kf/bAs=";
  };
  timesheets-by-employee = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_timesheets_by_employee";
    rev = "Latest";          # (2)
    sha256 = "sha256-xQ9ZIgOKn98CJ2rFLyo8NLaiVISdW1QSERjVltn4GxQ=";
  };
  download-attachments = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_download_attachments";
    rev = "Latest";          # (2)
    sha256 = "sha256-EgYPTFjtcDGfFm4cKtvWepeaWCPVAYUSm9NB5tlRGos=";
  };
  hr-expense = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_hr_expense";
    rev = "Latest";          # (2)
    sha256 = "sha256-NumAjnwlvn2qlZQqvTi1Sr3r2t4cnCFl4JbFVHQWtbE=";
  };
  custom-menu-style = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_menu_style";
    rev = "Latest";          # (2)
    sha256 = "sha256-0OkZcRvWmpssJIHXZ+d/EyDxDiyFTRUmLalC5J1G3YY=";
  };
  timesheet-sheet-fullwidth = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_timesheet_sheet_fullwidth";
    rev = "v1.0";          # (2)
    sha256 = "sha256-wxYWUllWnEy1B5cCSn2k/fz5fY/ZqhJLGElW1iHZQBQ=";
  };
  custom-expense-limit = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_expense_limit";
    rev = "latest";          # (2)
    sha256 = "sha256-0Wy9NYlo5VR4Q4/V3bTh05HPZY/8HIlRFvjZpaX/fAQ=";
  };
  custom-web = fetchFromGitHub {
    owner = "Martel-IT";
    repo = "custom_web";
    rev = "Latest";          # (2)
    sha256 = "sha256-M1V+/+6U7lZfQx2lpLo7Ru6mxC9IlVTzJwXzZbjQoJk=";
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
    src-custom-web = custom-web;

    installPhase = ''
      # Prima creiamo tutte le directory e copiamo i nostri addons personalizzati
      mkdir -p $out/hr_timesheet_overtime
      cp -rv ${src-hr-timesheet-overtime}/. $out/hr_timesheet_overtime

      mkdir -p $out/timesheets_by_employee
      cp -rv ${src-timesheets-by-employee}/. $out/timesheets_by_employee

      mkdir -p $out/download-attachments
      cp -rv ${src-download-attachments}/. $out/download-attachments

      mkdir -p $out/hr_expense
      cp -rv ${src-hr-expense}/. $out/hr_expense

      mkdir -p $out/custom_menu_style
      cp -rv ${src-custom-menu-style}/. $out/custom_menu_style

      mkdir -p $out/timesheet-sheet-fullwidth
      cp -rv ${src-timesheet-sheet-fullwidth}/. $out/timesheet-sheet-fullwidth

      mkdir -p $out/custom-expense-limit
      cp -rv ${src-custom-expense-limit}/. $out/custom-expense-limit

      mkdir -p $out/web
      cp -rv ${src-custom-web}/. $out/web

      # Copiamo gli addons del fornitore
      cp -rv $src/vendor/addons/* $out
      
      # Creiamo symlink agli addons core di Odoo se odoo-pkg è fornito
      if [ -n "${toString odoo-pkg}" ]; then
        echo "Searching for core Odoo addons directory..."
        
        # Trova la directory degli addons di Odoo
        for dir in $(find ${toString odoo-pkg} -path "*/site-packages/odoo/addons" -type d 2>/dev/null); do
          ODOO_ADDONS_DIR="$dir"
          echo "Found core Odoo addons at: $ODOO_ADDONS_DIR"
          
          # Itera su ogni addon nella directory standard
          for addon in $(find "$ODOO_ADDONS_DIR" -maxdepth 1 -mindepth 1 -type d); do
            addon_name=$(basename "$addon")
            
            # Crea symlink solo se non esiste già un addon con lo stesso nome
            if [ ! -e "$out/$addon_name" ]; then
              echo "Linking core addon: $addon_name"
              ln -s "$addon" "$out/$addon_name"
            else
              echo "Custom addon with name $addon_name already exists, not linking core addon"
            fi
          done
          
          # Abbiamo trovato e processato la directory degli addons, usciamo dal ciclo
          break
        done
      else
        echo "odoo-pkg not provided, skipping core addons linking"
      fi
    '';
}