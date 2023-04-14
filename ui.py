import streamlit as st
from streamlit_option_menu import option_menu
from PIL import Image
import pandas as pd
import sys
import mysql.connector
import base64

sys.path.insert(1, 'dbms_connect.py')
from dbms_connect import *

def streamlit_menu():
    # if example == 1:
    #     # 1. as sidebar menu
    #     with st.sidebar:
    #         selected = option_menu(
    #             menu_title="Main Menu",  # required
    #             options=["Home", "Projects", "Contact"],  # required
    #             icons=["house", "book", "envelope"],  # optional
    #             menu_icon="cast",  # optional
    #             default_index=0,  # optional
    #         )
    #     st.markdown(selected)
    #     return selected

    # if example == 2:
        # 2. horizontal menu w/o custom style
        selected = option_menu(
            menu_title=None,  # required
            options=["Read","Queries","Delete", "Update", "Insert"],  # required
            icons=["book","gear", "x","recycle","upload"],  # optional
            menu_icon="cast",  # optional
            default_index=0,  # optional
            orientation="horizontal",
        )
        return selected


    # st.experimental_rerun()

st.set_page_config(layout="wide")
# st.image("1.jpg")
# Customize the sidebar
_, col2, _ = st.columns([1, 2, 1])
with col2:
    markdown = """
    Courier Management System
"""
with st.sidebar:
            select1 = option_menu(
                menu_title="Main Menu",  # required
                options=["Home", "Operations"],  # required
                icons=["house", "list-task"],  # optional
                menu_icon="cast",  # optional
                default_index=0,  # optional
            )
            st.markdown(select1)

if select1 == "Home":     
    
# st.sidebar.title("About")
    

# @st.cache(allow_output_mutation=True)
    def get_base64_of_bin_file(bin_file):
        with open(bin_file, 'rb') as f:
            data = f.read()
        return base64.b64encode(data).decode()
    
    _ , col ,_ =st.columns([1,4,1])
    with col :
        st.title("Courier Management System")
        # st.subheader("Kiran H Kademani")
    _ , image,_ =st.columns([2,5,2])
    # with image:
    bin_str = get_base64_of_bin_file("1.jpg")
    page_bg_img = '''
<style>
body {
background-image: url("data:1.jpg;base64,%s");
background-size: cover;
opacity : 0.9
}
</style>
''' %bin_str

    st.markdown(page_bg_img, unsafe_allow_html=True)
        # imag = Image.open('1.jpg')

        # st.image(imag,width=500)
# st.sidebar.info(markdown)
# logo = "1.jpg"
# st.sidebar.image(logo)
    markdown = """
    This system contains the database of courier management,where the database contains the following entities:\n
        * Customer
        * Package
        * Service
        * Delivery Agent
        *Track
    You can enjoy querying this database ;)
"""
    st.text(markdown)
# Customize page title

if select1 == "Operations":

    st.markdown(
    """
    Select the following operations you want to perform on the database 
    """
)


    st.info("Welcome to "+markdown)

# st.session_state.count = 0

