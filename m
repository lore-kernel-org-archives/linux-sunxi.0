Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769305;
	b=3b0qf6Ei78IF8gZX40d+Th3UvwspX1qWTRixqu1EebTEwPL475rwqsXE8oZbneK9z4bM
	 HGEesSdDzEl2ezl+UA/W8IJiE2JBuHu+RWiobtW7d4EDIjtYhvwCtUzQaoyNnt9J0H7uc
	 s9JiujXjGGBxPMln3Xm7DUr8rbzQugLAkPbUjVExxGCvBZnQ7kILObz9YwG52uk4E56Xp
	 3xtd5kJBqQfvKacYTXYeUlFenaEswtyHHJxITF2rV6kpPxinuBHIh54dmNNG1tRExsF6I
	 I8KJggFhpsgOrB02ZwUp2pDcIEvsj77Bt+GSg+3Eq/wLSmd7AE+fk0rt54nAUiHDWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769305;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dWrqiD90mUdp7Z+CBPO+3ZBHkvvM+25eA7zawwe2TO4=;
	b=YxslTh0VGjQ4j1GcQw7jtM83wLE47w7Nz3IVy2ZUWX/FMtoYpRG5WgwNCv6XFpflYrlL
	 GvNAMqycHAm/PG8/DEzmpVtWNcy01EcQkxiAApuEU+xYLv/ePg90fLC2hvPjS9glAi01c
	 PWLdLU6fPz7PVeV9JGvLN88DL9pD4H4KbxhoC5NKwlEylSE9p8elhuF4kVJ9816iE8Tqm
	 JycmL1Hi6KdFPZpgqSafd3hHQWBF2W3n/WQ8uSdVbBKJ0wvD6IVRk3x30QZDyu7um9ZDO
	 McI4fhjrcP2xdNQBQzfUUOA2kP9/P/zxEYdMXKLH7mNXDkTPekloK/2T3LueUzEtK/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDvWm2Wz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABA606A326;
	Fri, 27 Nov 2026 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDvWm2Wz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07361F0089F;
	Fri, 27 Nov 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769305;
	bh=dWrqiD90mUdp7Z+CBPO+3ZBHkvvM+25eA7zawwe2TO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fDvWm2Wz8+878TKY/Qt+tc3zvNexpvJdGYM904sC6kb7H7noGokc9RE9GbAyGPsms
	 URGf84ATX3T5oZlfL5KZXKMuOTyedy4v/26EIfwGH/VyQwpUO4ygG2f2wg1PrTNKzq
	 9+VwHt28E1M1VQ9LDkbMDSSMbtcJWa6dfRuaGxDwGuvZb2gSJH3/AWM0q+JHES113n
	 UHveXG0MHsh/XjJ7Mnt0LO4qDf5Iys8w0CsjulTU4hmEynQXm9h5cDq2Vefbydlmk0
	 HXKydJnqa4cCPtkR5/kG8uu/fV7sVTlbD8ZAlKCjg7pUzOU2P/yWYKbbKWs0V5cJE4
	 J5zqUeH6AoS4Q==
Date: Fri, 27 Nov 2026 08:48:20 +0000
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
Message-ID: <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>

On Thu, 10 Sep 2026, Jerome Brunet wrote:

> This patch series adds support for the X-Powers AXP318W PMIC, which is
> used recently on new boards with Allwinner SoCs (the A733).

Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].

-- 
Lee Jones
