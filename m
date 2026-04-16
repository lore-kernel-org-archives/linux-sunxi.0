Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375793A6B77
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Apr 2026 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337217; cv=none; b=rWvHx4V+CyarQEXM6SzgdL6+uLz5261QGuH2ezkn9uxvMSTUWEjSVSpKMIgp/xZH3HfBTNQiz7yUwHO6x8n+1fCnAHb7maB7tdSjbpB5MswRi/LcZqocS/HWHUqwXnjGm7FF5IssLRyd1B5dZrvWSh8dlcOpZ17eWAx5Wh2JRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337217; c=relaxed/simple;
	bh=tLS44f//8+uJj2RaUyaLFt1xlHsbbHfAi9k3LP//vQk=;
	h=Date:From:To:Cc:Subject:Mime-Version:Message-ID:Content-Type; b=NrMqgSHLQZMIJ5COPH4LDyunPmYZy9Of3LSP6M12lB+UelGc3clS1QteEPEj4NENItcPPPPBpX/L5hRw8SLRSWezM9y07Hc5mnpmo7ikMqriWh9mjhACQsAhCMCErIaYeLKcl2oEES+mS3XCdRHA0Ss/y5HZw9g4u9BMqkv/l40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gvUSIQ0j; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gvUSIQ0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Mime-Version:Message-ID:
	Content-Type; bh=tLS44f//8+uJj2RaUyaLFt1xlHsbbHfAi9k3LP//vQk=;
	b=gvUSIQ0jZmxz5qTyJt93c50dX/dboFV72x+lIrP9spiRgG5erA2KEo+ptMBamq
	VCdScDnCO8rqZkdwSGruNHU/4ZFNVVD76uqFlEnccj25wflWkhbeYAapdkxprdeJ
	1HnaiQ1ftoH6RKILxjsvVnNJQM9nbQ8OYB/P067AdLM+I=
