import express, { Application } from "express";
import { database } from "./database/Database";
import { UserModel } from './database/model/UserModel'
import "express-async-errors";
import { IUserCreate } from "./interfaces/UserInterface";
import moment from "moment-timezone";
import { randomUUID } from "crypto";


class App {
    public app: Application;

    constructor() {
        this.app = express();
        this.init();
    }

    private async init(): Promise<void> {
        moment().tz("America/Sao_Paulo").format()
        await this.expressConfig();
        await database.init();
        await this.insertTest()

    }
    private async expressConfig(): Promise<void> {
        await this.app.use(express.json());
    }

    private async insertTest() {

        // for (let i = 0; i < 20; i++) {
        //     console.log(1)
        //     const userCreateData: IUserCreate = {
        //         name: 'teste1',
        //         password: crypto.randomUUID(),
        //         email: crypto.randomUUID() + '@hotmail.com',
        //         status: 1,
        //         type: 1,
        //     }
        //     await UserModel.createUser(userCreateData)
        // }
        const response = await UserModel.findUser(randomUUID())
        console.log(response)

    }

}

export default App
