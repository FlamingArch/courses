function validateInput(data) {
  const { firstName, lastName, phone, password, tosAgreement } = data;
  return !(firstName & lastName & phone & password & tosAgreement);
}

module.exports = validateInput;
