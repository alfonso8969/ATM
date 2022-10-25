/**
 * Converts a text string to a number formatted with dots
 * @param {string} number string of numbers
 * @returns {string} a number formated whit dots and commas
 */
let formatNumber = {
	separador: ".", // separador para los miles
	sepDecimal: ',', // separador para los decimales
	first: 0,
	formatear: function (num) {
		num +='';
		if(!num.includes(',') && this.first === 0) {
			if(num.includes(',')) this.first = 1;
			let splitStr = num.split('.');
			let splitLeft = splitStr[0];
			let splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
			let regx = /(\d+)(\d{3})/;
			while (regx.test(splitLeft)) {
				splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
			}
			return splitLeft + splitRight + this.simbol;
		}

		return num;
	},
	new: function(num, simbol) {
		this.simbol = simbol || '';
		return this.formatear(num);
	}
}
/**
 * Convert a string with dots in string whitout dots
 * @param {string} number string of numbers format whit dots
 * @returns {string} a string without dots
 */
let numberToInt = (number) => {
	let nums = [];
	if (number.includes(".")) {
		nums = number.split(".");
		return parseInt(nums[0]) + "" + parseInt(nums[1]);
	}
	return number;
}

/**
 * Converts a number to a string with separators
 * @param {string} number string
 * @returns {string} a string with dots and commas
 */
function decimalFormat(number) {
	let parts = number.toString().split(".");
	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".")
	return parts.join(",");
}

/**
 * Function that receives a date or a Timestamp
 * and converts it to a string in the format yyyy-MM-dd
 * 
 * @param {(Date|Object)} date Date to convert
 * @param {boolean} time to distinguish types
 */
function formatDate(date, time) {
	let day;
	let month;
	let year;

	if (!time) {
		day = date.getDate();
	} else {
		day = date[2]
	}

	if (!time) {
		month = date.getMonth() + 1;
	} else {
		month = date[1]
	}

	if (!time) {
		year = date.getFullYear();
	} else {
		year = date[0]
	}

	if (day < 10) {
		day = "0" + day;
	}
	if (month < 10) {
		month = "0" + month;
	}

	return year + "-" + month + "-" + day;
}

