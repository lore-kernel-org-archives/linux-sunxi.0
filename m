Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85C4A00
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 18:17:21 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id o1so381042qkg.9
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BhBxxXErolDDeAjaKYVNvGKhlVWMLhLrt4LAU1AjUHE=;
        b=l2V2yX0badbJ6OWKiDoneTV4ppIybTqV7NU7bwSWxJhY9EWTX6s++/LaC0JL8eZSo5
         x9+2mJnr/yFGf3lKSAM3VQdHDNF9A4yemj0KF12yXtD0xQLdmfNzqfcqNE38ejx60CkZ
         LeDwfsL7IIXchq/4ykwy2nql1hwY8tyOELPEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BhBxxXErolDDeAjaKYVNvGKhlVWMLhLrt4LAU1AjUHE=;
        b=WChjyWEbWBXw5xzp7/E858dnQbx7GwHh1BZyHBk3KBGeoLHmslSImKxLBGYdfYcFhY
         dkaadJesrMvc8ZcZbZ7Cia6Z35M9MLvq+KbMAn1rc04XR7X/4ZkwLLpEklTn0gXyEl0N
         8+GIntA3uGY7B1lU3yJ31hUso7xFBzFtxNAjkSePRpPWxu+ZNX8lR/LlhskNOVmbhepO
         QVfhFN3VguVf/6351fF5Gixm3J5kySnOBF+inK5hILiW5NHUAaQyQON6f3SV09mct/Oh
         PL1/yFw0AogvYV7dKWyhpg4nkIlgBTLm/BPaU/gpituxDw75rpbE9lw+vyZwpwDDegi8
         st6A==
X-Gm-Message-State: AJIora/F1rdUH60ciPjR/zCoCMb1x/ufkyleLEgjJ4SpsnVX3yfoab5t
	p7It44qe8HmM+CniKBXpV+0cPQ==
X-Google-Smtp-Source: AGRyM1uGNPwQY3bRMYRYylX5ofnn1QPnq/JzKllJLLnmp10je7EhUNwlR7Q8r2VFeSU3TK3jdhRYow==
X-Received: by 2002:a05:620a:1a0e:b0:6b5:a277:f9b3 with SMTP id bk14-20020a05620a1a0e00b006b5a277f9b3mr3339852qkb.145.1657736240420;
        Wed, 13 Jul 2022 11:17:20 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id l20-20020a05622a175400b00304fa21762csm7341787qtk.53.2022.07.13.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 11:17:19 -0700 (PDT)
Date: Wed, 13 Jul 2022 14:17:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: configs: streamline include/configs/sun*.h
 wrappers
Message-ID: <20220713181717.GP1146598@bill-the-cat>
References: <20220713155857.83170-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MKJ5QjdZMmoZffjB"
Content-Disposition: inline
In-Reply-To: <20220713155857.83170-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--MKJ5QjdZMmoZffjB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 04:58:57PM +0100, Andre Przywara wrote:
> For mostly historic reasons we had configuration headers for each
> Allwinner CPU "family". These days they are mostly just including one
> common header, with the rest being somewhat empty.
> There were attempts to remove them, and to just use the one common header
> to begin with, but this has implications to the build system, which me
> might not be ready for, yet.
>=20
> To document this behaviour, and to avoid something sneaking in over
> time, make those files all the same (minus the CPU family name and
> the copyrights), and add a comment explaining that.
> This makes it easier to just remove those files later on, when needed
> and possible.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
> ---
> Hi Tom,
>=20
> this is mostly to just confirm and document what we already established
> earlier: that those files are redundant, and are just needed to match
> CONFIG_SYS_CONFIG_NAME. In case we don't need or want that anymore, we
> can just remove them, without needing to think too hard about it.

Right, we need this for CONFIG_SYS_CONFIG_NAME and in turn being able to
break up the build for Azure, and manual build testing still.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--MKJ5QjdZMmoZffjB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLPDC0ACgkQFHw5/5Y0
tyzJjQv/T8I0TDits8CCxMLw2XPmcSZxvOQ9dgROClDMS8FNhPkfVXcOJ4KAW/VG
J9YavfFYrS4WIjbEZZZ7MFBhUhcl69ByGrGZLVP/zkAxmlP/Lyy3/DievESG15a7
54wUecO55zz9JWJmWKyg6WpXbEaQTFQD5KoHDBgerGkfAQfEX/fu0KX5nghzNPiA
uHViG65xAt4kzumwE66RmHIxwmsoC2JlagzTJVJc/PlAtbVqTIvXKFRso69oflmB
n7gWDNrYQYzGofdcZmvjnBcZgMWKdcClhpI2GpRS7Ha6HQaf7ya6KqmMybtrf3gI
B3WOysHsMQ0myDMaSuCnWHNKDsTq50GdBhsAkpdHSK1H/6LUGMiVTsK0oPO7Rw+F
UpCwjytFZdYqxSm564CuiRegypu1Ta06499v3/UQioSiInm6o4uM876oQWROu9u5
6aaWMWYK9uH5UYw96mv6R45ExjT2zNUOzplHigLATqTnSMpkw3xYpu1pEwLTE4vJ
XtQitGC4
=WF+F
-----END PGP SIGNATURE-----

--MKJ5QjdZMmoZffjB--
