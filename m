Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111741;
	b=i9ccYUjkSJTJQT6MihZd4pzTbswNOyQ+2oFj6XmbouOr2e4bHkSudS/aZULs21rUu3tY
	 DR+cGcfqmFMkvdB0Hl5f4oBnha5Vnpl0jenjLeUrazSKp3Q8V3iWyy8/1pg+86cbInW9o
	 tzMqrIUO58TvxrScB/Zz8xMfKYgwWOP0O6+Iv6/BmrzQc3uTJG8/OG0yADiVZfCsG7EjP
	 zxKb/fUeZ2SnaOrazQOmtAGdl2aAq3+qL8XUXP5YoebCOISA/hzVjSJfTc/iF/Rrf0v+X
	 mZkIXwluP2Ljly6ayBAnoZdDstXGZEzMsfQpGlW1fx5zFOY4WMEjmtjo32KNXxi/m7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
	b=vbGABgYak/OPZMDi2QZbfJaBVK2/vk7BI9aUubV9Sm3DMkGqT4t04u48c2Sx4e26Izpy
	 deVQUhsNVqLdgYJnrFrhkUGe7Zb0T69LHaew0sIQIs50fobxH+kZyovLD4x6zOECw+sB8
	 exjUTIh6dOPq/MlfEN8ObsaTyuCjHIU154RlBFxgAScXJmINwkgdvdsAh21MoEwDeagDH
	 fLr81NVt30VP0RDmmVaUzYlqaXuNE3JCb23jto3M5uHpvcXhlttQDbEutY9CBMWb2RHxk
	 WuavWJzaRX0SKGHBojCBuXshpLETe5nL+LXQqyXfGwoTKljJvzUyCw5vm7Hdln0P3vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FU7iBj5m;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB121606A335
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB121606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FU7iBj5m
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4ada9579947so74816fac.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111740; x=1795716540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=FU7iBj5mk2WuwQ04vwiLTZnEAwVeLr40UAvflZgU2r8f3WyMmPdNusXMc7F7vDbsDl
         EvFO/u0SXIK1mtQTldL6g8ukXMk2L9cvkQ7l4jNieK8rUMpXEBMDhdKJ2UybBvflhB2Y
         N/jgzaLFxeMsaZiXajYgEZpyjflxsrMfo4dIMdRhquJGHC1hJoMfjMP/ykju79MgIs0E
         XjxEBY911V4yeNVn2xC3pLd/7cnxV2ZWuTmzk4SoXThFf41VHLIwUI8hI2JUtLXjgOhI
         C/r3BFKnNVsA1RIYv8dfWrwu9Nt/tMTL6x7TOCJ6r7aSR2lPKxjjXkBDe66z+5g4pAK/
         wVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111740; x=1795716540;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=EEZTPVNeZBeHbfWQvmGhLo1EwfD9uSylKmKaGg+C+qUWKcCoB51pXW8G8/feU9lx5b
         56JDqqyI5UbMihVSX43M+r6Exb1z53i84SXZyBQvURpsVjsy+OdQJ4TzOeD6x2xFR9ow
         LJVA9Jvqx/QbKQo/UEpf9FmZyjbPXTK0j+gz0hgBNhz8mlCd5Gz/OvYgdT4Ev27MsKeF
         C9YNWSxXHDkzHY0lJj4aMvVKHWs9s0JN7dWFRT25gXsoyXUHaft76IlaES6BB07r4rXc
         MiSGH+SziGhYHKXZG4J+D2K1PtsMB15gcc/JHW4dRLkPh7NY6WX7U88w6fEPIm3cYMEz
         6p0A==
X-Forwarded-Encrypted: i=1; AL+hErGR0We12NcI4WwYejUob7O6JQoPO79c5j5PRbE6da1BevoMWmZY36FtEpHwcN16U8vjAMpu5wvZGJsb6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/BQGuAYkz1kkJHAHETKo4gsjYjbzeUQxyBwKLD6OnshETJAaJ3
	swfn5bXRglTlpbiLrN7DuLMKuRg3yhFlHuGMnDA7JUQygc1sRhwIcmPz
