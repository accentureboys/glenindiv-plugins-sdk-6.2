<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>

<div id="myCarousel">
  <div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/1.jpg);"></div>
  <div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/2.jpg);"></div>
  <div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/3.jpg);"></div>
  <div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/4.jpg);"></div>
</div>

<aui:script>
 AUI().use(
   'aui-carousel',
   function(Y) {
    new Y.Carousel(
      {
        contentBox: '#myCarousel',
        height: 250,
        width: 700
      }
    ).render();
  }
);
</aui:script>