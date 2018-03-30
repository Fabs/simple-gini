const Gini = require("./output/Gini");
const closestCountry = require("./lib/gini2000");
const { flag } = require("country-emoji");

const moon = "🌓";
const boom = "💥";

const extendedFlag = country => {
  if (country.name === "Moon") {
    return moon;
  }

  if (country.name === "Boon") {
    return Boon;
  }

  return flag(country.name);
};

const gini = values => {
  const giniValue = Gini.gini(values);
  const country = closestCountry(giniValue);
  return {
    value: giniValue,
    country: closestCountry(giniValue),
    flag: extendedFlag(country)
  };
};

module.exports = gini;
