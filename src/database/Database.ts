import { Client } from 'pg'
import moment from 'moment'



class Database {
    public client = new Client({
        user: process.env.DB_USERNAME,
        host: process.env.DB_HOST,
        database: process.env.DB_DATABASE,
        password: process.env.DB_PASSWORD,
        port: Number(process.env.DB_PORT),
        ssl: Boolean(process.env.DB_SSL)
    })

    public async test() {
        const res = await this.client.query('SELECT $1::text as message', ['Hello world!'])
        console.log(res, '12')
        console.log(res.rows[0].message)
        await this.client.end()
    }

    public async init(){
        try {
            this.client.connect()
            console.log(`✅ [${moment().format()}] Database connection has been create successfully at host ${process.env.DB_HOST}`)
        } catch (error) {
            console.log(`❌ [${moment().format()}] Failed to connect to the database at host ${process.env.DB_HOST}`, error)
        }
    }
}

const database = new Database()

export { database }