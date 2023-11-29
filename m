Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D8C18E0E
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeSUa6gM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bc8a9503fso74772e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 02:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701252797; x=1701857597; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCZTkTf5gNqH/rsoLk7etD6DwWJwR710k5LJwshNSuI=;
        b=AeSUa6gMhSx/LUVYoPu287qR5+ZjqokTXELpxm6iBW9vNHD3JZv6bM7y7YAQXC96cs
         4KjLjEbS/lk/etIGSb0ztNqIKb2Yghn4GBQZOZpXnJ5bZ34mLIgp0zJFEDnouRw4IOVc
         +wXSjmCeIkH5SkTftfH7JlW66gOeg7daCLW5rRM5ZAZ0gfTntTSWg2ptdZBrFYFdq3pX
         7DSaa+847GwcmgHvbEMRQxiVjQqNbAQ5UAQYF0grSA7LNP2S8OM/IinAQKQSAh+Se5za
         YHW36eWuSFjKZ+XQTzmtXLt5UEpCl/UqGhrUhm0UWA1UgfMfFHVbUYVFtB3PcbZN6zEO
         mGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252797; x=1701857597;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCZTkTf5gNqH/rsoLk7etD6DwWJwR710k5LJwshNSuI=;
        b=MS6jjsgCm1NqDkv8P6zga1IQGYZcSe7N2W2iyKk15u8VRVBdM1qds67BE/4d7Z79Lr
         idKI5sbJCEjzwLDjCw0Dc/XpnYs5O6TRrvgz+1TL69qiyOZl8xw1f/X9KTej2vodzHwe
         L1FML8JvGm77xZebeOPZuDx3wEapdXhLuHGG61mMZNz2ahWTLWXuNqWXMLM/iwkcTtTv
         dH/nHQ2psQ3M8ZBwB9Ws93TYeP03f/REoDsgkSW1acxkY/Xww+xt43uL9mwHkVCU5XWi
         h3SSxK+zRm1OS4yAjZORn02eEo/dwLbUDFYL8plx8z8lDe4NUrKnMTUMJ71kysenwJA3
         pVcw==
X-Gm-Message-State: AOJu0YyTjT0icnAZ4DZ8B0xjuG5Zb7MA3S9jXedBWTgIjJosFhAbsyBT
	q1HLLxrhprDJlFBzEBbb5kY=
X-Google-Smtp-Source: AGHT+IEqoByK4nUUfepBkFUQYGj/+qIG7mkFMGeDo/wE/qhqodU6sLdPk1cmUua5FNVdwpoUj02mkQ==
X-Received: by 2002:a19:f60e:0:b0:507:cfbc:bf8d with SMTP id x14-20020a19f60e000000b00507cfbcbf8dmr11730596lfe.16.1701252797196;
        Wed, 29 Nov 2023 02:13:17 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id q9-20020a0565123a8900b0050abbda2c52sm2140292lfu.157.2023.11.29.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:13:16 -0800 (PST)
Date: Wed, 29 Nov 2023 12:12:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Sandy
 Huang <hjc@rock-chips.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-doc@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <20231129121259.47746996@eldfell>
In-Reply-To: <ZWXv1Oi_sH0BRWao@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
	<20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
	<87h6l66nth.fsf@intel.com>
	<v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
	<ZWXv1Oi_sH0BRWao@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Nov 2023 15:49:08 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> Should we perhaps start to use the (arguably hideous)
>  - void f(struct foo *bar)
>  + void f(struct foo bar[static 1])
> syntax to tell the compiler we don't accept NULL pointers?
>=20
> Hmm. Apparently that has the same problem as using any
> other kind of array syntax in the prototype. That is,
> the compiler demands to know the definition of 'struct foo'
> even though we're passing in effectively a pointer. Sigh.


__attribute__((nonnull)) ?


Thanks,
pq

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVnDqsACgkQI1/ltBGq
qqde7A/+LfG5e8v6ABH2JqANkfijej4EDU9sSC3ZWBaUspi3UJEY1U0ZrDHgQd27
lLSoxs0tguK5Dtehhk/Mn4S1XmyDtRrKNB/2L/rNqilREqQa5ciQG9OFjpqnepS2
3kONuuooZchgnujkUjmgCg+L1X05peA166I3R9MkD4N3eqBH++XmohBaeUJDpUnN
n1OATmnWyX2df7p/qBpOhVaNT+zu8HCgsIZq//PDNTxQxmHP5CPqbxbxuBjcwFHt
bX1coZ602jx16CsrwaVYgVsHehXW0ru901OSPJ4flgpx/EyAjA4hHuVg+lJIZKqs
wQRR4p/QdyBRULqGl/+4VML92ccuHFCedEtbLyH+RXSTlM547Q9nwtUPw1lB7tYQ
Zx0BchNXyqKGnYvQUx5rTpJlTjwwq/IqkGkXnzpc3tIuj7hNTXEE1+3voPqNlnlU
J16Lt49s2r4J2ufAykGzgqC19HM5baSykl006GFCpzLrH6iETMejOymRxAFlnE8m
NdVHVD2YMPW9c21sJ+UjfbGrvF3H6E6MYZLDQLRnL44aHuYkCK6uSBfpgF1ugEqP
Tzqd5wGEhEeH6OmzYEiwWHBkNJdiGnA4yo1dzpLdgdGaEKHRfdcGePGcNlLdtNcI
AQZwl9NR+mk0zozfoa9HsXTUv+Su0TXpgD/prZ7PyqzSeM/SmkE=
=Sfat
-----END PGP SIGNATURE-----

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz--
