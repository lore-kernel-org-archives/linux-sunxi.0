Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84C184F
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jul 2024 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721238719; cv=none; b=sERKmmAXzZpcnmwffRIJklJ/HIV/WGmpLXf4aaPJSxifPtuLUZUbgT+cedItPR54GDQwHeSB5UuNtBAHwtDOWLqF0VYL+YYON5bXKFzTgYKOMQTqo73iTej87o2nNxMed5LwfwBgNw7zQHgv96pLQQEFqHv8pKR68rn5h/NdocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721238719; c=relaxed/simple;
	bh=4KymJMjItiHjaDBo7ehEb15/1IBo4nmyw7/rY1jCfXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytnaz9PWjrPpCIsDX+RPYN3ImfnOM9Ir8tNgLglTvwkHgN9s/CJytTY75hiq3N4BRuyoH2zbEcrGmkH5ktW7/oyEGENw4akmSaas/BIFjxP0ZjaO694OdzCvw5zeWmi5BAyzzaIr3VAedWLp86WnN7UNJBgqfFAxbZq6YZuBR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=U/TlRzcQ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="U/TlRzcQ"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-703d5b29e06so276138a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Jul 2024 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1721238716; x=1721843516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4KymJMjItiHjaDBo7ehEb15/1IBo4nmyw7/rY1jCfXo=;
        b=U/TlRzcQcCEg8SqnusLFjZnDci8jaRv+ygcNnRl4z5GI0fxGy5ysOY43Rkz/Bqa3oO
         DFJAJZOwHYRZBp2Zp3xliFemXT83a/g+hGAc7AjUsRsoYxMVmzGJSl+F9YXzELr8XRyp
         a6vlbbLrxjflvzYY7Rvm0G5tIzUEBWzmEz0V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721238716; x=1721843516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KymJMjItiHjaDBo7ehEb15/1IBo4nmyw7/rY1jCfXo=;
        b=VQj2GppuoXh6KWlmsDDt21DVesxogdrfPvR9wWpigoOx5JJYhXJjoMHTTxLTyJhpgs
         h4DCXXUrFPKH7heoSZqsGOhlYwsuL1qyp8vQzqWjY7hMkzbGRcdNJDsVCm7BGxLaTq2d
         zIh6tD+UNKyZIxsBRSY6v2e5b/UxlK8h+9I6oSsuPINPRmgxnkemFURNAm+IM0uEpyur
         kCv5IU+V5qBpJnvvfVNRYSwHuBI39OMUkaN/MhRtMv8KoaMxhDp0GlPUqf6VdArJeXsJ
         xpNYTciln3wfm4snE09rjzrlpKxHQU5gfCy6ru1h7mp7UtpoKAc8AOpAqFVYU7NSjNKP
         BHUA==
X-Forwarded-Encrypted: i=1; AJvYcCUw/72YJ0q6zdF0DdX1V038CICGGUSGUmCvzJrZvtXCt9ejkGu//6JqBdmFdzaTjxswyYXX/SMD2nVs7AkMCgHKPOalvZsyofEqH7M=
X-Gm-Message-State: AOJu0YwtBELIcyWqSamq48g1tYDwTuBQWfvy322mRsghxNh6YQuzy8HO
	/Fpp5Ykib8GSIVo1x+Q48Nnxg5ewyI4IlCViFUK+SMNFMu26ZQi4dYiVzN1A2oY=
X-Google-Smtp-Source: AGHT+IFtTJrC+WOBRp63pjXboEs9Fo+tznfniYpnBCLJ5/IlGHpi2jq8bf5MlJtU489IIlRdW1eSkg==
X-Received: by 2002:a05:6830:264b:b0:703:6477:460a with SMTP id 46e09a7af769-708e3861904mr2562251a34.29.1721238716501;
        Wed, 17 Jul 2024 10:51:56 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-103-45.totalplay.net. [189.203.103.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708e7806ccesm159463a34.23.2024.07.17.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 10:51:56 -0700 (PDT)
Date: Wed, 17 Jul 2024 11:51:53 -0600
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: dts: arm/arm64: update devicetree files from
 Linux-v6.10
Message-ID: <20240717175153.GR561963@bill-the-cat>
References: <20240717143415.343827-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZjjATnUyRyajD0lO"
Content-Disposition: inline
In-Reply-To: <20240717143415.343827-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--ZjjATnUyRyajD0lO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 03:34:15PM +0100, Andre Przywara wrote:

> Sync the devicetree files from the official Linux kernel tree, v6.10.
> This is covering Allwinner SoCs with 32-bit and 64-bit ARM cores.
>=20
> Besides mostly cosmectic changes, this adds cpufreq support to H616
> boards, Nothing that U-Boot needs for itself, but helpful to pass on
> to kernels. We also get the .dts files for the Tanix TX1 TV box and
> three Anbernic handheld gaming devices.
>=20
> As before, this omits the non-backwards compatible changes to the R_INTC
> controller, to remain compatible with older kernels.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

This reminded me I needed to see that v6.10-dts is tagged upstream now.
So, for the record, when can we move sunxi to OF_UPSTREAM? Or what's
blocking it? Thanks!

--=20
Tom

--ZjjATnUyRyajD0lO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmaYBLIACgkQFHw5/5Y0
tyxacgwAkdiWRTXME+anSGff1UOKYHvC5BMiBaJWZB7O0K503672kDnvcfzudMZ1
BR8hS0JeRemfUOYDdMT6/cLH51JIANVCU2sJk1KUcoPFX4jqupdEoaIk3Rfa8Qyy
BjKG4wTG1t5ePLlDsF8grCkGdl7nS/i8NG8g4VmQLsPSpTFya+1+Y4KVjEtncVdq
VY9UCvhRcvwLVhOfb8gyfyz9nWixgQthfYhjfU9DvoblnreHQi15iNFNpOcRosG1
iCCW/olVDCckJbNlZvtvhLv/sxSbtqNIOHe+n/Qr91R5Xv8oQhKtynvMphYPynPV
1/7tMC4ESR+TjTBXM9qx18d87zTiuhUvKCWgW6jgBSbwZIsuOjgZ48G0a3LzN170
+akgflgdIeheR7N5nYtzZ9pO1Jl4UpNAljDLA8E2iAj41IecHZP3Ymz+TA4hdP84
fN8p4cebzR75G1YOBLlSEnN9HQ0knIfwTYomvwfj3soy6sittyCbl7hw4wt033X/
t5px4VFz
=B40U
-----END PGP SIGNATURE-----

--ZjjATnUyRyajD0lO--