Received: from DESKTOP-HADQUNG (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnz_KPwOBp7+lnFA--.43835S2;
	Thu, 16 Apr 2026 18:57:21 +0800 (CST)
Date: Thu, 16 Apr 2026 18:57:20 +0800
From: qianfanguijin <qianfanguijin@163.com>
To: linux-sunxi <linux-sunxi@lists.linux.dev>, 
	andre.przywara <andre.przywara@arm.com>
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	samuel <samuel@sholland.org>, 
	wens <wens@kernel.org>
Subject: [RFC] Allwinner T536 initial support & pinctrl register layout redesign
X-Priority: 3
X-GUID: E27985CD-FBF2-46C0-AE69-9394DEB3819F
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.542[cn]
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <202604161857186497478@163.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64
X-CM-TRANSID:_____wDnz_KPwOBp7+lnFA--.43835S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4kZrWUCrykKw43tFW7XFb_yoW8AFWDpa
	1rK3W5Gw1UtFWIva1vyw4rJFW5CFs3Ka15Ww1UJr9rXFs8GF1IvrW3Kay3ZF1rCr1kWw1Y
	vF4a9w4Uuw4qvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnSdgUUUUU=
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbC-hHm1GngwJE1oQAA3R

SGkgZXZlcnlvbmUsCgpJJ20gcmVhY2hpbmcgb3V0IHRvIHNlZSBpZiB0aGVyZSdzIGFueSBpbnRl
cmVzdCBpbiBzdXBwb3J0aW5nIHRoZSBBbGx3aW5uZXIgVDUzNiwgYW4gaW5kdXN0cmlhbC1ncmFk
ZSBTb0MgZmVhdHVyaW5nIGEgcXVhZC1jb3JlIENvcnRleC1BNTUuIEknbSBjdXJyZW50bHkgd29y
a2luZyBvbiBhbiB1cHN0cmVhbSBMaW51eCBrZXJuZWwgcG9ydCBmb3IgdGhpcyBjaGlwLgoKUHJv
Z3Jlc3Mgc28gZmFyOgoKICAgIEJhc2ljIENDVSBzdXBwb3J0CiAgICBwaW5jdHJsIChHUElPIGFu
ZCBJUlEpCiAgICBVQVJUIGNvbnNvbGUKICAgIFN1Y2Nlc3NmdWxseSBib290cyBhIG1pbmltYWwg
aW5pdHJhbWZzCgpUaGUgVDUzNiBpbnRyb2R1Y2VzIGEgcmVkZXNpZ25lZCBHUElPIHJlZ2lzdGVy
IGxheW91dCB0aGF0IGlzIGluY29tcGF0aWJsZSB3aXRoIHRoZSByZWdpc3RlciBtYXBwaW5nIHVz
ZWQgYnkgY3VycmVudGx5IHN1cHBvcnRlZCBBbGx3aW5uZXIgU29Dcy4gVG8gYWNjb21tb2RhdGUg
dGhpcywgSSd2ZSByZWZhY3RvcmVkIHJlbGV2YW50IHJlZ2lzdGVyLXJlbGF0ZWQgaW5mb3JtYXRp
b24gaW50byB0aGUgcGluY3RybCBvcHMgc3RydWN0dXJlLgoKQW5kcmUsIEkgaGVhdmlseSByZWZl
cmVuY2VkIHlvdXIgcmVjZW50IHdvcmsgb24gdGhlIEE1MjMgZHVyaW5nIGRldmVsb3BtZW50LiBD
b3VsZCB5b3UgY29uZmlybSB3aGV0aGVyIEdQSU8gaW50ZXJydXB0cyBhcmUgY3VycmVudGx5IGZ1
bmN0aW9uYWwgb24gQTUyMz8gSW4gbXkgdGVzdGluZyBvbiB0aGUgVDUzNiwgSSBub3RpY2VkIHRo
YXQgd2hlbiBpcnFfcmVhZF9uZWVkc19tdXggaXMgY29uZmlndXJlZCwgdGhlIElSUSBtdWx0aXBs
ZXhpbmcgbW9kZSBpcyBpbmNvcnJlY3RseSBzZXQgdG8gNiwgd2hpY2ggYnJlYWtzIGludGVycnVw
dCBoYW5kbGluZy4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byBBNTIzIGhhcmR3YXJlIGZvciB2ZXJp
ZmljYXRpb24sIGJ1dCBpdCBhcHBlYXJzIHRoaXMgbG9naWMgbWF5IG5lZWQgYWRqdXN0bWVudC4g
QW55IGluc2lnaHRzIG9yIHRlc3RpbmcgZmVlZGJhY2sgd291bGQgYmUgZ3JlYXRseSBhcHByZWNp
YXRlZC4KCkR1ZSB0byB0aGUgR1BJTyBzdWJzeXN0ZW0gcmVkZXNpZ24sIEkndmUgbWFkZSBzZXZl
cmFsIG1vZGlmaWNhdGlvbnMgdG8gdGhlIHN1bnhpLXBpbmN0cmwgZHJpdmVyLiBBIHdvcmstaW4t
cHJvZ3Jlc3MgdHJlZSBpcyBhdmFpbGFibGUgZm9yIHJldmlldyBoZXJlOiBodHRwczovL2dpdGh1
Yi5jb20vcWlhbmZhbi1aaGFvL2xpbnV4L3RyZWUvdDUzNgoKSSB3b3VsZCBhcHByZWNpYXRlIHlv
dXIgcmV2aWV3IGFuZCBndWlkYW5jZSBvbiB0aGUgdXBzdHJlYW1pbmcgc3RyYXRlZ3k6CgogICAg
U2hvdWxkIHRoZSBwaW5jdHJsL3JlZ2lzdGVyIGxheW91dCBjaGFuZ2VzIGJlIHN1Ym1pdHRlZCBh
bmQgbWVyZ2VkIGZpcnN0IGFzIGEgZm91bmRhdGlvbj8KICAgIE9yIGlzIGl0IHByZWZlcnJlZCB0
byBob2xkIG9mZiB1bnRpbCBicm9hZGVyIFQ1MzYgc3VwcG9ydCBpcyBjb21wbGV0ZT8KCkFueSBm
ZWVkYmFjayBvbiB0aGUgY29kZSBzdHJ1Y3R1cmUsIElSUSBoYW5kbGluZywgb3Igc3VibWlzc2lv
biB3b3JrZmxvdyB3b3VsZCBiZSBleHRyZW1lbHkgaGVscGZ1bC4gSSdsbCBmb3JtYXQgYW5kIHNl
bmQgcHJvcGVyIHBhdGNoZXMgdmlhIGdpdCBzZW5kLWVtYWlsIG9uY2UgdGhlIGRpcmVjdGlvbiBp
cyBjb25maXJtZWQuCgpUaGFua3MgaW4gYWR2YW5jZSBmb3IgeW91ciB0aW1lIGFuZCBndWlkYW5j
ZS4KCgoKCgo=

