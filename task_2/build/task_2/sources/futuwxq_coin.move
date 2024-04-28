module task_2::futuwxq_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct FUTUWXQ_COIN has drop {}

    fun init(witness: FUTUWXQ_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FUTUWXQ_COIN>(
            witness,
            9,
            b"FUTUWXQ_COIN",
            b"FUTUWXQ",
            b"futuwxq coin, my first ft coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/49089070")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FUTUWXQ_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<FUTUWXQ_COIN>, 
        coin: Coin<FUTUWXQ_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
