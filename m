Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051A82FD1AA
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337046; cv=none; b=AQeJ4emkRjuPGL5E9iHZYZAvq+00LPuoYVv/r8lxGAqry633JT+x73wwTofbNh1qXLHnnZEoYWUs/vrA2PmC+QYP+s0Ph3Hm1wkHnXd/KidvimPgjf40TfHcftGvHwf570WMdSMwhXnJJ9in+EKdjJPYTd0quPgZ8+L0++YEwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337046; c=relaxed/simple;
	bh=nFJnphqUQG5wieQkJ7Kb9J+Gt5X/QP0brHiBPfCW6d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWUti5ai9g0LtsbSl4ZrBU945nggy9vRC4eJBnncK9o7/cu+8sl0rRN5JUvrU16y7hTHMtmdOzBtrAmakfm+NmdhDJzfwLwm96vi/RQeAG26hcWtXJul0swAiPzYtYsYzP7AgTu0hH9kG9uRFygw6Tq8s+S3KrDpgB/Pc1Zc+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZOuxXre; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZOuxXre"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b64c8311so17951125e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781337042; x=1781941842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlm0YHGLM0VfFF/fXJEvgkWs1yTQHLEduURYTbkabJ8=;
        b=lZOuxXreeyQokLF0a9uxd7DiuTCn0Smr9Ykt/lRH2ifbl3mkFB1gV6NJFsZs/7laa/
         Fce+J4jBrKaqU4wsIR084FQcOYGKDNb3ap9ItHLS6isaxZynt5+fsTXQ559V5s6qmq7o
         9BK/ZHQn0eMiYb/0xVpgWvagKTxAO62dw2+mGGxUxVQwJ+i8hKHcp4Xvn6KER+cC5PFj
         dav3dKbsQ3Fnb6R1zsROByW3ME40XbVXLNkk04HB8CCXBoh1Y6n7lWz9Y39J1b3RcyOT
         Sx5eRdXE9QYjCk45+bOjY1ikjg5I9JBVez3Tes9CV5qBySWAp5H8UGGqvEwvS4NWkk8C
         vZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337042; x=1781941842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mlm0YHGLM0VfFF/fXJEvgkWs1yTQHLEduURYTbkabJ8=;
        b=JUFMIItfMNJVY4wVXchfpnVSda+JEl6bBRSwKMlNYmnq57q8IXSRjHoYH3iVo5E/6g
         d0gOrz5bHhU9MeF8jwA5mfUqNxnTgLLi9jsYJlIzQHXzFI5KOSc7mVwh71yruyZm5HxK
         lzV6Xnm+a96yKFU6VEtCpdWb/pvtc9Yo6LAAl6OCHSqnUZsImtdxB76UBRls1xu37WIV
         R9SWyuqjJZR8ybRxR1AtCNitc9YSGq65Y1Rx5E4lg9r+Q1zx97YrqvEVa9V4SrwlDpTc
         9BgcY58Izw+9IzJiljKf+Z3wNNok1+ymfvaPmFxUIcMDzSaRrajPjAGWH9QcN1VCJk1X
         bwYA==
X-Forwarded-Encrypted: i=1; AFNElJ/tum4iAi6jZkdg4H31GNLOJQu6WELv4YAkdtJ/iPHNcIUUjM7lZzqCqEE1XW2BeX18M59t3HkFXcf+hg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC4i6mGddhpX3DiC/Gkk3sCevJaVAN32H9rRGf5fvg55xSLz0K
	ryhAqTNtWlW29eD6MOX7RTy2OpAa6+v0fGNXGLvMYnTgJFFI4gUXcrZq
X-Gm-Gg: Acq92OFHUpJRobPOHmHkXdkEY0hvGem7S+WWRqfEkmMDhLw66y0D2UrxPehVnQwqOKm
	pv1omNYbatE9Ao25P4i882sHpibws2nVjexw0BwZa0g+bAndJSWa09uLG6RVxDdn9n+1gdKptkb
	OpIPyAEg9Yjx89a0maNZb4+2rwTIC+NKjCiq+bi3LrV3JzgKfmZtAuUNBv8gESjWjO4/fVb/gt9
	uDdNFSv3H8mqhOYWhA/rawlJypxT5h6BW5ZhMgvHQ+WTUzpWejc23Dea/q5CDqcU4Jat/jw6cd+
	+Ebj7RL6+EgGBv8e3ofBlwODRItPOWAV+EO/+RnM+VuhpWabGmMrtRD/3y6a/exrP3JGTW6CKuL
	YUaddNo6xInupZRZudi5t3j7NK/fZvZfvkY2xjOczX7uSbWNwcTq4NkVnr0y6t61ZsC64Qekypl
	zZ429svPb5HSwH5xw+MLTpld6waXiaf5yiE42d3lxmzB9y
X-Received: by 2002:a05:600c:820c:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490ec4d3407mr76769065e9.15.1781337042183;
        Sat, 13 Jun 2026 00:50:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm145232805e9.0.2026.06.13.00.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:50:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 Wentao Liang <vulab@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
Date: Sat, 13 Jun 2026 09:50:40 +0200
Message-ID: <p7BkDUOlT8udh62CkXD6NA@gmail.com>
In-Reply-To: <20260607030950.83636-1-vulab@iscas.ac.cn>
References: <20260607030950.83636-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 7. junij 2026 ob 05:09:50 Srednjeevropski poletni =C4=8Das je =
Wentao Liang napisal(a):
> When sun4i_backend_init_sat() calls reset_control_deassert() it
> increments the deassert_count of the reset controller, and must
> pair that with a reset_control_assert() call to decrement it.
> In the error path where clk_prepare_enable() fails, the function
> returns immediately without calling reset_control_assert(), leaking
> the reference count.  Other error paths, like the devm_clk_get()
> failure, correctly jump to the err_assert_reset label which performs
> the missing assert.
>=20
> Fix the leak by using the existing err_assert_reset label in the
> clk_prepare_enable error path instead of returning directly.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 440d2c7b127a ("drm/sun4i: backend: Handle the SAT")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



