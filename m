Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA7202992
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732615; cv=none; b=GJP9j31/mTlAzxbnNFPNo21JwKuUPTrbP/tb8fASpSXBH4RkwpvFYz1jim3xznpcZwnNnCRcSy+PCyHGvR7f44GGHTdoZ8vsmqB9olDucStjdE+xip92+ihY02tFZi/IvTM0fNBC7MxbQg+UKUZQR2xkYYsWFJJtLiVjkRxS2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732615; c=relaxed/simple;
	bh=ITGzomHGqlNZ+3M/Bf4Vq0obByW5e55Dh93nE+DdX8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ApPLLXAwnCaNYOkwpy108o0xhK+ZJ2n4Zc1nl61QgPOO5nkdV9gOWPooKRW/XkGciNz9JOLjjV67JlSV22sA9YZZW+6cxcS9nNXv4IU6cDQmwuNUZcIRoZa/++uwpoZZHKG3NNRHiDEk2NEudQBKKth72A8fm6mGk6hlpO2//SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY6zmaFX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY6zmaFX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-391342fc0b5so2825451f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732612; x=1743337412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITGzomHGqlNZ+3M/Bf4Vq0obByW5e55Dh93nE+DdX8I=;
        b=OY6zmaFX8xm1Dj3V9bHY/mEer8fPuMgX+9oHhBe6yrV0cjgtTnhF9cvDG1DS0ucAIe
         AiQlmqPWCmzMBzSCnftyuaLIRg2opE5LayyiPSmX5dc2ZvJ/3u44q8Oz3Yi5c+XfJRzB
         9M0E/4cp1Um0NvGjOH0EFVkZYLHPiHbZFPxdp7L88JAEfsXyvWGTnd6UWHpz3C0CHGt/
         ql1no3m90kcHU8W+ZGftSl7V4ipnFs2cZ6fNdimqkx02QtLWm4PhaxqUmYACUYYaAtZN
         d9xpOQWTSX9z4voXW6FMWhbNs+5eaN/7Dhe8Sg45Wtmgsm8jXFHm3GnT1NhZk2FpRt4l
         V2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732612; x=1743337412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITGzomHGqlNZ+3M/Bf4Vq0obByW5e55Dh93nE+DdX8I=;
        b=UgYq+mjXvgwVBHkqqRKmZtea1r/yxbGLz8Xc5kAuz2e9ydiHFcDxziXTo3/ypwUZUa
         GWYcVnsKmvU5AknaTBly8lA+zpN5u78IO4a88tJ/QM+UC3H0f0v6N497m9goDVhvdwH+
         I8gQ9e+N31NDbuCz/hkRlI6M7N9yS6qUX/FuldEcDJruWsuvDxWHABWYUWeN1l6nC2/x
         6qv4+ZJCwi44AZV8M6OKnU/Qfc56gX4puOmbkEAdDsPLO1TpEbjds3YaaH5i2mqRjOVp
         cmlqcfNZs/gRvVzNy0XA8cqBeeVNNN3/M5uL50Fq2SgR1DOxBSNcZUtNVnRqMq+/Mbq5
         t9jA==
X-Forwarded-Encrypted: i=1; AJvYcCWNtfCZSiVO/Zbw8hSaXP+qBGk3/iypHtKh494FF9zhd9Pt8QopBFn+PCntXgEE6l601B9wTSKYsFgb0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSXjvxgv/w8jVniAeBUfsyBKh9dSF+ALI1DjGuERTaVRBrzf1
	N3tYtHNxhidlgZYIaW8n5cwA2lzG5M5iJZFQm8QvJyUw8QKX6eO+
X-Gm-Gg: ASbGnctmsyh994MycW/jJggcz6fQrtrmg2b4Nw24xIo0h91tYeQjrqPE4brETLekGrS
	be6S+b1AlhnJCr9orWQRVK9hKgnp4N9IVrSh5LSS0zkOiz2PvNJOEeQ2/yF+PAEmwgmPrBugnxj
	BYbZ8MN/QhlJyK7OU+Bjqkbglzx/urnLY1kMFHFXIlTOX93oG6r/DRTvnYFAWaXTboMD4uldhb8
	iTE9aP1fKAsnYE+wWAWzHDuA4JCXnO6wAuJOhujKoLWUAtQK1AkVO2yC0WshBQCC1DLzLPCT/M4
	U1BN5V9+r02DsTYZG3w/v7EJ8B4Jddy6BiSpIt0AlUcic3Re1ChzKILwCdmi1kJWPlq2W4NMIX+
	yTSS5bLd3Zi+w+lDaqceF1h/o7fcHCdQ=
X-Google-Smtp-Source: AGHT+IFdTpMYk1hbEnwfk3GGoCnQQoigUura2Ouq45WN4gxQRkyFCNphUBiIl6z1NzLUpK+pWIjlQA==
X-Received: by 2002:a5d:5f50:0:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-3997f90ff8amr7922895f8f.23.1742732611795;
        Sun, 23 Mar 2025 05:23:31 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fceae03sm87764665e9.8.2025.03.23.05.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:23:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 24/34] sunxi: armv8: fel: move fel_stash variable to the front
Date: Sun, 23 Mar 2025 13:23:30 +0100
Message-ID: <22634483.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20250323113544.7933-25-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-25-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:34 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> To return a 64-bit Allwinner chip back to the 32-bit BootROM code, we
> have some embedded AArch32 code that restores the CPU state, before
> branching back to the BootROM. At the moment the pointer to the buffer
> with that state is located *after* the code, which makes the PC relative
> code fragile: adding or removing instructions will change the distance
> to that pointer variable.
> The "new" Allwinner A523 SoC requires more state to be restored (GICv3
> system registers), but we must do that *only* on that SoC. Conditional
> compilation sounds like the easiest solution, but would mean that the
> distance to that pointer would change.
>=20
> Solve this rather easily by moving the pointer to the *front* of the
> code: we load that pointer in the first instruction, so the distance
> would always stay the same. Later in the code we won't need PC relative
> addressing anymore, so this code can grow or shrink easily, for instance
> due to conditional compilation.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