X-Gm-Gg: AYBFou25biaOdo/QML0R6lsq9orm+2I6NJhDeHx8oJdIFQiYLNgl3W65NbUPTqr1WGS
	3fpPzvgoX4BAY0zQ98Fl5SUPXoGxIqvgr6Lkr1wD//xDVrpchS3FJpgZh7FoedBc3psvXTKqamk
	jU38mzksepZEDV01nxOwFvpSLG5acgxkj0Zgm7vJYk+lp3/ZK7ridJBwD5pyencK7GPzQz+LQFN
	xaRNSiXycmY7MMrA6HzB4YuitPZp/xYiUZFXVpIEQGXWtqSBMbLaETxPQKc1TbcO/zyBfixnYqg
	UtBrDxPknDIl2uV9DVKM0a5ULbSMcQ8UQkjQlb7RhOZWMQ2gIvXljz+2EY5wskQ8UqNzhygn8Mf
	gJpEYZ97OTswmNiuyLyKoK8lzpS7o8K6P9fbYytPS2Af5DzxidmiuqKqPMlK7S3woBG32XUVxxB
	VUnwK8Pwo9CegornbDwIDmerWySviM/0gSB0iouiyL7sAQ+vUaRXb4PJox5n6xg0df6DyVVuuRB
	u4xXK/OZZQVsdicBqyXh16qBtMChY/Q9WA0Df0nujakFFvaji5nh3Euns5ZC5/elPSaeTn4vnLY
	SLUMT/DAquPYMYpHDwRr7Ly8IAEReCLPmLeSJzDCA0KZ6sv+ymBqnfKzaLMm90z70/2xL4D6K2C
	4
X-Received: by 2002:a05:6870:dc48:b0:491:47e1:6283 with SMTP id 586e51a60fabf-4bc810b3516mr386675fac.27.1795111739744;
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61081159sm452437fac.15.2026.11.19.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 19 Nov 2026 13:08:57 -0500
Message-ID: <20261118-a733-fwclk-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com> <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com> <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com> <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com> <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
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

Hi Chen-Yu, Andre,

>>> But I think there is still the arisc on
>>> the A733, so this would more likely run the management processor (SCP) code?

The A733 CPUS domain has both an E902 and an OR100 (manual section 1.2,
figure 1-1). The vendor SCP firmware Radxa ships for Cubie A7S, called
"arisc" by Allwinner, runs on the E902: vendor BL31 writes its entry
point to E902_RST_START_ADDR_REG at 0x07032204 (manual section 5.2.3).
Radxa's BL31, in its system reset path, sends a reboot request to the
E902 through the CPUX-to-CPUS msgbox. Exactly where the no-flag reboot
stalls is not known.

> The question now is whether this SCP use case is something we deem 
> useful, for mainline. If it's just about to run the BSP firmware, I 
> think we shouldn't bother, we just don't support that. But if we end up 
> running something like crust on the E902, then it's a different story.

For me this is only about the vendor BSP firmware; I have no other SCP
firmware for the E902 to test with. Upstream Crust has no A733 target,
and the A733 TF-A port under review resets through the watchdog, not
the msgbox [1].

>>>> So, not a fan of this. If the loaded firmware somehow needs some resources
>>>> then perhaps the software that loaded it needs to somehow tell the kernel
>>>> they are needed, like the bootloader patching the DT passed to the kernel.

Vendor U-Boot already applies DT fixups, but the A733 CCU binding and
driver do not accept protected-clocks today. A loader-declared handoff
would need a new binding and driver support, plus loader changes.

> So I wonder if we should just pragmatically add CLK_IGNORE_UNUSED, to 
> not shut on the door on this SCP use case later.
> If we ever only want to use remoteproc, I think we don't need this patch.

CLK_IGNORE_UNUSED would also leave a future remoteproc driver free to
gate the core. Chen-Yu, if you are fine with it, I will test it on A7S
and send v3 based on linux-sunxi for-next, with Andre's comment wording
and a short test note. Otherwise I will drop the patch.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200

Thanks,
Enzo
