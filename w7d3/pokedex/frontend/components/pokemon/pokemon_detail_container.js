import {connect} from 'react-redux';
import selectAllPokemon from '../../reducers/selector';
import {requestOnePokemon} from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';


const mapStateToProps = state => {
  const pokemon = state.entities.pokemon[state.ui.pokeDisplay];
  return { pokemon };
};

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (pokemon) => dispatch(requestOnePokemon(pokemon))
  // dispatch requestAllPokemon action.
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
