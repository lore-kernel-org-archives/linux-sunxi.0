Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ABA13D52F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Sep 2024 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725342679; cv=pass; b=Ki6PjLV/rnUDmss9f8rCa4XnEi+JU3d3rt/2HJpFx/uAB35Y8wInAvAdlCX26R41c2KjsrHkfLt7+edBozmzud8Am9OhVX/VecqAzSkLkkFNEl6TzSyczJDvsqsJqOJmMBd6pZK0evKbYKRuenGZS4ASnv3Z3FQKXS+HllR7Q7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725342679; c=relaxed/simple;
	bh=Asacfa8oCipwNiYXQVn9REN5uoZngBF6Q6zI9Dz/bdw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KPbD2plCYRPALTz5P/WKWtaSKzQD8TBlr9CrC1xEkhsPjTShPzjwWz6miuWluUI0V9lLVzti6RAM7wc+23WVpZ0tp17mmAoGsNiES/nyKdPMfvvtNrDdySaqLO2ty3RCSL20+zZv/5VKmDp76rB00TITL9XabSMeugdD563cw60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=XyCVZLRO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="XyCVZLRO"
ARC-Seal: i=1; a=rsa-sha256; t=1725342669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8GQhO1fHmoboE1FJwUCrihjkhjeIBsggkmMFyM10DMg0Kop9tRrHI4/EBRQrEuh9K85oOE+5FTZD9oqvGbJYoUlSRO3dBv5Eqz6zNPGImxXHBOBlPxpEq0Q3/y5Z5Mre0x/FfS/QRlEnBzPAsB4aPvQ9ThewJv6aMupym1KGFk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725342669; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Asacfa8oCipwNiYXQVn9REN5uoZngBF6Q6zI9Dz/bdw=; 
	b=i3rxpu+l1cK+Ajn3oEdwT8bwC8H106Je4Y12V2MjcxB21r1gFkazEgb3r2yGnaw+dvn5Z1so7OJOWWmxBEXNucWPAzCiP6nIUxPvQm6lO10DqN08SZK82eb6RqOz1N+ew6aczE3uig3AzXByNAFmTTG+14ZQKNivvPtilcwQbS4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725342669;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=Asacfa8oCipwNiYXQVn9REN5uoZngBF6Q6zI9Dz/bdw=;
	b=XyCVZLROwb3AK8le4SdPdY+culb9+h50WvszxApSrXAgvv743dUEsdjH5EXdqEuW
	figZdveoNgNd0PfFV61fZSnLGjAtXzwxcJwOhBMp7zpUchRC576UFGBrcapqdpGO0Hz
	cskpm7v5rArb+sOmIMFzS4JmjwMONDnEw6DG6y9IQIEcFBh/hCQhLflmNo1vv2DJcT+
	cf7obWTQlfCs3AbgEZGLMYV8yzbJLi6c3TT3/Q30GSJeCcp4GFDQJLEl//IZaO4mk1l
	n6Lr/xBuosz/nyrJ8kkX4Rl1y3dl/BigQDdtVss8Z1E1bGdiEuUVEUNRXdoDKWNCn8l
	6QQ9eIBwPw==
Received: by mx.zohomail.com with SMTPS id 172534266742979.07579990685713;
	Mon, 2 Sep 2024 22:51:07 -0700 (PDT)
Message-ID: <34afe6c1857190a23521815d85660f6125f0d302.camel@icenowy.me>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a64: Add WiFi/BT on Pine64
From: Icenowy Zheng <uwu@icenowy.me>
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
	 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	 <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Tue, 03 Sep 2024 13:50:59 +0800
In-Reply-To: <20240901122135.1389702-3-pbrobinson@gmail.com>
References: <20240901122135.1389702-1-pbrobinson@gmail.com>
	 <20240901122135.1389702-3-pbrobinson@gmail.com>
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

5ZyoIDIwMjQtMDktMDHmmJ/mnJ/ml6XnmoQgMTM6MjEgKzAxMDDvvIxQZXRlciBSb2JpbnNvbuWG
memBk++8mgo+IEVuYWJsZSB0aGUgcnRsODcyM2JzIFdpRmkvQlQgbW9kdWxlcyBvbiB0aGUgUGlu
ZTY0LgoKSSB0aGluayB0aGUgbWFpbnRhaW5lciBwcmV2aW91c2x5IHByZWZlciB0byBlbmFibGUg
dGhlc2UgbW9kdWxlcyB3aXRoCkRUIG92ZXJsYXlzLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBnbWFpbC5jb20+Cj4gLS0tCj4gwqAuLi4vYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1hNjQtcGluZTY0LmR0c8KgwqDCoCB8IDE3Cj4gKysrKysrKysrKysr
KysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1h
NjQtcGluZTY0LmR0cwo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2
NC1waW5lNjQuZHRzCj4gaW5kZXggZjA0ZjBmMWJhZGM0Li4xZDUxNDg1OWU2NjQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1waW5lNjQuZHRz
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1waW5lNjQu
ZHRzCj4gQEAgLTEzOCw2ICsxMzgsMTQgQEAgJm1tYzEgewo+IMKgwqDCoMKgwqDCoMKgwqBtbWMt
cHdyc2VxID0gPCZ3aWZpX3B3cnNlcT47Cj4gwqDCoMKgwqDCoMKgwqDCoGJ1cy13aWR0aCA9IDw0
PjsKPiDCoMKgwqDCoMKgwqDCoMKgbm9uLXJlbW92YWJsZTsKPiArwqDCoMKgwqDCoMKgwqBzdGF0
dXMgPSAib2theSI7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJ0bDg3MjNiczogd2lmaUAxIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDE+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHQtcGFyZW50ID0gPCZyX3Bpbz47Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVwdHMgPSA8MCAzIElSUV9UWVBFX0xFVkVMX0xP
Vz47IC8qIFBMMyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHQt
bmFtZXMgPSAiaG9zdC13YWtlIjsKPiArwqDCoMKgwqDCoMKgwqB9Owo+IMKgfTsKPiDCoAo+IMKg
Jm9oY2kwIHsKPiBAQCAtMzAzLDcgKzMxMSwxNCBAQCAmdWFydDEgewo+IMKgwqDCoMKgwqDCoMKg
wqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLTAg
PSA8JnVhcnQxX3BpbnM+LCA8JnVhcnQxX3J0c19jdHNfcGlucz47Cj4gwqDCoMKgwqDCoMKgwqDC
oHVhcnQtaGFzLXJ0c2N0czsKPiAtwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgYmx1
ZXRvb3RoIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJy
ZWFsdGVrLHJ0bDg3MjNicy1idCI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRl
dmljZS13YWtlLWdwaW9zID0gPCZyX3BpbyAwIDYgR1BJT19BQ1RJVkVfSElHSD47IC8qCj4gUEw2
ICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVuYWJsZS1ncGlvcyA9IDwmcl9w
aW8gMCA0IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQTDQKPiAqLwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBob3N0LXdha2UtZ3Bpb3MgPSA8JnJfcGlvIDAgNSBHUElPX0FDVElWRV9I
SUdIPjsgLyoKPiBQTDUgKi8KPiArwqDCoMKgwqDCoMKgwqB9Owo+IMKgfTsKPiDCoAo+IMKgLyog
T24gUGktMiBjb25uZWN0b3IgKi8KCg==

