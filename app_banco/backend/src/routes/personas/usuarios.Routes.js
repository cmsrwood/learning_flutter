const express = require('express');
const router = express.Router();
const loginController = require('../../controller/loginController');
const { validateUserLogin, validateUserRegistro } = require('../../middlewares/validateUsuarios');

router.post('/registrar', validateUserRegistro, loginController.registrar);

router.post('/ingresar', validateUserLogin, loginController.ingresar);

module.exports = router;