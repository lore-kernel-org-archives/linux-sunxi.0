Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602257;
	b=rUoTWZuy0rTkc8rue29ctw/JpIlaJcRVyk5knnie3b+aVqHg7jJrzcCVxeVe8qUZtV5m
	 QChemEL0Bqxyao9ZiFMqmxJv3nMCpCoVx6ezjk8+ZTdAsExQgmH+6VXAhUiAdXoiLowtB
	 XwPGb9gfbI969tBjIcDDaB6nET+K86D9FvzTlnM1DW4PFl4L4Xiv4Bey9II2VcBvpR2dX
	 +1NxwsOvnw8s6Vidy03rRy9Dur8Iwu2SpShlNwfOXxx7FVXlXAHCxjFlMQGyHjI2VcJKI
	 90Eiz4zqcr3bRkwYoxqjMnWnQhkEyE+WIhJAcMUv19x72HUTP6UUmp1Akck3Ntnx15Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
	b=OoUVBSzS1qaTkdFOhznMOR9UBjLV5eLY298MnQl2N2vQlTiquY+tVkFF5WNj0kHWVyvb
	 CeWHuhx5pPSDVjj4QtPtBzfK/B3EI35RE5sx21TdxhuocsiU7xvy3+zblkfbQgQagYni2
	 HCH3m8g9AUjR6LeHyOwobdsFHLX6YMtvm0OW9MvAttnshFrt8+JheUzOIuoZx/tFANY5Y
	 xV6Sc+uaqOujAnZq3H+NdI87ziA/LEZen76O7q/EvBqtCKHK0Lr77JLfxiWtf1Kar6/fv
	 901myPtCA1Ou4ecV31b12GFZKuSzQ1ZCZ61fNAKh0y+e32Sz23tt9/XsYriUZdS0wMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H1wusnzD;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798C606A31F
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6798C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H1wusnzD
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc603a168fso308182137.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602256; x=1793207056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=H1wusnzDE0ActQEGpoDvAkQ7/uO/QHSna59bhVsHIFGP4hM7fZ+YG3T3T6nDPc/7U/
         KUkVwwDOOXcfzgR18YKcoT4t/sIIArmqQEVc7PxeDu2l0RGnuC60jQPgmI6hVTwMNc5x
         bYloIx79VWLSG0lfjmUm6l0wbyIkZn59xV0KHoNuJsNyQ4w2KF7lAW3mqBgxJIbdJTGM
         JvqnAuWXWWw7TH4VIP7eYFMiy+CHXDA3T+m6jGyeXaXhAogJEXACev7cPqnneH0yrs5Q
         OWolHJladJ2dIO69s9I+cXIyFdAF/2ULqvxUbAj8vRF61WFxJm2jfPWb9Zb88X/Wz1Xm
         KgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602256; x=1793207056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=YAvqBksniJ6u6ybaCL8WJ21Yx8Srjl4dcAWnEUzPQ2l4bYi9r+C7zi2Tl6Mfcaub3T
         /hrFSuXCl8fCBySaYfiTnbUs6Pl/oxgNGyRpLcZ2Xl5TN5W9WdGT8CsCaRT0uuK1nV3Z
         1ieepkBs/rore8z/FAhzTC36QjwOsvgI9tnNS6qdOzOOU1UBBdHfbRD4iO67qchcGmIh
         0+D6v4XMIdf4cV2tDYLtL97sjCYWnYVVLXXWFFmaywX7npef2eRhGMv911/K77GdK915
         0MW4wUAwyMe8OWNtG6wP+ncey354EKqhF7FxedODQBJNmrtA9+3ERCPEPP08IxVw5iAD
         zx6g==
X-Forwarded-Encrypted: i=1; AKwUvBypiAuof/ufeoP3AxezvySa6JiLOBrLFp+fLMTQtVFw09sIN5F61QuP6A/u6/HJdmD/SaA0oZU+bHgUYg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIF/yOcnChBHzSSSqkY9BDkguRK3H/areDymBUUpp8Z2I8XSeWA
	02tHpYOzZLrqdVb2xUAsPWucRgF8wjjsC2MBT8NxDYRm8z6jG6v5ZpCFUrVDwhgj6kA=
X-Gm-Gg: AYBFou1G4QHK4EvpaxwCQzuxATMfGrBDaZwMVQcr+1uFH6wJLjD9iM5tJeRuzWth2sj
	/Kgbi6OmCVgCCvvpKtOS4LiAidzUaFepRoKv0doEOPmACQlTNW25N2bUl7I7zMpz/tOA3bUJITv
	hSTxV4y+impDe4EMBAUqjr5W3kDLOPzuzbJdRSgw3XWNb5sIKjnKvZI2OJ1T+9RscnZ9o66VEY2
	qZR5xiBmybu8q+nqzfq5vwNLfArXvIgxRiiuAmKsvPMJ7qGssObubwoqRvTXlAN4Z7RhgO0haf1
	TxaiRUaZlE5PV9RXW/qHYaqi6uQ3XlTIpJhfPUdI7XhNH6lzh/+jrDbqb6N1Ck4qU8a62/GHiSs
	ntVAPqj5V6UOOhCn9rIeI1+K0HiTyY7nKDoiCIID4ECzLOZroSBX+FPFH/AHCBv2dH1EErz9iYG
	+8DnLczXrM8wClCPhXnCo5I78Na1pucfsgPfq7GbZ2D5lUtmMlKjWWTTv63nH+SFv7zXQYytL1S
	x848Q+q6+eIcEh63KclPxCAsB6ip7jjVj3Wxq21JTnrBlxbN0vowD4LBLTFRA/roYFXw1EmJLha
	YmO6UNktnEOaK23cc4PzF8Kt6zXGLkUEScpo6kSF1ldDA0BlVyGMQ7ztNAMQrBw=
X-Received: by 2002:a05:6102:149e:b0:7cc:9d46:f091 with SMTP id ada2fe7eead31-7cc9d470bbamr602076137.24.1792602256305;
        Wed, 21 Oct 2026 10:04:16 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc924348c4sm3367159137.11.2026.10.21.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:04:15 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 14:04:03 -0300
Message-ID: <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjqZPuAbHDdaexv@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local>
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

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> No, just pass that as a 'bool autoconf' to it, and assign those callbacks
> there, while calling dw8250_setup_port() unconditionally from _probe().

I think the autoconf approach works for Octeon as long as everything
dw8250_setup_port() probes today stays under it, including the RS485
detection and UART_CAP_NOTEMT, not just DLF/CPR. With autoconf=false it
would only install the common divisor setter.

> I think it would be less flexible, also it will add an additional branch
> (actually two) each time the set_divisor is called (not that it's critical
> but just wanted to mentioned that).

The idle callbacks have to come from the drivers, since the
dw8250_idle_*() functions are static in 8250_dw.c. Stubs for LPSS are
fine with me.

> I dunno, I prefer just a longer solution, but I don't know how big this issue
> is that we need to backport in that way (and not taking the whole series as a
> fix).

On the severity: the IER restore comes from a7b9ce39fbe4. On the A733 I
saw hardware IER left at 0 and the console stop taking TX/RX
interrupts. I haven't tested this on hardware with a real DLF.

Given that, how about keeping the small fix as patch 1 with the stable
tag, and putting the refactoring after it in the same series? That would
keep the fix independently backportable if needed, while mainline would
still end up with the structure you proposed.

> I have Intel Galileo board that uses 8250_lpss.

The Galileo should be useful for checking the LPSS path.

Thanks,
Vinicius
