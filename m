Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ECE437864
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392122; cv=none; b=s/5Eevlk2ad0sf/tXVQaGp6iecpPF5if/+XimyKlDUiE/+Op22jY2jtJeb6y8fC5IDh5yvdw7nMLMqXnzFUYaC+Yyej9fiM6wXXgJikCqkKHV6m+eEmjrACxkhvldXKAgtl3P9dalv5lKka5CQNIdhfwaSoAgOvYXJT9WS8Xp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392122; c=relaxed/simple;
	bh=q9lVT+c+hzgPwLnQ067ugjs05Z+KIZPQR/Ta3Mhuk+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTL1c5/hnLUur36ZfZxsAm0AHmygKxbiIfXWErw4FYumASI/Y+SDxt8vCrzXeTDk/zo0WivJUIR7GaPA3GrOB0QLkdteM14NGbm8MGAlt1/6MzvekJA/MQSEIyPiotsMym+gdn2akSFrNI6/v2dam9fxPln/4eUkWmfbOFsGxDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T37l76SD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T37l76SD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956242332dso22206985e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786392119; x=1786996919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exfw+BpSiYeouKj8oOQeysjMtDRV6oyZO/QGXxK66VI=;
        b=T37l76SDCDoCy1pqOVG+Qh7w5tPh/Jdo3NwQD92mrscK4y+TV42tZrMPBoKIudNr+T
         wDuGtqTVwQFaPb6WxXxWzlB54baXh0EuPk5CXZKl7WWxACRaRA6bjOgIdF6D55dSctYt
         uzs8rwTjTifpCaQ+nh9JytA5oiVeReNKaz7J9ntxIZX6iV5ZHQMcXdfvmQOlJxDAhmlE
         mbe/vNt52ZA+U3qk0dumhzLOVspDVU/ClTvWDsZvB2w+5nxdGCZsde7aaZTor6wErQXA
         EnU1PBrvo7nDJJtCt0DaUAklVrI2tkUN7oqH9g7jQM7i+GAFbM4T1cktQT+f1CeISQgC
         qCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786392119; x=1786996919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exfw+BpSiYeouKj8oOQeysjMtDRV6oyZO/QGXxK66VI=;
        b=NMDSI02O3sziehVnqjyDAYM+ungGy7rr1xupzgcXMOfEmGhiNqY3rfg01WF4gunodH
         rOWJsgBzXfskoYpARnDKCUsKqXLGQXtMxRAMadxeb0GyuwhPS4o2JP/AwDBBT+wevINx
         Lskr0dlDdMS6vr46pTVOVqpit4pL4vqEBBv1rhfwi4zPLgCOhorNY4q/YTutjHf3PYRL
         oqXwssLbwnQoQQyTttnJuQyLKa/QDAfBDngax5rvuvu2RldQh13GNjU+TmShnMngCzx6
         wiktMxMrgCT7QnzIZEYSn+pACB+A1qlbUGxLr5Qv6YfWupZnWp0rdF/0Rjg9KWoVnuIa
         qC4A==
X-Forwarded-Encrypted: i=1; AHgh+RpVRX75DCBPXqwyCZSYJObZ9Zt7RrySHn6wc7RKfh5bGWyuIJsMJT7Q+JVUk1LkzVPemdGDjxrBjfqCfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUnca+bN/Nz3MHw23ruuwxzD2jOEguWe2Uo5HvM7imVn4yICQS
	xJ9PEGe5Q8OpwHV+q5YE/kJWQGwV2jaINZ63LRZVWlApjrTpfl/ATR7V
X-Gm-Gg: AR+sD11mxyjb5P7uRWb8YLJy9zkKpIQ6VjjPKk5roANrtNV7yUZ4vn8G91wGZvDjnAv
	vL0fzZeLF64r9HBH9vtpOnd608fJMgNZp14ZiSzCoXlai6IfjnLizE0xx1lKadi8Xjrzi4lGk2s
	YJETh1q6CKd7sQqXisro4jjkILfmdBqCGWZ/tK41bRDAPLobEWeHAed+NFBtjahTnFA+FWMnSM0
	kmBlCkRAQeqT1a0pu2vdPSqfekg+td0dYlvJuYsfDsZ/bx9TUdEnGoDy36BqLg68FScXIWAyvXP
	YYrEOSNPmkzFzDno22iNkBxo1gwWTndjfgamvREQItacBuES29tB4f33tT3uVbCRtf1hGrVKB4W
	/JNVkpfo5w+PFu9gsECuSqh6slS8dTFnu78rlCgCygSkQGUG/7kE6lCf2Ve6QSmGTH2kkvATxA7
	jb9J/OVaNh52ExSGcBBMO1oqIEQqwifv0xExL7UI6+e9Cj0oAtjAc5VXnOyNoJM9Gxm9ATCvuWw
	ASEpnZgTh51m0qw8YSLPXw=
