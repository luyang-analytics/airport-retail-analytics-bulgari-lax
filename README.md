# airport-retail-analytics-bulgari-lax
Airport retail analytics SQL project using LAX flight data and Bulgari transactions

Project Overview

This project explores how flight characteristics and traveler behavior influence luxury retail spending at Los Angeles International Airport (LAX). Airport retail presents a unique purchasing environment where decisions are shaped by time pressure, travel purpose, and flight conditions.

Drawing from my prior experience working in luxury retail at Beijing Capital International Airport, I observed that sales performance was closely tied to flight timing, delays, and whether travelers were domestic or international. In that environment, Bulgari consistently demonstrated strong sales performance compared to other luxury brands, likely due to its accessible price range and well-balanced product mix. These firsthand observations motivated me to explore whether similar dynamics would appear in a different market.

By combining LAX flight departure data with synthetic, transaction-level Bulgari retail data, this project analyzes how flight conditions and traveler profiles influence purchasing behavior. The goal is to uncover insights that could help airport luxury retailers optimize inventory planning, staffing decisions, and promotional strategy.


Business Problem

Airport luxury retailers face a distinct set of operational challenges:
- Travelers operate under significant time pressure before departure
- Spending behavior varies by traveler type, destination, and income segment
- Flight delays can either suppress or increase in-terminal retail activity
- Product mix must balance high-value items with fast-purchase convenience goods

Understanding how these factors interact is critical for maximizing revenue in an airport retail environment.


Data Sources

LAX Flight Departure Data (September 2025)
Real-world flight departure data including scheduled departure times, delays, and destination regions.

Bulgari Retail Transactions (September 2025)
Synthetic but realistic transaction-level data generated for analytical and educational purposes, designed to reflect luxury airport retail purchasing behavior across traveler segments and product categories.


Key Analytical Questions

- How do flight delays influence average retail spending?
- Do international travelers spend more than domestic travelers?
- Which traveler segments generate the highest transaction value?
- What product categories contribute most to total revenue?
- How does time pressure before departure affect purchasing behavior?


Analytical Approach

The analysis is conducted using SQL and focuses on descriptive and segmentation-based techniques, including:
- Grouped aggregation by traveler type, income level, and destination region
- Comparison of average transaction value across flight delay categories
- Revenue and volume analysis by product category
- Segmentation of spending behavior by travel purpose (Business, Leisure, Luxury Shopper)
- Comparison of domestic versus international traveler purchasing patterns


Project Purpose

This project demonstrates how transactional retail data can be integrated with operational flight data to generate actionable insights for airport luxury retail strategy. While the transaction data is synthetic, the analytical framework mirrors real-world decision-making contexts faced by airport retailers and luxury brands.
