Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E887208A2
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Nov 2023 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="BAi8zIFf"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7788ebea620so305312685a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Nov 2023 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699884418; x=1700489218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEih7DUrgL5ECyYJiE1VIj0Ky0Q8x/ttOHhXz+Oycxg=;
        b=BAi8zIFf+LB2JiXCWFc48cJcMOUDSqXuJzv7NUvQU9VnuD008pXJTXu3I/AglAIl/K
         a7enezqPhLo1m1vf4DnZ2Ri1RLzJTrhr1fb6egzYI3+UyL3sqg1nlfVBLnXfzA2aLU/2
         e2eIY6Tc0ycJ2u4C4FxOBD335nj4OQEisNvfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884418; x=1700489218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEih7DUrgL5ECyYJiE1VIj0Ky0Q8x/ttOHhXz+Oycxg=;
        b=wzCkwLySG2yvnTWKqQ5EkgrZMlPLVavvwG2YNQcqO47tmBIr5y1qTbEZEOygdJkIb/
         bmtB+pFQIQbn5NARIZ3XryVatPB/F/QeKnV7MhqqnaA9l9uWxB4l4q9aIOdzKJmhEsKS
         FYaLmFZuYVW8q1IjzBhD4iw1pIhSohJXOWUehGwv1XVs5r/5HOaNE1JNlodNsYW2OfFx
         lmfJY/pPQZkMLoNpKsbo+gJAB2jDugKcrMOYJ0nkWXm70uusDLlpk4xIy/Pe7SwXMkIq
         a2CmmIYi2BX/TcfcNV/cN+tAP7qYUNURFFD7J36MURvh+u1SUVa8EIdhDu0qzRkFTAnv
         RlSg==
X-Gm-Message-State: AOJu0YwIdqR1/N0XLQ+LyXKXgtPStkDa5rEFAmPSrKrbr7TEHLkl+tra
	BJPJxwDCX5QOnCahQdu7/RRT1A==
X-Google-Smtp-Source: AGHT+IHaPrarUGmGZa8q9bd0JJ6ylnB7XzWxpscpJcZ3Kbrwnof/IQaxgJ1gGsFzsQVKvKIn2GUmDg==
X-Received: by 2002:a05:620a:1a24:b0:773:a028:71b6 with SMTP id bk36-20020a05620a1a2400b00773a02871b6mr8270801qkb.65.1699884417959;
        Mon, 13 Nov 2023 06:06:57 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-631c-486f-62f0-4c29.res6.spectrum.com. [2603:6081:7b00:6400:631c:486f:62f0:4c29])
        by smtp.gmail.com with ESMTPSA id bl6-20020a05620a1a8600b00774376e6475sm1895740qkb.6.2023.11.13.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:06:57 -0800 (PST)
Date: Mon, 13 Nov 2023 09:06:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Ludwig Kormann <ludwig.kormann@ict42.de>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2024.01
Message-ID: <20231113140655.GJ6601@bill-the-cat>
References: <20231112212450.882-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WCYBjybAzZpwtrNj"
Content-Disposition: inline
In-Reply-To: <20231112212450.882-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--WCYBjybAzZpwtrNj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 09:24:50PM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull some more sunxi changes for this cycle:
>=20
> the first few patches are some easy refactorings and fixes, most of them
> actually don't change the generated binaries at all. Then there is a
> defconfig for a new board, for which we just gained the .dts file from
> the last kernel DT sync.
> On top there is support for a new PMIC (AXP313), and LPDDR4 support for
> the Allwinner H616 SoC, both of which are needed to support new devices
> that appeared lately, especially cheap TV boxes.
>=20
> While those are technically new features, they don't affect existing boar=
ds,
> for instance the LPDDR4 support code is guarded by a new DRAM type Kconfig
> variable. So the risk for regressions is very slim.
>=20
> Gitlab CI passed, and I booted that briefly on some boards, including an
> H616 and an H618 one (with LPDDR4).
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit da2e3196e4dc28298b58a018ace07f85eecd16=
52:
>=20
>   Merge patch series "arm: dts: k3-am6: Fix Ethernet/DMA" (2023-11-10 15:=
25:47 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 4b02f0120a4bb2a5d7081aef8cef6a4ca57e9db2:
>=20
>   sunxi: H616: add LPDDR4 DRAM support (2023-11-12 18:04:32 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--WCYBjybAzZpwtrNj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmVSLX8ACgkQFHw5/5Y0
tyx65gwAh1ZUYaWdH3EG1ca35rn7Fq81B3hVPCxp+Os71HIw1W63h0Ryn/dv9KtA
/zQODb5PWud/133mjoL1w9VO6Bh7rbpdTdc3QaDym8zCNXlQIS2lUj5VH7aGa/CD
WMhYVOYDFz8H1pz6+g31OGu77vEoxz1MwNeAor4Z92AYgR2ky0kOfuEbW0B26bcj
kDtiJJn6ikGC4NHH+OF79ANuOgByLqme6m/hbWzcjOACt6l7f2P5hrLFqqL8JRBt
LYECl6jXUpK9CGXL7oJv0b8FzSKKCcpXpUacVngzoNwofsh1HHAKMIXU5gat3nDu
hjQ5kHg5JSNMkKlcmLTAUZb90X56CgY8YmgZqEMiiH/X8gDxZscsoBOuEESQPaLi
dTzpqaEUnEMbDDVeYs3ZHQ1hbGs+4Eg1FUgLEttzArujmanhiB+g1pABVYNr84r2
NqC7D7PkS9xH4geacGpDQRQ15db9ZQP3cvgt+x0SJ4FB8gXmXmuaSBJd3xsc13q7
aAFsZWT3
=bSEJ
-----END PGP SIGNATURE-----

--WCYBjybAzZpwtrNj--
