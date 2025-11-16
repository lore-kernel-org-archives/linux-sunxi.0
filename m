Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171F30C60B
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310042; cv=none; b=hDDjzr9+wIFmIlQ2LH1q/xgUkKyEkua687ZlkpZXZekpc1txtO7wu+mZeZOt2vDZK/7r0GnKREpkjoU4zzxea1k5vzW955+5vpIezRueR+JErpvB2XDa9osFKUSYBCqSAySGw3j2OTydsseZQZSon6JkjtDOWuY1HAiuf6O8y3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310042; c=relaxed/simple;
	bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOMLf4zNeBLx2I+v3OCC5LqNlGbjwIL14jqFvhc9KC0xYaE18cNSm3N0n+r8+gYi/19jMfeNB1CQF/FylXzkwswv60s0yaKq+TTmKrzXr+Bexu2xJqXPssRZVHtoZZJvLnDPR2EXNrDa1jkQkNED+e02enXR/vOHGXP/0KkFERg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWRnDOa8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWRnDOa8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d402422c2so555749566b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310039; x=1763914839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=;
        b=JWRnDOa86uvKgyf/LfLGoGvGXDqihn/DxO60dXGqOXk7T3KIJqRRYMx2tKW8MmUl21
         p3mdhE1lpEAeIrmv+WTRKGjfZgeHntCzfJcx7rAom2kVBUZlHGTsC8F8fEvg/sdhwe02
         t8G1bks7QavFcSVgJgjfLAZpwe9DN0X1Pz119mi2xz9sXpGeO5ODirvw9oOEJHKihEKP
         RJpO7VTcS57qYAlmRf57SXtFlRYhOZuou0v+ZAF0ljusJMUMIBUXH3lkEXdGRHQ/L6tQ
         AsfkOjxGhTunDDHy39o0rm5jUrNvAh5eFnTyw4bOwJ7hiTd3Z9JfzuZO6tYYqq6imjzp
         lTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310039; x=1763914839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=;
        b=N/4x2KE9KZbkiE6ZZekDUD+n5nW2x9NgtPtSRoZXIQ5MDKYUnGJeXxHcY7BTdH+pdj
         I1vkN2m9HoGBdCzbZwCTLNRoAZr0Dh18jRwV1wCP9yNnQ89aNe4b33/u8J24LrMNVCQ+
         /8ooKF76MlE+bm4B/WRztk8EoJy+oU1df89FFdTWYJRBl1SLsqBp+Mzvkn9MCX0p1dWp
         brt3dyaXE2+cSKLCMesWeB/mTa+rWaBMpJHZZx8TOodtwfQEuXrj9vJqIsLe8HE6I0HW
         wyu+kDTTjzPI76PPhp13TPAvSFNI8AhfNcEAipd9ZNLCKCFGeHR7pw3sKgTAAAMK67Km
         A9uw==
X-Forwarded-Encrypted: i=1; AJvYcCVhmDfp4CCO7L7r+58diQ9EqUlJiWSjUFf6w4hVIz/jQRZJ1XNq4UNulXOEd64dCILN3QPx3zfvQR8fPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiZpZnocpP+a3u1CEkKAeVIJi/KtAQeKlL+ofrYeFqzRzE159B
	uMkONH1sskipL6EQF2Esx+Fz3z4Wglo/kG+MYCxO39GF3wP5DodkZ6zo
X-Gm-Gg: ASbGncvaUsjSCe7XQEjmWw8P8PiKcFHr0iC5Bz/AyppnouvuKfkqHjkJL8NjX2vzfiH
	x1w/QpqwzLEmIZvrMj0wZNaeY+NCKKbMzxZJvs8q0kzFD+o/k3CHZe1ihicCThIZvM6OgSvaCKz
	xrwQrnXRePra+tNLhkVgCpvLRhSw1HJ8hVTH4lEwxjOvF9ZT0JlsXZg9IG/7Z+r/AT79ilPzpoQ
	e3JXOUGTM8Nuq8WGTgk6iScocYU+e028umVJJeNZ5MbNpnvB4Ma2LZ0NjNEuEsrpbP/HWApGDRB
	gD7GWp1C8Qds+jN/JI5R7LHUd52iYpHqRJmgH/0GswVHeP8TnsGmVoclaYKLl+ZKVmD0HohtOUh
	k58XSingzYpDmPszkacwAynr4iZ3iB6a2dSGUeJyXoulLjSlZoZXpBJmj9mKAKSBa6Q1MfaD9qs
	KzNyelQbhGkR12Xyh1g3+hQeN+5R1FSmuymExGh0ldIb488ull8iiO++3lCZsnLwjQ7ES1SXdUN
	w0OVg==
X-Google-Smtp-Source: AGHT+IGimZSxkgoIOpfCKAWCHgTmcdkmEWm6/VMebPbmR8mxODGAMWNDh5ErsjYw3DRmDL/5wQcxSw==
X-Received: by 2002:a17:907:1c81:b0:b71:2145:dfc8 with SMTP id a640c23a62f3a-b7367962422mr1083057166b.39.1763310038731;
        Sun, 16 Nov 2025 08:20:38 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdae69fsm852257866b.51.2025.11.16.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:20:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
 Maxime Ripard <mripard@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas =?UTF-8?B?TcO8aGxiYWNoZXI=?= <tmuehlbacher@posteo.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject:
 Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq loop
 handling
Date: Sun, 16 Nov 2025 17:20:37 +0100
Message-ID: <2804881.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
References: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. november 2025 ob 16:55:26 Srednjeevropski standardni =C4=
=8Das je Marc Kleine-Budde napisal(a):
> Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its bits
> to be reset. If we ever reach the condition of handling more than
> `SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset all its
> bits but without actually handling the interrupt inside of the loop body.
>=20
> This may, among other issues, cause us to never `netif_wake_queue()` again
> after a transmission interrupt.
>=20
> Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Ker=
nel module")
> Cc: stable@vger.kernel.org
> Co-developed-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> Signed-off-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> I've ported the fix from the sja1000 driver to the sun4i_can, which based
> on the sja1000 driver.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


