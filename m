Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413622;
	b=LjabNgh+4G8t3L/3lmxrwRIbin8ssFTWMwMz4yRIDMw6zPKcwuWnJgc9n7C/S0RS2v+O
	 ztemxs9uSQv9ze9h5/mD2kgfP6Duod/hG/oLghTXAMGkIlNnuozxLipYBBGliU7VODZEH
	 T9EGPC/TjKdonYOWPqxsjpbbvpv0VTJKwWs8sfXDOslTYoPAqM5czuSM4ZIjl/MvG+C86
	 vNJX2j+Hnp2mHNqNIcTR+ezhGBdbOB3SqLWJpIGjJFu29rICmKemiZmF15eUeV6qVofnd
	 nROovlfl7aHISp6B7DKgZEE3XRpDUaYLyt+CkPaS9jwCI3VB/zfdJYyr6BgbA6v6SyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
	b=ED2RcA2MtitdsriXsIhr7HYqQZ0jKEG8QLCiacjLvS773kkDkRAdfyQYgbhL1xXsc28n
	 NodwmvkUt+P8ycbsu9BW6BhgabLV98JuJSRwmbPq5KFUQScR6/D/G67e0J2OeafLZPhn+
	 eEiu1rASyLeOeYQ8rtEpn1C5sTWEZWfW3glWe3rI1p+czIwZMrrqDXaA4c4YZnbDVAdAM
	 wzKk30JQ+XTCNbmPX+eUM1JEPolU6XpMi/JYn6UnBD86fbesVL3ir9TQmWFDZnHH3qota
	 QZxgUfjlFOmf3I2H/DPfZdxb3i0FshO23o4CDLIpS+MSkoQi7yiUUaU2RGNZQACQyYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPAF7VYU;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F23606A334
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F23606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPAF7VYU
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f488ba6e90so510927b6e.3
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413621; x=1794018421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=gPAF7VYUNtXIPtzFxtnApa7i6t2xFlWsX7JLhdslHRfnmF8dzMU+IDK4Wt4T+1I0DX
         mehABkNNtUexMFKHe6dQR0gCNXgZOI9W8nsiAO4TqRdmowmAb8IGooi5nRBK3/p/Av3n
         5twg/O1W9rlHKqHtsBULIad+4ecXxkNp+5LAOlHkxLmRQ0gfdrbrbItyNO51ASL0qzn9
         aS8pA0Uqj70UEiXEILqxLKzRvd9Q7gabuI0YlloAZZRTSCzptlzBcTe7MlGy+k0IqZtz
         xcNQLh23Eb86V69MiBqCy9W8Zjnu/yyoR0YzA4zrjrBlBtVQS/mGI9Jt4jTIK8ryIlmO
         NH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413621; x=1794018421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=W+j5LhFzAIziGixzVl4PoFIm7g6QXx6ktlCOHT+sy8B+5JOQyl478Cf0TiP7z+SWmy
         1gaz7v/66bsB9k+T/rEyty8QrmcDpxqmM06CiSWNg+S5l93txi4Kpx2oGQe6fYXAqvut
         KdAiKQZMC1FXjqRcd1tGnjpnlZgZyH8c0++IkdhhHQ/NzLJkz0BMAFt13XD1kaUE0bLv
         F3w8nTwR43xAXaXY4iulua5y7JbPg9D1qISbNc3jAuvQ4wSLovzWFtUW6/dgbg8OC6QN
         ajOwM+4A0c55hG9zmYm2cPca1fnTE7bbUDaSz7gaR0gVrOShdZh/6d7Plpa3xj0iS1TA
         XWiA==
X-Forwarded-Encrypted: i=1; AKwUvByB5lAn6TE+McCZMlQEMdKnY17rFSOglPUv8C07MEAoozZXhJvAhglO7XpGqMB6P1sXpwLTz5OWBVXPDA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJruFm8jzriFV8PT/+CyRespqALRC9PilY9OEQqHh9QCI7dUeaD
	47QQTnPmIPiDec9ikAF5FY0q36I7tQ9ocmnj9/5m9F3X/Lt/lJUF7UCA
