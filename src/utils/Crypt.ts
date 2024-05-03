import bcrypt from 'bcrypt'
type hash = string

class Crypt {

    public static async createHash(valueToEncrypt: string): Promise<hash> {
        const salt = await bcrypt.genSalt();
        const encryptedText: hash = await bcrypt.hash(valueToEncrypt, salt)
        return encryptedText
    }

    public static async compareHash(recieveValue: string, refereceValue: string): Promise<boolean> {
        const result = await bcrypt.compare(recieveValue, refereceValue)
        return result
    }
}

export { Crypt }