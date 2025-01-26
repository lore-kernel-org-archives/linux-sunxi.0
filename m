Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE213D8A4
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Jan 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737877945; cv=pass; b=AFElMpL5aq5khjPcwztuVvL3FeYwLJRd/bnhuGSzZ+e2mJhu1UAGXttXMfO8LBP6gl7jflE+mkF8SpaqC649za4JwPiHm3WHDIP5v2h8inL+0ASotuYjW3vU1jlQh6kQfGiQxx/KX1n+i3qR0q5eb1ZHZSJFlxD87mg5dO00+i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737877945; c=relaxed/simple;
	bh=rKrfr/SptBQwbiTQvVMn3VkOim1ngQyQbkwKURXsQe0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M8obtHSw9R0dBJMg5LGc4/N8142U4tWc0RwWXnOB+q+yrdP/d8HeQPxnhq59HHPsXWkctBRrgJrzdXUt6IZw8VDVxRnEFiDIldFe5+Yw1w2mY/1nH98TCUE0+MRR3QfB1wYMFroyz5aqHWXJaht7CyxedeWJsD1KR2K2nlpJqHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=T8yMRU5e; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="T8yMRU5e"
ARC-Seal: i=1; a=rsa-sha256; t=1737877935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hiaj4Q/l4XgTHZ1UlHoVp1dfiYa3vJfH5aB4zbrSJ++Kxwdl/ZqopWpec6FRJQsp/yid6ZeShIe7+Ctm6BeZrDPTxFOo5Z0D4UZlDvqRWtJcK5uyBuUpFDzf9V49H1RzmDmBkJKW3fHyosSt8vr6kcodHhL5ql3UltFx2N0F7ug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737877935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rKrfr/SptBQwbiTQvVMn3VkOim1ngQyQbkwKURXsQe0=; 
	b=n6EjTY5UFcCfpnHwsarFSORN2XBbH7qYlggOYiiRoaryZs7SfzP8YitOyUT6yM/ZDXaF6CrTMna9g1o6Hv2g+m+vhTCA/L0p/u7a6BOi/E0c3xeUOQeaXNOhK8r+B6wgSQl6idZrD8R20t9fj2tB+0CFMT6NDN6B8LOgxl09W+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737877935;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rKrfr/SptBQwbiTQvVMn3VkOim1ngQyQbkwKURXsQe0=;
	b=T8yMRU5eO3MOLIWJOA/l7FJgfGWn1CiCW5GV4PqmFC9E0B90a3ddXIDW2dYu/rYj
	5i1Rlr1/ZERlaXpumZ08VPrH2n0TdJKh+yALKO4wMv/IozHTAAboyooqGIxY8qSfMUl
	IoSiCxZyHCEG2CgT2FEkxpC+pBXOIXsQYUASnZmK+fzMruF+ZHg79SBnqNsAAjfYbps
	UO72TwRFxcQXfkzOFzSggZ8D8aUYX70wdm8qd+IkZYxviCubim2ke5ZciWFkBu88hVQ
	hOQnlbYKVLkO6a+RwemUEUqs0KIcl07nulpaMJz3yW/tl5BncHvoTDabQP2Wbub5Hrd
	tBPEeNyk1Q==
Received: by mx.zohomail.com with SMTPS id 173787791929919.86951080894619;
	Sat, 25 Jan 2025 23:51:59 -0800 (PST)
Message-ID: <db43243ea653073d223e640f064cd480da7e2cf5.camel@icenowy.me>
Subject: Re: [PATCH v2 5/5] ASoC: sun4i-codec: change h616 card name
From: Icenowy Zheng <uwu@icenowy.me>
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,  Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Chris Morgan
	 <macromorgan@hotmail.com>
Date: Sun, 26 Jan 2025 15:51:53 +0800
In-Reply-To: <20250125070458.13822-6-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
	 <20250125070458.13822-6-ryan@testtoast.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

