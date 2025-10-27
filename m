Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AD329C60
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600033; cv=none; b=ZuAIIkusgZrIoTYNTG3AP/VojBdsvd2QIGtTcd0VB/6VweCP8wjc1Zja0IflQtedC914xqcvcAKbKxrtYztyG5eST/MVhbAaFCmjgB2RzJLUsXRUTLFQDvWMM6aPVwsSkMHAra3hVu5IGjVFkJh8cztRuLIVZfNPhPao/R0EJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600033; c=relaxed/simple;
	bh=BW8/DR63CnCWhIWiVIwBV0MInYjlVHDWoTcnAgWkyfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo+E2vktGIKcFmfSPuO/WXx3cdls1HDDd75KKl6BmVRsMUktYdv1bsHKfzydSXkmEeJY+HG+S7DfcoZEl7+SPwlG6xTqUCHElPqYnDYOK6wJnfhvsd38Z+N18BF2S2J6lTJSdmuFjbCVEtenLfSBQuQO4bivsg8sUzAf7C/t5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=H79YhRTC; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="H79YhRTC"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-65363319bacso2712024eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761600030; x=1762204830; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPoMLHF6XCOH6xDRgIEXZcj8CzFAnJNrblH0H8FQ/E4=;
        b=H79YhRTCyApWJ2RyzMyhJEaK1REdu30wE3X3q8t+ANdxKmE0tpRK53BhcmqUqYlSCn
         Gh3nqibal64ocuxCk1mcOYOCA3O02TmJbTrPdDh2zDkwdoyDdQSqnOwbdGEvb5bwuTRu
         fgKY9KbnSIVH5WJdJe+/G3i+ehVVWvf9DE7dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761600030; x=1762204830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPoMLHF6XCOH6xDRgIEXZcj8CzFAnJNrblH0H8FQ/E4=;
        b=sqVur5wcLLAIEO2ru7P1Zc/bVPTaF8rgEE590Pmwh8d+eKehKL/nkpo8hWLAEmb8w6
         RdKzT1XRcPrK4Wty7MoiHM4AinJrz0aaTQQsL26wZwvg2hgD8Ux1kIZFqE3MBhLW2sJr
         ra2oPLlCLQTAmPQ/zYARDUQTM+3Y6+3ITOnqbXTqfz5c0/aw0Whny5Pmga6CtSIAhTtr
         nQXOSgMB7tdxCFN2A0DqJMRT1rKlYPx/3iUmVlfMobCjeyuJ5i/9VMETHndYlNT+WVvM
         iB4CzshzlEUIHW63zK1lB8SA7chT4H45ATS5iAyePcRNmFYV+lSj7k7QZxgKLXcdaRhe
         nBrA==
X-Forwarded-Encrypted: i=1; AJvYcCU0DXARaBv7zKL6EFlgK9wa/+2s/oUfCX8qHD3tu9j8bICbhcfp13IzK/O2npcQW511B5VKE6xfzt/7NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwP+cYfsqJjhY1RwaOFRSSrVEde+Z5x5XdzC+AA6+/ubhd4azT
	usw5xy9Owq/uf9P3X+lgHo1k8zDK7Ho6s8vasTOlabkNvBsYdD/qASM5eGmPzoRbMCU=
X-Gm-Gg: ASbGncvUx6QyNUuW7BK8WMX1iMVbtb0SaxMfxyi5BXTy+RYXaILhuhascnU4+mNpjW1
	yQxG8MGDezXCJktYVn/80J24Fzm/fx/jb5eju9YFBr34JqByG2v8JgL7c5bBQjAO1zFwJ9sHgJv
	qzTSfkUhWz9iqJ8zATe0imjYauiOCdKYvFWtBWtVy+uHo7rHKMqLmr4hMAhxX6a0Kq8EABRGTZ+
	gIFYupZ85Z0pwET5lh+1lEmLO0RbvKTAPGvwFNJkE9I/Fz5G5Mv6PgV23Rh9HgeLsJxyydQWznK
	PfjLQF0l4XzucyVPtdMlU5zpX0bS9UTICVceiJXSFbSvpyJXbg6jQwvt0W61RP37E2n7EbEvf6r
	kcftO7aepxbX2FCj+t1LpUziNzjiC0ZsRnkx2Ax+7zE6qxfJrpanP2nt+Xs+To7+B41SDOmO56Y
	aNhAdiaFZHzvlyvo3zT0Kcl15TkZrX9bzwS48Rg/Y=
X-Google-Smtp-Source: AGHT+IHcyWLhqAVdyR5Oz97LDv98qNZrVFzY3jRfpFFQJZLVtu7/Gyq9EqnyDZIbrUG22ZA79i1TZg==
X-Received: by 2002:a05:6870:fb8c:b0:3d3:3d2f:5c55 with SMTP id 586e51a60fabf-3d5d9d7b2e8mr623788fac.46.1761600030355;
        Mon, 27 Oct 2025 14:20:30 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net. [187.190.202.235])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3d1e395c213sm2860625fac.21.2025.10.27.14.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 14:20:29 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:20:27 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [GIT PULL] u-boot-sunxi/master for v2026.01
Message-ID: <20251027212027.GA6688@bill-the-cat>
References: <20251027144512.3199406-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eb/6plx4Mpjbvxgf"
Content-Disposition: inline
In-Reply-To: <20251027144512.3199406-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--eb/6plx4Mpjbvxgf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 02:45:12PM +0000, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull these sunxi changes for v2026.01. No big features this time,
> mostly a collection of patches that have been lying around for a bit.
> There are some DT updates, for those SoCs that do not use OF_UPSTREAM yet,
> hopefully that's the last time we need to do this exercise. And that's
> offset by switching over two more SoCs to OF_UPSTREAM.
> Two new boards get a defconfig, and some improvements for the sun8i-emac
> Ethernet driver. Finally a patch that fixes occassional DRAM size
> misdetection for new A523 boards.
>=20
> There are a few outstanding patches that just wait for getting some
> details confirmed, which I might send then later.
>=20
> CI passed, and I tested this briefly on affected boards.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 9094482ca7576877b2bfaa57c8e73cfeb536f8=
b9:
>=20
>   Merge tag 'efi-2026-01-rc1-2' of https://source.denx.de/u-boot/custodia=
ns/u-boot-efi (2025-10-26 09:03:36 -0600)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git HEAD
>=20
> for you to fetch changes up to fa4dfe870c16a90ed14be92f5f3a3822a7ecfe9a:
>=20
>   sunxi: dts: arm: update devicetree files from Linux kernel tree (2025-1=
0-27 11:12:57 +0000)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--eb/6plx4Mpjbvxgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaP/iGwAKCRAr4qD1Cr/k
ClozAP4us0WiSRftiYTQrlbL+Gi3yjBCEd/O0VTgBs8UVkrYIgD/QX/GpAklJ025
9nmTMbo8oASGroqbjr0E0Qwxnc722Qk=
=pwEM
-----END PGP SIGNATURE-----

--eb/6plx4Mpjbvxgf--
