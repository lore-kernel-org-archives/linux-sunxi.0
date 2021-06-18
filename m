Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFF571
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 16:38:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d196so12343084qkg.12
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Jun 2021 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EICT/2dwcf9iKV/tvgmxFcqhbN+Pz3T0ajLLTfBeTP8=;
        b=GEDl1885D6YajPP2fqpj6RIbAMt69Ccgg7J0GNOqPmUiY86v1Ntv/W/hp4HtLuq7cA
         hEq1KgIiuH1bb53f8zAh7maTfTcQJ8HIb3/aCRPWZUZIJZT1brGshDWFTDlXa0616uGB
         OYh3iO3d+IJlPxiJZ/7nS6q4rFk6rNHNkeHQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EICT/2dwcf9iKV/tvgmxFcqhbN+Pz3T0ajLLTfBeTP8=;
        b=YVGP3iD+Mj+rClclQ4n/yqDcpgvvEYHXtT1/T6WFrGn1YnceU3Z0XV+AS1S9UPy2Dj
         GwuSmsQoSo/ig7fa5DZwQwbIxB6ARYstYiQtzz7gH+sMiddDSovh6IIAPzHqUDN+2l4e
         +pEANR24Pt98JQFhVFAIwsJEsGEGsl1yeuMahVA5W7wL4KpfiuSkb0LlYw4q7KVLpuBa
         AEFYGvA07xHWc8CVctUeYclXRyl9MjKa1MDOkxKTp8n7Uy1m5D3Yg7AgfW2ON6hgUYYK
         kHtuScgrYE1VxGbW1jKnCVR46WcoUsJBz1ayCBp+pCGjPfGTmxt9AyBvg8pnXhHCyLo7
         iFag==
X-Gm-Message-State: AOAM530ZQnfOB97zOyOxMXb6AMEUIEPBnsf4wu3BCwA4cx40NvM0Yk9v
	LeMIf42q6tLxH6KYh57mPq3t3w==
X-Google-Smtp-Source: ABdhPJy4YDfyX5kY+3kNElAtXIyDorWl7aVbLd0VCqob1PCn8AKB3P8syIKhXdUDKkYWrHnWHADWxA==
X-Received: by 2002:a37:b13:: with SMTP id 19mr10202242qkl.87.1624034300271;
        Fri, 18 Jun 2021 09:38:20 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b01-cbda-143e-7f00-f95f-8895.res6.spectrum.com. [2603:6081:7b01:cbda:143e:7f00:f95f:8895])
        by smtp.gmail.com with ESMTPSA id i11sm4272444qkl.95.2021.06.18.09.38.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:38:19 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:38:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mkimage: add a flag to describe whether -A is
 specified
Message-ID: <20210618163817.GS9516@bill-the-cat>
References: <20210617184621.4083311-1-icenowy@aosc.io>
 <20210617184621.4083311-2-icenowy@aosc.io>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A25Mno8zdSIr3fdZ"
Content-Disposition: inline
In-Reply-To: <20210617184621.4083311-2-icenowy@aosc.io>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)


--A25Mno8zdSIr3fdZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 02:46:18AM +0800, Icenowy Zheng wrote:

> The sunxi_egon type used to take no -A argument (because we assume sunxi
> targets are all ARM). However, as Allwinner D1 appears as the first
> RISC-V sunxi target, we need to support -A; in addition, as external
> projects rely on U-Boot mkimage to generate sunxi eGON.BT0 header, we
> need to keep compatibility with command line without -A.
>=20
> As the default value of arch in mkimage is not proper (IH_ARCH_PPC
> instead of IH_ARCH_INVALID), to keep more compatibility, add an Aflag
> field to image parameters to describe whether an architecture is
> explicitly specified.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--A25Mno8zdSIr3fdZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDMy/kACgkQFHw5/5Y0
tyyhugwAoFH8gaSDPu7tHt3hfpzrhJ7P4qsSdr8r36pxKm/CsDykYUnvo3MB+Dwe
bJ5quyDTBjH6kC+ZJlRU8M5GKOXdv+s095cxHqR22Ps032BJcmKmu+NXuz/y/ZVs
PiUGLNfQ5hSLrie+nDAg30pCBwvw4mRPZecI9PoemPtEFqWJ4JUmq4bA2wwEaVh/
LxFXKEnM6qlycZ3NykDO4IhL9ZZt7nkrjR3/QP6HxA0tmVpVH1GznUmZQC5taQvG
UnVjD51KooY+DgqhZC5r7Bat9OXCRpcX7wbv0rf4ZgQ4v67fCixSGkV7CZBOwHJx
NCLTZw8uDKVtRKlX1oArDbAl3t5Z1DyeuGl1Am+rOji2TmHzVEBWc+7cMBrsw/fm
dJvV2e5+uKAvOmDrYc8OZEaev5ArSBCBB/WRaACT0CYXy9RrybSLQfoc+NL6fOT1
EpPWVfIHB5rvWX78lSJ54ZgjFv3WIMApF+r8PdLch4U4qanhK7zD/2baLqv7AcyI
JOMwYzDP
=z2c7
-----END PGP SIGNATURE-----

--A25Mno8zdSIr3fdZ--
