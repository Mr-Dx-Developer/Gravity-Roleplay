-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if Config.Language ~= 'pl' then return end

Strings = {
    no_society_account = '[^3OSTRZEŻENIE^0] Konto społeczne nie istnieje dla: %s',
    ems_worker = 'Pracownik karetki',
    not_authorized = 'Nieautoryzowany',
    not_authorized_desc = 'Nie masz uprawnień do korzystania z tego!',
    not_on_duty = 'Poza służbą',
    not_on_duty_desc = 'Nie jesteś na służbie!',
    gps_enabled = 'GPS włączony',
    gps_enabled_desc = 'Włączyłeś GPS',
    gps_disabled = 'GPS wyłączony',
    gps_disabled_desc = 'Wyłączyłeś GPS',

    possible_cause = 'Możliwa przyczyna',

    full_name = 'Nazwa',
    pulse = 'Puls',
    bpm = 'BPM: %s',
    bleed_rate = 'Wskaźnik krwawienia',
    bleed_rate_low = 'Niski',
    bleed_rate_medium = 'Średni',
    bleed_rate_high = 'Wysoki',
    no_name = 'Brak nazwy',
    injuries = 'Obecne obrażenia',


    get_off_stretcher_ui = '[E] - Zejdź z noszy',
    move = 'Przenieś',
    move_desc = 'Przenieś nosze',
    put_in_vehicle = 'Umieść w pojeździe',
    stretcher_in_vehicle = 'Zdeponuj nosze',
    put_in_vehicle_desc = 'Umieść nosze w pojeździe',
    place_on_stretcher = 'Połóż pacjenta',
    place_on_stretcher_desc = 'Połóż pacjenta na noszach',
    remove_from_stretcher = 'Usuń pacjenta',
    remove_from_stretcher_desc = 'Usuń pacjenta z noszy',
    not_found = 'Nie znaleziono',
    already_occupied_ambulance = 'Już zajęta',
    already_occupied_ambulance_desc = 'Ta karetka jest już zajęta!',
    already_occupied_stretcher = 'Już zajęte',
    already_occupied_stretcher_desc = 'Te nosze są już zajęte!',
    vehicle_occupied = 'Pojazd zajęty',
    vehicle_occupied_desc = 'Nie można tego zrobić, gdy ktoś prowadzi pojazd!',
    not_occupied_stretcher = 'Nie zajęte',
    not_occupied_stretcher_desc = 'Te nosze nie są zajęte!',
    stretcher_placement_blocked = 'Umiejscowienie zablokowane',
    stretcher_placement_blocked_desc = 'Nie możesz tu umieścić noszy!',
    knocked_out = 'Wyeliminowany',
    knocked_out_desc = 'Zostałeś znokautowany!',
    checkin_cooldown = 'Oczekiwanie na zameldowanie',
    checkin_cooldown_desc = 'Próbujesz się zameldować zbyt szybko, poczekaj chwilę.',
    checkingin_progress = 'Trwa meldowanie...',
    remove_dead_target = 'Usuń Nieprzytomną Osobę',
    ply_injury_head = 'głowa',
    ply_injury_neck = 'szyja',
    ply_injury_spine = 'kręgosłup',
    ply_injury_upper = 'górna część ciała',
    ply_injury_lower = 'dolna część ciała',
    ply_injury_left_arm = 'lewa ręka',
    ply_injury_left_leg = 'lewa noga',
    ply_injury_right_arm = 'prawa ręka',
    ply_injury_right_leg = 'prawa noga',
    diagnosing_patient_progress = 'Diagnozowanie pacjenta...',
    treating_patient_progress = 'Leczenie pacjenta...',
    recovering_progress = 'Odzyskiwanie...',
    injury_report = 'Raport o urazach',
    none = 'Brak',
    mild = 'Łagodny',
    moderate = 'Umiarkowany',
    severe = 'Poważny',
    deadly = 'Śmiertelny',
    injury_report_locations = 'Lokalizacja',
    injury_report_type = 'Typ urazu: %s',
    injury_report_severity = 'Ciężkość: %s',
    injury_report_bleed = 'Krwawienie',
    light_injury_title = 'Lekki Uraz',
    moderate_injury_title = 'Umiarkowany Uraz',
    extreme_injury_title = 'Ekstremalny Uraz',
    injury_bleed_notify = 'Powiadomienie o Urazie i Krwawieniu',
    light_injury_desc = 'Twoje %s jest zranione, rozważ wizytę u lekarza!',
    moderate_injury_desc = 'Twoje %s jest bardzo zranione, potrzebujesz lekarza!',
    extreme_injury_desc = 'Twoje %s jest ekstremalnie zranione. Musisz udać się do lekarza zanim będzie za późno!',
    injury_msg_one = 'Masz znaczący uraz.',
    injury_msg_two = 'Masz poważny uraz.',
    injury_msg_three = 'Masz bardzo poważny uraz.',
    injury_msg_four = 'Masz krytyczny uraz.',
    bleed_msg_one = 'Krwawisz.',
    bleed_msg_two = 'Krwawisz mocno. Zastosuj ucisk.',
    bleed_msg_three = 'Zagrożenie wykrwawieniem!',
    fainted_title = 'Omdlenie',
    fainted_so_high_desc = 'Zemdlałeś z powodu bycia zbyt wysoko.',
    cant_jump_title = 'Nie Możesz Skoczyć!',
    cant_jump_desc = 'Jesteś zbyt ranny, aby próbować skakać',
    blackout_title = 'Utrata Przytomności',
    blackout_desc = 'Straciłeś przytomność z powodu urazu %s! Natychmiast szukaj pomocy medycznej!',
    treated_fully_desc = 'Zostałeś wyleczony i czujesz się lepiej niż kiedykolwiek!',
    treated_not_fully_desc = 'Zostałeś wyleczony, ale potrzebujesz dodatkowego leczenia.',
    prescription_menu = 'Menu Recept',
    prescription_menu_desc = 'Dostęp i zarządzanie receptami',
    no_stretcher_detected = 'Nie Wykryto Noszy',
    no_stretcher_detected_desc = 'Nie wykryto aktywnych noszy!',
    cant_run = 'Nie Możesz Biec',
    cant_run_desc = 'Jesteś zbyt ranny, aby biec!',
    no_back_seat = 'Brak Dostępnych Miejsc',
    no_back_seat_desc = 'W tym karetce nie ma miejsc w tylnej części',
    enter_vehicle_back = 'Wejdź do Karetka (Tył)',
    stretcher_already_deployed = 'Nosze Już Rozstawione',
    stretcher_already_deployed_desc = 'Nosze przypisane do tej karetki zostały już usunięte.',
    send_stretcher_home = 'Powrót do Pojazdu',
    ambulance_not_found = 'Nosze zostały usunięte, ale nie znaleziono karetki, aby wrócić!',
    bleedout = 'krwawienie',
    player_injury_critical_desc = 'Gracz jest w stanie krytycznym z powodu rany %s!',
    gps_active = 'GPS Aktywny',
    gps_active_desc = 'Gracz %s aktywował GPS',
    gps_deactive = 'GPS Nieaktywny',
    gps_deactive_desc = 'Gracz %s dezaktywował GPS',
    no_wsb = '^0[^3OSTRZEŻENIE^0] wasabi_bridge NIE został uruchomiony PO frameworku i/lub PRZED zasobem: %s',
    spawn_blocked = 'Garaż Zablokowany',
    spawn_blocked_desc = 'Nie możesz wyjechać swoim pojazdem, ponieważ jest zablokowany!',
    menu_remove_crutch = 'Usuń Kule',
    menu_remove_crutch_desc = 'Usuń kulawkiemu pacjentowi kule',
    menu_remove_chair = 'Usuń wózek inwalidzki',
    menu_remove_chair_desc = 'Usuń wózek inwalidzki pacjentowi w pobliżu',
    toggle_stretcher = 'Weź nosze',
    toggle_stretcher_desc = 'Weź nosze z najbliższego pojazdu',
    no_vehicle_nearby = 'Pojazd',
    no_vehicle_nearby_desc = 'Nie ma pojazdu w pobliżu',
    no_ambulance_nearby_desc = 'Nie ma karetki w pobliżu',
    on_duty = 'Na Służbie',
    on_duty_desc = 'Właśnie przełączyłeś się na służbę!',
    off_duty = 'Po Służbie',
    off_duty_desc = 'Właśnie przełączyłeś się po służbą!',
    amount = 'Kwota',
    mr = 'Pan',
    mrs = 'Pani',
    debt_collection = 'Windykacja Długów',
    db_email =
    'Szanowny %s %s, <br /><br />Centralne Biuro Windykacji Sądowej (CJCA) obciążyło Cię grzywnami nałożonymi przez policję.<br />Z Twojego konta zostało pobrane <strong>$%s</strong>.<br /><br />Z poważaniem,<br />Pan Wasabi',
    fine_sent = 'Wysłane Grzywny',
    fine_sent_desc = 'Pomyślnie wysłałeś grzywnę na kwotę $%s!',
    fine_received = 'Otrzymano Grzywnę',
    fine_received_desc = 'Otrzymałeś grzywnę na kwotę $%s',
    log_killed_title = 'Gracz Zabity',
    log_killed_desc =
    '> *%s [%s] zabił %s [%s]\n\n**Informacje o Zabójcy:**\nImię: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**Informacje o Ofierze:**\nNazwa Postaci: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **Przyczyna Śmierci:** `%s`',
    log_suicide_title = 'Gracz Popełnił Samobójstwo',
    log_suicide_desc =
    '> %s [%s] popełnił samobójstwo\n\n**Informacje o Graczu:**\nImię: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **Przyczyna Śmierci:** `%s`',
    unknown = 'NIEZNANE',
    log_admin_revive_title = 'Gracz Odrodzony przez Administratora',
    log_admin_revive_desc =
    '> *%s [%s] administrator przywrócił %s [%s]\n\n**Informacje o Celu:**\nImię: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**Informacje o Administratorze:**\nNazwa Postaci: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_self_revive_title = 'Administrator Odrodził Się Samodzielnie',
    log_self_revive_desc =
    '> %s [%s] przywrócił się samodzielnie\n\n**Informacje o Graczu:**\nImię: `%s`\nID Gracza: `%s`\nIdentyfikator: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicencja: `%s`\nLicencja2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_death_logs = 'Dziennik Śmierci',
    log_revive_logs = 'Dziennik Przywracania',
    medbag_crutch = 'Kulawka',
    medbag_crutch_desc = 'Kulawka, aby pomóc pacjentom w chodzeniu',
    menu_crutch = 'Zastosuj Kulawkę',
    menu_crutch_desc = 'Dodaj kulawkę do pacjenta w pobliżu',
    medbag_chair = 'Wózek Inwalidzki',
    medbag_chair_desc = 'Wózek inwalidzki, aby pomóc pacjentom, którzy nie mogą chodzić',
    menu_chair = 'Zastosuj Wózek Inwalidzki',
    menu_chair_desc = 'Dodaj wózek inwalidzki do pacjenta w pobliżu',
    shot = 'strzał',
    stabbed = 'ukłucie',
    beat = 'cięcie obuchem',
    burned = 'poparzenie',
    other = 'nieznane',
    JobMenuTitle = 'Menu EMS',
    dispatch = 'Dyspozycja',
    dispatch_desc = 'Sprawdź, czy są gracze potrzebujący pomocy',
    DispatchMenuTitle = 'Dyspozycja',
    GoBack = 'Wróć',
    key_map_text = 'Menu Pracy w Karetce',
    assistance_title = 'Zgłoszenie Pomocy',
    assistance_desc = 'Osoba poprosiła o pomoc medyczną!',
    respawn_available_in = 'Odrodzenie dostępne za ~r~%s minut %s sekund~s~\n',
    respawn_bleedout_in = 'W krwotoku umrzesz za ~r~%s minut %s sekund~s~\n',
    respawn_bleedout_prompt = 'Przytrzymaj [~r~E~s~], aby się odrodzić',
    distress_send = 'Naciśnij [~r~G~s~], aby wysłać sygnał o pomoc do EMS',
    distress_sent_title = 'Zgłoszenie Pomocy',
    distress_sent_desc = 'Sygnał o pomoc został wysłany do dostępnych jednostek!',
    route_set_title = 'Ustawienie Trasy',
    route_set_desc = 'Ustawiono waypoint do osoby w potrzebie!',
    diagnose_patient = 'Diagnozuj',
    diagnose_patient_desc = 'Diagnozuj najbliższą ranną osobę',
    no_requests = 'Brak aktywnych żądań',
    revive_patient = 'Odrodź',
    revive_patient_desc = 'Próba przywrócenia życia osobie w pobliżu',
    heal_patient = 'Ulecz',
    heal_patient_desc = 'Próba uleczenia osoby w pobliżu',
    sedate_patient = 'Uspokój',
    sedate_patient_desc = 'Tymczasowo uspokój osobę w pobliżu',
    drag_patient = 'Przeciągnij',
    drag_patient_desc = 'Przeciągnij pobliską ranną osobę',
    place_stretcher_target = 'Dodaj lub Usuń Pacjenta',
    place_patient = 'Umieść w Pojeździe/Wyjmij',
    place_patient_desc = 'Umieść nieprzytomną osobę w/poza pojeździe',
    no_nearby = 'Nie Znaleziono',
    no_nearby_desc = 'Nie wydaje się, żeby ktoś był w pobliżu',
    no_injury = 'Brak Obrażeń',
    no_injury_desc = 'Osoba wydaje się nie potrzebować żadnego leczenia',
    no_injury_dead_desc =
    'Pacjent nie wydaje się potrzebować dodatkowego leczenia. Spróbuj użyć defibrylatora i miej nadzieję, że będzie dobrze!',
    player_injury = 'Osoba Ranna',
    player_injury_desc = 'Ta osoba wydaje się mieć ranę %s',
    player_not_unconscious = 'Gracz Przytomny',
    player_not_unconscious_desc = 'Wydaje się, że gracz jest przytomny',
    player_unconscious = 'Gracz Nieprzytomny',
    player_unconscious_desc = 'Pacjent musi być przytomny w celu przeprowadzenia tego leczenia!',
    player_reviving = 'Odrodzienie',
    player_reviving_desc = 'Trwa proces odradzania pacjenta',
    player_noitem = 'Brakujący Przedmiot',
    player_noitem_desc = 'Nie masz wymaganego przedmiotu do tego!',
    player_successful_revive = 'Odrodzony',
    player_successful_revive_reward_desc = 'Udało ci się odrodzić pacjenta i zarobić $%s!',
    player_successful_revive_desc = 'Udało ci się odrodzić pacjenta!',
    player_healing = 'Leczenie',
    player_healing_desc = 'Trwa proces leczenia pacjenta',
    player_successful_heal = 'Uleczony',
    player_successful_heal_desc = 'Pacjent został pomyślnie uleczony!',
    player_healed_desc = 'Zostałeś pomyślnie uleczony przez lekarza!',
    not_medic = 'Nieuprawniony',
    not_medic_desc = 'Nie jesteś przeszkolony do korzystania z tego!',
    target_sedated = 'Sedacja',
    target_sedated_desc = 'Zostałeś uśpiony przez profesjonalistę medycznego',
    player_successful_sedate_desc = 'Udało ci się pomyślnie uśpić pacjenta',
    drop_bag_ui = '[E] - Upuść Torbę',
    drop_stretch_ui = '[E] - Umieść Nosze',
    pickup_bag_target = 'Podnieś',
    move_target = 'Przenieś',
    interact_bag_target = 'Otwórz',
    successful = 'Sukces',
    medbag_pickup = 'Podniosłeś torbę medyczną',
    medbag_pickup_civ = 'Przeszukałeś torbę i wziąłeś to, co mogło się przydać',
    stretcher_pickup = 'Wysłałeś nosze z powrotem na karetkę, z której zostały zabrane',
    medbag = 'Torebka Medyczna',
    medbag_tweezers = 'Pęseta',
    medbag_tweezers_desc = 'Służy do usuwania kul',
    medbag_suture = 'Zestaw Do Szycia',
    medbag_suture_desc = 'Służy do zszywania ran',
    medbag_icepack = 'Lód W Torbie',
    medbag_icepack_desc = 'Służy do zmniejszania opuchlizny',
    medbag_burncream = 'Krem Na Oparzenia',
    medbag_burncream_desc = 'Służy do leczenia oparzeń',
    medbag_defib = 'Defibrylator',
    medbag_defib_desc = 'Do ożywiania pacjentów',
    medbag_medikit = 'Apteczka',
    medbag_medikit_desc = 'Służy do leczenia pacjentów',
    medbag_sedative = 'Środek Uspokajający',
    medbag_sedative_desc = 'Służy do usypiania pacjentów',
    medbag_stretcher = 'Składana Nosze',
    medbag_stretcher_desc = 'Służy do przemieszczania pacjentów',
    item_grab = 'Wyciągnąłeś narzędzie z torby medycznej',
    wrong_equipment = 'Nieodpowiedni Sprzęt!',
    wrong_equipment_desc = 'Czy byłeś w ogóle przeszkolony?',
    player_not_injured = 'Nie Ranny',
    player_not_injured_desc =
    'Ta osoba wydaje się nie potrzebować żadnego dodatkowego leczenia i jest gotowa na użycie defibrylatora',
    player_treated = 'Leczony',
    player_treated_desc = 'Udało ci się pomyślnie leczyć pacjenta',
    revive_command_help = 'Polecenie administratora do ożywiania graczy',
    revive_command_arg = 'Identyfikator gracza',
    reviveall_command_help = 'Polecenie administratora do ożywienia wszystkich graczy',
    revivearea_command_help = 'Polecenie administratora do ożywiania graczy w pobliżu',
    revivearea_command_arg = 'Obszar do ożywiania graczy',
    resetdeathcount_command_help = 'Polecenie administratora do resetowania liczby śmierci gracza',
    resetdeathcount_command_arg = 'Identyfikator gracza',
    viewdeathcount_command_help = 'Polecenie do wyświetlania liczby twoich śmierci',
    alive_again = 'Żywy',
    alive_again_desc = 'Zostałeś odstawiony przez lokalnego mieszkańca przy szpitalu!',
    request_supplies_target = 'Zaopatrzenie Medyczne',
    currency = '$',
    not_enough_funds = 'Niewystarczające Środki',
    not_enough_funds_desc = 'Nie masz wystarczająco środków!',
    hospital_garage = 'Garaż Szpitalny',
    used_meditkit = 'Użyto Apteczki',
    used_medikit_desc = 'Udało ci się opatrzyć swoje rany',
    action_cancelled = 'Akcja Anulowana',
    action_cancelled_desc = 'Anulowałeś swoją ostatnią akcję!',
    healing_self_prog = 'Leczenie Ran',
    checkin_hospital = 'Sukces',
    checkin_hospital_desc = 'Zostałeś pomyślnie leczony przez personel szpitala',
    max_ems = 'Dostępni Medycy',
    max_ems_desc = 'W mieście jest wystarczająca liczba medyków! Wezwij pomoc!',
    player_busy = 'Zajęty',
    player_busy_desc = 'Aktualnie jesteś zbyt zajęty, aby wykonać tę akcję!',
    cloakroom = 'Szatnia',
    civilian_wear = 'Ubranie Cywilne',
    bill_patient = 'Faktura dla Pacjenta',
    bill_patient_desc = 'Wyślij rachunek do pobliskiego pacjenta',
    invalid_entry = 'Nieprawidłowe Dane',
    invalid_entry_desc = 'Twoje dane są nieprawidłowe!',
    medical_services = 'Usługi Medyczne',
    hospital = 'Szpital',
    interact_stretcher_ui = '[E] - Interakcja',
    stretcher_menu_title = 'Interakcje z Nosze',
    open_shop_ui = '[E] - Otwórz Aptekę'

}

UIStrings = {
    player_dying = "UMIERASZ",
    player_passed = "ODSZEDŁEŚ",
    ems_on_the_way = "Służby ratunkowe są w drodze!",
    press_ems_services = "dla Służb Ratunkowych",
    press_for_light = "by zobaczyć światło",
    hold = "Trzymać",
    time_to_respawn = "Czas do respawnu",
    press = "Naciśnij",
    player_hurt_critical = "Stan krytyczny!",
    player_hurt_severe = "Jesteś poważnie ranny",
    player_hurt_unconscious = "Nieprzytomny",
    player_hurt_unconscious_direct = "Jesteś nieprzytomny",
    player_hurt_find_help_or_ems = "Naciśnij <span class='color'>G</span>, aby wezwać pomoc",
    player_hurt_time_to_live = "Krwotok",
    player_hurt_auto_respawn = "Zanikają funkcje życiowe",
    player_hurt_respawn = "Naciśnij E, aby zobaczyć światło",

    ems_online = "POMOC ONLINE",
    ems_offline = "POMOC NIEDOSTĘPNA",
    currently_online = "OBECNIE ONLINE: "
}