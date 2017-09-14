import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component{
  constructor(props){
    super(props);
    this.pokemonList = this.pokemonList.bind(this);
  }

  pokemonList(){
    return this.props.pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} poke={poke}/>
    ));
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    return(
      <div>
        <h1>Pokemon Index</h1>
        <ul>
          {this.pokemonList()}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
