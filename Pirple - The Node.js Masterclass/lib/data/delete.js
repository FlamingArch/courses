function deleteFile(dir, file, callback) {
  let pathFile = lib.basedir + dir + "/" + file + ".json";

  // Unlink the file
  fs.unlink(pathFile, (err) => {
    if (err) callback("Error deleting file");
    else callback(false);
  });
}

module.exports = deleteFile;
