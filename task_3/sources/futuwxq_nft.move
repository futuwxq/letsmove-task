module task_3::futuwxq_nft {
    use sui::display;
    use sui::package;
    use std::string::{String, utf8};

    public struct FUTUWXQ_NFT has drop {}

    public struct FUTUWXQ has key, store {
        id: UID,
        name: String,
        description: String,
    }

    fun init(otw: FUTUWXQ_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"FUTUWXQ_NFT"),
            utf8(b"A NFT for futuwxq"),
            utf8(b"https://avatars.githubusercontent.com/u/49089070")
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<FUTUWXQ>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = FUTUWXQ {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
        };
        transfer::public_transfer(nft, recipient);
    }
}
