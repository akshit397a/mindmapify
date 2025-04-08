# MindMapify

Welcome to the **Mindmapify** project! This tool allows users to upload a PDF file, which is then processed to extract key information and convert it into a mind map. The tool also generates a summary of the PDF, bullet points, translations, and a flowchart for better understanding.

---

## Features

- **PDF Summarization**: Automatically summarizes the uploaded PDF file.
- **Mind Map Generation**: Converts the summarized content into a mind map.
- **Bullet Points**: Generates a list of key points from the PDF for quick understanding.
- **Translations**: Translates the summarized content into multiple languages.
- **Flowchart**: Generates a flowchart to visually represent the information.
- **User-friendly Interface**: Simple and clean web-based interface for smooth user experience.

---

## Installation

To run the **MindMapify** locally, follow these steps:

### Prerequisites

Ensure you have the following installed:

- Python 3.x
- pip (Python's package installer)
- Virtual Environment (recommended)

### Steps to Install

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/pdf-to-mindmap.git
   cd pdf-to-mindmap


2. **Set up a virtual environment** (optional but recommended):
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

3. **Install the dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the application**:
   ```bash
   python app.py
   ```

5. Open your web browser and go to `http://localhost:5000`.

---

## Usage

1. **Upload a PDF**: Click the "Upload PDF" button and select your PDF file.
2. **Summarize**: After the PDF is uploaded, the system will generate a summary and display it on the page.
3. **View Bullet Points**: Below the summary, you will see key bullet points that capture the main ideas.
4. **Translations**: The summarized content will be translated into multiple languages for accessibility.
5. **Mind Map**: A flowchart and a mind map will be displayed to visualize the connections between the extracted ideas.

---

## Technologies Used

- **Python**: For backend processing and PDF text extraction.
- **Flask**: Lightweight web framework to create the web interface.
- **JavaScript & HTML/CSS**: For frontend design and interactivity.
- **Libraries**: 
  - `PyPDF2` or `pdfplumber` for extracting text from PDFs.
  - `Flask` for handling backend requests.
  - `NLTK` or `spaCy` for text processing and summarization.
  - `Graphviz` or `mindmappy` for generating mind maps.
  - `Google Translate API` for translations.
  
---

## Contribution

We welcome contributions to improve the project! Here’s how you can help:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-xyz`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes (`git push origin feature-xyz`).
5. Create a pull request.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---




---

## Acknowledgements

- **Mind Map Generation**: Thank you to [Graphviz](https://graphviz.gitlab.io/) for providing an excellent tool for visualizing graphs and mind maps.
- **Text Processing**: Special thanks to the [spaCy](https://spacy.io/) and [NLTK](https://www.nltk.org/) communities for their natural language processing tools.
- **PDF Libraries**: Thanks to the creators of [PyPDF2](https://pythonhosted.org/PyPDF2/) and [pdfplumber](https://github.com/jsvine/pdfplumber) for making PDF extraction easy and efficient.

---

**Enjoy using the PDF to MindMap Converter! 🚀**
