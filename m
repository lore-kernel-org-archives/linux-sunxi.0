Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778A21128F
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161746; cv=none; b=et10U5j6exrkaqDJC6G4dZxFU17Etql0J04Kro2qG1oLsbYRMJSaANGHsRAVbqTsXRsnySZSr/CaVkoYlb1/KfCZG1aiV7pw/08PNH+1JoOEeBvuJeQnKLvTNPrta/Ggbc//hRBbIZEQPI363Dv2/XKYecDsBhy90w+SNgP70pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161746; c=relaxed/simple;
	bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pENOL4HHcFXfAjDai+8zYQqKpnF+LrZbXUwQHbYmCoWU1dPp0AX2/W3tId+j3wvlvJEQ4WQ1w9ZDoYpS0DQAEiS8NBrQNGHzYDwlizwSjKvjMsY09VsBXlXgPb/N7cmxqxG6R0bmqawe/4FQQYIN2owiK4wzZvLNJENnt5qS8aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1hgThDB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1hgThDB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f3ac22948so1265162f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161743; x=1740766543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
        b=N1hgThDBemnV2FtUSYjwbt5v5RiNBFxetcFDsxHJCZxyrzUgUKndPHBqqoneEnfQfE
         M7pX8NIwD+rs5A+YdFZ/QFgHznOWPpR+rXtqjn4qF0ss1xR7u+NYKwNqK+Nn67Ly0ssY
         x4SLlMUVE1/oiTfQvWxLoFfZI5AiSjbgi2xAxoUsLsoXuI+yXD/0vQ2k71uv2K4pmFV7
         OS+h+4ydusBS8taYmtMUHgkviMUSRcYV1QnbINGGMiz2tbwnGdiEPGLpf3e7aazuAsoe
         UJW1CdPmdSUV/iWplG0E+3C3UWdviFkyZSqizbMPMDZA2YGV2MuJBc4P+OQrevzBiFpp
         okTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161743; x=1740766543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
        b=g60UfnEmCtbR7azsKR6wdDvp5lUjdkmMVZPHLvs8ydiANwNCY+KdGsSVQKXi7mBudZ
         OLO4rk3wMi6FJQq3saaUyoVWV/eW83Mf0gr+JwpuqbLcPNZTlcZ/lZtXcfTsy2uhyS0E
         sSzaBBL2d6RbDfiJiy8ZuBUXOhWXmpzIxazeZnQHA/Xer2jFo/IBfowAqwj0hCKI02zo
         CBRq9hibAWFrRnhlHifgO6LdlOUkucShDnLwtVwpkdavqryTR9vzK5ffGv4Z5FLid9zl
         MTevDMmU9k0+As4/db+GtRDWfNRWjPxPv6OOssHjxoXGD/tyBXBT3ZTWmGR/MNCJt0bQ
         gC0g==
X-Forwarded-Encrypted: i=1; AJvYcCUrtxuHxCiPrGda89TjJuF1qqfaspBjOyV69nuQd5CVxuUC3HREmJX6Ei+sAtTm6lT6z/h4sme+MQdR/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypv0q/DjRP2IIgqR7E+0XcTKuVTAhdnVqLf/++cnHcCMVHryXY
	luoRJK3DsvsFuGdMu0ASHl3ClMOiKLXgB6qbkGIlXCpMpeVUkFes
X-Gm-Gg: ASbGncsR09DofEHXeRjAx+lUw8E0YBeIcezOiEczHCxDacizcTTfZuV8RN/PSefPc8v
	GQZChOiFApCXzjod+jFbOm0OlWvn38Yq00y+r66LSiuKN26wOrBlFb24DOUKUk4foNA6/3xH8PD
	Aj0W/y+uih2P2HwMUx2A4uGbL36m0OIwlLPuULmQIpDxJ94IUhoIOfdHdK8tBiJZpSIfXdt352a
	IZbdjp1n4rkGRZl27Ac5RymQJ9mllmge0WOOas2g5WdtMzopnq49PsjNb8EQ89wJAUac/QxPXFY
	b0gWHsPzse5RHtn4RjeiHEsUczJ6SneRlDRQHlSMo3C8QAN8/U1c6NHh29DyF/Tqh5ahe8LFdPo
	U1w==
X-Google-Smtp-Source: AGHT+IEUcd8ZVq/GSMpj0nEp4xNKJ3oVuqW8jkTX+24Fpx6yj7XA7+1f/SvbeSr2zKHVbT8cItUZ6A==
X-Received: by 2002:a05:6000:1543:b0:38f:46c4:4a6e with SMTP id ffacd0b85a97d-38f6e979cdcmr3162525f8f.24.1740161743326;
        Fri, 21 Feb 2025 10:15:43 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591513bsm24244645f8f.55.2025.02.21.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:15:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject:
 Re: [PATCH 5/5] arm64: dts: allwinner: h616: enable Mali GPU for all boards
Date: Fri, 21 Feb 2025 19:15:41 +0100
Message-ID: <13703667.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250221005802.11001-6-andre.przywara@arm.com>
References:
 <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 21. februar 2025 ob 01:58:02 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> All Allwinner H616/H618 SoCs contain a Mali G31 MP2 GPU.
>=20
> Enable the DT nodes for that GPU, and specify the regulator providing
> power to the VDD_GPU pins of the package. The rest of the DT node is set
> by the SoC, so is not board specific.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


