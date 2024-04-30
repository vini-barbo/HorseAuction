import App from './App'
import moment from 'moment'


class Server {
    private SERVER_PORT = Number(process.env.SERVER_PORT)
    private app = new App().app

    public async start() {
        try {
            this.app.listen(this.SERVER_PORT, () => {
                console.log(`✅ [${moment().format()}] Server Connection has been create successfully at port ${this.SERVER_PORT}`)
            })
        } catch (error) {
            console.log(`❌ [${moment().format()}] Failed to create a server at port ${this.SERVER_PORT}`, error)
        }

    }
}

const server = new Server()
server.start()