# st.text_input("Please input something",key=random.choice(string.ascii_uppercase)+str(random.randint(0,999999)))

    selected = streamlit_menu()
    if selected == "Read":
        option = st.selectbox(
'Select the table you want to check',
('Customer',"Package","Services","Delivery_agent","Track"))
        _ , bt , _ = st.columns([1,3,1])
        bt = st.button("Submit")
        if bt : 
            str1="select * from {};".format(option)
            st.write(r_execute(str1))

    if selected == "Queries":
        _ ,col , _ = st.columns([1,2,1])
        col=st.text_area("Enter the Query for the table:")
        _ , bt , _ = st.columns([1,10,1])
        with bt :
            b = st.button("Submit")
            if b : 
                st.write(r_execute(col))
    

    if selected == "Delete":
        st.markdown("Delete details of a customer:")
        default_checkbox_value = False
        # if 'dummy_data' not in st.session_state.keys():
        dummy_data = retrieve_id("Select * from customer;")
        st.session_state['dummy_data'] = dummy_data
        # else:
        #     dummy_data = st.session_state['dummy_data']
        # def onclick(i):
        # st.session_state['dynamic_checkbox_' + i] = True
        with st.form(key="Delete"):
            _,b,_ = st.columns(3)
            # st.text_input("Select the customer you want to remove:")
            st.write(r_execute("Select * from customer"))
            data = retrieve_id("Select * from customer;")
            # with b:
            #     approve_button = st.form_submit_button(label='Print current table')
            # current_statusses= []
            with st.expander(label='Tuples of the table', expanded=True):
                # if approve_button:
                    # checkbox_statusses = 
                    # st.write(checkbox_statusses)
                    _,m,_=st.columns([1,5,1])
                    # for i in data:
                    #     d = r_execute(f"select * from customer where cust_id = '{i}'")
                    with m:
                        options = st.multiselect('Choose the customer ID you want to delete:',
    data)
                    #     default_checkbox_value = st.checkbox(value=False,label=i, key='dynamic_checkbox_' +  i)
                    #     st.write(d)
                    #     # if j :
                    #     #     st.session_state['cust'].append(i)
                    
                        
                    
                    # st.write("hi")
                    # .append(st.checkbox(checkbox_statusses[i][0], key=i, value=default_checkbox_value))
                # st.write(checkbox_statusses[0])
                    
                    c= st.columns(5)
                    
                    # st.write(st.session_state['cust'])
                    with c[2]:
                        bt = st.form_submit_button("Submit")
                    #     st.write(get_selected_checkboxes())
                    # l=[i.replace('dynamic_checkbox_','') for i in st.session_state.keys() if i.startswith('dynamic_checkbox_') and st.session_state[i]]                
                    st.write(options)
                    if bt:
                        for i in options:
                            d_execute(f"Delete from customer where cust_id = '{i}'")
                            st.success(f"Successfully deleted the customer details with customer ID : {i}")
                    st.experimental_rerun()
                        # st.experimental_rerun()
            

            
            
        
        
    if selected == "Update":
        st.markdown("Update the table services:")
        with st.form("Update"):
            _,b,_ = st.columns(3)
            # st.text_input("Select the customer you want to remove:")
            with b:
                approve_button = b.form_submit_button(label='Print current table')
            # approve_button = st.form_submit_button(label='Print current table')
            if approve_button:
                st.write(r_execute("select * from services"))
            a,b = st.columns(2)
            # col3,col4 = st.columns(2)
            _,c,_ = st.columns(3)
            with a:
                col1=st.number_input("Enter the service ID:")
                col2=st.text_input("Enter the name of the Service:")
                st.write(col2)
            with b:
                col3=st.selectbox("Select the type of service:",(r_execute("Select service_type from services")))
                col4=st.number_input("Enter the price of the service:")
            with c:
                bt = st.form_submit_button("Submit")
                if bt :
                    d_execute(f"Update services set service_name_ = '{col2}',service_type = '{col3}' ,price = {col4} where service_id = {col1}")
                    st.success(f"Successfully updated the service table with service ID:{col1}!!!")
                    st.write(r_execute("select * from services"))
        
    
    if selected == "Insert":
        st.markdown('Enter the details for inserting in Package table')
        _,col1,col2,col3,_ = st.columns([1,5,2,5,1])
        
        col1=st.text_input("Package ID:")
        col2=st.number_input("Package_weight")
        col3=st.text_input("Package_info:")
        buttn = st.button("Submit")
        # col2=int(col2)
        if buttn:
            try:
                i = d_execute(f"Insert into package values('{col1}',{col2},'{col3}')")
                st.success(f"Successfully inserted the entered information with ID:{col1}!!!")
                i = pd.DataFrame(r_execute("Select * from package"))
                st.write(i)
            
            except mysql.connector.Error as e:
                # st.error(e)
                st.error("This package id may already exist,try another one...")
        
# st.session_state.count += 1

