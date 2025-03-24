const { BadRequestError } = require('../errors/ExceptionErrors');

const validateUserLogin = (req, res, next) => {
    const { email, password } = req.body;

    const error = []

    if (!email) {
        error.push('Falta paramétro: email');
    }

    if (!password) {
        error.push('Falta paramétro: password');
    }

    if (error.length > 0) {
        throw new BadRequestError(error);
    }
    next();
};

const validateUserRegistro = (req, res, next) => {
    const { nombre, apellido, email, password } = req.body;

    const error = []

    if (!nombre) {
        error.push('Falta paramétro: nombre');
    }

    if (!apellido) {
        error.push('Falta paramétro: apellido');
    }

    if (!email) {
        error.push('Falta paramétro: email');
    }

    if (!password) {
        error.push('Falta paramétro: password');
    }

    if (error.length > 0) {
        throw new BadRequestError(error);
    }
    next();
};

const validateToken = (req, res, next) => {

    const token = req.headers.authorization?.split(" ")[1];

    const error = [];

    if (!token) {
        error.push('Token no proporcionado');
    }

    if (error.length > 0) {
        throw new BadRequestError(error);
    }
    next();
};

module.exports = {
    validateUserLogin,
    validateUserRegistro,
    validateToken
};