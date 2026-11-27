Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802835;
	b=X1AYI6jwqbp8LnAEH0U6zpmJH50UEA3bGvrcMU72Ui7bTECyiHbYOcURdVxL6bHRzXUS
	 /lHTlQeyeJ95re9iB30D/QLwaaqWJ4HZvawformjcpKiI+14vsZtF8Zd0DNx3/PKWBP/u
	 0Oly/GoIoyP3mfyXrzBLN6foJUFeZEUzfZR588w7o/dgDp3IC/nTk7p9lMzD5R6ae/KfI
	 OKMxLAM9pR+08BoLWuZ58uJCdISVfBUsQFvw/3jHpBBuMSPJZ2XBfJIOho/amf88PANEu
	 r900T14P5lIHnhPievS5bEvpKaMCOy/IBFlwx/rRo60cQ312ZBar1BmZuOFaICiHeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
	b=027PEDto35XF7hzGWLwqCdW2m/iDhVqLU+P67NYHvAWLAY75du1NjdMYTANNnukkTyba
	 8tXT4Rpwy89OFODQcgKFY9SfaoDIPuXDyZZ5x5rX8Swbe04C/raq/lFp0GZKKWaP+OU/z
	 n4MLT5BSleD8Hy5F0kdfAs1H0PkzWE7YWJhGxvIwtc0TutZEwvOucuMi7PXTsjwGY+wi0
	 vZLVSkqkU8PyQsBNXNSElQIg0iciKhH2VO9oMoAGkp/kdAs8riE1avxKcE6Vp2trFgsQM
	 DRPvIGafoKFNEW4AdEOfL75eGBDEen9bwQLcpzHgVDQ6gim2C+u/D7FOAEMPXSkelWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BscAtnw7;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9662606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9662606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BscAtnw7
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4b8587b395aso4795529fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802834; x=1796407634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=BscAtnw7fyEdXM9szBeCBiST6616zHuoZ7B6Z4RjGl1XDVYPpksk3TMaS6vL4n+rns
         t6Wf07lyFTZg6pm5Nypumyzyw+gxCv6kpHNXShKSgmh5nwlzjxXLubwbEtsOHZzkbQzd
         d9qFlEh/u4QT8Q78d19K5Gk5LJieRIBzH0UQ5Y+kUqVfg0O5dh0efNeG6SL0nxdmPJ/8
         +ATASTRPuOB2Q2oQblqhJ+srcEfKOcV2LRbJMsJUU7n5WxRk2woikp0UWbgElM+5Drtl
         bC/hsD2kPRDJtpAyjtjsygz50eKiP6mX4ZJHRGEYPxfA4blfz/avmGiqt3ElnDqCbQA6
         Q9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802834; x=1796407634;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4IXqSRG1pwptTB8gRp0YajkwGXGGA4iFphY2Hyaf8U=;
        b=rNfA1uLkbouVhb/FIsd31DxL+KYP8qdIeJ4RxpEz4zNjon77htsRbRR8Uj6nehPMwR
         Yj+5Jroo7NgCceMwmK50bQ+BneAlOALc5PU7XVescph15ZAlIDX3CSLKITzRNQGQHrd1
         7MUYcuP//8DTcMjnfG+hlU5caKMzl+lXcJcyZMYoJG83HQYWECULtnFCRmX4GKcw9Mdb
         fdlPyYVLlIL3LTkAo0E5T5UePGeTz6KYJ2lAPzQKXDRk3duWods/izeUwxIkMfUgpx2j
         X2MKVUgqnlDGPRIM/upDslcSfXGVU4WUzgIaKGaUAY2XBsjQmk3uRteoVaaoyjABMNnU
         uBRg==
X-Forwarded-Encrypted: i=1; AL+hErEd+8YBEBB+s8zGWVygWOUbUcClEXgZ8YliHZDXocAe1E9BS19TLA0RtGPtRhaNO1Am0VhGGWxMARCJew==@lists.linux.dev
X-Gm-Message-State: APuU4Z9cZMzdImcK0wOh+2kh8eB8Cs8hRXCfRz2aYh3sfxoyIWil0pOT
	yuEJ1JwxP2hQF9Nnp6BpWfj9FbD4qlvwapilK+g/jNHUSInScX1qNueY
