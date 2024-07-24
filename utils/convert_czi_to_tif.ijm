// Set the directory path where your CZI images are located
dir = "/Users/anthonycortez/Projects/Pancreatic_Islet_UNET/HE_Images/";

// Create a subfolder to save the masks
File.makeDirectory(dir + "/tif_files");

setBatchMode("true");
setBatchMode("hide");

// Get the list of CZI files in the directory
list = getFileList(dir);
nFiles = list.length;


// Loop through each CZI file
for (i = 0; i < nFiles; i++) {
  // Get the file name
  fileName = list[i];

  // Check if the file is a CZI image
  if (endsWith(fileName, ".czi")) {

  	// Construct the full file path
    filePath = dir + fileName;

    // Open the CZI image
    run("Bio-Formats Importer", "open=[" + filePath + "] color_mode=Default view=Hyperstack stack_order=XYCZT" );

    run("RGB Color");

    // Save the mask
    saveAs("Tiff", dir + "tif_files/" + fileName.replace(".czi", "_mask.tif"));

    // Close the CZI image
    close();
  }
}