module task_1::hello_futuwxq {
    use std::ascii::{String, string};
    use sui::object::{Self,UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct Hello has key{
        id:UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_futuwxq = Hello {
            id:object::new(ctx),
            say: string(b"hello futuwxq~"),
        };
        transfer(hello_futuwxq, sender(ctx));
    }

    public fun hello(ctx: &mut TxContext): String{
        string(b"hello futuwxq~")
    }
}
