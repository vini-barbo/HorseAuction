import express, { Application } from "express";
import { Database } from "./database/Database";
import "express-async-errors";

class App {
    public app: Application;
    private database = new Database()

    constructor() {
        this.app = express();
        this.init();
    }

    private async init(): Promise<void> {
        await this.expressConfig();
        await this.DatabaseConfig();
    }
    private async expressConfig(): Promise<void> {
        await this.app.use(express.json());
    }

    private async DatabaseConfig(): Promise<void> {
    }

}

export default App
