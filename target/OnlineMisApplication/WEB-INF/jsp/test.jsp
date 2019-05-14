<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>Hi MIS..  </p>


 <form id="msform" method="post" action="workCreation">

 <fieldset>
                <h2 >Work Creation</h2>
                <!--<h3 class="fs-subtitle">Tell us something about you</h3>-->  
                
                <ul >
                <li><p>Types of Work <span class="red">*</span></p></li>
                <li><select id="typeworkid" name="typeworkid">
                <option value="" selected="">--Types of Work --</option>
                <option value="New">New</option>
                <option value="upgrade">Upgrade</option>
                <option value="repair">Repair</option>
                </select> 
                </ul>
                
                <ul >
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><select id="worknatureid" name="worknatureid" >
                <option value="" selected="">--select work--</option>
             	 <option value="work1">NTR KVK (Constituency KVKs)</option>
             	 <option value="work2">NTR MKVKs</option>
             	 <option value="work3">Modernization Works</option>
             	 <option value="work4">Regional Academics</option>
             	 <option value="work5">District Level Sports Complex</option>
             	 <option value="work6">Swimming Pools</option>
             	 <option value="work7">400 mtrs Synthetic Athletic Track</option>
             	 <option value="work8">Water Sports Academies</option>
             	 <option value="work9">Model Sport School at Vizzy Stadium</option>
             	 <option value="work10">Twin Synthetic Tennis Courts</option>
             	 <option value="work11">Wooden Flooring</option>
             	 <option value="work12">Repairs to Swimming Pools</option>
             	 <option value="work13">Shopping Complex</option>
               </select>
               </li>
                </ul>
                
                <ul >
                <li><p>District <span class="red">*</span></p></li>
                <li><select id="districtid" name="district" >
                <option value="" selected="">--select district--</option>
             	 <option value="28">Ananthapuramu</option>
             	 <option value="29">Chitoor</option>
             	 <option value="30">East Godavari</option>
             	 <option value="31">Guntur</option>
             	 <option value="32">Kadapa</option>
             	 <option value="33">Krishna</option>
             	 <option value="34">Kurnool</option>
             	 <option value="35">Nellore</option>
             	 <option value="36">Prakasam</option>
             	 <option value="38">Srikakulam</option>
             	 <option value="39">Visakhapatnam</option>
             	 <option value="40">Vizianagaram</option>
             	 <option value="41">West Godavari</option>
               </select>
               </li>
                </ul>
                
                <ul >
                <li><p>Constituency <span >*</span></p></li>
                <li>
                <select id="constituancyId" name="constituancyId">
                  <option value="select" selected="" disabled="">--select --</option>
                  <option value="1">Ichchapuram</option>
                  <option value="2">Palasa</option>
                  <option value="3">Tekkali</option>
                  <option value="4">Pathapatnam</option>
                  <option value="5">Amadalavalasa</option>
                  <option value="6">Kothuru</option>
                  <option value="7">Rajam</option>
                  <option value="8">Narasannapeta</option>
              </select>
            </li>
                </ul>
                
                <ul >
                <li><p>Mandal <span >*</span></p></li>
                <li>
                <select id="mandalId" name="mandalId" >
              <option value="select" selected="" disabled="">--select Mandal--</option>
             	 <option value="8">Amadalavalasa</option>
             	 <option value="34">Bhamini</option>
             	 <option value="35">Burja</option>
             	 <option value="6">Etcherla</option>
             	 <option value="28">Ganguvarisigadam</option>
             	 <option value="10">Gara</option>
             	 <option value="33">Hiramandalam</option>
             	 <option value="5">Ichchapuram</option>
             	 <option value="23">Kanchili</option>
             	 <option value="13">Kaviti</option>
             	 <option value="15">Kotabommali</option>
             	 <option value="22">Kothuru</option>
             	 <option value="38">Lakshminarsupeta</option>
             	 <option value="21">Laveru</option>
             	 <option value="9">Mandasa</option>
             	 <option value="31">Meliaputti</option>
             	 <option value="29">Nandigam</option>
             	 <option value="12">Narasannapeta</option>
             	 <option value="14">Palakonda</option>
             	 <option value="3">Palasa</option>
             	 <option value="27">Pathapatnam</option>
             	 <option value="24">Polaki</option>
             	 <option value="17">Ponduru</option>
             	 <option value="4">Rajam</option>
             	 <option value="7">Ranastalam</option>
             	 <option value="20">Regidi Amadalavalasa</option>
             	 <option value="19">Santhabommali</option>
             	 <option value="26">Santhakaviti</option>
             	 <option value="32">Saravakota</option>
             	 <option value="37">Sarubujjili</option>
             	 <option value="30">Seethampeta</option>
             	 <option value="11">Sompeta</option>
             	 <option value="2">Srikakulam</option>
             	 <option value="16">Tekkali</option>
             	 <option value="18">Vajrapukothuru</option>
             	 <option value="36">Vangara</option>
             	 <option value="25">Veeraghattam</option>
            </select>
            </li>
                </ul>
                
                <ul >
                <li><p>Village <span >*</span></p></li>
                <li><select id="villagesId" >
              <option value="select" selected="" disabled="">--select--</option>
               <option value="1">Alikam</option>
               <option value="2">Balivada</option>
               <option value="3">Batteru</option>
               <option value="4">Ippili</option>
            </select></li>
                </ul>
                
                <ul >
                <li><p>Location <span >*</span></p></li>
                <li><input type="text" name="work-number" placeholder="Work Number"/></li>
                </ul>
                
                <ul >
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="work-number" placeholder="Work Number"></li>
                </ul>
                
                <ul >
                <li><p>No. of Works <span >*</span></p></li>
                <li ><input type="text" name="no-of-work" placeholder="No. of Works">  <input type="button" name="Create"  value="Create"></li>
                </ul>
                
                <div id="work_table_div">
	        <table id="work_table" >
	        <tbody>
            <tr>
            <th>S.No</th> 
            <th>Work Detail</th> 
            <th>Estimated Cost (in Lakhs)
            </th>
            </tr>
            <tr>
            <td><b>1</b></td>
            <td><input type="text" id="s.no" name="s.no" value=""> </td> 
            <td><input type="text"  id="work-details-new" maxlength="10" name="work-details-new"></td>
            </tr>
            </tbody>
            </table>
        </div>
                
                
                <input type="submit" name="next"  value="Save and Continue"/>
                
                
            </fieldset>
            </form>
            
</body>
</html>