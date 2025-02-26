Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEBA19CC3E
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585284; cv=none; b=eZ5d2Q3BiX2mdEn6s0Nac202WcPyJMNjH3VDqWg/RyAfwr4IhzkMdcS/3MAuL6Zpvesyn7bd0deHkMmJRy0HqP+/UeJ4uaHnfy1Dv++2YnHcF5kO+QzqFrVXaqHMTSat3XtwQsjJdQdRlzOctnQV6yz8YVDcC9aJe43PmvWcslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585284; c=relaxed/simple;
	bh=xL+xw2Aw3r+AqvgFsvVUq6XxhSK3pP8lfoSWv8yszpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLKpCrR29nNvDbpFWGLny1ENAbdqQaV3a2BDal/xZ3wEYg64WQKAeQ2YLiRc25qXz1WWynH7GlB2ikFIIwEP2RXvJAwvwINkyDdnZkll/RdDuwNWm+fWdomPvOZG8sbHZbozvHWzgw+B/mOtj+ZtpTm+7gJGjSaS/zY9U4Caeu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAB3qrSQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAB3qrSQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so11426425a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 07:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740585281; x=1741190081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL+xw2Aw3r+AqvgFsvVUq6XxhSK3pP8lfoSWv8yszpg=;
        b=cAB3qrSQaJlNvuFdZa4n8j9AAp1nYpg86mKg0E8OWva2datybwu2GiZy2Wu6EmVMyJ
         /WLFGaQdL+fJ4TIUTCCJ/+EoYFjAislj8I2S+mt4PuPruqlNPJGeh2UTYL9xyVp7oYZA
         0xmcvWQrfI7oFhbaconMi1Elrs1ujQT9yw9tcyUIrvryc/4jwJaGWIBwEDKx7qh0dRG8
         TbRll6seAtsV8I6v6UzxY8CTdbHK5r1AMHQqIYe3LeqLZpc/EHzbaKpattGaM5t48BLt
         7sGgceHAD+yqFktD7IgDyXTIwpq9jWN56xA2WnY8RGRiLAjLya9bA6UhJyxZEr/s/Rb2
         K4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585281; x=1741190081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL+xw2Aw3r+AqvgFsvVUq6XxhSK3pP8lfoSWv8yszpg=;
        b=AQ4UUI5Revl8p+N8QlNZpxd/Az7z3ATS/Mc3LNvY2VLgbrGFQsXoxXP6ODV+avnaRZ
         SgukMXBMcD6ly7JeK1SUM50zfHLtqcQ5j04BUYcySX1m4UkJIXPUC1BIoSgHtDi4qdOp
         cIW2uKdZnSbwhTP4/jNh5rvhXNb+5mxiqHU5yWma3G5mdJW5Cu+m1BkyCFTRYoVPn6g/
         djS4SryQg4nK9Aq/pT+Vb4hvWUo5/XyB23CHhRl9qIxCDNHr/Gw6cFCMrNAo08k4dKUl
         Ekg27pvn8InL/M9XxAHNsYvrIg/jPzEqQhghLS3lBJ97Sud9w62Fg40toKN+beV13x0c
         eULA==
X-Forwarded-Encrypted: i=1; AJvYcCX8aJr/Wb3FpzqGxavOInc19NAIFsOId8U2oy4ikqpAUnBITO5rH0XZnPY7KUY7DWg9istmzm8l9xEuOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2MLJ6T8KQjkBq7KAu7aT5xkFIpCUiMeRIioV3/KHGqupDVfJf
	JbOl79dvAHuYl3w0lgKhqKSFg17PkdELueckq3t4z3Lnw3zSMhQD
X-Gm-Gg: ASbGnctW4l4w4Ls7EjwKtjnVOpcCTVRHIATreEz5KxUWzu2lIA4QIpBLrWVmLZ0j8/g
	2Zz5n1cLFdZQQi6tMUFlea9IT641PBVSfAF6agCcN5x3+/Yw1h/75chX5fidA3QiPAPbpKbrpb5
	f7lu/Ru/OvlVKM1q5N0BOrmh0oc34BFpf1ciLro+WZ9MHUiHuqDZ80dNpTcy0HvCUnVw74CmOGw
	03njoZ3p1mmW32e+0ILWOE0lHRmv5gVmDNZ3QYWymXm61upT3NwHrEledmq9nx4dZXlQKA6G57a
	bKStw0ZQ0ufc+LJfUlTsMP4mgnEV8gOTwP6EN6JPz/6bh1j59+BeO2OdqPLW2tY5AkJfcdIs63C
	/lQ==
X-Google-Smtp-Source: AGHT+IHzcTLAAZYtrgS/xRMRmyIBTzvv6btGp6HKMLWs6niiUU/Cs8bJ2GYlkNJzz/HT1K+pdG5+dA==
X-Received: by 2002:a05:6402:2b95:b0:5dc:7725:a0e0 with SMTP id 4fb4d7f45d1cf-5e4a0d830eemr4764150a12.15.1740585281184;
        Wed, 26 Feb 2025 07:54:41 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b7174cesm2938378a12.34.2025.02.26.07.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:54:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 Icenowy Zheng <icenowy@aosc.io>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] sunxi: mmc: Fix T113-s3 MMC clock divider
Date: Wed, 26 Feb 2025 16:54:39 +0100
Message-ID: <2359168.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250226113712.1257061-2-andre.przywara@arm.com>
References:
 <20250226113712.1257061-1-andre.przywara@arm.com>
 <20250226113712.1257061-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 12:37:11 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> On the Allwinner D1/R528/T113-s3 SoCs the MMC clock source selected by
> mux value 1 is PLL_PERIPH0(1x), not (2x), as in the other SoCs.
> But we have still the hidden divisor of 2 in the MMC mod clock, so
> need to explicitly compensate for that on those SoCs.
>=20
> This leads to the actually programmed clock rate to be double compared
> to before, which increases the MMC performance on those SoCs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


