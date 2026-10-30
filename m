Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358538;
	b=BAIQ0WDK4n9uGHQJBO220HdkbjIgRYAgu9u6BV+bi6xGu5Ymh7K3umojEy9DV3j23mC+
	 qoDWtNpG/AYi4LfF1Nc0SBUwYY4tBY4MpeEIEHi/w+Yz9B5vunOPu/ritTxKWY8rwyFP0
	 b/En1awL+SLIVC59+8cgJbgVnjkSqUyol2VpCufGbelSmovwXz+uNcjKc5AdNEsoLyVyp
	 E9TjuDbZdeC2QIM+qJdxp9ncLbufeg43Gz28I1AxEArFVykZHI4jGyvz0caBBId3fyOIL
	 hipbujHItGq8GFgdHoReuG90H0zs9YEG29VQbC9u3RNWZf82DbMADUKdJGKmi4UYSvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FEaJkG989fFMm7IX/q8MendMyxblAEsMjvpOnotPZK0=;
	b=r4vBVtEuVY3ZHtsUPIF2rjcaiAuwo1NwI7MzNxaoESX0IB9VFL7SJIy3MxDMXNaIOYKS
	 Djw+TZFRUMfsd9LHa39DdEcG81GPONDG3Gn7ZPzLSQiczGkWeCbn7FFzdGC8NY0QKno1L
	 tTPotZob9vcWdxaSSbVSRwhNxYC9omsVrw7qdR8zUPYlv1Zs9e6nMPcQmbAm8L5AeiZCk
	 sExCgv36Rai5m220Y9DUXu2MDqBpgcPS0Lte3RAwcWOOaRtjAFqcKhfpvoK1FXJU8I2qZ
	 vTUpRERNrCs+l0bgx9jUMFvC4PmSnVK92bXMcwW/ZmLp5VwobCRiWDohhF6i+OHNwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twtWanUO;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B58606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 11:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twtWanUO
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so220651e0c.2
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358536; x=1793963336; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEaJkG989fFMm7IX/q8MendMyxblAEsMjvpOnotPZK0=;
        b=twtWanUO4WEDNEa1x+R3MGU3hvjaQ/yEN98WBCEQeqwYwURqklGi2VGqbetxHIG/eQ
         C1uAjke+TShTedlJpquZWuyM2gGsSr+15QpMtTFjGFuNW1tPdT2ZCJWpZx33ASTeQnbo
         jp9Lbzpe94xQOOsY0yoia51lOfA7/1cjv6ZBIQ7F0zJSowGluJAgeLW7BmUZb1tQNmTx
         avELRp8+1TmQ++YhLvLRRjXqDuV2Z6JKT0TH2mVwyZB+aLfHJvBQodaOjEFtgudBVOUS
         qJi7H7BRTl7zIYjOG2d0AV3oZKl1BXNxYGYzeRAAK7cxER0fwQb8njJiNYsb6aMvzlFK
         v3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358536; x=1793963336;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEaJkG989fFMm7IX/q8MendMyxblAEsMjvpOnotPZK0=;
        b=j84DPJEW2DeBR77s2+2yRk3P/xfSC+DnK3CrzCvoUj66KNFHxmb/UhcUtqCsMiXBgj
         qmNUeMfojmM57NMb9gBiwGyCIGFrqgGIzhWTk6BTU7lTb8XHuyCYLZoDwFVw6m5QoGLo
         OMNef/wJ6ISJVdZDRIkjdVaWtonzJWMhbCxyfMt+syzucBmspVXxmWlAOltz59u9zsKs
         +QuJFsaObwrFgn6K9bYKrp0228Peg3E5yzsPRRqT2FjyQP/joCTgpQAvFoujVAXdPBGg
         6RzLTgrXQ2EetyeTLBG1Eth9EkD0pT5E2daq7OZMCi3quq05ImiahJC76ba2jrGq9gM7
         1jPg==
