Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707934;
	b=uaQfM7NUbUMK8T4g11gsgT25hUU1E2fYnAgjf6iXnfCgnk6kHoaFsipHLKrnxTTA2aMN
	 K/D64LnZGW8tkfRijumdjCn9/CGdFLKJeDaLuf4eeDuT4yZas63AGJmNBzq7efET79TQX
	 07/ZqdBUZXoSceHMk6bKXxVZW1Yqr5N0klc6xS0EtuevGOnyzouocayOinKE2ZnI06hOY
	 5T50rW36tcWMakmGAK6EJe63SauL/W3oT1prLe42wO/VGQ4V+NBUCpIImT9ZF8AlC13Z5
	 1WEcY6DmwsOUNUcVvO+K05eqRyWNdZ+vAT81Bl6SgwGG716nZjG+2omyKqbFK4vBk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
	b=j/mWP9Xu6fAu6472LHue8epAGpNXEtdyv7KXgogul+zmoWQrfsRidzrwwPuPAehdrbBy
	 wWubUBt4u3yIAIK7KZJdYde1uShgezyF6PThrA0a06bsMfreGjelGlYtauQxDDwkdLezq
	 pPbf9EobG12mdeMiz1+tcQcZsdn1k4hhKOO5QNggo8kZR9FahccDXyGmmx7AOkA0Q52VE
	 h8QQMcLhw6qioORD2TmjuEC6pVHJhVKGD2PJq6AHB3Spe6ylUJDhTaMLEm3j+Ytn/TdQj
	 TIS3qEY+kIftcMwrbo+AAAnCKQzzT55o8IzIWXYA9A9LRols7ume5k6Lr6zBT8MdcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFnf6qxE;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C8606A332
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48C8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFnf6qxE
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso734061241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707932; x=1794312732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=iFnf6qxEJj0vAkSKG41Ai1kMLfB5IsWvbOpT84WFJnqekF1gySszWj+E6OwZqMV5ge
         /6raZFJ3oom2YsDpr29Yiz7sDkXZT2lXwIX3PMudhp6TInA75qs2BO4FEZhoJpaQ0Xi6
         I+8jMSomy2J67h7WXqYsGkmV9YPRZVs5O062oeSdQRTXHZ6ZX3HZ/z9122wnZN2xK1Fu
         EF7fL0AfIYM0okyRJU8Nfc8UwdHuMndjrMqUNrt9ERiFeRDBEym47m7mwcWAYBHe3amV
         NjHd3S3kuXd8JNTqth7twG4yWJzsBtp5a2IQ5RlHlxsXuFL0XA5gQUug5w2Oa0pgjXav
         oqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707932; x=1794312732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=Jq9zNrGUug/IizTgqGpYagMyZZBDgwzYdSjp9VSvOBLamRpbxbU+6VB0xJGnHawczi
         QwA4N0DsoDRhKwALblx1AOJOoO9rXRJIWJ16rRfBE9VNVC1oDbYvsQ+Yx0G/UIu5M1Wh
         JHwtv5Dl3yJCbWBKWQlFJX0dHQzup9Wrc9TnUc5IWp2ckqTfe+ZgV2LuHSqpTU3pibEx
         oaS5NK3xU9Lom1L9U3HgXae6Olx1cpMzWgLEyAq9typzqurkwIEmjeEKLMw3pKMuDhyn
         VNg+Cg8j9p7G7KE1663fzVi/jUeq1lOY9IfPxCEDqutBQDiA3OOJGbedZdJ4tBl2aAqc
         Ex4A==
X-Forwarded-Encrypted: i=1; AKwUvBwrYLraz+1+4Oueec6r6qsqCUsIdfy6r1x5zLwHPM8DnKU97ssRJkZag/qBptVGcyjODqRkr0MWh+MZ/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Aq8XhKQJgZWjwenuzpxQL+Fv92s3njOOqurzQbvC/jzcRp5mt
	/S+H0vW0IHsYpKVhrjFTuvjWZb2lznF1a1VauTCHh97H3n5uRqz2qKN9
X-Gm-Gg: AYBFou0jdIsXqMmOOS0QWP+qrdEHQU7nZ2aE/djzq9DSIFUyw3mAVpvo2THJ3zZbZVD
	zP/hXVYPd1UckKNgTHp4G3a0PNULNJ5MpmRJ17ykSuyY5eKE7URYvMS4db0277TAczzuFS//yNu
	huz7oSFPqTmXXsLzCXVmZibjSkf1iv2oPpgFKbqYKIHV46aamckz7Xf25r7WltMKvhuveuZ9MA6
	vm6ELVEox8xpWBq0lzXkrWke+pB4ErbLZj4vMpXDyVeY4CZbKd6gWlFoGqvbHe8OFhS6Vu238vf
	IJhsTZh9byvaKd0wdO/im49vNckRF8Wg6hYFTobNd1a3JL1rC+Mj6+knEMxHvwDrF4a7vj6+4FH
	fNFbP04kHfQBxSm7fX3NrD4x4nKf67OE0qHTNQ3TNe+ZGjQinJS99xd1mFqTnv513PcpfgqtsEq
	yfxo+pUNQw797DtxuEsl3NBSys4fpufT6LuxTbdOCPS8rm13TjcDM3fNr1zBWe0HKjhp0fO1Aj7
	KopkWHuCA7RUYVQuHLF2JyPB0bzg6HE4Kz68/KEGYYl2Zhd48jhkmG1lKqeJiRpKa5vwn9OTwcR
	aNNHDlS75p2ie7tQx8RQ/Q4GJwwDpXVQxi5ZEz/dViA3zlWfx5xlHVE4iVRLB4GVahQNyKQ1fjT
	8azcEPaEkE9GhX6CwiJs32Zhzd0ZwfGcPTnmG
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5461054137.16.1793707931886;
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm12606282137.6.2026.11.03.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Tue,  3 Nov 2026 09:11:49 -0300
Message-ID: <20261103121149.33238-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech> <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
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

Hi Andre,

On 11/2/26 16:32, Andre Przywara wrote:
[...]
> > +static const struct clk_parent_data usb01_ref_parents[] = {
> > +	{ .hw = &sys_24M_clk.hw },
> > +	{ .fw_name = "hosc" },
> > +};
> > +static SUNXI_CCU_MUX_DATA(usb01_ref_clk, "usb01-ref", usb01_ref_parents, 0x1340, 24, 3, 0);
> > +
> > +static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
>
> Don't these two clocks miss the gate at bit 31? So it should be
> SUNXI_CCU_MUX_DATA_WITH_GATE instead?

Yes, both have the gate at bit 31 in the manual, and the vendor CCU
models 0x1340 with it too. usb2-u2-ref resets to off, which is the one
I hit on my board. usb01-ref resets to on, so nothing breaks today.

With the gate added, clk_disable_unused would switch usb01-ref off
unless something claims it, and in my local DT nothing does (the
USB0/USB1 PHYs take osc24M like the A523 ones). On my Cubie A7Z,
clearing bit 31 of 0x1340 at runtime stops the USB1 Wi-Fi traffic, and
after rebinding EHCI1/OHCI1 the device no longer enumerates (error -62),
4 out of 4, while it enumerates again with the bit set. So at least USB1
will need CLK_USB01_REF kept enabled once the gate is added, likely
through a consumer in the USB controller or PHY, as suggested by the
vendor DT. I only tested USB1, by writing the register, not the gated
CCU itself.

Thanks also for your guidance throughout these discussions.

Thanks,
Vinicius
