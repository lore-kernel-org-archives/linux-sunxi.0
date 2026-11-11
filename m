Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398601;
	b=oNgltUtxTrU55SXqZBJUYzW8o2WnpM6VlWsosh5qMJRki1bNeHpRT3HZzxZ+wrcRzEm0
	 lYBN4X31BYUUBNC+m1bwlmm6slSxk2V5ZS/61I7lAYSTYHm3waaf3UvBjm6GYVThECsIP
	 0pCMVGZgAHgnoX4UPqQqkrJl8PzR1rF2+S4Ntsxyc6nSxOebc6DHF/RsSw6ipyG1zDuYV
	 KhV0InQJ81r1072sLCaeltRUKuo1VElO+vOfT909vg+zPR+sFDM398J14VCexHmNR9tmY
	 V49pCOTUeY6Rs8XF5nLpEn9iDys/yMvKxaZL3dioKPIIctjydYng6na89/fhutNWiDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
	b=uARTmz+ntc2pEtjogSx8P3ZbGQKU9k3mlvIbAsw1a0NaFbuHA6AZJ3eUiR58JHmTVkcg
	 LSCJcI9zP0jv04b3MpDeC2CQgESfT1iTMCGlfMGXht8RZQlX+UFyrcgc3RVKXUfQtNVSq
	 VbudA03Z8dz9mm/EFThsh0VNil7az6o9OYa1p4pVg1dwYRPOdDyvXpZ3SQdxqM+Zhxh7f
	 D1SnohjiKX5H6A0T4TeCcO7R7fyqeHeErXh4NjyrcdN0QJOVdEXPzjulGufXA0mBWv9nV
	 Ts+2ubyF9td0TMrfkZgRQ8ysu7TlfhxVJFiTbqa9K3MSL9dVoTsLAXOgDv9vc55IshQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmL5KdaI;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2C606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 12:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmL5KdaI
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c6f1019a3so371918d50.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398600; x=1795003400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=xmL5KdaIE8MDRIhkzgKQCMY7gOJwghPR6rqXUppVxvB+rduXwXi7lPNap/WwLhRBD2
         tFLl9b2m1Fh1AunzWy7zno9j3Ga7DCPZ3L1XyZ4fEn67UP+GZuuZyBPl4FYCvj01r7Ru
         yULlC/j02J1P4t5cTDAjdtehNenQjXsSSwgHwqjFafcjH1ZcYNJPhOq+bBKBiZkSuw5G
         6z8/URYDHeHRBMTJE1weeROUUub8/NFGlKfl205wahCqGN3v5LXse+snSv6yqCBl1jar
         F7UrpuidZSPbvTdJiyE18Kjx/kBQI4FQaWIHZsjs2sfLLTF2pLRQz+/uBf08WwSMF7HP
         3LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398600; x=1795003400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=pnFo85HVU0ffPn/4NTPI02UDCiH6R1CY+XvZxBOrKR9ImdNn0H6Zq8NYungQFkVOIq
         gg0UYsW90HlhXQd11iEJ0/pC9ktHxerqr24nfOOKB5nanypsed5sXXygk2qJucUuTSRe
         cX0DOGH6HP8P261FW0Fv3dclMp6M6jPNLDDAT8z9unlp+D8Jzf90ReAFxcaL09oZzjx7
         f8vHQZjVctaohaMWOedaI27h3GG6MIvU8F7x7Vs9icVruHFoRKn6hvE6Fsj2MPt4e4Cl
         GKhSij7faYa+74CEPuFdP5ooZoOWeia4YRUQgV+Ci6E9jNcunnF+TPlrObZPdWLqjPBz
         lEJA==
X-Forwarded-Encrypted: i=1; AL+hErFTHNVSPv7ZewZ9aF7ZEbPzvhTGZ99W2mfGO24nKDFPkNlWFIuc3MSbz7qOX/t5g86qsfjrha26U2yXnw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+AKIod371CzZ/Q0lJmLobYGvVpWnETZT3pA5f/7YnthTCCm6qC
	CIMfO+DF7TZZBVzrqvwtsA75FHxld2xzG3mYXxSgEE78Dw+prHJEOWyd
X-Gm-Gg: AYBFou2OBnlQc4Iklf8Qb2N4QmWSj8t3hchXkBk6VkPQEbQcBswDwVAjs+0d4sy97o9
	JEVlnlUkr7BEqeG1g4Eht9A1UhITi0jb8J8uj0sA5H5OlgWYIPqBawKvVgUvWB9oRERiWNzsif2
	A1GL/kbNGJJKLHieE4nkqR9c4j+BVZvlkLRTBPIYN4o6XY4nQ4ffx4HD9eoXRS4wqpjIVsUQrqL
	CbauBhnwuZfviVgsi28IDLEmq3QeKtiAT4F1fh7RrpjKfLe06T3wziEUW+5403XyO8+lySjTrfm
	ikQPCtnocgRuYHXcOkHxGwOIlEg9rAZacY5biaiAW6BNlaxCHRF/EFM2GcSrRGFg3WznezQdhCZ
	Yqfnb5C6Q3d78OGlLt+qUheabovzWvk3a0aT/6K42i6SZSiCfdhT4WSSDCn33YOSldPIV4HKAnv
	PnE4ledOIeg+fA3Yhn3xZDfGfGON4CkuFUisnJYVDsqR4wApuC+cCsqqgmlIYKt7Ms7M2JQcrMg
	DXuPHJpIYHzdpH/3C2Y0xWPyOpmUbMsadqnuY9oQ/oxCrJPh6KMteUULwM2IDANXthhiBgswwer
	jgN4xbdBF6ES/tpV2epAoar0cxp9kiFMJrarOXETcXlYdGPenv99LMNGuD0UM/1qLG8vyjjGNYV
	EeBu95inC+RIRCcQi68rHVl7u2XzsWP/LfgRQdix2HF56m3mrV95zcsGi3euRbFE7gy5hMW4DAQ
	4=
X-Received: by 2002:a05:690e:134c:b0:67c:33ba:4367 with SMTP id 956f58d0204a3-67c67fee82emr1588399d50.123.1794398599941;
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a09074sm4389527d50.18.2026.11.11.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Wed, 11 Nov 2026 09:02:35 -0300
Message-ID: <20261111120240.32497-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 23:45, Enzo Adriano wrote:
> Provide the SoC description needed for the Cubie A7S console, PMIC and
> microSD support.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

I tested the A733 SoC dtsi with the posted prerequisite series and a
local board DT.

UART0, R-I2C0/AXP318W, RTC, MMC0 at 3.3 V (hash-checked reads and
writes), eight CPUs, PSCI reboot/power-off and 20 CPU hotplug cycles
worked. GPIO interrupts worked on both edges for PB, PC, PD, PE, PG, PH,
PJ and PK.

MMC0 card-detect hotplug needed my separate A733 EINT-mux fix. PI is not
exposed on this board, and I haven't tested the R-PIO interrupts or the
A7S-specific DT patches.

I'll send the A7Z board DT as a separate series based on this one.
