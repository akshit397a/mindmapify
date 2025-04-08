
import os
import streamlit as st
import requests
import easyocr
from PIL import Image
import numpy as np
import io
import pdfplumber
from googletrans import Translator
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch
import textwrap

API_KEY = st.secrets('HF_TOKEN') 
API_URL = "https://api-inference.huggingface.co/models/facebook/bart-large-cnn"

def extract_text_from_pdf(file):
    with pdfplumber.open(file) as pdf:
        return ''.join([page.extract_text() for page in pdf.pages])

def extract_text_from_image(file):
    reader = easyocr.Reader(['en'], gpu=False)
    
    def convert_to_numpy(file):
        image = Image.open(file)
        return np.array(image)
    
    def convert_to_rgb(file):
        image = Image.open(file)
        rgb_image = image.convert('RGB')
        return np.array(rgb_image)
    
    def convert_from_bytes(file):
        file_bytes = file.read()
        image = Image.open(io.BytesIO(file_bytes))
        return np.array(image)
    
    conversion_methods = [
        convert_to_numpy,
        convert_to_rgb,
        convert_from_bytes
    ]
    
    for method in conversion_methods:
        file.seek(0)
        image_np = method(file)
        results = reader.readtext(image_np)
        extracted_text = ' '.join([result[1] for result in results])
        
        if extracted_text:
            return extracted_text
        
    return "No text extracted"

def summarize_text(text):
    headers = {"Authorization": f"Bearer {API_KEY}"}
    payload = {
        "inputs": text,
        "parameters": {
            "max_length": 2048,
            "min_length": 100,
            "length_penalty": 1.5,
            "num_beams": 6,
            "no_repeat_ngram_size": 3,
        }
    }
    response = requests.post(API_URL, headers=headers, json=payload)
    if response.status_code == 200:
        return response.json()[0]["summary_text"]
    else:
        return text

def split_text(text, max_chunk_size=2048):
    words = text.split()
    chunks, current_chunk, current_length = [], [], 0
    for word in words:
        if current_length + len(word) + 1 > max_chunk_size:
            chunks.append(" ".join(current_chunk))
            current_chunk, current_length = [], 0
        current_chunk.append(word)
        current_length += len(word) + 1
    if current_chunk:
        chunks.append(" ".join(current_chunk))
    return chunks

def make_points(summary):
    return ["- " + point.strip() for point in summary.split('. ') if point]

def translate_text(text, target_language):
    translator = Translator()
    translated = translator.translate(text, dest=target_language)
    return translated.text

def create_flowchart(summary, max_steps=10):
    steps = summary.split('. ')
    steps = [step.strip() for step in steps if step.strip()]
    steps = steps[:max_steps]

    plt.figure(figsize=(14, len(steps) * 2.2))

    box_color = "#E6F2FF"
    arrow_color = "#3A7CA5"

    box_width = 1.6
    box_height = 0.8
    box_spacing = 2.5

    ax = plt.gca()
    ax.set_xlim(-2, 2)
    ax.set_ylim(-len(steps) * box_spacing - 1, 1)

    def wrap_text(text, max_width=35):
        return "\n".join(textwrap.wrap(text, width=max_width))

    for i, step in enumerate(steps):
        y_pos = -i * box_spacing
        wrapped_step = wrap_text(step)

        box = FancyBboxPatch(
            (-box_width / 2, y_pos - box_height / 2),
            box_width,
            box_height,
            boxstyle="round,pad=0.3",
            facecolor=box_color,
            edgecolor="#5DADE2",
            linewidth=1.5,
            alpha=0.9
        )
        ax.add_patch(box)

        ax.text(
            0, y_pos,
            wrapped_step,
            fontsize=10,
            fontweight='medium',
            ha="center",
            va="center",
            color="#2C3E50"
        )

        if i < len(steps) - 1:
            arrow = FancyArrowPatch(
                (0, y_pos - box_height / 2),
                (0, y_pos - box_spacing + box_height / 2),
                arrowstyle="->",
                color=arrow_color,
                mutation_scale=20,
                linewidth=2,
                connectionstyle="arc3,rad=0.2"
            )
            ax.add_patch(arrow)

    plt.title("Process Flow", fontsize=15, fontweight='bold', pad=40)
    ax.axis("off")
    plt.tight_layout(pad=2.0)

    plt.savefig(
        "mindmap.png",
        bbox_inches="tight",
        dpi=300,
        facecolor='white',
        edgecolor='none'
    )
    plt.close()

    return "mindmap.png"
def process_file(file):
    file_type = 'pdf' if file.name.endswith('.pdf') else 'image'
    
    if file_type == 'pdf':
        text = extract_text_from_pdf(file)
    else:
        text = extract_text_from_image(file)
    
    chunks = split_text(text)
    summarized_chunks = [summarize_text(chunk) for chunk in chunks]
    combined_summary = " ".join(summarized_chunks)
    
    bullet_points = make_points(combined_summary)
    
    translations = {}
    for lang in ["hi", "gu", "ta", "bn"]:
        translations[lang] = translate_text(combined_summary, lang)
    
    flowchart_image = create_flowchart(combined_summary)
    
    return combined_summary, bullet_points, translations, flowchart_image

def main():
    st.title("MindMapify")
    st.write("Upload a PDF or Image for processing")
    
    uploaded_file = st.file_uploader("Choose a file", type=['pdf', 'png', 'jpg', 'jpeg'])
    
    if uploaded_file is not None:
        st.subheader("Uploaded File")
        st.write(f"Filename: {uploaded_file.name}")
            
        summary, bullet_points, translations, flowchart = process_file(uploaded_file)
        
        st.subheader("Summary")
        st.write(summary)
        
        st.subheader("Key Points")
        for point in bullet_points:
            st.write(point)
        
        st.subheader("Translations")
        for lang, trans in translations.items():
            st.write(f"{lang.upper()}: {trans}")
        
        st.subheader("Mindmap")
        st.image(flowchart, caption="Process Flowchart")

if __name__ == "__main__":
    main()
