Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991B4B53E5;
	Tue, 15 Sep 2026 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491557; cv=none; b=CE21RB8fhMALJpC4DayEBZxjy8urxh4rfhVQBqJGP7T05miFAraA9HkphApcZ0nAw2Qs53Y0AQEa0x16ZUHHMDhK8uEmgOQMWbcd0GSY6Uwrbrkz+ERMhgdjN8Kidl+4pOSBvL39OB0xoLXkR6HaCHfu2RazjhJtf6YouQMEIdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491557; c=relaxed/simple;
	bh=1p08njRzaxxJUGeViwEgW9D9BKYP62TZf0wUv6jTmcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWGsH/FazX8usZkEr1RulDpjFY89loPND0fSnY3s5MQ0NPKvY6ut/SpgJKH57QKogV3g7xzZKCpr0fKXTfsdR/1Wnquo3SnWPycRuc/O9lFe7nPsPDFj+509loOGkgQ1JufGRW1lXKmjtiiN1FHBaF/aWshgawVuMM4mmB5t5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFjTYw0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFjTYw0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D779D1F000FF;
	Tue, 15 Sep 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491556;
	bh=1p08njRzaxxJUGeViwEgW9D9BKYP62TZf0wUv6jTmcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFjTYw0V5uMopAB+XnR9iv4O7/EgB2tOBkHcbBcSlAsgQ/xlSPvy3+PNJESBCa3EM
	 rHEu8+JZx96SCWSgS0Fuf+gRPq+rGdNcaQhX4EuvI6BqapgZ9ktyrdvMCrxOqfheC3
	 5WSkAfr46R3lQoAW6zMC8T/HZ7o90XY/B7TtoapZUvvyqxg1epA/1Rywa5xNzvIvav
	 0EwoJzO+ckeFGRHwcwTf8X1J3wF3zfkVKxWOWJWOAGCck5F4TVzMCFTIgfc9PR080C
	 4ia7pzIQ+KgvICHtHvqr8daUDn+H9/DQ9UDYXOxY2gry4g2gK2Pukq+ClpA/DBWj5Z
	 Bm3S/msLT0WwQ==
Date: Tue, 15 Sep 2026 17:59:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for
 Teclast
Message-ID: <20260915-stubble-jarring-8ac922fb7465@spud>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ds7rGmwnVtxv+Snq"
Content-Disposition: inline
In-Reply-To: <20260914210115.28151-2-andre.przywara@arm.com>

--ds7rGmwnVtxv+Snq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ds7rGmwnVtxv+Snq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql5XwAKCRB4tDGHoIJi
0hZLAQCKbMz0kBjj4L8osaddTBmbeWcDEaxQ9D8TnpULZdlE6QD/RqZKDFDrpK1A
MjljX3MSYrM9HlLEQxswYcGqI9hd/AY=
=B+4o
-----END PGP SIGNATURE-----

--ds7rGmwnVtxv+Snq--
