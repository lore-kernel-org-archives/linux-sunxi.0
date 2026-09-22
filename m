Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77C5616BC;
	Tue, 22 Sep 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095207; cv=none; b=tTXRPNI9UYxQqcESi+1bECueeshjPkbqDu8m88Q3PoprmN3Dbp7eZ+IGMDftW1HoJjKkkRrCat7zfVECzGc8KRkxYns+qksR0ts6oTfKOnvA5MPWWFePtfIhyywPOwIJeS4iw3PrNdWEcCDs78wTj35VUSkD+qVdclWSQQLgUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095207; c=relaxed/simple;
	bh=TMV4i/0QXbQ+KNOuKkQNyiGHjxKIkJwFi38QaRPmL3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H88jALj4m0sq0JQpgQ64f6Iv04uzG0HFPIby1FltlQcWSkRQrXhLHyQhg0G1H6AItCCbAgAnT81+cEHp2MonXun89mYeO7FKcsOCgYAs3j0rKqOKBFbFtrJ177NYvHl6TvGgKbyeykN85Ef15MZrh+G/0MbgbhbuKa+oi5jdl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g//EvwAY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g//EvwAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217BD1F000FF;
	Tue, 22 Sep 2026 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790095205;
	bh=TMV4i/0QXbQ+KNOuKkQNyiGHjxKIkJwFi38QaRPmL3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g//EvwAYjQPdh+Yil+SkwLoNzr10iGrzK3+QY7btVA11OmeTlLrbDEAEviXInUg/B
	 Vbx1Hdxl/y0snLa0DiKxrN/MKfj0Ny2eyArvAkhgb4txwVAUP+zA313kem/gJMnC5/
	 dcFy4Q2QPvbaPed2KaCBQyh+SQ44wWttLm5FhElA/S+BGAK1KZPvMSbI/OvDzXo6Wg
	 IoK4JIds3Q1LDE3t9YIlEULYn6T4f39FT1PPF1UFq4yCGzWVF5r6ymVF6UDfFHd3co
	 8+gM/4DkUg3DtV61pI/IF1p3R3l2vs7ttXRP0QWtWUnr5feoZmjq8yI8x/iv44Tnxs
	 n34zTB02gAbFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260922-submit-ac200-mfd-v13-2-8832afd2481c@gmail.com>
References: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
 <20260922-submit-ac200-mfd-v13-2-8832afd2481c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 16:40:04 +0000
Message-Id: <20260922164005.217BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.
>=20
> Enable and rate-lock the shared input clock, retain the vendor resume
> path's 40 ms wait before creating the regmap and accessing registers, and
> deassert the common reset. No minimum delay is documented. Set only the
> deassert bit instead of forcing a reset cycle, avoiding a chip-wide reset
> of unrelated function registers. Leave the common reset deasserted during
> driver removal and system shutdown; function drivers own their block
> resets. Supplier unbind still tears down linked consumers and releases
> the provider's clock references.
>=20
> Cache only the common page selector. Individual functions can reset
> independently and invalidate their other registers, so leave all
> functional registers volatile.
> [ ... ]
> ancillary package-control access.
>=20
> Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-submit-ac2=
00-mfd-v13-0-8832afd2481c@gmail.com?part=3D2

