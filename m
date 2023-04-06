Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720606FD0
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Apr 2023 13:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEDAC433EF;
	Thu,  6 Apr 2023 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680788990;
	bh=csFTd9xgqQmG3khgKy/H8E2+yqNIifxEZPO2W+iou6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r08HtjL9d+tfzLkNl8KMy9MA2a6mOQ5Tkar/EU9zYLuXyjRjHLB93ENkQ9i6p0O65
	 OV+1eaYy/PBm9O61cFWUy5P5j8IJrj29EXrz7r7RoIR6uqehkOo5MCVtMAIp9mFwpz
	 HcjOKi6C0er8B7uld+3Di0cS+pY40Hh5Qc6/j5bzUvKj2ht/oOTNh5WY+IJJ/4ubyQ
	 cNPc4XnxOBuKb2MuxHHfCmLvCSYwxK6k7OUO7cwqed4TUeFZ6yVXyWbujBFZkMDsyG
	 2HMEGRNlWyAKVpLLB5kO5l8sH3V0GvXnGddUxaZZ8uKaXmsA884UEB4B6+GKKPYVjS
	 d0cGg65kex+rg==
Date: Thu, 6 Apr 2023 14:49:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a
 variant
Message-ID: <d74c94a6-77d1-41f1-82e4-a046f7935aee@sirena.org.uk>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XWDytlkjLKAQS5Qf"
Content-Disposition: inline
In-Reply-To: <20230401001850.4988-4-andre.przywara@arm.com>
X-Cookie: Man and wife make one fool.


--XWDytlkjLKAQS5Qf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2023 at 01:18:50AM +0100, Andre Przywara wrote:
> From: Martin Botka <martin.botka@somainline.org>
>=20
> The AXP313a is your typical I2C controlled PMIC, although in a lighter
> fashion compared to the other X-Powers PMICs: it has only three DCDC
> rails, three LDOs, and no battery charging support.

Reviewed-by: Mark Brown <broonie@kernel.org>

--XWDytlkjLKAQS5Qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQuzfcACgkQJNaLcl1U
h9CSlAf8CYgKwnS/YNocVz95bkMlJjpIxwc/jSzT3shGduMokI1v+SGDMfMwOeGg
+G5a6bOP8eMobfRPCKg+a75q+QCVRR0cGD5uO+ZkMfCb8bVPPkYC+RThQxynI81B
OXFjmvOyNUYiGHf1PVMRcMjH6UrajkC2xPAQiFdMzP0BUZ9CkiJHqUFI/1oFtAaY
sdaNk59euFwkW3KNM3CVzpI8l5wX8CMuXde74RMDOPpJF4L+xoTsar2osyIvGI/D
mcrKluHgelKuLVhW/7A1STRb4h5ruob7dQ1T3qPj23tRjHRLLCig4M/mVet81c99
hMRTX+KAu+SrzuNAC67qkR4DSn7peQ==
=mDNG
-----END PGP SIGNATURE-----

--XWDytlkjLKAQS5Qf--
