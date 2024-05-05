import { Status } from "./Utils";

interface IUserModel {
    user_id: number,
    name: string,
    password: string,
    email: string,
    status: Status
    role: 'USER' | 'OWNER',
    companyId?: number,
    createdAt: Date
    updateAt?: Date,
    deletedAt?: Date
}

interface IUserCreate extends Omit<IUserModel, 'user_id' | 'created_at'> { }

interface IUserFind extends Partial<IUserModel> { }

export { IUserModel, IUserCreate, IUserFind }
