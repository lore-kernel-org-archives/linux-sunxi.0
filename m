Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C116F0FE
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221251; cv=none; b=MTKoGrq6OMkEquao4VjOm3VOuIjeLFOG99sO3QWhm+sBnZVAWQox+6J7oyiUrFKfnbZKykmaB5BIvo/vZVXN0SRn0u335U+ySIWzwdhZloeRe9XEKn2i3tDFkImDMcrVpmoDDU6o7p0tv5vduSDiFsNfk1eaog7MRlIc4WuKL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221251; c=relaxed/simple;
	bh=K4gTS6aNOoGkLqoGCTSScxVNlWdF2p8+kobu38XGSa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nS/NtBjnBmB3YYwV7nbBBZOTIGAO5xqu/XOIwM/k/T9wT0sPPNkWIvwi/oU/O7JSkzrYdUnE0qDvUV8LeM5YDTVZG19crJMsi9Ytl0USbernB4ZKnU+7Lx/PmsWPAOqV7YBYiYQOEkXiT8kv9Lxa0p8fYKaluPDXLYlP+FG3k6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqzSV0U6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqzSV0U6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43937cf2131so19889605e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 02:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740221248; x=1740826048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gTS6aNOoGkLqoGCTSScxVNlWdF2p8+kobu38XGSa8=;
        b=XqzSV0U6SawG0ZjI6HtngtrlVE6wcWtQimTsJ9ywDFdxcX2ywhgd4n+Xx/ZVNcA1fY
         tEDwAhd/6Wg1XU8AzGq0a8hje7B02lCApSjnQRz+qqhdYEkIMHDMTCGCM/hZDTacn2ug
         u+nD/JUQzOu3WzQ0Dy15p6fBSQd7+yYtBSM3NhPfYuLtuZuy3oc3GYLgvjmk9EPLzf7m
         0jhPDa0iY0NzBQFYmT7ECXsfgxePe63HpBeMY2MlFh0bJGFfKZz5ziChWc82HDtpYrjt
         S7XT0uudsgcC6QcPdfHYPdTlxyj26Dg4F2pytxiH+gcPLlEkzNroRcV+tLXhWS6YvO3R
         2+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740221248; x=1740826048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4gTS6aNOoGkLqoGCTSScxVNlWdF2p8+kobu38XGSa8=;
        b=iNyVYY/0mRfrLCQprhtgWIdBkDsjgVCpUQcxzrvC45LKXstP2K18piNEPrEPtzqUbl
         L4np0NmzS/seAuK5GHDuh7ii4zr8A2srtRf+VA/xkI9Cms+9A9y/y4V1T37OrJWlqkm8
         3Y541/NV7S63Qz3bHVA6yaYeg63x6o0me/uOMCssBcO02nYvAORsOV9Psnc9EIuM0UP4
         HQUXAntgl0ZR87zP5oggrnllxWzHnTACfYzs8Y3i3IXoAWuEEuSS+87hr2zFcoStrZAi
         ThJjwhlnXI+xbPNyVt9Ow9hxd9hUQ8ynbz3ajqDL08T5rs1RoTwVjlm8PyRJML9OjEBY
         IyfA==
X-Gm-Message-State: AOJu0YzdfjvJusDvyNgmMJoEVwVMX97KdeadIEv/0i4wEUWDOB921aHX
	0uFytKFsDpxqjRPad4XLBNRliooyUvu/hZN1Ftbz/y5KA2Zu0PK0kLyzVpis
X-Gm-Gg: ASbGncvhpQ2gtkSW8D4GO4NIN1jDu4oWSr4088Am82Uv2cjYLNwimfkSypvujAeSim7
	1EaWkpxUUzUdin8/U0yrGZCsaeFZO3RiLnyVvVe60TJt8bJrvOetZUUEkX5dhVjw9R0dniSs38n
	YGJm2SWdoCDeM8a9rguXof1tZbswvpiJIAss+nqxBl9JMrLgwb4PXC2P2V4wIrt0HzjJxb8f/e5
	hU0wAb2DfFYfowVteHb5hhBZczjf3xzjz8JAEljHYJfhGiWOULiHMGBtxjEbUS1gXRyMwc/bkLq
	ql7DOX0B3N5oN1FfvL+edwtMmx6iwykQYieT/cDFpf/Bmk3SXxGSgZyRrvjwGusclWA18YT9xAe
	PKA==
X-Google-Smtp-Source: AGHT+IGMFat89xDslZ3gs0OEN7qP54MKN3a90GPZu3cGzZ8CzpD0nmIqc72q8bVak1DiEV6lXFfl7A==
X-Received: by 2002:a5d:47c9:0:b0:38f:31fe:6d23 with SMTP id ffacd0b85a97d-38f6e967ed3mr5620901f8f.23.1740221248358;
        Sat, 22 Feb 2025 02:47:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8115sm26269377f8f.92.2025.02.22.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 02:47:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject:
 Re: [PATCH 3/4] arm64: dts: allwinner: h700: Add LED1 for Anbernic RG35XX
Date: Sat, 22 Feb 2025 11:47:26 +0100
Message-ID: <2494727.jE0xQCEvom@jernej-laptop>
In-Reply-To: <20241018160617.157083-4-macroalpha82@gmail.com>
References:
 <20241018160617.157083-1-macroalpha82@gmail.com>
 <20241018160617.157083-4-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 18. oktober 2024 ob 18:06:16 Srednjeevropski standardni =C4=8Das=
 je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add the second LED (red) to the Anbernic RG35XX series. The RG35XX has
> 3 LEDs: an orange one that is controlled directly by the PMIC; and a
> green and red one that are controlled by GPIOs.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


