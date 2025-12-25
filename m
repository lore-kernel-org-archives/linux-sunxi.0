Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D21EB5E1
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687774; cv=none; b=ixsV2oic0w2zZ9BOLV3ktCOangY/xzM3S4BI2EYKCkXQD1darkih0MlT0uryS0Xh22WkMStGiQAgwUMe1FCHSxEbsQ8dPMw7yW6Q2jS8+a9zo9ILY5sIwHtmiviOMAfGDc9MN9LtDeSG6uUTwEUqLfuISd/CdpHLw/mcD2JXuqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687774; c=relaxed/simple;
	bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOJ80qgx2vh79w0YiqXMwATKDUUfrVm5be+ZY93r2Giv6kFk79CUN5XT+CmDJ49U2w/pWIxNlF3waS+Ak0E1TEbdeT8oqqCkHsDbRSdhZefryXuK2MfaN+miu3Mmi9lPL1b4h+/DZB2MFitg4H2EZWyPwqvGr0bVh3Hul1b6B7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzwCwCDq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzwCwCDq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b832522b47cso80519566b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687769; x=1767292569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=YzwCwCDq8RoNu5XJuSXy6eITto7uubGGR9wI2Ol7D4DUBgGRmc09P8gKcHL51TrEyd
         pyLjqN0wAce+JtaP9kLV+Z4A6G22Vmre4TQpENAFDG/MxILzo5hyF4PT0VH7B18HClF+
         SyQPOzg7J6OvPjMUpcTJeEbCV3Rn3MW/uRPr6obnf09M+QcaBHOwZ70Rm/K7tR+0S/xQ
         PSuGrtylrjkUvQVylUPT0VsIJHoDMtsmvD9d9O1rKsu+nvbZojfDmt8wBDIYku2LYiM7
         D2bnYwtRwxL0B6viQ+DCmKP+Zhe41E+jDNOgeMoaPVeTFUadbXIFjFerMfzF3rsEuCgS
         EqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687769; x=1767292569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=OB9b8wYwJrgcmvVS/QPgvkJhCrJ3ZbH2BeQNmCI2SoTFw4vA8zbyykL96l/4++BRig
         2J0dvHlYMBnUaLKx+/fMzZk0Lz5MRWxLR48+mzAyvuG4XGersyK8cUkxLGggo7658tku
         uYtHcQcNBNIp2dFyIm+6dfueEwNaICZX/SFntZejy1f81RMiYq1hQx1u8b2WPkH1kpxS
         BUZ7By8aVppiSD2xxOL0zgWHhyBend0zg7jV+Djc85zmbzM7KVqni40kSuJQCfkO/EHs
         7nidnEOiel/+Tvk1c85ewGSvIouDXVDk/5buPw157gBpGPvEF0R2PA0IPwzV3cwqo2mB
         EhKQ==
X-Forwarded-Encrypted: i=1; AJvYcCULc6KWQtkYc6yC3VEwMlq941zrLP4N+EiySrYb9r2W8mQMFgydeOzJf78y4IcDTjt0m2uOS86pXJ6Arw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTlkVjtFs06lpiR9+oJgsI9ySh2Rek53ETE8R3vW+EaWkhyyqQ
	IFT6v9u/K3b9jIYel7HovgUyEGjEQ23jvXwlsgjxrX6WazocoXQQS0lg
X-Gm-Gg: AY/fxX6HoD3HVaEFJUO5Z/kbiYTEyYdqpQrKQGMi690UCo/2WP42HCcpDBK+c44ognc
	NP8k6Mkhzas45MshlAM9WcIDMbEiAZ/70V1dxSjw4aUdbDjLoEWhsOpXfz7NkvjufzSqfyHpqHY
	vQ9J8biNg474UyLBnUeMZQajUlC2QIy7r0TNNt60lxzLzGNzc7jewX9kSUjX5nlZH2RY46bJvgW
	+jlCB8LCJu3B2AaywKD68GRgQyCy+V7SYslmdh0Qd8VWuB7QAABHATubKP3PXXDbCPEN4dqsTM/
	sEeAas/L+sU4rQ/vG3ayhMhkOEJ8Wu/0mcWX6RNDzWqwLo2rtO+0t6UrS9O0YQUqQvpdCoB4LwT
	OUo9ZqVN1HC/iMNQD40E6AmuMtviyixuHsMksoJWMPTLQGqG9gNBDEEggamnXvcjwRnnrBuMnN7
	vEfZs5K1glOBwahKBT8eIHiwpHkIHctIVydSjJsTgblQI=
X-Google-Smtp-Source: AGHT+IHEIjHpbPASvhXMCNryNTALHso5yEhVN2Zt1Wti83jtrsqyLd89aktdU3iFdV+yBgA6+HZu7g==
X-Received: by 2002:a17:906:d54d:b0:b83:1400:482c with SMTP id a640c23a62f3a-b8314005538mr450270266b.64.1766687769040;
        Thu, 25 Dec 2025 10:36:09 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm2154858066b.23.2025.12.25.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:36:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with
 leading numbers
Date: Thu, 25 Dec 2025 19:36:06 +0100
Message-ID: <5080862.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:13 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>=20
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>=20
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


