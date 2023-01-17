Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018D4C9A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 16:16:12 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id z9so4912378qtv.5
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Jan 2023 08:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32k8zb8SlIXtNBA+355kied36qp9WCAcumqxmiU0DEk=;
        b=lpwhTDhGaQqc0e723O6ST5N6BNhSrkMWRdJ0nUHjZQExupVmiw1St/5wpyC/CtY0P1
         pFFR6gDGjeRgtqE66XOvo20qGZM0t1i/UdkF0LvjhhZW/AAgW6sxD+MQkPhbiFB2gBEy
         qzfQJ/+ig2N2k0f5y76fL4a4aeA2pa/D9PMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32k8zb8SlIXtNBA+355kied36qp9WCAcumqxmiU0DEk=;
        b=ChpiWtTSr4AJHt+qJsjomGNmbe8mpqo+qzYBqqUKBtrg3JtBCrGgal2S3Ny5NQiOSc
         xqzc2St0hitu3ppkydsbC7ZB2cmzgki8gjgVvnLYT9fr2LdW9LhjEihltDFocCCku6Yt
         Aj+aUVT2ku1Gc7+/JKCKi3wBpfSGmobTOVHrf1YVu1jQPMgB88r5TWEN8JMZhwA/jsjp
         G2hTAhEsGeE+b+2+iDNG5jdsq0FcXpLV2FsS1AMUgh0BbZWJESBuwZSiH5xOhqssMjOM
         ucxcDljqWivQFAjMXnShmgeCq7SJ/E4nEaqVyH4k03a9Gc6LYDpuD7ppI5DODgg5jTaf
         798Q==
X-Gm-Message-State: AFqh2kq4iuJZdjUTT9STWzlnxlTd4lXkyMt/ZZTGGBOyAIO0tBijcYqe
	dj6XzzpCsgY5vx/DeFnMLYCjhg==
X-Google-Smtp-Source: AMrXdXvFclcxsUWSN1SUIfYU7fyMzfsKr9SQNT9GZcdT5IbfbKLBabDmq+XDCK826C/n3iJTiYEODg==
X-Received: by 2002:a05:622a:40c8:b0:3b0:c9a1:d973 with SMTP id ch8-20020a05622a40c800b003b0c9a1d973mr32828436qtb.7.1673972171544;
        Tue, 17 Jan 2023 08:16:11 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-3487-94a5-6d7e-19f3.res6.spectrum.com. [2603:6081:7b00:6400:3487:94a5:6d7e:19f3])
        by smtp.gmail.com with ESMTPSA id t39-20020a05622a182700b003b63b20314esm1577961qtc.57.2023.01.17.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:16:11 -0800 (PST)
Date: Tue, 17 Jan 2023 11:16:09 -0500
From: Tom Rini <trini@konsulko.com>
To: Sergei Antonov <saproj@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ns16550: Fix DM serial operation with non-DM SPL
Message-ID: <20230117161609.GG3880571@bill-the-cat>
References: <20230117120938.818180-1-andre.przywara@arm.com>
 <CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WTO+dqXoBrlfXqg9"
Content-Disposition: inline
In-Reply-To: <CABikg9w9U28WMY9rS8dQwKpz9qnNu5i2_270U=SOLmHf=ZXw=w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett


--WTO+dqXoBrlfXqg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 04:12:54PM +0300, Sergei Antonov wrote:
> On Tue, 17 Jan 2023 at 15:10, Andre Przywara <andre.przywara@arm.com> wro=
te:
>=20
> > -#if CONFIG_IS_ENABLED(DM_SERIAL) && !defined(CONFIG_SYS_NS16550_REG_SI=
ZE)
> > +#if CONFIG_IS_ENABLED(DM_SERIAL)
> >  /*
> >   * For driver model we always use one byte per register, and sort out =
the
> >   * differences in the driver
> >   */
> > +#undef CONFIG_SYS_NS16550_REG_SIZE
> >  #define CONFIG_SYS_NS16550_REG_SIZE (-1)
> >  #endif
>=20
> What if I have DM_SERIAL and a 16550 UART with 32-bit registers?
> Before 9591b63531fa the register size of 8 was enforced for DM_SERIAL.

Note that right now, there are some broken cases still, which is why I
made:
https://patchwork.ozlabs.org/project/uboot/patch/20230110161946.3816866-5-t=
rini@konsulko.com/
but that doesn't fix _this_ case, either. Can you test the above patch
on your platform however? Thanks!

--=20
Tom

--WTO+dqXoBrlfXqg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPGyckACgkQFHw5/5Y0
tywohAv/YFtqeRWNptfyqwXYXD9HLuLZh9ue+tUFcl+IpQILsADW5XCEOJ3UDo83
BR+k8BKEUSRNg6mItxV1/prY1nwMLHeVhSPUETc+TAWp3QF4A/SSTXIt56L5jqfW
yIyNiMfvcE+3yJchsRLBM5DnBQXLlEL1eAGJUbGMKwueE6NpOE+OEpUfmzaur+oN
ilkY4emP2qNjTlC5m2plFRil8J/4O19nQkjyQfJxBYoKekReoP9MDqp+FzoY9Rw/
TIsVvQlZOMOcKy2Sfbn1EcZz68aEqVnkFDh6Yao95BvcIMdSWKiNPNPzuSNaEoTh
1E/bAyG9C1gEaim5+UnU7DyQzMrkvEk3jNQoMrh+Lnl80yG+HO2xOWY+I9UezrWA
IXcfE7iQ0rldgM9ARYIQUqgFIaWmQzh3JcwwbdsSTP59dJpLq1c2eAB/pegakBjW
j4SE9kJ7zR9Zq1QAJXxGzZGlp0J5lIsGgGpQ77DFgjGZ8ZxMS8Dgr7vgmmVPO2mT
Hk/7WeL9
=MdHc
-----END PGP SIGNATURE-----

--WTO+dqXoBrlfXqg9--