5ZyoIDIwMjUtMDEtMjXmmJ/mnJ/lha3nmoQgMjA6MDAgKzEzMDDvvIxSeWFuIFdhbGtsaW7lhpnp
gZPvvJoKPiBBZGRpbmcgamFjayBkZXRlY3Rpb24gcmVxdWlyZXMgc291bmQgc2VydmVycyB0byBh
Y3Qgb24gdGhlIGVtaXR0ZWQKPiBldmVudHMsIHdoaWNoIGFyZSBkZXNjcmliZWQgYnkgQUxTQSBV
c2UgQ2FzZSBNYW5hZ2VyIGNvbmZpZ3VyYXRpb25zCj4gaW4KPiB1c2Vyc3BhY2UuIFRoZXNlIGNv
bmZpZ3VyYXRpb25zIGluY2x1ZGUgdGhlIGNhcmQgbmFtZSBpbiB0aGUgZmlsZQo+IHBhdGgsCj4g
c28gYWx0ZXIgdGhlIGNhcmQgbmFtZSBmb3IgdGhlIEg2MTYgdG8gcmVtb3ZlIHNwYWNlcywgbWFr
aW5nIFVDTQo+IHJlZmVyZW5jaW5nIGVhc2llci4gQWRkIGEgbG9uZ19uYW1lIHRvIG1haW50YWlu
IGNvbnNpc3RlbmN5IHdpdGggdGhlCj4gb3RoZXIgZHJpdmVycy4KPiAKPiBUaGUgY29ycmVzcG9u
ZGluZyBBTFNBIFVDTSBwYXRjaCBpcyBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzQ5MQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gV2Fs
a2xpbiA8cnlhbkB0ZXN0dG9hc3QuY29tPgo+IAo+IC0tCj4gQ2hhbmdlbG9nIHYxLi52MjoKPiAt
IFNlcGFyYXRlIHBhdGNoIGZvciBjYXJkLT5sb25nX25hbWUKPiAtIE5vdGUgVUNNIHBhdGNoIGxp
bmsKPiAtLS0KPiDCoHNvdW5kL3NvYy9zdW54aS9zdW40aS1jb2RlYy5jIHwgMyArKy0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvc291bmQvc29jL3N1bnhpL3N1bjRpLWNvZGVjLmMgYi9zb3VuZC9zb2Mvc3VueGkvc3Vu
NGktCj4gY29kZWMuYwo+IGluZGV4IDM3MDFmNTZjNzI3NTYuLjY4ZTJkODIyMjhhMGIgMTAwNjQ0
Cj4gLS0tIGEvc291bmQvc29jL3N1bnhpL3N1bjRpLWNvZGVjLmMKPiArKysgYi9zb3VuZC9zb2Mv
c3VueGkvc3VuNGktY29kZWMuYwo+IEBAIC0yMDEyLDcgKzIwMTIsOCBAQCBzdGF0aWMgc3RydWN0
IHNuZF9zb2NfY2FyZAo+ICpzdW41MGlfaDYxNl9jb2RlY19jcmVhdGVfY2FyZChzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgY2FyZC0+ZGV2wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgPSBkZXY7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhcmQtPm93bmVywqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqA9IFRISVNfTU9EVUxFOwo+IC3CoMKgwqDCoMKgwqDCoGNhcmQt
Pm5hbWXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSAiSDYxNiBBdWRpbyBDb2RlYyI7Cj4g
K8KgwqDCoMKgwqDCoMKgY2FyZC0+bmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9ICJo
NjE2LWF1ZGlvLWNvZGVjIjsKPiArwqDCoMKgwqDCoMKgwqBjYXJkLT5sb25nX25hbWXCoMKgwqDC
oMKgwqDCoMKgwqA9ICJINjE2IEF1ZGlvIENvZGVjIjsKCkkgdGhpbmsgaXQncyBwYXJ0IG9mIHRo
ZSB1c2Vyc3BhY2UgQVBJIHRoYXQgc2hvdWxkIGJlIGtlcHQgc3RhYmxlLgoKPiDCoMKgwqDCoMKg
wqDCoMKgY2FyZC0+ZHJpdmVyX25hbWXCoMKgwqDCoMKgwqDCoD0gInN1bjRpLWNvZGVjIjsKPiDC
oMKgwqDCoMKgwqDCoMKgY2FyZC0+Y29udHJvbHPCoMKgwqDCoMKgwqDCoMKgwqDCoD0gc3VuNTBp
X2g2MTZfY2FyZF9jb250cm9sczsKPiDCoMKgwqDCoMKgwqDCoMKgY2FyZC0+bnVtX2NvbnRyb2xz
wqDCoMKgwqDCoMKgPQo+IEFSUkFZX1NJWkUoc3VuNTBpX2g2MTZfY2FyZF9jb250cm9scyk7Cgo=

