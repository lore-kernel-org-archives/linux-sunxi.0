Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115773;
	b=oQMoLQgFu1HYlIGzLmo/0rw7DXBLW3IAw8QsL69lVIm/226fjb6ASLfeMmpc86vz0EgM
	 sC5L/2YesJMz6YY23qubY2IAUiwPpvJUFjhQt3VlwoXllIcSeN6jtlvwhPh8rvHIt1SNx
	 Kthh8qROIl7M3GwxGp5uKu4t0+tk1VfalzCf+Mglm9Pemvjnqm9jRqZuuePXPq9kvWFKf
	 ibLuswbM6PXANxHe47iFPZxGuhv9s2+6UGfkgYdA52IPly2qZOCL/mjGY8ybqmTjQ+4Gl
	 tD9B/Y7EVVWFZzm2ZQhlWojAtWyLHCqoKZrqcwtghAE86edqP5i3r3gdvFw3+JkEofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115773;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+YptLFOK/EBAxVUJQntkNmJVGlHLd+Rimgm9hn2ud24=;
	b=DeTtrN8raG/F+HRqS+/Li5rQXaRT6ZVH6fdbF43tw+1rcPq4yxw6eS+QnC3UpQabpn+A
	 e+8UGzqtzGHTQoYyQ+iCtyGF27/BDROqOx00DzmWYQTrxx2iPj2d39dryDQfOCSAHt2wk
	 +NlNIY+KGP/apvYs88CPJ+kQDbcw3YhxJUjc/PMoIyhqASZsRE19PZOrunEGEQu8BPKEN
	 05JZS8OK8ZjNDoo/1hN07UWqfcfsETH/KHKuJjwmgwgK2Fm4eEk2vZTz46ViFwXPrEiEp
	 F23ImEhrkCHNmXNtychHydCJz98yJkYAQUsQvamOP3kS4+3miacR30C1UABLPdLOSqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFyZ+0Gf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C4606A325;
	Thu, 19 Nov 2026 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFyZ+0Gf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5F11F000C5;
	Thu, 19 Nov 2026 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115773;
	bh=+YptLFOK/EBAxVUJQntkNmJVGlHLd+Rimgm9hn2ud24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fFyZ+0Gfk6xbAOKNndUs+ptaS8i8DhdiJ5Fu7nIzVLIYMD5nzK9YZOrGWIJXwmG/u
	 yJlalwvLh6kKBO5E2YqTASKMYqqPTQ4WYqaS0ztNB5eRUucp6w+l+rnR8qmoW4y1lc
	 Lua33bLSUieVq1KSp54d5xc+Zj1elEX28TgSLJgCJk79UUSsQGi1S7xW37OMrfJT8F
	 RpKd8mNlEuydD0XGtTsUa/4yYO4ZTzrJlE7gyq61Pk7ojktodGTet+o+bJl/k+8fBz
	 Bxy2su0W88pajyqVLCkLGkGG5vthDyX8LB5cy3SPOv/KffphLWYXNg0iwkH3Rl/ezF
	 yvIGXbpU385Ww==
Date: Thu, 19 Nov 2026 19:16:07 +0000
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, broonie@kernel.org
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
Message-ID: <20261119191607.GC70182@joneslee-macbookpro.roam.internal>
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

> This patch series adds support for the X-Powers AXP318W PMIC, which is
> used recently on new boards with Allwinner SoCs (the A733).

Okay, this looks good enough.

Mark, do you need a PR?

-- 
Lee Jones
