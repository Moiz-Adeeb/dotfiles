---
name: local-leads-no-website
description: Find local businesses in a given niche and city that do NOT have a website, enrich them with phone/email/Facebook/Instagram/rating/Meta Ad Library link, and save them as a new Google Sheet in the user's Drive under a leads folder, nested by city then niche, skipping businesses already logged in a previous run for that same city and niche. Trigger this whenever the user asks to find leads, find businesses without a website, do local business prospecting, or build a leads list for a niche + city, even if they don't use the word "skill" or "leads" explicitly.
---

# Local Leads Finder (No-Website Businesses)

Finds ~10 businesses in a niche + city via Google Maps, keeps only the ones
without a website, digs up their Facebook/Instagram/email/phone, checks
previous sheets already saved for that niche+city to avoid repeating
businesses, and writes the new results to a Google Sheet in
leads/<City>/<Niche>/ in the user's Drive.

## Inputs required

Before starting, confirm you have both:
1. **Niche** (e.g. "dentists", "boutique gyms")
2. **City** (e.g. "Multan")

If either is missing, ask for it. Don't guess.

## Workflow

### 1. Search Google Maps
Use the Google Maps / Places search tool with a query like `"<niche> in <city>"`.
Pull more than 10 results if possible (e.g. 20-25) — since businesses without
a website will be filtered out next, you need a larger pool to end up with
~10 in the final sheet. If the tool paginates, keep pulling until you have a
large enough pool or results run out.

### 2. Filter to no-website businesses
For each result, check the `website` field returned by the search.
- Has a website → discard.
- No website field / empty → keep.

Stop once you have ~10 qualifying businesses (or fewer if the city/niche
doesn't have that many).

### 3. Enrich each qualifying business
For each business, in this order:

a. **Google Business Profile page**: open/fetch the business's Google Maps
   profile link. Look for phone, email, and any linked Facebook/Instagram
   URLs shown on the profile.

b. **Deeper digging (if profile is missing Facebook/Instagram/email)**:
   run a web search for `"<business name>" "<city>" facebook` and
   `"<business name>" "<city>" instagram` to find their social pages.
   For email, check the social pages' bio/about sections and check the
   business's Google profile description — do not guess or fabricate an
   email if none can be found; leave it blank.

c. **Meta Ads link**: the Facebook Ad Library blocks automated fetching
   (robots.txt + JS-rendered), so don't try to determine Yes/No yourself.
   Instead, build a direct search link so the user can check with one click:
   `https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=ALL&q=<business name>`
   (URL-encode the business name). Always use `country=ALL` — never lock to
   one country, since the business's ad reach isn't known in advance.

d. Record what you find. It's fine for Facebook, Instagram, or Email to be
   blank if genuinely not findable after this step — don't stall the whole
   task chasing one field for one business.

### 4. Find or create the "leads" folder, then city and niche subfolders
Search the user's Google Drive for a folder named "leads".
- If found, use its ID as the parent.
- If not found, create a folder named "leads" first, then use it as parent.

Inside that "leads" folder, find or create a subfolder named after the
**city** (e.g. "Rawalpindi").
- If the city subfolder already exists, use its ID as the parent.
- If not, create it (as a child of "leads") first.

Inside that city subfolder, find or create a subfolder named after the
**niche** (e.g. "Photography Studios"). This is where the sheet actually
goes — not directly in "leads" or in the city folder.
- If the niche subfolder already exists, use its ID as the parent for the sheet.
- If not, create it (as a child of the city folder) first.

### 5. Check the niche folder for previously-found businesses
Before filtering/finalizing your list, list the files already inside that
niche subfolder (leads/<City>/<Niche>/). For each existing sheet found
there, read its contents and collect the business names already logged
(the "Name" column).

- Exclude any business from this run's results if its name already appears
  in a previous sheet for this niche+city — don't add it again.
- If a previous run left you short (e.g. only 6 new, non-duplicate
  businesses found), go back to Google Maps and pull more results to try to
  reach ~10 *new* businesses, rather than padding with repeats.
- If the niche folder is empty or doesn't exist yet, skip this step — there's
  nothing to dedupe against.

### 6. Build the sheet
Columns, in this exact order:

| Name | City | Phone | Email | Has Website | Website Link | Facebook Page | Instagram | Rating | Meta Ads | Google Profile Link |

Notes on columns:
- **Has Website**: always "No" (since only no-website businesses are included).
- **Website Link**: leave blank (no website exists).
- **Meta Ads**: a direct Facebook Ad Library search link for this business
  (see step 3c) — not a Yes/No, since that can't be reliably auto-verified.
- Leave any other unfound field blank rather than guessing.

Create the file as a Google Sheet (not a raw .csv) inside the niche subfolder
(leads/<City>/<Niche>/), using CSV/text content with the appropriate
conversion so it lands as a native Google Sheet.

**Filename**: current date and time, filesystem-safe, e.g. `Leads_2026-07-24_14-32`
(avoid colons or slashes in the filename).

### 7. Confirm to the user
Report: how many new businesses were found without a website, how many were
skipped as duplicates of a previous run, the sheet's name, and a link to it.
Flag any businesses where Facebook/Instagram/email couldn't be found despite
the deeper search.

## Notes
- Scale is small (~10 businesses) — no need for batching or background jobs.
- If Google Maps search returns fewer than 10 no-website businesses total,
  just deliver what's found and say so — don't pad the list.
