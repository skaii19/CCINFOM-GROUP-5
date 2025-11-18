from PySide6.QtWidgets import QDialog
from PySide6.QtCore import Signal
from view.add_tournament import Ui_addTournamentDialog
from datetime import date

class TournamentForm(QDialog):
    # signal to emit form data
    saved = Signal(dict)

    def __init__(self, existing=None):
        super().__init__()
        self.ui = Ui_addTournamentDialog()
        self.ui.setupUi(self)

        self.existing = existing

        # Connect buttons
        self.ui.saveButton.clicked.connect(self.on_save)
        self.ui.cancelButton.clicked.connect(self.close)

        # Fill fields if editing
        if existing:
            self.ui.tournament_addName.setText(existing.get("tournament_name", ""))
            self.ui.tournament_addTypeDropdown.setCurrentText(existing.get("tournament_type", ""))
            self.ui.tournament_addStartDate.setDate(existing.get("start_date", date.today()))
            self.ui.tournament_addPrizePool.setText(str(existing.get("prize_pool", "")))
            self.ui.tournament_addCountry.setText(existing.get("country", ""))
            self.ui.tournament_addCity.setText(existing.get("city", ""))
            self.ui.tournament_addVenue.setText(existing.get("venue", ""))

    def on_save(self):
        data = {
            "name": self.ui.tournament_addName.text().strip(),
            "type": self.ui.tournament_addTypeDropdown.currentText(),
            "start_date": self.ui.tournament_addStartDate.date().toPython(),
            "prize_pool": float(self.ui.tournament_addPrizePool.text()),
            "country": self.ui.tournament_addCountry.text().strip(),
            "city": self.ui.tournament_addCity.text().strip(),
            "venue": self.ui.tournament_addVenue.text().strip()
        }
        self.saved.emit(data)
        self.close()
