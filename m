Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD493C278B
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348519; cv=none; b=bWUuQ2sXYpz0UU6ErBoeVseXPK6bTtLm2wsfUOYlMIUaYNdMtuRVDPzLxrkU8qxQM5ln0/oLbs1iwOCS71kDjU42L25heKtss7ggJhzv+nBPn3nMd9J6JokWYc030XK1AdiksUZI/fhVbfyaCAH9lk+cZpYacGkEt7h6EcvPIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348519; c=relaxed/simple;
	bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olOb7lEpKpgrInu+fgtmfhp5JH5XJD20VT/IkM/La1IATkVg0r4NyX0I0CZwXDW6lP369ywC27C6GHHAxjsVuUcoFwDYBE8pOyeCUOYYbS4ZgbLo8l8IP/VXp+VrUSIu4MMva2XecR3N69hcM+zJ10PCJajPD/AlcwBYXwYf61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJyVGkvj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJyVGkvj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46066e640easo994959f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348516; x=1781953316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=HJyVGkvjIj2SxefR9dRskpalIqHQSDtCMlov4Zo3OqX2vLHNsS4cb9RiGKCpaXpjW5
         bhp3DdaQnjz9Lhqrf+xFCyDgiSQQy+CbmiuyuhkSrE9GO1RTgYyJMNkC4Iuda2oC0ziJ
         zk4HwdbbXVfgHoA+wngstapkNxQY/F898jjU9tj/aBrJjndHtlKcgbqk3gTBWVVIDwkb
         1ArWrzqzex8u+f649OgUy/D1vN/n6JN2IR1j7GJV3+IrnHFLXGpE3JOnRzUI7mzgkYxv
         CjrDGKOuq29A/YR0eofEgYf6dI2++onlZdKpjnQv35qLrAvTE7y16302vwJ2bMoiZH4X
         VIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348516; x=1781953316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=p+e6jnyZwKAUWrO4nvemZglTFGMwHL1/tQGDmezfw+7fIwm+6jfbgjHfpLKILA6T1u
         sV31vsWTPjW8Ulzozq2uuPiiIF2DTRqxgJTMX7A8a4AnvI/vEANTnglOwpmucqlDjXXU
         Q+I+YJsn0atS6195F5N/21J0/6XFxWe/lj3UOTHSUJk/OmpJwaHxTmnoVGQLGlyH+QyL
         RYUdgWZXumnDQhMq4t+v/yOGja0yUjGo8CmJTYIz4HPjt5ADuIPaIQWUx6VOBaJvcD/o
         xrUeh+84EvqnZhEBLVonAd/GMkq7xDVwNVtMThmEsoY109TvDs+rrhT43LEV4Zj6kqxX
         4aXg==
X-Forwarded-Encrypted: i=1; AFNElJ9EKUi1VvE9Z+xeJuD1VECPaFZ30/TAb99UkjKO+kFawmjgenEDbxkDu6t+3WH74h+NZzl/JmjuM2H7mw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1lTkYaPm792m6AYU4ELNkfkWKKOPkoIvQ61OpEVHBP9UU2gbc
	tHRdOFIwMjQ/J1et4+ESSekFy7Cc1QnyA3wWqc8lk5a03kzS5an/1HeE
X-Gm-Gg: Acq92OGiWRf6ru1u0w9C72ceojIXVZL7bHhw26o5MYHyBg5QWHAvtKiCBljDx4SzjX8
	3lVFKoXzZdHp5lLD9EXQovAgdWRX3GKgCvtIZrrjtfQMHGFNhwcpt/BLe6uiweM1OwrB2laVbM+
	p066lzHyMLpA9XKWYg8jvn/09M8yevRkFpZZSxsc0zV2MNFrR2GOk3QS6wTXTc1722XuAldL0jq
	D0FK06CygmS8s+YzWXZ4o+kqMULm/y6Gr5rc/NO0go5v452kyRQD3G2YTjCW5dAY5aYEJJjY21y
	f7lc+ujv3tv9bdI/2X+Cf5D2SC4K+o7m3LiqlpSEFeWW91Smzcxkpvm9TVbCkrKvUhXF45D66NV
	sX4R85BV+u9goR5pppXbCg854CYst8hA4gwAZLXfLK6R4BJJTyVHUJ0WJwmtPw6p80yF3c4KtLm
	KXRSWrAo6n7H5cqtAtSHTyuNPelvIagI7R1av+Zh9GzEvp
X-Received: by 2002:a05:6000:188e:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-4606db8c6fbmr9211591f8f.14.1781348516083;
        Sat, 13 Jun 2026 04:01:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm14930828f8f.1.2026.06.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:01:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject:
 Re: [PATCH v4 7/7] arm64: dts: allwinner: A133: add support for Baijie Helper
 A133 board
Date: Sat, 13 Jun 2026 13:01:53 +0200
Message-ID: <rVKu3PRHTqCaxGV5Fc8kHQ@gmail.com>
In-Reply-To: <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:21 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
>=20
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
>=20
> Add initial support for both the Helper and Core boards, including UART,
> PMU, eMMC, USB, Ethernet, LRADC-connected buttons.
>=20
> UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
> AW869A chip has no mainline driver currently.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Schema validation passes, so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


