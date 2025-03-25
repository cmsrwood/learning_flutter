const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const ingresarRepository = require('../repository/loginRepository');
const { BadRequestError, NotFoundError } = require('../errors/ExceptionErrors');


exports.registrar = async (usuario) => { 
    const encontrar = await ingresarRepository.encontrarUsuarioPorEmail(usuario);
    if (encontrar) {
        throw new BadRequestError('Usuario ya registrado');
    }
    console.log(encontrar);
    const response = await ingresarRepository.registrar(usuario);
    return response
}

exports.ingresar = async (usuario) => {
    const datos = await ingresarRepository.encontrarUsuarioPorEmail(usuario);

    if (!datos) { 
        throw new NotFoundError('Usuario no encontrado');
    }

    const match = await bcrypt.compare(usuario.password, datos.password);
    if (!match) { 
        throw new BadRequestError('Contraseña incorrecta');
    }

    const token = jwt.sign({ id: datos.id }, 'secret');

    return {
        message: 'Ingreso exitoso',
        id: datos.id,
        nombre: datos.nombre,
        email: datos.email,
        token: token
    }
}