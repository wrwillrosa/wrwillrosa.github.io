---
layout: post
title: "Resolv"
date: 2024-11-28
categories: ruby
---

In one of my previous jobs, our customers granted our Rails application the permission to send emails on their behalf through Nylas.
That way they used their own email provider and custom email domain, if any, to send messages.
All of a sudden, there was a spike in emails bouncing back, and part of our customers couldn't deliver messages to their customers.
That risked our customers' reputation and ours too.
What did it go wrong? How did I solve this?

Google and Yahoo! announced in October 2023 they'd require senders to authenticate their emails in the first quarter of 2024.
That meant anyone sending messages to @gmail.com or @yahoo.com must set up SPF, DKIM, and DMARC records in the DNS for their domains.

A few years ago, I did that for my own personal domain while learning about email deliverability out of curiosity.
It took me a while to understand the meaning and importance of each of those acronyms in ensuring messages sent from my domain are signed (DKIM),
they come from servers authorized to email on behalf of my domain (SPF),
and other servers can take a hint on what to do if messages supposedly coming from my domain don't meet the criteria in my SPF and DKIM records (DMARC).

Part of our customers haven't had set up those DNS records by the time Google and Yahoo! started enforcing email authentication policies upon senders.
So messages sent from those customers were being marked as spam or rejected.
Workflows that triggered emails started failing.
Part of our customers' customers stopped receiving email updates about rent renewal processes and the like.
This was a critical incident.
