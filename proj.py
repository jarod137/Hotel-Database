import argparse
import mysql.connector
from mysql.connector import Error
from prettytable import PrettyTable

def main(question, name):

    PTables = PrettyTable()

    try:
        connect = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="Ho0pa4in79o9e11ep!",
            database="los_dulces_resort"
        )
    
        if connect.is_connected():
            db_Info = connect.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            mycursor = connect.cursor()
            mycursor.execute("select database();")
            record = mycursor.fetchall()
            print("You're connected to database: ", record)

    except Error as e:
        print("except")
        print("Error while connecting to MySQL", e)    

    match question:
        case 1:
            print ("case 1")
            sql = """select g.*
                    from `guest` g
                    join `reservation` r on g.`guestID` = r.`guestID`
                    where r.`reserveID` is not null;"""

        case 2:
            print ("case 2")
            sql="""select st.`employeeID`,st.`name`,st.`email`,st.`position`,st.`phone_number`,s.`hotelID`,s.`roomID`,s.`roomType`,s.`cleanDate`,s.`cleanTime`,s.`cost`
                    from `service` s 
                    join `staff` st on s.`employeeID` = st.`employeeID`
                    where `roomID` is not null AND `position` = "Housekeeper";
                    """
        case 3:
            print ("case 3")
            sql="""select g.`name`, g.`address`, g.`roomID`, s.`startDate`, s.`endDate`
                   from `guest` g
                   join `stay` s on g.`guestID` = s.`guestID`
                   join `room` r on s.`roomID` = r.`roomID`;
                   """

        case 4:
            print ("case 4")
            sql="""select g.`name`,a.`amenityType`, r.`roomType`
                    from `guest` g
                    join `delivers` d ON g.`guestID` = d.`guestID`
                    join `amenity` a ON d.`amenityID` = a.`amenityID`
                    join `room` r ON g.`roomID` = r.`roomID`
                    where g.`name` = 'Guest 1';"""

        case 5:
            print ("case 5")
            sql="""select s.`employeeID`, s.`name`, s.`position`
                   from `staff` s
                   where `position` in ('Front Desk Clerk', 'Concierge', 'Housekeeper', 'Valet', 'Chef', 'Server', 'Security')
                   and `employeeID` in (select `employeeID` from `manager`);"""

        case 6:
            print ("case 6")
            sql="""select h.`hotelName`, h.`capacity`, COUNT(o.`employeeId`) as 'onCallStaff'
                   from `hotel` h
                   join `oncall` o on h.`employeeID` = o.`employeeID`
                   group by h.`hotelID`
                   having h.`capacity` * 0.9 < COUNT(o.`employeeID`)
                   and count(o.`employeeID`) < 10
                   ; """
            
        case _:
            print ("undefined case")
            sql=""

    print(sql)
    mycursor.execute(sql)
    results = mycursor.fetchall()
    PTables._validate_field_names = lambda *a, **k: None
    PTables.field_names = [i[0] for i in mycursor.description]   

    for r in results:
        PTables.add_row(r)
     
    print(PTables)
    
    try:
        
        if (connect.is_connected()):
            connect.close()
            mycursor.close()
            print("MySQL connection is closed")

    except Error as e:
        print("except")
        print("Error while closing MySQL connection", e)  
  
if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('-a', type=int)
    parser.add_argument('-b', type=str, nargs="+") 
    args = parser.parse_args()

    question = args.a
    name = None
    if args.b ==None:
        pass
    else: 
        name = ' '.join(args.b)
        print(name)
    main(question,name)
