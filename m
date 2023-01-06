Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17295F1
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 23:10:51 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ud5so6816866ejc.4
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 15:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:content-transfer-encoding:references
         :in-reply-to:subject:from:cc:to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBJRzSx8sh0EAMS5a3epzhJu7mWg6Dh0mbH3noFr6XM=;
        b=efGTEbzGgujmNvxtq1ctn7l7vJuMJZANXFPbik6YiIQ2RVRt7bIMeCMDMSewBt/VJ1
         U4BhNPhy4kQ/WPQf3aKiwjJdjmtmXcrbLMuRLEYzVfCwweKAYAYDWnK/RHeY0JLBgYYG
         jqcSUCuGJ5pH4jn/P5QsyntNL2Xza93dmXydWhJlqaOYp6YAfCS1DpZ4HxV9fdxiNT/X
         7PMzL0mPqW93+oL5RgxyXD7DAlL1U//4ULHU3Gtb1LrpTbXe01slWiMv5I5BtLiaHElJ
         wbkmqKcZvW7q+yqG6IUEIqsy2f5nfiwLIyewHXpSFA77GzpPPmIPnTcZ5tt2NQnZrdfn
         RABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:content-transfer-encoding:references
         :in-reply-to:subject:from:cc:to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBJRzSx8sh0EAMS5a3epzhJu7mWg6Dh0mbH3noFr6XM=;
        b=sXAY+UCURktZjDD418feDrZFvbOT7x8XDCmwSXxKzO7q81yq0t8dfdOm5pazUz9pWv
         Iv/U29v6bkLPZM9ywtm2/14xG7AfLC1ljZu7ylHUQAAmLhz7O1+vpneJjONtu6s63hBv
         j4UGlQQHviSm/Gl+u9GZHeiUy8uOqLsM77nKP7BlyuVipGZNNioMZPe0P1XB/9T48Z4l
         MuzpEDbuOvGZhccFBc+0R52g5Y0mhFNOuwfMVcGMCuDqP7gDGfjhbfTHjvHLe/njhU/Q
         kQplDLbGrdKr1U53OXWlieDj+Hy8MYM/95IEuEX9vlR7wAKEN7p7s8FPd99CHMVhURG6
         kX5w==
X-Gm-Message-State: AFqh2koGXMjDjDOcZuvNp6IRDhVuCI49iuppvwh8N8LjqiECiZKPpA4j
	8mLWMgFqfgMeEN7u2LUNfb0=
X-Google-Smtp-Source: AMrXdXtkaErnolaExZQuqEFSBEkxpvvIH0JeDqbpgPFPuRfXQYg0bccY4jdht1LNoQrnbXhzpoF/uA==
X-Received: by 2002:a17:907:a789:b0:7c0:bbab:22e5 with SMTP id vx9-20020a170907a78900b007c0bbab22e5mr51930077ejc.16.1673046650153;
        Fri, 06 Jan 2023 15:10:50 -0800 (PST)
Received: from [100.68.188.119] (92.40.193.218.threembb.co.uk. [92.40.193.218])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709063a9000b0084ce5d5d21bsm832466ejd.22.2023.01.06.15.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 15:10:49 -0800 (PST)
X-Priority: 3
To: adam@piggz.co.uk,linux-media@vger.kernel.org
Cc:
 mchehab@kernel.org,linux-sunxi@lists.linux.dev,paul.kocialkowski@bootlin.com,laurent.pinchart@ideasonboard.com,adam@piggz.co.uk,
  yong.deng@magewell.com
From: piggz1@gmail.com
Subject: Re: [PATCH 0/3] suns6-csi changes to support libcamera
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Date: Fri, 6 Jan 2023 23:10:46 +0000
Message-ID: <ig7fmi.ro3721.rtjy47-qmf@smtp.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

QXBvbG9naWVzLCBhY2NpZGVudGFsbHkgc2VudCB0aGlzIHNldCB0d2ljZS4gIHBsZWFzZSBpZ25v
cmUgdGhpcyBzZXQuDQoNCkFkYW0NCg0KT24gRnJpZGF5LCA2IEphbnVhcnkgMjAyMywgYWRhbUBw
aWdnei5jby51ayB3cm90ZToNCj4gRnJvbTogQWRhbSBQaWdnIDxhZGFtQHBpZ2d6LmNvLnVrPg0K
PiANCj4gVGhpcyAzIHBhdGNoIHNldCBhZGRzIFY0TDJfQ0FQX0lPX01DIGFuZCB2aWRpb2NfZW51
bV9mcmFtZXNpemVzIHN1cHBvcnQNCj4gdG8gdGhlIHN1bjZpLWNzaSBkcml2ZXIsIGFsbG93aW5n
IHRoZSBQaW5lcGhvbmUgcmVhciBjYW1lcmEgKG92NTY0MCkgdG8NCj4gYmUgc3VwcG9ydGVkLg0K
PiANCj4gVGhlc2UgaGF2ZSBiZWVuIGRldmVsb3BlZCB3aXRoIHRoZSBndWlkYW5jZSBvZiBMYXVy
ZW50IFBpbmNoYXJ0LCBhbmQNCj4gYmVlbiB0ZXN0ZWQgYnkgY2FwdHVyaW5nIGZyYW1lcyBmcm9t
IHRoZSBsaWJjYW1lcmEgY2FtIHV0aWxpdHkuDQo+IA0KPiBJbiBhZGRpdGlvbiB0byB0aGVzZSwg
YSBwYXRjaCB0byBjaGFuZ2UgdGhlIHY0bCBnYWluIG1vZGUgaW4gdGhlIG92NTY0MA0KPiBkcml2
ZXIsIGFuZCB0aGUgMiBmb3JtYXQgcHJvcGFnYXRpb24gcGF0Y2hlcyBhbGwgYnkgTGF1cm5ldCBh
cmUNCj4gcmVxdWlyZWQuDQo+IA0KPiBBZGFtIFBpZ2cgKDMpOg0KPiAgIG1lZGlhOiBzdW42aS1j
c2k6IG1lcmdlIHN1bjZpX2NzaV9mb3JtYXRzIGFuZCBzdW42aV9jc2lfZm9ybWF0c19tYXRjaA0K
PiAgIG1lZGlhOiBzdW42aS1jc2k6IGltcGxlbWVudCBWNEwyX0NBUF9JT19NQw0KPiAgIG1lZGlh
OiBzdW42aS1jc2k6IGltcGxlbWVudCB2aWRpb2NfZW51bV9mcmFtZXNpemVzDQo+IA0KPiAgLi4u
L3N1bnhpL3N1bjZpLWNzaS9zdW42aV9jc2lfY2FwdHVyZS5jICAgICAgIHwgMjE1ICsrKysrKysr
Ky0tLS0tLS0tLQ0KPiAgLi4uL3N1bnhpL3N1bjZpLWNzaS9zdW42aV9jc2lfY2FwdHVyZS5oICAg
ICAgIHwgICA2ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAxMTgg
ZGVsZXRpb25zKC0pDQo+IA0KPiAtLSANCj4gMi4zOS4wDQo+IA0KPg0KDQotLSANClNlbnQgZnJv
bSBteSBTYWlsZmlzaCBkZXZpY2U=
