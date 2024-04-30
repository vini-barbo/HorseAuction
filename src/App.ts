import express, { Application } from "express";
import { database } from "./database/Database";
import { UserModel } from './database/UserModel'
import "express-async-errors";
import { IUserCreate } from "./interfaces/UserInterface";

class App {
    public app: Application;

    constructor() {
        this.app = express();
        this.init();
    }

    private async init(): Promise<void> {
        await this.expressConfig();
        await database.init();
        await this.insertTest()
    }
    private async expressConfig(): Promise<void> {
        await this.app.use(express.json());
    }

    private async insertTest() {

        const userCreateData: IUserCreate = {
            name: 'teste1',
            password: crypto.randomUUID(),
            email: 'teste1@hotmail.com',
            status: 1,
            type: 1,
        }

        await UserModel.createUser(userCreateData)
    }

}

export default App
