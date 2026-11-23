Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432572;
	b=EtI1GZ8jKyzY7qYoCzJ91/10m5ONFP0++vRH+x/aWr3uFEhgjXUg6x8NR9bEwHSNaVvH
	 0w6SqdpCcLFA+e0I+HXw+6zadQKcybSz+QPxERqeuIAxN08KRc1mLVvZJmLcav1Ew8l9Z
	 92BXlOUUnSCVcVDZNPTH02ih/8jof2TCiPni5zIZtvEUx4+w+SVvssS1kR+EakMgkJv8T
	 LWaTfaES1bk4IMpGCxSR2aDiSDuo6PhErOF15tU5C9t4Or5s+ZvPMBts6a1jdaQ36hjCX
	 SJXduKaS6Cs1iynrTFErtHCL3nJlh334yaGuEco2RBp4H/XmVkDYG7VfdGwHb50rWcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
	b=QkIQ33kJ8MjgFVN6SRz0pr/y+XmiIz/hh0f0Yg3WMkshnLXGMmQgVhI4UGLBQpnFSsQM
	 sHcRBQ8Sg5e5VAtbpj7voDqT6/DmhkALuMim/h/hMfcYN5hEMwDGU/2Vqcw/oBSJRAluU
	 hmlMhqHd6DLgyOYbBipudi8kCp8aCiBUdIvm2Zg26i5QJk/RFSBvI+x2UpvzSoZuQUyJi
	 M0a1N4XWCt1M7Hrrez30SlDK19Sl4vpfOLfvRqbMUhJo3yQ1k2I7FQFnwiMnZznyP1C3q
	 111nT2yqfzjw0xZvgKfQNnzEthcbSheyQvCiNAIJoqB1uxuOeLgteCSVTMU75AxL8WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwLmG00s;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279B2606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 11:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwLmG00s
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so1000897e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432571; x=1796037371; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=mwLmG00sjcO4S9vmOikQWda2z8KX/0K1mdPAnBN/Kj8ueb3M7fz46khfhCFvWTG4sb
         LJAUioe2Oxmtbg0cqJoRFtRiAMmIRTv0+eDjLc5Up+cJP0cLODrjLmwhHqa3Iv6QXEVd
         uM6ewFim9i5RPLvdOB/Cxj4O8ignbYE0kgzz3AkyNo1YsO6Lb6pYT2SGNRVHnV3iBrZ6
         +zZLVlTY2F0SfwCKtQCuERP7WeKC2vBMxHrELxYxr1GSOYAzid4QcLijUgO7m/nDrrxg
         V50Y19kzhE8alt1/eQ2O3/un9fDZ8+8PwKmCs3AT4Q9677BKcAYF65VUn2wY1Vpk2Ul5
         HHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432571; x=1796037371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=kjF1Q9eDM9CyvPM4X5jXDYYfxRDbmrdy2p/olYZYtPuxHOMmVCAL4uT7YO0qB+hBFZ
         taAeaa1WDWuYOjrtpOoYFOUFVCxIqIBw2JDFy6aWKl+I2PB8+Ok7bC2RJrlIdiMkdlK0
         YEtNTnX5Ys4mzrTlhXlFOAGMapBHRmvWFwoexS8eMeAabwfQToaeimC+HA4s/w5JREJc
         3tcMm5OeiqEImtGKpFQqhjoNXmt8FDJmw/DNGQPsEXxpctI2KELqI3wP75KNQAtJZjHK
         B1rseh2Q9/UGfn0cLjhR4Iakwrtd6fzlnVla5iGVhe1+T+Ms605PXqO445s1M9Igxcdh
         rMhw==
X-Forwarded-Encrypted: i=1; AL+hErFnROp6kbLkQs8LUTmiMvYqJCk1fcvYGzcvmGVqeoAQaCks8qDLlUDPceJTirN9e1XnNJBoi1Pm/KY5uw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/kXYwcQXhne7Y2Izh2Hu13hEFkArScKcA1nMBd1UvraEpWUKWG
	Yrr8XSPcx/RQ5BFAX2MrAlSJfsd71pqhZ+ZHVlQ0JWjieVRVXTakav2/
X-Gm-Gg: AZFdTZcuooL9mDGrln6c3Btw2GtkYSS8CpaOX09eM818V1OeR7CVDCcBHN0Hj284Q2s
	Porof0aEU24rQP68dTxaVoAkOtEp1s1RfRfFzmXv9wsWPtrnBKvztW3LVS2d32YBOdW3cHaVsxH
	aQ0C2sZDjLYWBOSduhuC1l+q2l5OWkgynROpycExCJGGIPU2BHqkJWbzEQrWYKvk60i8Go8w5gC
	doT6UOJwR9xgJe9qe1Uo5x/UcbXSz+gMZ217V+6USEG3U5Xaory3lQ6HTzuVIc3ykpmzPkJchVe
	QLtEiWYb411EVEr6mKmgkEh4zPUFrmFhO9YXgXrcsTSS4wt0fBa3IwBGlH+qga5cH/cKFFzT80t
	k0yqPIFm75M7MI0l+oLOucJ+c0K13dOKd85P99i8a042AQ1QnsfYNpSvDeBDMIY4f2Lgot87zHN
	ivptcwkK9gXxQ8BchDNHsMq9G7EUO36ntt2ixBNvXY57zBodGIV56Ymwdo3fcAWDNTPzt3D0B0e
	iSTVcgti8qHfwDl3Vcr5d+I1qUBU7j6xSCDFxAZqNfVrU0c3UJOhrqTaE2C10Dobk2xAd707czH
	FqqowUyRQ+8DJPkk/lX1xt0rorkM8ayrpFOYZc7dYbKCjGr/Nq9sNcgdWNfTEXFtJUiB2oaJm/V
	YlsOZpPplIcGTO4TQbj4e85XL+EKB8kbz2GX1KamKsseDDE3iSf0/fsfWiCY=
X-Received: by 2002:a05:6122:288a:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ee8af56a83mr5616946e0c.18.1795432570921;
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm10485066e0c.1.2026.11.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 08:15:47 -0300
Message-ID: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
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

On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
> there no differences as far as the OS is concerned?

I'm targeting V1.11, which is the board I have and tested.

I compared the published schematics. V1.10 differs from V1.11 in two
places relevant to this DT:

On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
separate SY8089 step-down regulator at 2.4 V for both.

V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
which V1.10 doesn't have.

So the power supplies and card-detect configuration would need changes
for V1.10.

From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
CSI connector and a backlight driver, none of which are described here.

Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
DT for V1.10 if needed, or splitting the revision-specific parts now?

I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
changes to this DT, including removing the MMC alias and revisiting the
regulator descriptions and constraints. I'll wait for Enzo's v5, test on
my V1.11 board and send a v2 with those changes and the LED patch
squashed into the board DT, as Krzysztof requested.

[1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/

Thanks,
Vinicius
