<%@ Page Title="Demo Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DevexpressImplementTest._Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.2, Version=20.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <script src="../Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> 

<script>
//Jquery

    $(document).ready(function() {
        //stars_time
        $('.starsRating li').on('mouseover', function () {
            var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

            // Now highlight all the stars that's not after the current hovered star
            $(this).parent().children('li.star').each(function (e) {
                if (e < onStar) {
                    $(this).addClass('hover');
                }
                else {
                    $(this).removeClass('hover');
                }
            });

        }).on('mouseout', function () {
            $(this).parent().children('li.star').each(function (e) {
                $(this).removeClass('hover');
            });
        });

        $('.starsRating  li').on('click', function () {
            var onStar = parseInt($(this).data('value'), 10);
            var stars = $(this).parent().children('li.star');

            for (i = 0; i < stars.length; i++) {
                $(stars[i]).removeClass('selected');
            }

            for (i = 0; i < onStar; i++) {
                $(stars[i]).addClass('selected');
            }
           
        });

    });
</script>
    
    <style>
    .headerImages {
        max-width: 500px;
    }

    .feedbackButtons {
        border-radius: 25px;
        padding-left: 20px;
        padding-right: 20px;
        color: black;
        background-color: #ccc;
        border-color: #ccc;
        outline: none;
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
    }

        .feedbackButtons:hover {
            background-color: #6e6e6e;
            border-color: #6e6e6e;
            color: white;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
        }

        .feedbackButtons:focus {
            color: black;
            background-color: #ccc;
            border-color: #ccc;
            outline: none;
            box-shadow: none;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
        }

    .feedbackButtonsSelected {
        border-radius: 25px;
        padding-left: 20px;
        padding-right: 20px;
        color: white;
        background-color: #000000;
        border-color: #000000;
        outline: none;
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
    }

        .feedbackButtonsSelected:hover {
            background-color: #6e6e6e;
            border-color: #6e6e6e;
            color: white;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
        }

        .feedbackButtonsSelected:focus {
            color: white;
            background-color: #000000;
            border-color: #000000;
            outline: none;
            box-shadow: none;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
        }
    /* Rating Star Widgets Style */
    .rating-stars ul {
        list-style-type: none;
        padding: 0;
        -moz-user-select: none;
        -webkit-user-select: none;
    }

        .rating-stars ul > li.star {
            display: inline-block;
        }

            /* Idle State of the stars */
            .rating-stars ul > li.star > i.fa {
                font-size: 2.5em; /* Change the size of the stars */
                color: #ccc; /* Color on idle state */
            }

            /* Hover state of the stars */
            .rating-stars ul > li.star.hover > i.fa {
                color: #6e6e6e;
            }

            /* Selected state of the stars */
            .rating-stars ul > li.star.selected > i.fa {
                color: #000000;
            }
</style>
    <div id="feedBackContainer" runat="server">

    </div>
  
</asp:Content>
<!--c#-->

using DevExpress.Web;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.Bootstrap;

namespace DevexpressImplementTest
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
            Dictionary<string, string> question = new Dictionary<string,string>();
             question.Add("1", "whats your name");
             question.Add("2", "whats your name");
             question.Add("3", "whats your name");

            foreach (KeyValuePair<string,string> item in question)
             {
                 feedBackContainer.InnerHtml += HTMLBuilder(item.Key, item.Value);
             }

        }
        private string HTMLBuilder(string id, string question)
        {
            string starsRating = "<div style='text-align: center; '>" +
                                    "<h4>'" + question + "'</h4>" +
                                    "<div class= 'rating-stars text-center'>" +
                                    "<ul id='" + id + "' class='starList'> " +
                                        "<li class='star' title='1' data-value='1'>" +
                                         "<i class='fa fa-star fa-fw'></i>" +
                                          "</li>" +
                                           "<li class='star' title='2' data-value='2'>" +
                                           "<i class='fa fa-star fa-fw'></i>" +
                                           "</li>" +
                                           "<li class='star' title='3' data-value='3'>" +
                                            "<i class='fa fa-star fa-fw'></i>" +
                                            "</li>" +
                                             "<li class='star' title='4' data-value='4'>" +
                                             "<i class='fa fa-star fa-fw'></i>" +
                                             "</li>" +
                                              "<li class='star' title='5' data-value='5'>" +
                                              "<i class='fa fa-star fa-fw'></i>" +
                                              "</li>" +
                                        "</ul>" +
                                     "</div>" +
                                     "<label id='" + id + "_label" + "'>Hello</label><br>" +
                                     "<TextArea id='"+id + "_textbox" + "'></TextArea>"+ 
                                     "</br>"+
                                     "<a id='"+id+ "_link" + "' href='' > Add a comment <class='fa fa-pencil' aria-hidden='true' ></i></a>" +
                                     "</div>" +
                                     "<br>";

            return starsRating;
        }
    }
}


