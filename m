Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA846314D21;
	Mon,  8 Jun 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938614; cv=none; b=PR9mlPbJ/IN2I4e2ytMbBSDd5K6aTAsnfVQY4vMEA0wv/4oF0/3j4tuGPGSoLauZX+8ACeSwQSbrcmTQvMtjy7X/dfJyn8jjOzDi6ecN7+T6POiPIrFiI0XA1Db7egBztkkOxwzUnZ8FP1JpEPBKRnzszOuJOPKRmp695JZ+96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938614; c=relaxed/simple;
	bh=xkbOr+L2EKFIeeQ9c+CcgCnxLz8JXGwjXbsGP2srD9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMb9QrT7iD6b5eYORwQLKRxoCfH/auSOcAy1uHEZCme0njs5tDtyRqXQpGwI4a2Z5S0Xtst3LcHIw5o1orYonopt/B1Zg1/vev1NImPADo4zO5toT5je/tbhDGDKOB6puRTQRyp6iIFj5UUR0XQP+MtgFF0AQB5GVwtAar5WB5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpnOhm/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpnOhm/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359951F00893;
	Mon,  8 Jun 2026 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938613;
	bh=xkbOr+L2EKFIeeQ9c+CcgCnxLz8JXGwjXbsGP2srD9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpnOhm/lnBbJGtDm6SQAN5oep0c8dq0M5wYUd/XzI/3zvquJ7ci5i1p9Q0bKAoi+v
	 ajjZOJasvDlpkDgNg8OQmT8CxoMy0iVV0gawrNSxRO+jh9/uJHKGuM4pp9K1U3uzwc
	 VqFY/ccv+BPIeh8dmrVfadJFfsGr4oONV9MtJwOACwKOuFGW4ha0FKxeHY7ssKKKBi
	 ayDY6I4QVQKaeBhgVlI2o3RRUcP+ZmrUx5F78NYl/0NskdCZoBb+c1G7Zg86Ly2VsF
	 D7zr22lDxuM4PGI3wQfk8iY1TQ5wib1QZOFqC6Bd/gfe/JR22kDvkazI7V+cBRyMEd
	 +peC9ie/OpumQ==
Date: Mon, 8 Jun 2026 18:10:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: sunxi: Add NetCube Systems
 OpenNMC (dobermann)
Message-ID: <20260608-efficient-unmasked-055a2b553525@spud>
References: <20260605191322.1920944-1-lukas.schmid@netcube.li>
 <20260605191322.1920944-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWTtt+IfRs7SuezO"
Content-Disposition: inline
In-Reply-To: <20260605191322.1920944-2-lukas.schmid@netcube.li>


--iWTtt+IfRs7SuezO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iWTtt+IfRs7SuezO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib3cAAKCRB4tDGHoIJi
0rjdAQCo/gI3s8btXoM2IzEm8f1ptKxAEXzZm4h/xNixYwNW4QD+OrPsYbgQSu56
41hKCVOySwILHR50LVcbsTe1YZNEvAg=
=iwjK
-----END PGP SIGNATURE-----

--iWTtt+IfRs7SuezO--
