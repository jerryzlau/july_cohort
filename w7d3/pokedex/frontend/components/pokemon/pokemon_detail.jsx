import React from 'react';

class PokemonDetail extends React.Component{
  constructor(props){
    super(props);
  }

  componentDidMount(){
    // debugger
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps){
    if (this.props.match.params.pokemonId != newProps.match.params.pokemonId){
      this.props.requestOnePokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    if (this.props.pokemon === undefined) {
      return <div>"Loading"</div>;
    } else { return(
      <div>
        <h1>PokemonDetails</h1>
          <ul>
            <img src={this.props.pokemon.image_url} />
            <li>Name: {this.props.pokemon.name}</li>
            <li>Type: {this.props.pokemon.poke_type}</li>
            <li>Attack: {this.props.pokemon.attack}</li>
            <li>Defense: {this.props.pokemon.defense}</li>
            <li>Moves: {this.props.pokemon.moves}</li>
          </ul>
      </div>
    );}
  }
}

export default PokemonDetail;
