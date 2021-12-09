Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240E68
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Dec 2021 14:20:00 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 132so4949781qkj.11
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Dec 2021 06:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M5I5kux7CSwrAtfqiNnP7lTkuTguGB/XagolZPHOlu0=;
        b=QX3wr5xjCEQxCWoCLQD9yI0Q3tfUqrgEWkCIGSOto6APBJNv0/KNvyNBUhLShi/jny
         i68lOXTLFP5a+N5ZDd4Eo5Z0RurQ/GtRt9AN3vqqH85Wixnf1O+jH0v3EGfflzUWvebO
         FOyJHa89m5zPSxpw8b2tx2Y8kJZqXXWySETS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M5I5kux7CSwrAtfqiNnP7lTkuTguGB/XagolZPHOlu0=;
        b=1CrUwMgao9IcGm6ITAb/XbyyHylaWbengls+V/EFjqpiEa2ZWSUzyL0IGpoSL8fXHE
         e68VNpf+BJtT523aI0uLP5oZpU1IK/JwUUKT6K4ToudhYUy97ydba5I1cOKHFjdp4uyq
         yEKSlk+PdPV/tw8NrrM/sibZ8wYpu8xoN4V8S8shKiZ9/gNV/FVXvd0PfWkQcbUkpirt
         zs4pkqciBiDZaaNXmlsp1MSWOFBeUney9+5B6gefivgMKUYmgyy55lU04NUoeMn8MJkE
         p6HAbkJRmrvspbHryXO0WwhEokSYnAA9j2jzRGda+dYUf+iR7AGhABSgyLR2oBp5fmlL
         lxVA==
X-Gm-Message-State: AOAM532hp5TyLqa7cLGLR6KP1dYqFzZQ3oKiyykt6Ij47ZMw4sisdfYi
	mvG0lo4+2/89tJXUFzD62k+M1Q==
X-Google-Smtp-Source: ABdhPJwEVXgZmIfrD0iq64JxfAUBt3Kus4kTZlgZWPuHVWzTM3kbcSPeq/cc/HyW3zclb8nrYNHDCQ==
X-Received: by 2002:a37:a895:: with SMTP id r143mr13536615qke.670.1639059599917;
        Thu, 09 Dec 2021 06:19:59 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-9479-232f-d023-75ef.res6.spectrum.com. [2603:6081:7b01:cbda:9479:232f:d023:75ef])
        by smtp.gmail.com with ESMTPSA id n20sm2946070qkp.65.2021.12.09.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 06:19:59 -0800 (PST)
Date: Thu, 9 Dec 2021 09:19:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>, 5kft@5kft.org,
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Simon Glass <sjg@chromium.org>
Subject: Re: Pull request: u-boot-sunxi/master fixes for 2022.01
Message-ID: <20211209141957.GH2355606@bill-the-cat>
References: <20211209000650.2446-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aTHdXM4WpLndGb15"
Content-Disposition: inline
In-Reply-To: <20211209000650.2446-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--aTHdXM4WpLndGb15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 12:06:50AM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull those two fixes from the sunxi tree.
> This fixes two regressions: eMMC operation on boards with WiFi (so using
> three MMC devices), and a repeated wrong error message in USB gadget
> mode (fastboot, ums).
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> The following changes since commit 558002a0f2230bedf6b38716f3ed86a92fc901=
0b:
>=20
>   Merge https://source.denx.de/u-boot/custodians/u-boot-riscv (2021-12-03=
 09:02:49 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to fbd9207e7fe3712b372ca9889a2a82402161fd27:
>=20
>   sunxi: Remove misleading USB-OTG charger message (2021-12-08 23:07:15 +=
0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--aTHdXM4WpLndGb15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGyEIkACgkQFHw5/5Y0
tyx4Ewv7B9pL9VRiS9xjJHIMW2/f+GZpFO40EA51910K9408oafHpEr7GFCnAEzW
bRbRAnMSl5Cj1APF2twtSJ3jNQgOGa5ID/3FmVGWOLdLtrkl12iZyMhJ/j1Bg/yb
BEi1Z6BFgCupcqPqPoEC5GnMuC2bHt/KYQOalcH0NYA0sTKy6vwmssDd/1dpA1Qc
xyfCn5RJdPlcGPRrFemYlrTEBlSQjEqMImDNzjxIefXnyb5HKy/Hwbe0BZUa8Kd7
3ilSFC7cw0ampfTHmGOGabmAxVQRnoFrec+4Y0733FzLVLNPTZZs/tFJNH90vYkx
+R/FSIXMbwpJ/NmRTqlylWo15DiFsXjXeAesR94KNKnwZP/hX0nGG8LC2mak0STZ
YQ0mLyRXY4hBZQBeXYisvem6S8AjrbX2lnY07ma00sE8POGCHgvwOzpGj0qnDV+/
TGHdqbMAFEE9FvgIFpju88y8E9Dk6dpKhZ2Z4FUhGRI43/RLpXAMnaGkblFjfQR8
/0Od2Z2x
=hmbZ
-----END PGP SIGNATURE-----

--aTHdXM4WpLndGb15--
