Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802814;
	b=DMxKBrFAE8E7ao/ll8Jw937aKhMrASO1rNy80e39cwqkOf38go6JHsskUG/eaoH5KfIH
	 sp23WDa/bgiuRP+g+xTGTe98ALKXrHiXaAjtiDWH/aGSVw74kTA5y5AUE44ZNVzp3DBX8
	 Lo4B2oy4jzJSUiseB067cu0/dpEVfWbmse69h5RtCEh9k3c91QiQY4OxrpR4ezZlCRFdh
	 63HqcZk71JFHbQE8525Y7jsFOLCiio7J1I2CuERDGDMj49cvEnfOD2CqXugHaweHKum3z
	 Gx8w02ZuoexXb4VMMoHfx/h/ZKYR2pXNk7mNny4yOqRIuSH2tDghGC/fTlMrThwzagQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
	b=WMzvmfGXqNpzDHoWDyzcZCzLlatVlXhSOGdmZ3S6FsXasBBKw3ze5ADnpS35cBk1iD9v
	 HKq3mFuByHH6KyWjGdu7MQQwVf85kh5kvAqzFhrG9KwapVv/IVJ+Eyn+yWhXASQfpTAXB
	 LHMVGWu0uF8Wjbdo0m0u5laGrk8xhb/kQwwIzlJj4u7cUtD0Ur+viJGXDA6M4Jxv0T24h
	 ASSxyo5NdJAoN1hPcJ7bVFfPRz50W4uxY3rp99bPBZuzaRqLZZc/AIqiBPqlB8FEXww+C
	 FB7la/y32Fmq/Xe15SDQlkfFxQxp8c/9ihqGPqIg9UwDw0Pu7v+2wNao8+MZnwA5nnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAx1hgED;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDEE606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAx1hgED
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1afdf5196so3238133eaf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802813; x=1796407613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=QAx1hgEDu9bb9NwakkV3Wc4JRnjT/RtuvERZaLnUt4ANN4mFGx392+XDKBs9h0TH4h
         PU+3HNrrze977bg+tOaCtFGRKRl8qGSBZzfAQsQCakbDlQQy69DoNLySlERAAH98yzbZ
         pyFeWrsyRIPWVswi0J3d0tF39XRTARrIuOY8qOKJmhZw2I2/l0+HVY7UVc5kFgjiyqbr
         pGwAB8th+++E3xfZQYmcC6/HhcWimeEjksjAZibA/jYkpY7mGxlJWdeLZiKwmf/rfC80
         1vz8+uvweg+R2/jilie8HdK1lM9oO0XJUxx/L7ci9O9rduQw/bTCQJ1dIie07lVAJA/w
         yqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802813; x=1796407613;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=gVqUfnxlz7aOrLPPqMA+jBWik175PVEtcbZVpRaW49rKYzB4oqh337aAuRD0cwFmE+
         WqCF/3zW3YRUaWIYxVshWaUFUjXZdgORhsncCLcMdEOnf2q84RqebGhzzUdFe3nJHq72
         cG8FFs1FgbmT5I30lwaIBcPOS1Gux0C3aWlx4D6r3buLtVLOiVKklWS5za0FTps7b/8q
         u/c1TNVH/bLjjGQskaOBzFEKvdJ4R1usZOgQjOjLMjO1GKu5k6zMNQ/t1XOTAancCTyc
         FiQdAc2MDJiijaI40muy3QJHUAbsJM7AnjKnyeDp1REhWPbXUNbK/AMvka4pp3nEgBjm
         nrrA==
X-Forwarded-Encrypted: i=1; AL+hErEvNj+BzaI6h8utK6LYZu2HoqSp+JLluaRe1obWCL+Uwvw09vWUxfANVnk3/uGppg3pC6TvAl10AUaWbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9eCw+rq5Ci+S5x7t1n6BQOxIlHFG5qZN6f7mvoeBHPnmtrHELn
	3AR1p0xYuOlRMuvZwz7qM6h6aeZANsmZV5riYlLfTwQB0p92BkjY/kOn
X-Gm-Gg: AZFdTZegsLIlMVtIvM9wOxuJ0UDXNBDDp3NhPWwFuRfUOgC9la00f8bUd7w67qTbWI8
	tuyF7Zy3vrqJVDWSWkmlC6fo6bhGQxd9o7kDS50C0LGpVE9wF5NwPuE1fXUR1RK/X1byDzJbeKs
	dzqSC8d+dSO12yOI9jWwW3dPJynjaeKkQsl+HgiknHC30JPqga6X5YzMVOHk7yfvfE922z7Xta7
	TtgJ8T6Y14IFfLoXsDDP2Q6yBL+v0PWXvLxEZyo1jkwcrceGTvEnibfFSlNgmHuk/8UthlMGCHr
	Vek5PHCh+7nPKVs1nOa/KW5wGWsXj6U/ZQVzSKX4Dv7ur/5vqJHSsXYlQS1+GNDUJT75UpZvzhS
	m5uJsI8V+WctH3NzQgJn/oQTp3CvW1jaTTYFGLOLNeD8N7oZ0rpn5O0ewI7r8nY6PCi1qtvdT+s
	edaVspxDx6Su/TsQMQIPexEi2/zlyIYwsn5Ohztm9pDHfhc+NxkAZ1xtB0shEigYBtYlrRazkxF
	qV/kUBbnCipYBbxRav7Pk+gKpeEnn4WKA0P7BSwdzUUiM8R0t6+hNQACIyDsCautig3svY/AmCJ
	ortqS/yO8qjVDMMTjwJ1ATvKGKAw9mprVJCmMHBqGJkqFO2eqBG6nxckXV9ncLPZGICcz6Gdecf
	qNeYM/Q==
X-Received: by 2002:a05:6820:a74d:10b0:708:c97f:5541 with SMTP id 006d021491bc7-71b394868bbmr14209997eaf.37.1795802813364;
        Fri, 27 Nov 2026 10:06:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm17220715a34.18.2026.11.27.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:06:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 27 Nov 2026 13:06:50 -0500
Message-ID: <20261127-a733-dt-v6-01-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
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

> But it's still compatible to the D1 MMC controller, isn't it? As in: a
> driver capable of supporting the D1 MMC IP can also drive the A733 MMC.
> I think the voltage regulator is a separate problem: it's external to
> the MMC IP. The vqmmc supply property is documented and usable, and the
> availability of the regulator it points to is a separate issue.
> The same as the H616 and A523 have the voltage switch already, but are
> still compatible to the A100 and D1, respectively.

Agreed, and the manual backs it. The A733 User Manual v1.00, section
11.3.1, lists SDR 200 MHz at 1.8 V IO for SMHC0, but the SMHC register
list has no voltage control. The Port F pad voltage is chosen in the
GPIO block: GPIO_POW_VAL_SET_CTL at 0x0200_0070, bit 0
VCC_PF_PWR_VOL_SEL (0 = 1.8 V, 1 = 3.3 V, reset 1), section 18.14.6.3.
So vqmmc for mmc0 would be a regulator provided from the pinctrl side.

On the A7S (schematic v1.10, sheets 4 and 7) both Port F supplies are
fixed rails: VCC-IO, 3.3 V from SWOUT2, and VCC18-PF, 1.8 V from CLDO5.
There is nothing to point vqmmc at today.

Unless Jernej still prefers dropping the node, v7 keeps mmc0 with the D1
fallback and no-1-8-v on all three boards. The Port F switch can follow
when it exists.

Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
node; no board enables it.

Enzo
