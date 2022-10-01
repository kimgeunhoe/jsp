<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <!-- SEO Meta Tags -->
        <meta name="description" content="Your description">
        <meta name="author" content="Your name">

        <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
        <meta property="og:site_name" content="" /> <!-- website name -->
        <meta property="og:site" content="" /> <!-- website link -->
        <meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
        <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
        <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
        <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
        <meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

        <!-- Webpage Title -->
        <title>06</title>
        
        <!-- Styles -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
        <link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/resources/dist/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="/resources/dist/css/swiper.css" rel="stylesheet">
        <link href="/resources/dist/css/styles.css" rel="stylesheet">
        
        <!-- Favicon  -->
        <link rel="icon" href="/resources/dist/images/favicon.png">
    </head>
    <body data-bs-spy="scroll" data-bs-target="#navbarExample">
        
        <!-- Navigation -->
        <c:set var="ssmvo" value="${ses }" scope="session"/>
        <nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
            <div class="container">

                <!-- Image Logo -->
                <a class="navbar-brand logo-image" href="/index.html"><img src="/resources/dist/images/logo.svg" alt="alternative"></a> 

                <!-- Text Logo - Use this if you don't have a graphic logo -->
                <!-- <a class="navbar-brand logo-text" href="index.html">Ioniq</a> -->

                <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav ms-auto navbar-nav-scroll">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mem/list">Member List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/brd/list">Board List</a>
                        </li>
                        <c:if test="${ssmvo ne null }">
                        <li class="nav-item">
                            <a class="nav-link" href="/brd/register">Board Register</a>
                        </li>
                        </c:if>
                        <c:if test="${ssmvo ne null }">
                        <li class="nav-item">
                            <a class="nav-link" href="/pd/register">Product Register</a>
                        </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="/pd/list">Product List</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
                            <ul class="dropdown-menu" aria-labelledby="dropdown01">
                                <li><a class="dropdown-item" href="/">Article Details</a></li>
                                <li><div class="dropdown-divider"></div></li>
                                <li><a class="dropdown-item" href="/">Terms Conditions</a></li>
                                <li><div class="dropdown-divider"></div></li>
                                <li><a class="dropdown-item" href="/">Privacy Policy</a></li>
                            </ul>
                        </li>
                    </ul>
                    <span class="nav-item">
                    <c:if test="${ssmvo eq null }">
                        <a class="btn-outline-sm" href="/mem/loginpage">Login</a>
                    </c:if>
                    <c:if test="${ssmvo ne null }">
                        <a class="btn-outline-sm" href="/mem/logout">Logout</a>
                    </c:if>
                    </span>
                    <c:if test="${ssmvo ne null }">
                    <div>&nbsp; ${ssmvo.nick_name }(grade: ${ssmvo.grade })</div>
                    </c:if>
                </div> <!-- end of navbar-collapse -->
            </div> <!-- end of container -->
        </nav> <!-- end of navbar -->
        <!-- end of navigation -->