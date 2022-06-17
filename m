Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6E2F53
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 13:16:56 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id o43so6368237qvo.4
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QCgFL3to13Wc8rGF4h9c9SXL+sppxdQbOKgB6794SMI=;
        b=G6xaw1a4xgKr0I/LpSfdl8HPwuRS7/KrZOBlxXP/eb7NQLFne6xlhM0yNUvB+bYFj+
         2SPglrlwsvQ3Y+F+KF/HNXKL1lc8L383o1GkVFTlNT3cs2cqR3MTPTBOtfNufVYjaTcX
         WUNQuOC88l1MvkqLDNDMqO6CoiU1BVo/Hu3QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QCgFL3to13Wc8rGF4h9c9SXL+sppxdQbOKgB6794SMI=;
        b=gRFus5pd5sPQx9JZvW3xyFS7/gAEj9GojIbDtf0rewGOhKCwVi4aNBB6ADivbskWWf
         dB0DgZVt8pGm7m8UMJsI6COFaCFhEppCd4yRp0qkzQD5efkl+Z5MhGHLBqO68KTPbI5z
         SYoHhclfaQZdcmIt+TsiHc05SQfw6wno15ONpWfQtJeDhLqyskLtHBV8yC1k7pxW4ARc
         wB7L8tg4To3YdTtfna+Equyq4xcL+yW5Qksgxn0KgcPcQFwWB0twq5zDXTKV9SGScx4z
         rPQIasxruAQnpqvhdRztSoyv2q6FwmwglrMgqnKd/3NhYdbhydVhCvDYz3/Eab4Re4mQ
         UdfQ==
X-Gm-Message-State: AJIora+8bAXj8QZGNoXgm/4SbgLz/bMGNoYiGcOkldqzOJvNnwI5Waqv
	tmzgL+/UUXNoCfrKFItKBN75YA==
X-Google-Smtp-Source: AGRyM1t38IqlI6f9zqY8b5RR6DdeKCABcgKedkEXqUiTcYh7zB67gn9nu1b05uPkx0HWijq0Y0TI3w==
X-Received: by 2002:ac8:584b:0:b0:304:f08b:5dd4 with SMTP id h11-20020ac8584b000000b00304f08b5dd4mr8314217qth.77.1655471815363;
        Fri, 17 Jun 2022 06:16:55 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id br6-20020a05620a460600b006a6d3fa430csm4290617qkb.58.2022.06.17.06.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 06:16:54 -0700 (PDT)
Date: Fri, 17 Jun 2022 09:16:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] usb: host: ehci-generic: Make resets and clocks optional
Message-ID: <20220617131652.GM2484912@bill-the-cat>
References: <20220607234222.2252-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J1Shk2GgFwoWW9YC"
Content-Disposition: inline
In-Reply-To: <20220607234222.2252-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--J1Shk2GgFwoWW9YC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 12:42:22AM +0100, Andre Przywara wrote:

> The generic EHCI binding does not *require* resets and clocks
> properties, and indeed for instance the Allwinner A20 SoCs does not
> need or define any resets in its DT.
>=20
> Don't easily give up if clk_get_bulk() or reset_get_bulk() return an
> error, but check if that is due to the DT simply having no entries for
> either of them.
>=20
> This fixes USB operation on all boards with an Allwinner A10 or A20 SoC,
> which were reporting an error after commit ba96176ab70e2999:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Bus usb@1c14000: ehci_generic usb@1c14000: Failed to get resets (err=3D-2)
> probe failed, error -2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--J1Shk2GgFwoWW9YC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKsfsQACgkQFHw5/5Y0
tyxMzwv+Mlw30Cnu6Mth7Uk65vU19xJGGzorwLvlUtwXtVniLs3JZAMuDtiDJjxC
1sBIifeR8ukh0n6mg7MdtrN72kwGkM0qFLS9v6yAj3aDeamLlIHZniW6501W6O/C
9b+ONiS5s+sR5w6F6GwJ77FqsFbv3ov//qw6/VyCSAjLBjtd8sPMQmXCFyk3UzQn
12zrJeM+IVDhYVi7l7gNiqP6P/c1RHCHGDb3D7z9NnB4hACxJ8DJaIV5+u50zp62
8yJ6kaqYwmyyunS6G1lQhGI4WGAT3qGx0xPHgWjVS8H4Rrj3bPSZkPiE2pr1N8fI
IuVPAOk2MRmNzottzEUU6KqdjZS2qzvZdrWWFoidp/aLmIABXFRI3kqlIKfiKHN+
J72626crmq65H8z8N3TQHcsgEeEKJ0OXZGasrJ8begA/vqWf/B3VaIYBDR2M/alW
xi3UyKPKqeUKLeoPivW5lfrykLLfxcCjX8QCxmr4ngWZR9xrae67nqLc39uJMdMF
bRc16ZW0
=AIUg
-----END PGP SIGNATURE-----

--J1Shk2GgFwoWW9YC--
