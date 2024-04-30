import { UUID } from "crypto";
import { Status, Type } from "./Utils";

interface IUserModel {
    user_id: number,
    name: string,
    password: UUID
    email: string,
    status: Status
    type: Type,
    companyId?: number,
    created_at: Date
    update_at?: Date,
    deleted_at?: Date
}

interface IUserCreate extends Omit<IUserModel, 'user_id' | 'update_at' | 'created_at' | 'deleted_at'> { }

export { IUserModel, IUserCreate }
