import express, { Application } from "express";
import { database } from "./database/Database";
import "express-async-errors";

class App {
    public app: Application;

    constructor() {
        this.app = express();
        this.init();
    }

    private async init(): Promise<void> {
        await this.expressConfig();
        await database.init();
    }
    private async expressConfig(): Promise<void> {
        await this.app.use(express.json());
    }

}

export default App
