import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetail from './pokemon_detail';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component{
  constructor(props){
    super(props);
    this.pokemonList = this.pokemonList.bind(this);
  }

  pokemonList(){
    return this.props.pokemon.map(poke => (
      <div>
        <PokemonIndexItem key={poke.id} poke={poke}/>
      </div>
    ));
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    return(
      <div className="pokedex">
        <div>
          <h1>Pokemon Index</h1>
          <ul>
            {this.pokemonList()}
          </ul>
        </div>

        <div>
          <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer}/>
        </div>
      </div>
    );
  }
}

export default PokemonIndex;
