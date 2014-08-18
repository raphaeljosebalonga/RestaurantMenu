var siteloc = "http://localhost/Restaurant%20Menu";
var scriptloc = "/scripts/"

function fetch_restoMenu_Ordered()
{
  $.ajax({
	url: siteloc + scriptloc + "getorder.py",
	data: {}, 
	dataType: 'json',
	success: function(res){
		console.log(res);
		if(res[0][0] != "None")
                    {
			table = '<table border="1">';
                        for(i=0; i<res.length; i++)
                        {
                              row = res[i];
                              table += "<tr>";
                              for (j=0; j<row.length; j++)
                              {
                                  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
		}
	});
}

function fetch_restoMenu_Ordered_perid(table_id)
{
  $.ajax({
	url: siteloc + scriptloc + "getorderperid.py",
	data: {table_id:table_id}, 
	dataType: 'json',
	success: function(res){
		console.log(res);
		if(res[0][0] != "None")
                    {
			table = '<table border="1">';
                        for(i=0; i<res.length; i++)
                        {
                              row = res[i];
                              table += "<tr>";
                              for (j=0; j<row.length; j++)
                              {
                                  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
		}
	});
}

function fetch_restoMenu_List()
{
  $.ajax({
	url: siteloc + scriptloc + "getlist.py",
	data: {}, 
	dataType: 'json',
	success: function(res){
		console.log(res);
		if(res[0][0] != "None")
                    {
			table = '<table border="1">';
                        for(i=0; i<res.length; i++)
                        {
                              row = res[i];
                              table += "<tr>";
                              for (j=0; j<row.length; j++)
                              {
                                  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
		}
	});
}

