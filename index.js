const Gini = require("./output/Gini");
const closestCountry = require("./lib/gini2000");
const { flag } = require("country-emoji");

const gini = values => {
  const giniValue = Gini.gini(values);
  const country = closestCountry(giniValue);
  return {
    value: giniValue,
    country: closestCountry(giniValue),
    flag: flag(country.name)
  };
};

module.exports = gini;
