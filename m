Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500418C2A
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097F2C433C8;
	Wed, 21 Jun 2023 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687359580;
	bh=rJbvPZyesMVVZGwgwtESLy0d3zonMwwWoM1KrbrTODo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZc63UVndIzL8dUzV/ItfsjJSu0EVr4uUxFaVj63jdMi8MWWIwL6Jnt0lxyAXY/WA
	 C7h7KJSe7Utt3jMUj8xWLfpUn3PBmVVzyU4heK4JlPBYxobGxxkW8CAS8fqO6pzM1G
	 e7LyHGtmDWgCCcbnRp1eQA0kzJpE/zh1TN7GquyoDfRp3KItkPf/81dtO/sG6ogdxw
	 0CV8vqT2jY9vhHNG/ONCWFwW+Fzda0fNQdvVEW03GWA9SqxkbAhzwdbAoQjegh4bYQ
	 LiLT3Wlr3sJvpDog1jdsPwKbRCbli8NY6V+dunvSDV4YDPZSQFpPMCchBNf/iz5t0S
	 PGDCbaDGKgr2A==
Date: Wed, 21 Jun 2023 15:59:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] spi: atmel: Prevent false timeouts on long
 transfers
Message-ID: <9988258d-5797-402a-9d92-c7c9e1afa73c@sirena.org.uk>
References: <20230619155349.3118420-1-miquel.raynal@bootlin.com>
 <20230619155349.3118420-3-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OwDbOvhyPcaB4J+Y"
Content-Disposition: inline
In-Reply-To: <20230619155349.3118420-3-miquel.raynal@bootlin.com>
X-Cookie: Printed on recycled paper.


--OwDbOvhyPcaB4J+Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 05:53:48PM +0200, Miquel Raynal wrote:
> A slow SPI bus clocks at ~20MHz, which means it would transfer about
> 2500 bytes per second with a single data line. Big transfers, like when
> dealing with flashes can easily reach a few MiB. The current DMA timeout
> is set to 1 second, which means any working transfer of about 4MiB will
> always be cancelled.

This breaks the build:

/build/stage/linux/drivers/spi/spi-atmel.c: In function =E2=80=98atmel_spi_=
one_transfer=E2=80=99
:
/build/stage/linux/drivers/spi/spi-atmel.c:1338:76: error: =E2=80=98master=
=E2=80=99 undeclared (
first use in this function)
 1338 |                 dma_timeout =3D msecs_to_jiffies(spi_controller_xfe=
r_timeo
ut(master, xfer));
      |                                                                    =
    =20
   ^~~~~~
/build/stage/linux/drivers/spi/spi-atmel.c:1338:76: note: each undeclared i=
denti
fier is reported only once for each function it appears in

--OwDbOvhyPcaB4J+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTEFYACgkQJNaLcl1U
h9ATngf/Uj6V7e+ZkPyX9brbeEyYT7qm2+ucvwQH1k6CMSZknX7UxyvvJ41YS03G
rNZtf3du92rEIwMXHaOlBNbjWRD3lUFCDAMHc6YWsF552GIY0kuRkFe6lPcu6pPk
ohxsOl1JHpvySD+23mKYAhtDos/9DsGcIk0LRtEXyTu9KvIdX4z3Ys/O0mVdS9jL
xDF2J1KRTdYjXwqnM1QC+3Y8AdcRrNvwCDJYZKjRttSF8xDHzYrjfzc5DFMdXU01
a3E2FU/W1+h+IPWLrGkfgotS0RVtncaD3hSm3DIR5Ixfxhrens66i+EpaxkP2m0t
j/U2JbKgkmjzLRJkgzTwQDpbaRREKQ==
=aoBA
-----END PGP SIGNATURE-----

--OwDbOvhyPcaB4J+Y--
