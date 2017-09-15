import React from 'react';
import ItemDetailContainer from './item_detail_container';
import {selectPokemonItem} from '../../reducers/selector';
import { Route } from 'react-router-dom';

class PokemonDetail extends React.Component{
  constructor(props){
    super(props);
    this.itemArray = this.itemArray.bind(this);
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

  itemArray(items){
    if (items === {}) return [];
    return Object.keys(items).map(id => (
      //items id starts at 1 but array index starts at 0
      <div className='items'>
        <li>Name: {items[id].name}</li>
        <img src={items[id].image_url} />
        <li>Price: {items[id].price}</li>
        <li>Happiness: {items[id].happiness}</li>
        <br/>
      </div>

    ));
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
            {this.itemArray(this.props.items)}
          </ul>
          <Route path='/pokemon/:pokemonId/items/:itemId' component={ItemDetailContainer}/>
      </div>
    );}
  }
}

export default PokemonDetail;
