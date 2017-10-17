import {connect} from 'react-redux';
import SessionForm from './session_form';
import {login, signup} from '../../actions/session_actions';


const mapStateToProps = (state, ownProps) => ({
  loggedIn: Boolean(state.currentUser),
  errors: state.errors,
  formType: ownProps.location.pathname === 'login' ? 'login' : 'signup'
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: () => dispatch(ownProps.formType === 'login' ? login() : signup())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
