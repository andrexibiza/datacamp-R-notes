import json
import re
from typing import List, Dict

import nltk
from nltk import pos_tag
from nltk.tokenize import sent_tokenize

# Make sure you have the necessary NLTK data downloaded
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')


def extract_text_from_pdf(pdf_file_path: str) -> str:
    """
    Replace this function with your actual PDF text extraction implementation
    using OCR or PDF-to-text tools.
    """
    # For demonstration, assume we have the text directly
    with open(pdf_file_path, 'r', encoding='utf-8') as file:
        text = file.read()
    return text


def extract_recipes(text: str) -> List[Dict]:
    """
    Extracts recipe data from the given text.
    """
    recipes = []
    current_recipe = None
    for sentence in sent_tokenize(text):
        # Identify recipe names
        if re.match(r"^[A-Z][a-z]+(?: [A-Z][a-z]+)+$", sentence):
            if current_recipe:
                recipes.append(current_recipe)
            current_recipe = {"recipe_name": sentence, "ingredients": [], "procedures": [], "equipment_list": []}
        # Identify yield amounts
        elif match := re.match(r"(?:serves|yields|makes)\s+(\d+(?:-\d+)?)", sentence, re.IGNORECASE):
            current_recipe["yield"] = match.group(1)
        # Identify ingredient lines
        elif match := re.match(r"(\d+\/\d+|\d+(?:\.\d+)?)?\s*([a-z\s]+)\s*([a-z]+)", sentence, re.IGNORECASE):
            amount, name, unit = match.groups()
            current_recipe["ingredients"].append({"name": name.strip(), "amount": amount, "unit": unit})
        # Identify procedure steps
        elif re.match(r"^(?:instructions|directions|steps|method):", sentence, re.IGNORECASE):
            current_recipe["procedures"].append(sentence)
        # Identify equipment lines
        elif re.match(r"^(?:equipment|tools|utensils)\s*(?:needed|required)?:", sentence, re.IGNORECASE):
            current_recipe["equipment_list"].append(sentence)
        elif current_recipe and sentence.strip():
            # Additional procedure steps or equipment items
            if current_recipe["procedures"]:
                current_recipe["procedures"].append(sentence)
            else:
                current_recipe["equipment_list"].append(sentence)

    if current_recipe:
        recipes.append(current_recipe)

    return recipes


def main():
    pdf_file_path = "C:\Users\andre\Desktop\BongAppetit.pdf"  # Replace with your actual PDF file path
    text = extract_text_from_pdf(pdf_file_path)
    recipes = extract_recipes(text)

    # Output the extracted recipes as JSON
    with open("recipes.json", "w", encoding='utf-8') as json_file:
        json.dump(recipes, json_file, indent=4)


if __name__ == "__main__":
    main()
    