X-Gm-Gg: AZFdTZdeyS0oKZX5/EhdfjACpW8z2MzVoOClND9lrVHbzLgObXT1GgM5ASuk+TvobMi
	RAucMMPrWGczc1CbW6q25uQ9MHzHNCXUOwhBPee/dlUNuwmjkARPL8SS/wljzdVQa+XIBl2noox
	8RVcKbY9NE4fqTw0tCsCtjvA14zjhIWfEPWSv00KXd3GNywLmrZ5aHVJBnIOIV2VEaiHHjsQ8qh
	BmGKmnIhli+65QD91MsLsosM62MOsuxcSpxwnqj4lHFx5kGNPfBvtfw3dOx+DjnFpDYudBYUEhW
	p8+pWOm/3ykZuckRQLWpXqf9Oijj/mkZkHBApHjuydBRp0nAw63X+V6xiiMXWqf0P62YKVs0wFO
	ncUM/C9p6gTwWaxzEY7VTwyIWwI3xB4bJG1M1q4MmWG1WchHQiT+t9wFh36cCSqNXyPCpTPdn8h
	ozDXzpk8cBmHf6knKIwwd28iuXB0eP/g1HxqnDK1DbKltz46foQhaxsl/Sf9Cf+k6XZnHwtNO0z
	XJKM4XLA87qKv4/2rmpmjho8YP+i17e3UIVWBfFxlNymrKNooPPlOlffplGY0Ipnl0sUmEXbIbU
	llg42XGMBi3L+ILmlXNCn0HcUiXmOHTYwZsrS24tPKEQxqjZaAqJk5LfYob+qUNhX/pPRpCEueC
	PrA+MIV9tbL4sdCJg3KwMiCNM113B
X-Received: by 2002:a05:6870:440c:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4bc858f9583mr23176950fac.53.1795802833555;
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm23406139fac.16.2026.11.27.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:13 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
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
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:11 -0500
Message-ID: <20261127-a733-dt-v6-02-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
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

> > +			linux,default-trigger = "heartbeat";
>
> I don't think we should have an LED wasted on a heartbeat when there is
> already a controllable power LED. I think a second LED should be left up
> to the user to configure. If they want, they can always set the
> heartbeat trigger via sysfs, although I'd probably do this on the power
> LED instead.
> So I believe there should be no default-trigger line.

Agreed, v7 drops it.

> > +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
>
> Since the Allwinner GPIO notation with bank and pin number is hard to
> read, we always add the pin name (PF6) as a comment, see other .dts files.

v7 adds /* PF6 */.

> > +			reg_eldo1: eldo1 {
> > +				regulator-name = "vdd2l-lpddr";
>
> So I saw the same issue on the A7A, also with LPDDR5: the schematic says
> 0.9V, but at boot time it was 1.075V. The kernel corrected it to 0.9V,
> without apparent problems, but I didn't stress it at all, so can't say
> whether this is stable. Various LPDDR5 datasheets suggests VDD2L should
> be 0.9V, or at least in the range between 0.87V and 0.97V, though in
> some configurations it can also be tied to VDD2H at 1.05V.
> So we are none the wiser, I guess, it would be good to figure out what
> the PMIC reset value is for ELDO1, so to know whether it's the
> vendors(?) DRAM init that deliberately programs EDLO1 to 1.075V, or if
> it's just left untouched.

The reset value is not in anything I have; I have no AXP318W
datasheet. Reading ELDO1's control register before the boot firmware's
DRAM init would settle it.

> > +			reg_swout2: swout2 {
> > +				/* VCC-IO to the console and microSD. */
>
> I guess you mean "GPIO headers" instead of console?

Yes. VCC-IO supplies Port B, which goes to the GPIO headers (including
UART0 on PB9/PB10), and the 3.3 V Port F path for the microSD. v7 will
say "GPIO headers".

Enzo
