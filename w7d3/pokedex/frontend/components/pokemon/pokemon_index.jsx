import React from 'react';

class PokemonIndex extends React.Component{
  constructor(props){
    super(props);
    this.pokemonList = this.pokemonList.bind(this);
  }

  pokemonList(){
    return this.props.pokemon.map(poke => (
      <li key={poke.id}>
        <h4>{poke.name}</h4>
        <img src={poke.image_url} />
      </li>
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
