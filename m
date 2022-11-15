Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845482F31
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 10:25:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x102so5976191ede.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcxZYjpbn2eV6/WvnT+obXOgeZnC8xXioG+ui237ndk=;
        b=p+/waMWp/YPPi2zuK0xUepgwXrm990oLJPYLIhWqDU+l2nOLAoRnuIS3P8HwK0RXiV
         fMymPcAywmAmAoRTfpjcnppNg41vlLIi38a93XqruoL2QCvc8o15oE0mBJ0dB3MKgm30
         dMecDRCsysliS6C6fwF6EYKAWYsbrW2swntlHvA5T418CT9nELoTdhAOTc3SMWOSigmT
         JMS4OHO7xRZEpja63p2HRAHk3omR9CXV2U2WVXq1ZnZz/0/IYcdaAsm3MOOiW1W8g1w4
         J+nBDxBK3ONDt+NlU3I6v1PV31cJYmbV5jKRty6rpPC4ygF3agdyNtSEPc85eM5XT1J/
         mH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcxZYjpbn2eV6/WvnT+obXOgeZnC8xXioG+ui237ndk=;
        b=2tqGL+ft4AhODAwNKcSOGUJLfk29IWfaFp7wmWVZydTg2dINdLvh+fwmmnTSY1IwW9
         Jjt3CQqL9CAHgrB9q92nnEI+k0DDhYPCUkatqrAPUHWNYuc5aP6l6ZnwnJ+uSmG2p/9w
         +sSlPpel7xHAPdAVGUR7IZIwShc4u1G+64HxQYYCfG4yea+1jGTICR0Pm6ql/TRFx+jg
         3Gqzg0I7Sf4W5Fsrh5vD6EDlS3iCqhG4GjzAkOZL4xLiwlPKhKxpVk5dX0YBLlyIDb03
         +G2YOa8WnbJwSfMV5W7AishYi85/M6lkUjC7YGiwCE+G/SU/QD5r9n7giB4nSPj0rX8p
         XugA==
X-Gm-Message-State: ANoB5pn4fyV+8HhlaVaQT09xJRltq/uK4I38GCCDIWeBjeYTTY7Z/m0N
	eJ4dMkUfysSCYSkytKXYCos=
X-Google-Smtp-Source: AA0mqf7KkYh41Ir0U/sn8JTfGNGkKtnVVNEBNZS3zDMGBmAUvKmOYAFxqecNiyVa+UPZKyGge1y8kw==
X-Received: by 2002:a05:6402:321f:b0:461:bd12:52ce with SMTP id g31-20020a056402321f00b00461bd1252cemr14419903eda.197.1668507948539;
        Tue, 15 Nov 2022 02:25:48 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b00782ee6b34f2sm5282111ejh.183.2022.11.15.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:25:47 -0800 (PST)
Date: Tue, 15 Nov 2022 11:25:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: pwm: allwinner,sun4i-a10: Add
 F1C100s compatible
Message-ID: <Y3NpKbWlMvcDNeeG@orome>
References: <20221107005433.11079-1-andre.przywara@arm.com>
 <20221107005433.11079-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v2xes7JCuwPLY+zC"
Content-Disposition: inline
In-Reply-To: <20221107005433.11079-2-andre.przywara@arm.com>
User-Agent: Mutt/2.2.8 (2022-11-05)


--v2xes7JCuwPLY+zC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 12:54:24AM +0000, Andre Przywara wrote:
> The PWM controller in the Allwinner F1C100s series of SoCs is the same
> as in the A20 SoCs, so allow using that as the fallback name.
>=20
> Join the V3s compatible string in an enum on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--v2xes7JCuwPLY+zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNzaSkACgkQ3SOs138+
s6H3+w/+MJpdt1BjQ9TSWGx9/Uf957PYJG4R3EI0PElk7GwAu9B2EI8UksZcHXaY
Yv8i0KrSJYVCwS3XVVrZMe+Q0phNkiu5Fhr0MR3kAWcHF0gAQrWRudeaYsF1o2b4
M8ZNdyIi9P54fT8PjE+VobpvcrlNvlcpSvt7K67oU0pI323mive0O57k2RSLqfvX
WxFv7VPio7UYmMdkYX0mar3ijYRYsUkePZDy+s96qc+0aM+i+2uFF4RHU7WmO06r
KUrQFP5sobG6G1o+cvx40hULuczJz6v0nVE/ImKWRybFO7YpF3/HuCYPMhSvNTMQ
yROAUT/cCIz9+lwpvILUkhfQ8uP/+87gbLeL/BEobXjT6rcKURQ/dLtmLB1JJsOh
SL3OjgByqHrKzB4EXxQYHgVnO2Q8Cq9uSUAufW7aBETKlUvt/lofTBEfTBjyhGNv
QXN+F2Q1Aj61bKmNSMpmE2pT5GrmLcTATD+FDzCzwNm/Ls6FVjsUpwiYI+ezS+xJ
RcQjmv62OKiUjfSlslfqZ+Lt3NopKmoPan57tlDN83o0PZodC5UiYQtln/cd/4F6
GhG6FHz6ojHPekH/bISrALAsbjl2JOKPtAEf8UtDJQ7W++BH03AIKpGZnchRW+Cj
Xs/E9gKPsYefTBtUwrFRDvEePST89LB4HbjVzEgvaI/UEWtmEC8=
=QuZ9
-----END PGP SIGNATURE-----

--v2xes7JCuwPLY+zC--
