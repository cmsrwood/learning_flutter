const express = require('express');
const cors = require('cors');
const routes = require('./routes');
const errorHandler = require('./middlewares/errorHandler');
const requestLogger = require('./middlewares/requestLogger');

const createApp = () => {
    const app = express();

    app.use(cors({
        origin: '*',
        methods: ['GET', 'POST', 'PUT', 'DELETE'],
        credentials: true,
        allowedHeaders: ['Content-Type', 'Authorization']
    }));

    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(requestLogger);

    app.use('/api', routes);

    app.get('/', (req, res) => {
        res.send('Hola mundo');
    })

    app.use(errorHandler);

    return app;
}

module.exports = createApp;