let i
let arr = []
for (i = 0; i < 500 ; i++){
	arr.push(
    `("${String.fromCharCode(65 + i)}mmie.nicolas@example.com",
    "${String.fromCharCode(65 + i)}beautifulbird",
    "Emmie",
    "Nicolas",
    "$2b$10$CRlQyqWHEpV0xIXZfOkeE.OgYK.TOrwaDvwm5NkJvxjAn7LIL2u2C",
    "da449380ace40de84cf59ceb24f8deb6f13c5ca641b86ad58b8fa8a249105b46",
    1,
    20,
    "Male",
    "Other",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
    101,
    2)\n`
  );
}


console.log("(" + arr + ")");
