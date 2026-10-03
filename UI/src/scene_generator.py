import os
import json
import urllib.request

OLLAMA_HOST = os.environ.get("OLLAMA_HOST", "http://localhost:11434")

def generate_scene_assets(input_list):
    """
    Connects to local Ollama service to serialize a plain text comma-separated 
    list of objects/ingredients into structured JSON rendering assets.
    """
    prompt = (
        "You are a 3D and 2D scene asset generation engine. "
        "Given the following comma-separated list of items, serialize them into a valid JSON array "
        "of scene objects. Each object must have keys: 'name', 'type' (one of 'atomizer', '2d_sketch', 'point_cloud', 'opengl_glsl'), "
        "and 'properties' (an object containing relevant positioning, color, and density parameters). "
        "Return ONLY valid JSON with no markdown formatting or extra commentary.\n\n"
        f"Input Items: {input_list}"
    )

    req_data = json.dumps({
        "model": "llama3.2",
        "prompt": prompt,
        "stream": False,
        "format": "json"
    }).encode("utf-8")

    try:
        req = urllib.request.Request(
            f"{OLLAMA_HOST}/api/generate",
            data=req_data,
            headers={"Content-Type": "application/json"}
        )
        with urllib.request.urlopen(req, timeout=30) as response:
            res_body = json.loads(response.read().decode("utf-8"))
            parsed_json = json.loads(res_body.get("response", "[]"))
            return parsed_json
    except Exception as e:
        print(f"Ollama generation fallback triggered: {e}")
        # Fallback default structured asset mapping
        items = [i.strip() for i in input_list.split(",") if i.strip()]
        return [
            {
                "name": item,
                "type": "point_cloud" if idx % 2 == 0 else "opengl_glsl",
                "properties": {"density": 1.0, "color": "#6366f1", "scale": 1.0}
            }
            for idx, item in enumerate(items)
        ]

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        print(json.dumps(generate_scene_assets(sys.argv[1]), indent=2)) 
