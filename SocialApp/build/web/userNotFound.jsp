<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
   <TITLE>UserNotFound</TITLE>
</HEAD>
<BODY>
   <H3>Customer Not Found</H3>
   <%-- Displays a response using customer bean properties --%>
   <jsp:useBean id="user" class="Bean.User"
      scope="session" />

   <P>The customer
   <jsp:getProperty name="user" property="fullName" />
   was not found on the database.</P>

</BODY>
</HTML>