X-Received: by 2002:a05:600c:19d1:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4996199bd2dmr283023555e9.14.1786392118717;
        Mon, 10 Aug 2026 13:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997415df9asm12835825e9.13.2026.08.10.13.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:01:58 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: iuncuim@gmail.com
Cc: wens@kernel.org,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	p.zabel@pengutronix.de,
	andre.przywara@arm.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH v5 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Mon, 10 Aug 2026 22:01:55 +0200
Message-ID: <20260810200155.965544-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704171411.1413349-5-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com> <20260704171411.1413349-5-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mikhail, Chen-Yu,

Andre pointed me at this series. I have a T527 (A523 family) Orange Pi 4A
here, so I applied v5 on top of v7.2-rc7 and ran it on the board. It works:

  thermal_zone0  cpu4-thermal   43.0 C idle   49.1 C under load
  thermal_zone1  cpu0-thermal   43.2 C idle   49.2 C under load
  thermal_zone2  gpu-thermal    42.8 C idle   47.2 C under load
  thermal_zone3  ddr-thermal    43.8 C idle   49.3 C under load

(60 s of busy loops on all eight cores.) Boot is clean, no errors from the
driver, and the readings track load sensibly, so:

Tested-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>

While testing I looked into the open question about the extra sensor,
because I had reached a different number in my own out-of-tree work: I use
sensor_num = 4 for this controller, and this series uses 3.

> Are you sure? The calibration data is written to the sensor register.
> The BSP simply reads the sensor data from the GPU sensor, and passes it
> off as the value for the NPU sensor. No extra calculation involving the
> calibration data is done.

What the BSP does in software and what the hardware has look like two
different things here. The T527 User Manual v0.92 documents four sensors on
this controller: THS_EN (offset 0x04, page 452) has THS0_EN..THS3_EN in bits
3:0 with 31:4 reserved, and page 459 lists four data registers, THS0_DATA
0xC0, THS1_DATA 0xC4, THS2_DATA 0xC8 and THS3_DATA 0xCC, the last described
as "Temperature measurement data of Sensor3". THS_DATA_INTC, THS_SHUT_INTC
and THS_ALARM_INTC likewise have four per-sensor bits.

A documented register is not a wired-up sensor, so I measured it. With this
series running, THS_EN reads 0x7, so sensor 3 is off and THS3_DATA is 0x0,
as expected. Setting bit 3 and reading the four data registers once per
second (raw 12-bit values; lower means hotter on this part):

  idle          THS0 0x875   THS1 0x874   THS2 0x87C   THS3 0x85E
  under load    THS0 0x83C   THS1 0x83C   THS2 0x852   THS3 0x836
  delta          -57          -56          -42          -40

Sensor 3 starts reading as soon as it is enabled, sits at its own offset of
about 0x1C from sensor 2 instead of mirroring it, fluctuates independently
between consecutive reads, and follows the load. So there are four live
channels on this controller and the series reads three. I restored THS_EN to
0x7 afterwards.

What I cannot tell you is which channel belongs to which block, and I want
to be honest that my own tree does not settle it either. I followed a vendor
recipe that goes the other way round from what you describe: it treats the
GPU channel (id 2) as unreliable and reads channel 3 in its place. Your
reading is that the vendor takes the GPU channel and reports it as NPU. Both
cannot be right, and I have no way to tell which block each channel actually
sits next to. All I am claiming is the electrical part: channel 3 is alive
and independent.

One more thing you may want to check, and I am less confident about this
one. Applying your calibration code to my SID gives 0x90D, 0x90D and 0x90E
for sensors 0..2, and 0x92B for the ths0/DDR sensor. In the bits your switch
does not consume, between caldata[4] and the ths0 field, there is a further
12-bit value of 0x919, in the same numeric range as the other four. That
would fit the factory having calibrated four sensors on this controller, but
I have not verified the exact packing, so please take it as a hint and not
as a claim.

If you do end up reading channel 3, there is a trap worth knowing about.
Right after the block is enabled that channel can still be at 0 while its
first conversion is pending. With the two-slope formula a raw 0 works out to
about 183 C, which is above the 110 C critical trip, so the board powers off
2.8 s into boot while it is actually at ~50 C. I hit exactly that and had to
guard against a zero reading before using it.

I am happy to run whatever test would help on this board, including reading
channel 3 with proper calibration if you respin with sensor_num = 4.

Finally, a data point for the naming issue Chen-Yu raised on 5/5. On this
boot the kernel prints:

  thermal_sys: No trip points found for thermal-sensor@2009400 id=2

The gpu-thermal zone does define three trips, but inside a container named
"gpu-trips", so the thermal core silently ignores all of them. Renaming the
containers to "trips" is not only what the binding requires, it is what makes
those trips take effect at all.

Cheers,
Juan
