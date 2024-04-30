import { IUserCreate, IUserModel } from "../interfaces/UserInterface";
import { database } from "./Database";

abstract class UserModel {
    public static async createUser(userCreateData: IUserCreate): Promise<IUserModel | void> {

        const query = ' INSERT INTO "user"(nome, password, email, status, type, company_id, create_at) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *'
        const values = [userCreateData.name, userCreateData.password, userCreateData.email, userCreateData.status, userCreateData.type, 8, new Date()]
        console.log(values)
        try {
            const response: IUserModel | any = await database.client.query(query, values)
            console.log(response)
            return response as IUserModel
        } catch (error) {
            console.log(error)
        }

    }
}

export { UserModel }