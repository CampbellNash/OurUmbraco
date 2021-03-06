﻿namespace Umb.OurUmb.MemberLocator.GeoCoding.Services
{
    
    using System;

    public interface IGeoCoder
    {
        Address[] GeoCode(string address);
        Address[] GeoCode(string street, string city, string state, string postalCode, string country);
        Address[] Validate(Address address);
    }
}

