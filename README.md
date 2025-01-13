import os
# Define paths
receptor = "protein.pdbqt" # Protein file
ligand_folder = "ligands/" # Folder containing ligand PDBQT files
output_folder = "results/" # Folder to save docking results
vina_executable = "vina" # Path to AutoDock Vina executable
# Grid box parameters
center_x, center_y, center_z = 10.0, 12.5, 15.0
size_x, size_y, size_z = 20.0, 20.0, 20.0
# Ensure output folder exists
os.makedirs(output_folder, exist_ok=True)
# Loop through each ligand
for ligand_file in os.listdir(ligand_folder):
if ligand_file.endswith(".pdbqt"):
ligand_path = os.path.join(ligand_folder, ligand_file)
output_path = os.path.join(output_folder, f"{ligand_file}_out.pdbqt")
log_path = os.path.join(output_folder, f"{ligand_file}_log.txt")
# Build the Vina command
command = f"""{vina_executable} --receptor {receptor} \
--ligand {ligand_path} --out {output_path} --log {log_path} \
--center_x {center_x} --center_y {center_y} --center_z {center_z} \
--size_x {size_x} --size_y {size_y} --size_z {size_z} --exhaustiveness 8"""
# Run the command
print(f"Docking {ligand_file}...")
os.system(command)
