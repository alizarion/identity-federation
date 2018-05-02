<%@ page import = " java.util.* " %>

<html>
<header>
    <link href='http://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
    <style type="text/css" media="screen">


        body {
            width: 100%;
            height: 100%;
            position: fixed;
            background-color: #34495e;
        }
        .content {
            width: 600px;
            font-size: 36px;
            line-height: 40px;
            font-family: 'Muli';
            color: #ecf0f1;
            height: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -15px;
            margin-left: -118px;
        }
        .content:before {
            content: '[';
            position: absolute;
            left: -30px;
            line-height: 40px;
        }
        .content:after {
            content: ']';
            position: absolute;
            right: -30px;
            line-height: 40px;
        }
        .content:after,
        .content:before {
            color: #16a085;
            font-size: 42px;
            animation: 2s linear 0s normal none infinite opacity;
            -webkit-animation: 2s ease-out 0s normal none infinite opacity;
            -moz-animation: 2s ease-out 0s normal none infinite opacity;
            -o-animation: 2s ease-out 0s normal none infinite opacity;
        }
        .visible {
            float: left;
            font-weight: 600;
            overflow: hidden;
            height: 40px;
        }
        p {
            display: inline;
            float: left;
            margin: 0;
        }
        ul {
            margin-top: 0;
            padding-left: 250px;
            text-align: left;
            list-style: none;
            animation: 6s linear 0s normal none infinite change;
            -webkit-animation: 6s linear 0s normal none infinite change;
            -moz-animation: 6s linear 0s normal none infinite change;
            -o-animation: 6s linear 0s normal none infinite change;
        }
        ul li {
            line-height: 40px;
            margin: 0;
        }
        @-webkit-keyframes opacity {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
        @keyframes opacity {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
        @-webkit-keyframes change {
            0% {
                margin-top: 0;
            }
            15% {
                margin-top: 0;
            }
            25% {
                margin-top: -40px;
            }
            40% {
                margin-top: -40px;
            }
            50% {
                margin-top: -80px;
            }
            65% {
                margin-top: -80px;
            }
            75% {
                margin-top: -40px;
            }
            85% {
                margin-top: -40px;
            }
            100% {
                margin-top: 0;
            }
        }
        @keyframes change {
            0% {
                margin-top: 0;
            }
            15% {
                margin-top: 0;
            }
            25% {
                margin-top: -40px;
            }
            40% {
                margin-top: -40px;
            }
            50% {
                margin-top: -80px;
            }
            65% {
                margin-top: -80px;
            }
            75% {
                margin-top: -40px;
            }
            85% {
                margin-top: -40px;
            }
            100% {
                margin-top: 0;
            }
        }
    </style>
</header>
<body>
<div class='content'>
    <div class='visible'>

        <p>
            Java : Bonjour
        </p>

        <ul>

            <%
                out.println("<li>"+ request.getHeader("IT_CLAIM_given_name")+ "</li>");
                out.println("<li>"+ request.getHeader("IT_CLAIM_family_name")+ "</li>");
                out.println("<li>"+ request.getHeader("IT_CLAIM_email")+ "</li>");
            %>
        </ul>
        <div></div> 
        <p>HTTP Request Headers Received</p>
        <table>
            <% Enumeration enumeration = request.getHeaderNames(); while (enumeration.hasMoreElements()) { String name=(String) enumeration.nextElement(); String value = request.getHeader(name); %>
                <tr>
                    <td>
                        <%=n ame %>
                    </td>
                    <td>
                        <%=v alue %>
                    </td>
                </tr>
                <% } %>
        </table>
    </div>
</div>

</body>
</html>
