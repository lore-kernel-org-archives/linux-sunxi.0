Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1934A3414
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jul 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045344; cv=none; b=WKs8DvHnckNI4Ff3Upjqw16LDX4qoUVN2af3W9Id+MGZp5bjY0NANiWVIC7kZB5fmTDin5oZ11YEz02LDyDoMuiGjMKNT4No6pVeaZagrriAz3Wl9TmGXvwNkHrnBh2/Qvv7Hm9kE2qlB9uPWS2ci4GZ7U2GvDkM8mZgPvfv718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045344; c=relaxed/simple;
	bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuBcLis4YSCrjKYHwiOKq2xZEeugEBOrK0+QFhjiEUNU4qYLuoz97kDSgsXM5uAg7YduLHqcu4qKxulnCn4O6FJOeJ5H7uSR4aI4GBF3qrcxT5Eq9DnJItZwU0QbuATLzTtqgrer3Mdpux4zWkCTvPLUP8b30STx2Yo9OywxcbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qp96uWC4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qp96uWC4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so28867235e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045339; x=1784650139; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=qp96uWC4SWfA8gX1XUI2q8i/IpBLlnHsfz4YNHU6i2t/sUoq8Jy3diF0Xk9fpXM5IO
         aQRfURWGaqFMKOdQOrzY35UuOmIfOY+XKIaW514pjHaq/XszJwf+dXESh/x3ATGzcPV/
         ALzi9JKdbTJMoRlzpmFt7/3QHERO1/wI2zY5oAIohCrn9r/ryAdS9lnpT2LbI6dKfmAM
         2AaMDi6dV9iQKJXnA+BibceAM2Jjjey5Z6EWwAVqsH8t0tBEmD5Glt/RIXzDlv6tsXIl
         LHadozba527LyHInYDBDIKZfn2MOp4slaibhRH9JTsPS0AtKHcnM5TEje/gQXeCgLRvq
         sDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045339; x=1784650139;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=QU82sEZ2i32W3DUV51rYOCmukBIwxvYPAdeR4if5CJmT4va5pwFh7sW7Lhzdp9WuW0
         LC1E4oDPe5asUU1Qii16+zXo22jF5eGRwDNRnFiVB1how0bb4CdjSVFE21+3S+IqipGD
         dynO3GFjl7YvGHvWUH4GtbCc9a56w4qEMSjYqdMLzCT8NltnfAuAvbQHkrXL2HpuMZQp
         0UnjVkqYGH9PmtdgCxnm8p/cpXr1Sh/sBY9zJE/ApQk3yLFakoE8XbbfZwcvKFFQREHS
         jDLOdTMVDiYE4cQbTJ9hdLcbZYU89WgdaTuGnS6VM0qKhaD0T5V1jYOEUazzEetewCw9
         DNaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUcoWKk8F3Z980v4W3pHoFUcJ2KX05nN9hNW6LoLjKYkMbZmw4wYuF8D+uCVNE5jftdT4me2iCrW2EtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoTIF4LhnnpvdDX1F5woG998dlp2zRR8SL7AY2rXWyI0ib2u3p
	Uw+krcs5DtXvuqpyGEfWL/3Ug2WiUQlNa+4Q1q2FUe6y69YvBg4zA4Z6
X-Gm-Gg: AfdE7ckQO10wWVq8Wv0wyKZNWi8LdDjxU12WwHO8TxRcrKCOGX64LsxpBkK8V2OpYc3
	+6oFknF5/DO4/cZSZN5XosZrfTVjwCFLseL76QSW1WFbegkb0kdrUw7UCCHJ1UOnsiRzyIQKB4l
	icpXtik3LQ0rywWIedK2/Yf/B2jnuWoixfmWpKDYOAurb4gHudT5iz3oLS0YVUmP6vTjx3VYiV3
	EZmrMxe8MuFx9/tJbmQCgvUydw22jvO2jnpcTPKJZjIawZcN5oTx3OBBrG1jmOrlFiMzlCa/JIq
	ffJPULCAf+jd58tJpdCNP2YrgrpM/VvHxDXZnh4qwNFJWgfz9xsKXec1Gw7ygVztuG0/V5mG119
	x+F6mk0HIbEyYc4CiN4TNVCFNA4S4RaoKBtZ8D7beXxeQwskHtcOza88ho9Y9MWwf2L1w6fhyk+
	+E5j4ID6wwScOvv0HDnbzLt4+WGGLj0OmLKzfpZhesauipqfUppyETkjt9zFVVUWEEi9pbv11Hp
	a9c0HldVAQIADjIyx1WiqjRV5Vi3SXDOPgvgjzs1/MSaaZwjCfbu70n8QbyZKs3mNiiiC+OUMAL
	hUAuYI/TKSktrLe8/RCtHVfUvmeMVpIg/NComRIn1+pwkqGd33VEpZaPLHLp65vuSPIkVXqcidF
	QY0vw4tUuouwZ693uHvyPWVmWDqcydwMvBfxwny1slzE=
X-Received: by 2002:a05:600c:6303:b0:493:e4ce:acd0 with SMTP id 5b1f17b1804b1-49538992918mr33564445e9.1.1784045339225;
        Tue, 14 Jul 2026 09:08:59 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f9402sm88923595e9.13.2026.07.14.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:08:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
Date: Tue, 14 Jul 2026 18:08:57 +0200
Message-ID: <rIZ28csxRO67EN6Ja__8tQ@gmail.com>
In-Reply-To: <20260714113304.270224-1-wens@kernel.org>
References: <20260714113304.270224-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. julij 2026 ob 13:33:03 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> The H616 codec does not have capture capabilities. Set the
> .playback_only quirks flag to denote this.
>=20
> This was somehow missing from the original driver patch, even though
> the patch prior to it in the series added this quirk.
>=20
> Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