X-Forwarded-Encrypted: i=1; AKwUvBzGMM6AyuD5rgOtWFrsjMstkPwF1afLEGEY2r9c/WrTjilF6Ggas7SiTGSNCMMTYKNM/bZzm+1dcFTOUA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJwqQwW3GrLY95ozvAuk3Ce5wJXuprzQHQLCLNzqJIweptUVXP
	uBFM7xlMGfUBoTjSjRmXm9qNSfsDcuNS4srSmgevROSagp00+HOw1LE7
X-Gm-Gg: AYBFou1dZzo89cv65ttvPIBAvM6Rx+xuauJqR/X2BKw3QOF3HWZbc9Fx02jArSlgDbW
	1yAADN6irl0+F6lwBtNlmmajMB8o2zypDCih/Kd/piCAxEXT7OMJHID/s07gXZKlkJ1OQVgxXpQ
	fu9k6WVQykKn3180f6uxY3P+iUCckQKRhTgMFhRPf/g7VNHDpkcdzAEuLuW/Vd/vvk5De3yiGY/
	Dgl8ecAeeDQQ6ROrobkOroudEwInwNagCzp8SYjdTYRyheAK6YU15yn24aO3FCEmNNvH/165FGj
	8wZ1x+YvklQ4vVXBQ+CRM9kio0urn9omxHYvt9NhR3XwtdPIzOK+aVgYeBGBR228qa7eMsHYwZB
	8nvhfsD4PRbEhgdr8dVvoVZKkApu+bhikVe3J+Ns73YLxWiVvkQ1BD3pTZJ8+E5raU4q6n4F37F
	v5O+U2O+f99lEAS0A2PWKK3F6hGtQisDt+LOt5TsCL4YyoNVFLKS/gvJem9bO9jMGuSGXh/hsF7
	3fdK0N5janpoDG9QG2U/oiqweX/P9/CJgnYUgDz/WhjC4tKxNGdkwCfLg/KrQNC1F5rpGgqMzIl
	A8BBAsa3hpqSKWRtHNJdtpaeFyGX5doBc1+KopOJie7IdjDavT8EEALpr4zSUmxYfnU+iLauPcm
	JJfyXl5nspZwlXkZHk9OkGOKDZ5cjNMLyiM/z
X-Received: by 2002:a05:6102:418f:b0:7c3:9059:49c2 with SMTP id ada2fe7eead31-7d0726056cdmr710246137.22.1793358536554;
        Fri, 30 Oct 2026 04:08:56 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07768d366sm1752844137.10.2026.10.30.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:08:55 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Yixun Lan <dlan@gentoo.org>,
	u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
Date: Fri, 30 Oct 2026 08:08:46 -0300
Message-ID: <20261030110846.74922-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <277fbb28e539eb61d492b3d1c79db12d5eba6078.camel@d-silva.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org> <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com> <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com> <277fbb28e539eb61d492b3d1c79db12d5eba6078.camel@d-silva.org>
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

Hi Alastair,

I checked gpio_init() in arch/arm/mach-sunxi/board.c on your A733 branch
(5887f2b) and ran it on my Cubie A7Z from cold FEL, stopping right after
it.

The common code copies PIO+0x348 to PIO+0x340 using the H6 power-mode
offsets. On the A733 those are PF_EINT_CFG2 and PF_EINT_CFG0, while the
power-mode registers are at 0x48/0x40. So the copy writes PF's interrupt
configuration instead.

Both EINT registers were zero in that test, so nothing changed, but the
addresses are still wrong for what the code intends.

The A733-specific code also clears bit 5 at PIO+0x40 to force PF to
3.3V. That bit belongs to PC's field; PF is bits 11:10. I tried clearing
it after an SD boot and saw no difference on the A7Z, where the PC pins
aren't connected.

With my mainline setup, PF in 00, 10 and AUTO (01) all worked at 3.3V
and 25 MHz. I can't test SDR104 there yet. An earlier, limited test with
the vendor kernel timed out with PF fixed at 3.3V and worked in AUTO.

I didn't run your full SPL, since its PMIC setup doesn't match this
board. Only gpio_init() was exercised.

Thanks,
Vinicius
