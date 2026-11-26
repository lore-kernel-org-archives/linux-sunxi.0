Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725228;
	b=0Dvyd7/Zw4Ar7P+iQztlnc16RwHyMmHKoFaCydWLGTJqpPD8wVqlKNCp63DXFh2ln7RH
	 UZDQbbgltzbI9j9eDNhH+9eKmxcTFwUP1HcTPyrYEo9k+T6Ygp9GkMwP2n28F71nwMu2b
	 CNRPwx6BwtHyCYEyXFps7ORjnQyy6v6Dn+lFxNRKFMUCxTkrWe9/rtlsHiUeRZP4edHT9
	 3kOrkS/FEQsvD0b18Z5tayB1raRKtLnNHWAMw0GsmWjO24LeDe0B10Dh3VR01kFo2m6Hb
	 pkqETqyrDAqCAyIWNY0eR6xSqdeL2SGqxbcv+lTClIBfBm5F787og+IcjswJiSXBNog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
	b=ymxtejJ9+ZUBeeHmBKgJf/3Vi0v/eqkhXQABNSMjF4kRwVCiPzLRcP6/IjJt5z0dTUMm
	 GcfapsUmmFuUaV3ezUnD1WJS4nJjl1H8fVI1j8uyWo4opYrmb8rEljUeFEitL8w3fbh2q
	 u9BJiEe7BNN/lXz/rLxp+yV1qzANy5A/LQ9zfI4B3tKF0N4JqWMBy7u0JiEZs/1vmPeH9
	 BaECSUHADKTr+ZMZSCjWED/UCliD3sbzwETYYz+pIzKs6Yx5/arkwteFabW/kk8Hcvy4O
	 LNahAQf4NObwlavChPhFvGDnJjfFJm/WGN9dqpl/U8a7Pi4b0ha739jjKoETHIjUDGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHPMikrj;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E72606A327
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E72606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHPMikrj
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8629c7cc36eso4146044a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725227; x=1796330027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=oHPMikrjDxT9I5mh0Qke+M5vy7kuY5MrudB0kwbV57ntE+k3FNKxT54+8ErLiWqo0o
         w/yqa7pFT0QKLo9m6S6VMyCtUUxHbCksf7Z167rNUgM/Rw5ESDx3Vy0bzuD5bvI3pHcL
         pLG6tGjz9QVrERkhedchtzXIRDzndyfS/MoZBfr2qUSSeW/1n6yB+nZM440TUc7tm8uE
         iGcuSwjhlnnN8zcatV3icT89CW1rnhV9qrEKMUqqidixi6PyiDUFLVXqj42xLpfXBVsl
         lAWmUBMzLmvlY0kSc/cqTPb4XNcJO43wsPWt0bOxGPNJzcMWyym8yHj+BhZS4nB5rweK
         1i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725227; x=1796330027;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=1IreOmzlvOB4s3OGhWwgXclFuyj4gwEC+uhGEbJnAFozXenl1bJbBgLwA+W5WDRcGw
         riu1GFHG3jEeV8Uk82aI7cEh0nUMQQ8G/cyQLGgEWTm9aaYhHWcGR4Gq+F9MIQ/bALp7
         Ox3uoZeAUWRjX+rWCcQynkNpiElT8kJVjlZgtRh16jZ6zpjgk2ZSKjnY1OqRzDTEWIqg
         sjWqmYESjVS+1moFxPCqcJZuBT+uL52+Y7DWDHMM0dVNvrs2SsfF7pPbMv8cZP2t32Ef
         ydTkAicU/qQEiSf5t94X9sNWRt4wAtchvljC8J4dOcBkdvyt5ldtFqDWm9zIT0K/29th
         V8Fg==
X-Forwarded-Encrypted: i=1; AL+hErG4p2G2cye96kE1VSYbq96hJWXLA9/eLs5eWidor49JNPsimPrKBbzWXZDn5lH4gu05n7gbEAVt25D6hw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8gWbr8DvajSvEQpGL6Eq3RrGSQWWbz8gdLB89lqg59kdLb0pdF
	CgSZ9fHM3FHxWiW4U6H1jAGZYTipETiWGXu4snVR3kSqzsOM0YGNWoL2
X-Gm-Gg: AZFdTZfxNnQ0Z5nNrRp8nTDU1oR+zn8Z50qo2QMhx8J3kW3o20AK8ePY8WUkglNWwAl
	s0yTg0hXAtE2YQ5v+ekh+SmSLxmo6inKXrVNxHcBqlSgA8ZtQAE0ibf2isLZTWPg0q9GQB3DBOM
	6Gr3JB6CH9wBtLSg3i3BZCBAEf/j9ps/JJwzJkzxrUV3kusHrmeaQKH1sYiI0KtCjF8MjMK+ZIY
	HsBy12FW69yGZ0w52BBDx55IxaMh9CLkhvTkIJrub4VYL44GotZI7I+NtnKqrQoHpeePFpj2WfB
	cdJYW0d2J71QkEUY8ltl/JfYXypMRiZnB1LlCpflnC9aIqczbxlTiZ4Vd6ZNe++UY8qhGvyH4KL
	+qV0DBmTleYmroWbXJvwbmFGhMM112qFfNc/yvhDAMOLu8+XTfWKiA+AMOAsvHL/5k+suEy3sqF
	JH0p7DuPUrdjFn66PVfBxOdx/SatXq963XrxAN+3HruUcahf975i0dAuzMdoWnXQYQOq/TbP3W6
	lsoMN/SMRlZ8hcb2ctOn1CqjS3MWZ25r+bDtKp3e+xgGj2WNEACidpuBlvHHYT2HVB76IeMC6zi
	V3epf1t1FEtTEgfvrP8yrSLBYV7ndFhjdNorPDZ+33omvjcIHfR85yNvxF69zzz3cWB4IX/BSm/
	ChYPq5w==
X-Received: by 2002:a05:6830:2696:b0:862:c9e8:5788 with SMTP id 46e09a7af769-86314febd1cmr24635150a34.0.1795725226996;
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm15139167a34.6.2026.11.26.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alastair@d-silva.org,
	andre.przywara@arm.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 26 Nov 2026 15:33:44 -0500
Message-ID: <20261125-a733-04-alastair-pinctrl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
References: <20260910133519.459011-8-andre.przywara@arm.com> <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset="us-ascii"
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

>    Adding a 2-bit variant (writing 0b01 per bank with mask
>    0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>    and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>    follow-up series).

Vinicius posted a separate two-patch series for the same issue [1] and
later marked it superseded by my v2 [2]. My v3 [3] sets every two-bit
voltage-mode field to auto (01) at init on both A733 controllers, as
documented in the A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20. Vinicius tested v3 on a Cubie A7Z [4].

I've posted v4, rebased onto the EINT-mux fix in pinctrl fixes:
https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

Could you test v4 with RGMII on bank H on the Orange Pi 4 Pro?
I haven't tested it on that board. If it works, please reply to v4
with your Tested-by.

Pablo's IRQ-bank v3 resend covers the bank offset [5].

[1] https://lore.kernel.org/r/20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[4] https://lore.kernel.org/r/20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com
[5] https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com

Thanks,
Enzo
