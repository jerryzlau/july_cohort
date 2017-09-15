import {connect} from 'react-redux';
import {requestOnePokemon} from '../../actions/pokemon_actions';
import ItemDetail from './item_detail';
import {selectPokemonItem} from '../../reducers/selector';


const mapStateToProps = state => {
  items: state.entities.items;
};

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (pokemon) => dispatch(requestOnePokemon(pokemon))
  // dispatch requestAllPokemon action.
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);
