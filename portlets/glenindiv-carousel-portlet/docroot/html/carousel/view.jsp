<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>

<div id="myCarousel">
  <div id="image1"></div>
  <div id="image2"></div>
  <div id="image3"></div>
  <div id="image4"></div>
</div>

<aui:script>
AUI().use(
  'aui-carousel',
  function(Y) {
   new Y.Carousel(
     {
       contentBox: '#myCarousel',
       height: 250,
       width: 700,
       intervalTime: 2,
       animationTime: 1,
       activeIndex: 0,
       boundingBox: '#myCarousel'
     }
   ).render();
  }
);
</aui:script>