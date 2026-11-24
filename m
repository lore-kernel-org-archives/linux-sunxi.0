Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557105;
	b=mJB1tEdMx8dNj6ObNUq0VQ6tQh3GdHt774NFbVvuxzH8pcVlh1ArIXKz9bz9rZMUmdqj
	 MuTFUpqH2qUcWVmfnqZyJ0bWlrkUxFaG7miMI96S8Ll92r87YEm8K5rdlmXh0syL/7rJI
	 INJhGkxqj85PEIZ/NltoBctnCYpd+ZZDNGSgTMyMZ0++72gYW1EEEXi0HbMC48hTsZAE2
	 fmWWPNnCoZQcqVRQ/hVEaqK8ENw2OgTLqYm/VF/fu5ijL6417bCqEzrjLZ0wtRfm8enEF
	 +cojrbJhz5i5WCHqwDQWPQmwTAClDd0n/CnPJXAYpABJstWY2/SNBGxGYLU7na4XH3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
	b=ZvaWGbfYYBcebqzOfsvYL/rxqqUwBQ9ku6E9iGdan7ps+WDoGmw0xq/sAiJQ7RAmBoJV
	 wtuZb+pSY52+DF+MzExOwJICbDxvQpS46oHef0fkCwdmMt1+U3BxEXkBnM17RM3C7qBs5
	 qmpYLX29nGTomm0WTNIRhKv4rky3/kjM4CmjX6Nv5MytNtcC5EAGTpJiyW7hShFi+tRse
	 AUgU0/Px420dGyWe776ZALuL6KTsWEVN65uVGE1Nfc6cROneUmQJIjhGWYAiQQOYoGCnf
	 z8fvL0PZOrgOoCRqmo43YdfDIS1o8KI51JuZ6DA2mWvlkki/r+oSJKxEeHf/0l5eivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfYVdDED;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E5606A68B
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 21:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72E5606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfYVdDED
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4471202f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557101; x=1796161901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=FfYVdDED8jpr1sVK427lNfcqHBb2WZGdZ6jZNXXXKMk9IISHbjoCsAEWs3NDK5Hbjr
         HJsRv1uQo15xOlFRDC6m92Kh1eTNxZ284PY6N6IgIOVyQ5msa1Gap03GuVz6K8c5/azU
         6NEhUELFkseSnaNg6TH0i8jGveTjkPdEfx3RiXgvtHlchOpzyhVEOWebgxuZf/8leU32
         e9NqNNn1Wtj+Zgoyra0jEh09GWtfaAD2dbk1tw3bXJQuCD9rGjnOInHbcmN5AWCy5WEn
         4s1RAvMTQ3vYC4Zy8pSEsPDOoISff5k7r+2oDjtWWmSi6+kWJ/G0YRdE9Z7fVdTjofFT
         vXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557101; x=1796161901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=eWG4nJPSKiOn5WwDyK+RaVokYKj5ZiFBQAf2BdhzGwjKNrNzZ1UBUROpcJgjpiNzWH
         2+CqldTQ6DECMoksDSy1Ix/Gt0jhmDBuywxd7O+8vsjx9eHn35u5icLuy3Y2ER6cDAcR
         Js+0iBsUCQWuvwC4LhVQkKP9AqHa49Kjyi1uIG2BH2lXnkMdZTZeyd3dGJLC43WKmkg+
         4Y1XvD1IW2YjwmxGooQ8A74ve6zJcdkSeEa+qD+mqYhjOl20UuOe+SS4Pin5LPKpvlN5
         2MGkBKNTDUjPg7r1/Cnt1ju01bNUzNIdlGEFKLWXJKHRsVKYE0bnGLDH9hMcikAJ/POK
         oeDw==
X-Forwarded-Encrypted: i=1; AL+hErH3b6lHx4oLlY2Ok1CKRtiMLdYBxgcCPeniomPWdU9OHP6XEzRm6GUxbAW2ObTOHqigeRBNV9UgdKP7vA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/87Vyoj4izC37qaLqijJhuSRlhKALQBxTY4hiMq+UwfgAMUSLG
	oWVhfavKPvmPlQFJyboAS6QX4li2mirxFDyF4aApPs+xpxV7Jx8cVsU7
X-Gm-Gg: AZFdTZeCWFZpgao5CSTrSP3fkY2LVdNkjax2H2Q9KYCDn90HydFnlPzlIJFbg+HcXgm
	qQJBLBwadQ0DKsNmWF3Rq6SpYWPrju0e9iD7Xaae+DDUQvN+X6tcRhi/hMaTq6k33kHCtabsEv1
	uAq9f+6PzyCvALQTjCVI2eFNzrTAtCAkBs1AhI6a7o5a70sPwxKPaJU9Ghu7QlfBvw+B+5QFvjg
	5hMEJXjWd0M5879q7lvnPkx27+dDmx49erhLYI0zWGEXcrcjus/Lt4MKkG1PAJiO8EHPZ4eN865
	SEGN8vHCHe5ZgFrIXZ/dZC6k1FbwY3/J6+AX1piOqsNg973OzKbcdW+OZ58ZBqPvKxDfylSeK7d
	uRibQWSVlnEx4DBhv3/AgcS2GNtfl/80EG8Nc/aF0W/MeN/3BTLbzePK93PexpxjDsiCXjwtrnb
	pxPjQ5iakyf/z1gNuMH4Tf0av2M4TDYHPZHUDGyscYo/Y1TvfkbOMYeh46jaz9mFWkb6pZbQIYr
	WFOormtA3B0mnbpFxTfB/uDc0cZgbkUtsabQKmrRtH5aBlyl1UK1QhInPXSRA60zoJk7EFHOtgm
	zh2VG13N4InDFfovvuLwu+Ck7IVbGlGVGxaFrMN5Vw==
X-Received: by 2002:a5d:5d87:0:b0:4b8:db69:1b4a with SMTP id ffacd0b85a97d-4b8db691b7fmr2464923f8f.55.1795557101212;
        Tue, 24 Nov 2026 13:51:41 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:40 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:45 +0000
Message-ID: <20261124215048.42074-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

RESEND:
- rebased on v7.4-rc1, no changes
- add Rob's ack on 2/3

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.1

