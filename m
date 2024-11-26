Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BA7E9
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Nov 2024 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612707; cv=none; b=LEzMMMIWcAmAFhpPpsyt948rNTIpyhL6S7OgAeFGR+BnFFvUedAcjr8HKG6N8h8dOi+7DTOmJf/0JUeNaptYqFKghhOP3TX6WFDBguEVadhROjEf12W41lb+d94TkhSGu1Cj7eM02v26jC74qcA/hzOPiF7X37pZ3EXBePEvkF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612707; c=relaxed/simple;
	bh=8wJo0FQyMs7z3lb/ouq80c/a0Jaepww/M3knbCWU/CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fnt7pMx8xPqB+cK9BHlpaJ9SMbCuCXF6cy21TieKd78Lqsfh/V8JIIMz+bMs5HCatJSwHjczYjajPMLVGE40KffXZIuFiQTQ1c68ES20bmDalHN2/Oo3m9nRHrXM1s/UCO4i2dUqGLCMAk75WeALgd01MFcgxxKEVnKinYjg7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFri5-0005E2-I5; Tue, 26 Nov 2024 10:18:17 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFri3-000Dyd-2H;
	Tue, 26 Nov 2024 10:18:16 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1ADB937D7BA;
	Tue, 26 Nov 2024 09:18:16 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:18:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to
 check skb
Message-ID: <20241126-wooden-cyber-polecat-d96127-mkl@pengutronix.de>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
 <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fklivl3r3m4v2cbu"
Content-Disposition: inline
In-Reply-To: <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--fklivl3r3m4v2cbu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to
 check skb
MIME-Version: 1.0

On 22.11.2024 23:15:44, Dario Binacchi wrote:
> Throughout the sun4i_can_err() function, the likely() macro is used to
> check the skb buffer, except in one instance. This patch makes the code
> consistent by using the macro in that case as well.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I'll apply this one on can-next.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fklivl3r3m4v2cbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFklUACgkQKDiiPnot
vG9V2Qf9HACb0LFZ2n5t9mhZxL1lJKrvPrG0+M1I2I+az5Kf1ctouzr1D2tj3UCX
1jRQnCniUZWRqagu1R3mc6ih6FQwftuCstvdh/J2+wurmgvs6erlza4FytN/vN91
GzhOEXksFZIJCIKrP0Oj4EOIZZKmc2I8wP3+TV+6V/x+Cb1/yo86+ktgY08/p7CG
PDxBOBnlCF1lwKu1rAIp5TaEkKAWko7SVo2wDrpdAe5H7YI7KOXJvVfkeZvEN3j7
U9i2pdrP9SyWt4Iz6nn2fYbVn2Bez6a2XVd9Vg19eMVzpyhrq6zcxjNo5oleXutW
eve3U2Mo0bP+O0aTxxuAM1H9XDV6dQ==
=b9xE
-----END PGP SIGNATURE-----

--fklivl3r3m4v2cbu--
