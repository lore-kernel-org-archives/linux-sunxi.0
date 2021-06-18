Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C23271
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 16:38:26 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 3so2780708qks.8
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NZ6VhgBg/xqsTMDR8qN7JoON7D4jU93NwLP7hXZPG2Y=;
        b=tAAg/0nzCJBzdhoar/sOZnxiAkpvVV4Oc1edM2le+iH2d3PQ3wHMCc1DlF4367hFXc
         HW9O7lP1JG051O1x+KPUbtD0Gzf6UGk4jdgLujKubQ1Rn+nOQsQmlpuDHXhN/yRZ3LMt
         GU0gR9xfWWQAPmlV/alNiP7cFALyknAJoM6SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NZ6VhgBg/xqsTMDR8qN7JoON7D4jU93NwLP7hXZPG2Y=;
        b=Iq9FTigggQ+Cxf40czloJt+fLmnqsCYpT1Lkfe15AW2r8w2/hc4eYpTNayzNmsZdmd
         C9S5lJRYLRFsRehtnyvP7I/mbMxNUP62Fq9UR2H1QEbXcSR5xmRhhxzwzkdcx9+hb+Xn
         gFvjeYntBrHfH4kELFlfBlKQCZKg78VECakd5GpeSzS0GGWj3qpywRd1XYdadvVR3QHf
         8jUyzW1wZxxLNlg5CpF7cm8PjXFkwmD8ORuVWh0xi34fOIxDoGSRKJEvRAZCEzcACWic
         cMULzNdLahyNILQYLy8eC6fwrf68xT2lTKSkdHxW/9BH6+SYu413Yl2WqT7Oy7GfHG/r
         9EZA==
X-Gm-Message-State: AOAM5337jqr491j8sH0DLubZtRcNJKpjdkrV4kkvOjR9l+MFtAX1nn0D
	ql2FX93giJNRnDO/lHEMX8Q5gg==
X-Google-Smtp-Source: ABdhPJweLTTM7AwHrzfO1O8f+VVsQjgXW464v2BVwegP1GO9ZPc5Or5lCYiiapafUd+LfXZsx8m2vw==
X-Received: by 2002:a37:6114:: with SMTP id v20mr10531204qkb.157.1624034305150;
        Fri, 18 Jun 2021 09:38:25 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b01-cbda-143e-7f00-f95f-8895.res6.spectrum.com. [2603:6081:7b01:cbda:143e:7f00:f95f:8895])
        by smtp.gmail.com with ESMTPSA id z136sm4445311qkb.34.2021.06.18.09.38.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:38:24 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:38:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mkimage: sunxi_egon: refactor for
 multi-architecture support
Message-ID: <20210618163822.GT9516@bill-the-cat>
References: <20210617184621.4083311-1-icenowy@aosc.io>
 <20210617184751.4083469-1-icenowy@aosc.io>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7FBusMY41sbWuT4E"
Content-Disposition: inline
In-Reply-To: <20210617184751.4083469-1-icenowy@aosc.io>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--7FBusMY41sbWuT4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 02:47:49AM +0800, Icenowy Zheng wrote:

> Refactor some functions in mkimage sunxi_egon type, in order to prepare
> for adding support for more CPU architectures (e.g. RISC-V). In
> addition, compatibility for operation w/o specified architecture is
> kept, in this case the architecture is assumed as ARM.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  tools/sunxi_egon.c | 63 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
> index a5299eb6a1..af649c392e 100644
> --- a/tools/sunxi_egon.c
> +++ b/tools/sunxi_egon.c
> @@ -16,7 +16,25 @@
> =20
>  static int egon_check_params(struct image_tool_params *params)
>  {
> -	/* We just need a binary image file. */
> +	int arch;
> +
> +	/* Assume ARM when no architecture specified for compatibility */
> +	if (params->Aflags)

Since this should be params->Aflag and you fix in the next part, please
fix it in this patch for the next version.  I'm pointing this out here
because aside from this, everything looks fine and I agree with the
overall approach.  Thanks.

--=20
Tom

--7FBusMY41sbWuT4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDMy/4ACgkQFHw5/5Y0
tyyoCAwAq3ZUXZrLTHKjdTCuwE9YLTVXcpIDkY+Kmg+FpzETMKh+rqPOYw8S4VlU
8LdstO5zXeE6DvEG07sVAcpMUhKhNF0GzUerOFCJILeKGHrzepLJT8IypPKDLc3L
cRoHnO2KVCqyVingPmSng1b/jV34cjhlHt219s0jVqBF4SWnYIHj9gR2M91aP35o
Z6MHjON1PrKIptAFIaw6KmYmCqjudTTK0/a53sYEmK2tvgKBgz+NTP7BnH7qhtm9
vFvnDZfDKjmLnONYfHp5Sy8AhTWj+Pch6xkHUFqPbesQ98D5ADjhVxE8ZCk6Kco/
+h7qUHlbJYszo7RtxZtMIa1C/Q2K9gEhBmyGUbkitkPqGG/WBho6wBtLP8OZxolh
qpxG4lLrVDAz59vDMDuiS16l9XFs6VgrNkpwc2R9HFm87ZCuVYzdc3Dj/0O5zjqT
nW3RU6MZ9BzQWuYsk+Uhrz2cqnlhFVdTC9DKVsC75VtHyGisi1jmJwnWRFIvM+bX
yaNIvD+m
=T2V3
-----END PGP SIGNATURE-----

--7FBusMY41sbWuT4E--
