from PySide6.QtWidgets import QWidget, QLabel, QVBoxLayout
class TeamsTab(QWidget):
    def __init__(self):
        super().__init__(); l=QVBoxLayout(); l.addWidget(QLabel('tba')); self.setLayout(l)