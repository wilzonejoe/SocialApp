<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
   <TITLE>CustomerFound</TITLE>
</HEAD>
<BODY>
   <H3>Customer Found</H3>
   <%-- Displays a response using customer bean properties --%>
   <jsp:useBean id="customer" class="Bean.User"
      scope="session" />

   <P>The customer
   <jsp:getProperty name="customer" property="fullName" />
   was found on the database.</P>
   
   <P><A HREF="CustomerDetails.jsp">Check another customer</A></P>
</BODY>
</HTML>
