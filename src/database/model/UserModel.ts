import { randomUUID, UUID } from 'crypto';
import { IUserCreate, IUserModel } from "../../interfaces/UserInterface";
import { database } from "../Database";
import { Crypt } from '../../utils/Crypt';

abstract class UserModel {
    public static async createUser(userCreateData: IUserCreate): Promise<IUserModel | void> {
        const password = await Crypt.createHash(userCreateData.password)
        const userId = await randomUUID();
        const query = ' INSERT INTO "user"("userId","nome","password","email","status","role","createdAt") VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *'
        const values = [userId, userCreateData.name, password, userCreateData.email, userCreateData.status, 'USER', new Date()]
        console.log('adicionando usuario')
        try {
            const response: IUserModel | any = await database.client.query(query, values)
            console.log(response)
            return response as IUserModel
        } catch (error) {
            console.log(error)
        }
    }
    public static async findUser(userId: UUID) {
        const query = ' '
    }
}

export { UserModel }