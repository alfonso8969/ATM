/**
 * Converts a text string to a number formatted with dots
 * @param {string} number string of numbers
 * @returns {string} a number formated whit dots and commas
 */
var formatNumber = {
	separador: ".", // separador para los miles
	sepDecimal: ',', // separador para los decimales
	first: 0,
	formatear: function (num) {
		num +='';
		if(!num.includes(',') && this.first === 0) {
			if(num.includes(',')) this.first = 1;
			var splitStr = num.split('.');
			var splitLeft = splitStr[0];
			var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
			var regx = /(\d+)(\d{3})/;
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
var numberToInt = (number) => {
	var nums = [];
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
	var parts = number.toString().split(".");
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
	var day;
	var month;
	var year;

	if (!time) {
		day = date.getDate();
	} else {
		day = date.dayOfMonth
	}

	if (!time) {
		month = date.getMonth() + 1;
	} else {
		month = date.monthValue
	}

	if (!time) {
		year = date.getFullYear();
	} else {
		year = date.year
	}

	if (day < 10) {
		day = "0" + day;
	}
	if (month < 10) {
		month = "0" + month;
	}

	return year + "-" + month + "-" + day;
}

