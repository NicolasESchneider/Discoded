import React from 'react';
import {NavLink} from 'react-router-dom';

class ServerIndexItem extends React.Component{

  constructor(props){
    super(props);
  }

  render(){
    return (
    <NavLink to={`/@me/${this.props.uId}/${this.props.server.id}`}>
      <li className="server-icon">
        <p>
          {this.props.server.name.slice(0,2)}
        </p>
        <span className='server-name'>{this.props.server.name}</span>
      </li>
    </NavLink>
    )
  }

};
export default ServerIndexItem;