X-Gm-Gg: AYBFou2nK0LcZ5u9+DhcwRb1ffFBCbTyqEVJh3t2C5NtLXQcJ/Zd7XQws6ocFmZV3BH
	w5G2vRfgi8hLOzC8t2FwoPBPOL27iKTA7dJZoNE4Jnz0pRGZTFfBB+gScfo1wjkVRjhADWfZK30
	Uimhn4oKfkFxVW0wg+Kh2ckKeVTKY+u9YUFrBRZiOAZRAz1RCDLCGaVuGHa1MGJt5IHZAyVMcs0
	TYlB2MxWRhFJ4SGjEc0at5SUvTTCOo8Y2TzQ4SX01Lr+oQdmXR9Na6BuvBAzAwzAcwO+DG7rPqW
	aDg6r5x8Rwqi0EN/L15FTYKjyAGHjbxNieQrCwfvVSRu8DZS9EFgXLF/Fnfcjwk46Q5No6K+fU7
	e/hy7nLZCClMKoswTD9UBKnh2c/RLs+fgsX2K1N4dbBWaek1HwuroWYDeLbygduzBD/6WVwxaE7
	FRWGkBJw1mQkY4HwH62zwVK5BN188RkU0SGqIwvU3DcI0l3ggYgDzpyKMFQvAuugGku1xVeND6n
	zDsLLwqf6pO5OmoUf+ctYIbGGBqwfdTRYAvo36rv5tNmhOA3wy6Nus81FcUYMIBEpcZgP5HE0vF
	J3dU+l68KESMHwjehWgObN/Lr1eGhIz9pv38vCf59irZBIsaGd66pvkzF2A+I9QS/l3ztPNUFyO
	TJd2+2y4gR2uierhmTtUfXEMk66g=
X-Received: by 2002:a05:6808:1b06:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-5640dd36723mr2864854b6e.38.1793413621390;
        Fri, 30 Oct 2026 19:27:01 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm2821127b6e.3.2026.10.30.19.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
Date: Fri, 30 Oct 2026 22:26:59 -0400
Message-ID: <20261031020640-263f7b05-a7s-reply@gmail.com>
In-Reply-To: <20260911001805.0a2e033d@ryzen.lan>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com> <20260911001805.0a2e033d@ryzen.lan>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andre,

The v2 cover is Message-ID:
<20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>

I have incorporated your review into the three-patch DT v2. The initial
SoC description now includes the RTC, all UART and main/R I2C instances,
R-PIO/R-CCU, all four MMC controllers, and the documented pin groups.
The board enables UART0, the AXP318W on R-I2C0 and the microSD slot.

On the individual points:

* Base/checks: the series uses official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
  with the exact public clock, PMIC, pinctrl and UART dependencies listed
  in the cover letter. The full ARM64 dtbs target and final A7S
  W=2 CHECK_DTBS=y check pass.
* RTC: added with its current clock inputs and the board's 32768 Hz
  source. RTC counter advancement was exercised on the board.
* PSCI/timers: removed arm,psci-1.0 and added the ARMv8.2 EL2 virtual
  timer interrupt, PPI 12. The redundant disabled-by-default prose is gone.
* Pins/UARTs: added explicit pinmux values, MMC1/2/3 pin groups and all
  seven main plus two R UARTs. UART0's pins are in the DTSI.
* GIC: added maintenance PPI 9 and the ITS at 0x03440000/0x20000.
  GIC/ITS dma-noncoherent follows your public A733 reference and the
  A523 precedent; the CPUX interconnect diagram supports that integration
  inference. ITS remains disabled; MSI and EL2 delivery are not claimed.
* MMC: all four controllers are described. MMC0-2 retain the existing
  A733/D1 binding. SMHC3 has different DES0/high-address fields and a
  12-bit DES1 length, so I gave it a separate binding and compatible
  instead of claiming D1 programming compatibility. That node remains
  disabled; no operational eMMC driver is claimed.
* I2C/PMIC/R-domain: added all 13 main and three R I2C nodes, R-PIO and
  R-CCU. R-I2C0 and AXP318W are enabled, with schematic-derived PMIC
  inputs/outputs, CPU supplies and pin supplies. The microSD slot uses
  SWOUT2 and PF6 active-high card detect with a pull-down.

Three supporting changes are separate from the DT series: firmware
clock preservation, A733 main/R pinctrl voltage-mode preservation, and
the distinct MMC3 binding. The pinctrl approach follows Vinicius's
October 14 recommendation. The clock/binding prerequisites should land
through their respective trees before the dependent DT changes.

Two final-candidate Cubie A7S RAM boots passed, including eight CPUs,
PMIC/I2C activity, RTC advancement, UART baud changes, 148 MiB of
read-only SD traffic per boot at 50 MHz/four bits/3.3 V, and warm reboot.
The second run crossed the late unused-regulator shutdown boundary.
The tests used vendor boot firmware and a RAM-only BL31 reservation.
They do not claim card writes/hotplug/UHS, operation of the other
controllers, RTC alarms, or EL2/ITS/MSI functionality.

One electrical uncertainty is explicit: the schematic's nominal 2.4 V
BLDO input conflicts with the software-reported 3.3 V BLDO2 selector.
Physical measurements are unavailable. The DT preserves the existing
setting without a voltage constraint or newly enabled LVDS consumer.
Resolving the physical voltage requires inspecting RP220/RP298/RP299
and measuring UP11 LDO2V5-INPUT and BLDO2/VCC-LVDS0 to ground.

The acknowledged board binding is retained, the old MMC binding already
in the selected base is not resubmitted, and the oscillator names,
26 MHz board crystal, four CCU inputs and DTB ordering are corrected.
AI assistance is disclosed as Codex:gpt-6-astra, with Assisted-by: LLM
retained in the patches.

Thanks,
Enzo
