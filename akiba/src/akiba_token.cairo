#[starknet::contract]
mod AKibaToken {
    use starknet::ContractAddress;
    use openzeppelin::token::erc721::ERC721;
    use openzeppelin::access::ownable::Ownable;
    use openzeppelin::security::pausable::Pausable;
    use openzeppelin::introspection::interface;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(
        ref self: ContractState,
        name: felt252,
        symbol: felt252,
        owner: ContractAddress,
        token_id: u256
    ) {

        let mut unsafe_state = ERC721::unsafe_new_contract_state();
        let  mut unsafe_state_1 = Ownable::unsafe_new_contract_state(); 

        ERC721::InternalImpl::initializer(ref unsafe_state, name,symbol);
        // ERC721::InternalImpl::_mint(ref unsafe_state, recipient, token_id);
        Ownable::InternalImpl::initializer(ref unsafe_state_1,owner);

    }

    #[external(v0)]
    fn supportsInterface(self: @ContractState, interface_id: felt252) -> bool {
             let unsafe_state = ERC721::unsafe_new_contract_state();
             ERC721::SRC5Impl::supports_interface(@unsafe_state,interface_id)
        }


    #[external(v0)]
    fn name(self: @ContractState) -> felt252 {
        let unsafe_state = ERC721::unsafe_new_contract_state();
        ERC721::ERC721MetadataImpl::name(@unsafe_state)
    }

    #[external(v0)]
    fn symbol(self: @ContractState) -> felt252 {
        let unsafe_state = ERC721::unsafe_new_contract_state();
        ERC721::ERC721MetadataImpl::symbol(@unsafe_state)
        }

    #[external(v0)]
    fn token_uri(self: @ContractState, token_id: u256) -> felt252 {
        let unsafe_state = ERC721::unsafe_new_contract_state();
        ERC721::ERC721MetadataImpl::token_uri(@unsafe_state,token_id)
        
    }

    #[external(v0)]
    fn tokenURI(self: @ContractState, tokenId: u256) -> felt252 {
            let unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721MetadataCamelOnlyImpl::tokenURI(@unsafe_state,tokenId)
        }

    #[external(v0)]
    fn balance_of(self: @ContractState, account: ContractAddress) -> u256 {
            let unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::balance_of(@unsafe_state,account)
        }

    #[external(v0)]
    fn owner_of(self: @ContractState, token_id: u256) -> ContractAddress {
          let unsafe_state = ERC721::unsafe_new_contract_state();
          ERC721::ERC721Impl::owner_of(@unsafe_state,token_id)
        }

    #[external(v0)]
    fn get_approved(self: @ContractState, token_id: u256) -> ContractAddress {
            let unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::get_approved(@unsafe_state,token_id)
        }

    #[external(v0)]
     fn is_approved_for_all(
            self: @ContractState, owner: ContractAddress, operator: ContractAddress
        ) -> bool {
            let unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::is_approved_for_all(@unsafe_state,owner,operator)
        }

    #[external(v0)]
    fn owner( self: @ContractState,) -> ContractAddress{
        let  unsafe_state_1 = Ownable::unsafe_new_contract_state(); 
        Ownable::OwnableImpl::owner(@unsafe_state_1)
    }

    #[external(v0)]
    fn approve(ref self: ContractState, to: ContractAddress, token_id: u256) {
            let mut unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::approve(ref unsafe_state,to,token_id);
        }

    #[external(v0)]
    fn set_approval_for_all(
            ref self: ContractState, operator: ContractAddress, approved: bool
        ) {
             let mut unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::set_approval_for_all(ref unsafe_state, operator,approved);
        }

    #[external(v0)]
    fn transfer_from(
            ref self: ContractState, from: ContractAddress, to: ContractAddress, token_id: u256
        ) {
            let mut unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::transfer_from(ref unsafe_state,from,to,token_id);
        }

    #[external(v0)]
    fn safe_transfer_from(
            ref self: ContractState,
            from: ContractAddress,
            to: ContractAddress,
            token_id: u256,
            data: Span<felt252>
        ) {
            let mut unsafe_state = ERC721::unsafe_new_contract_state();
            ERC721::ERC721Impl::safe_transfer_from(ref unsafe_state,from,to,token_id,data)
        }

    #[external(v0)]
    fn transferOwnership(ref self: ContractState, newOwner: ContractAddress) {
        let mut unsafe_state_1 = Ownable::unsafe_new_contract_state();
        Ownable::OwnableImpl::transfer_ownership(ref unsafe_state_1,newOwner);
    }

    #[external(v0)]
    fn renounceOwnership(ref self: ContractState) {
        let mut unsafe_state_1 = Ownable::unsafe_new_contract_state();
        Ownable::OwnableImpl::renounce_ownership(ref unsafe_state_1);
    }

    #[external(v0)]
    fn safeMint( ref self: ContractState, to: ContractAddress, token_id: u256, data: Span<felt252>) {
        let mut unsafe_state = ERC721::unsafe_new_contract_state();
        ERC721::InternalImpl::_safe_mint(ref unsafe_state, to, token_id,  data);

    }
        

}