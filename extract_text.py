import sys
from pypdf import PdfReader

def extract_text(pdf_paths, output_file):
    with open(output_file, 'w', encoding='utf-8') as f:
        for pdf_path in pdf_paths:
            f.write(f"--- Extracting from {pdf_path} ---\n")
            try:
                reader = PdfReader(pdf_path)
                for page in reader.pages:
                    text = page.extract_text()
                    f.write(text)
                    f.write("\n--- Page Break ---\n")
            except Exception as e:
                f.write(f"Error reading {pdf_path}: {e}\n")
            f.write("\n========================================\n\n")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python extract_text.py <pdf1> <pdf2> ...")
    else:
        extract_text(sys.argv[1:], "cv_content_utf8.txt")
