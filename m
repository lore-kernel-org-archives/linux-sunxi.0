Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15D68
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 17:58:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso14283704wmr.5
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=djGu5F47ZDEGPk74n/k+snh9k77CtD6nTsKeSDd0WXg=;
        b=RVjL5C6WAQIKdyIak0zrl0KhQ16O5G9WsIRC/7sv0S+am1czeu51b6VNZZSkUSFFUg
         6iD4Rr9d+b3XXB70FURx6biYfOgp2KWNPHR3Hrtv2qQ3SOC98xDj6JvU2TFw47fxgQrk
         0J+tz11ZNcIXkIgQEKrUFaAVBGSCOkPkCZ+Lc8ump8J6qwHisbMW01XP3GxRxZB7WSA7
         DUCEQuosWC0JHtqbKfId8haFlYZ4RaR6EePdjEhJL+9hID5ghcCXpFxjt5z7vJwmGNZD
         Z+ezIa6LUjWWGgjxlixn7tEiWK8jsm72yyHBhsWHsem+ol01zo3jWtUEwnPgq5RFi6BZ
         u7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=djGu5F47ZDEGPk74n/k+snh9k77CtD6nTsKeSDd0WXg=;
        b=LSubgBNsj+QxQPw3q4aIjKiEIuA2U+4NruXmqpTrWJqDYNE63JgvI+Qr5KauSR/6RR
         MzOPP2p1UBeZnu+jNts91ELIKIoPBVFOefjVAMwwxwX3pu052ShXeF0TaxGvcX55eeyt
         UKiVp8WjvlrdKHeVlLeeLDq1h1eBAhp2e+uqahEV+C/kM1/TG3Dk8g1h2xKIAz3eadrD
         B/uknRxlc6VvVmZ6LJplHFQHseFno5yS2TpPO1PBfcXBteugcaW/qNZzHNTDB6qrEZE2
         kfqAToGA7vDJL2XDj+7skFQz7pC+jae+NLeoGw7j9rMoB3/3TgQznxLEgmwy76YssSlP
         jIGA==
X-Gm-Message-State: AOAM53170yCt7aHGI1gS7le7v7H6BjCVbTMhLJuOITny369kv2UouuiF
	6ixlTXJY/5xQGytDlB9cfcs=
X-Google-Smtp-Source: ABdhPJwpnyv5VDLYai8280oakJLd8Q+2WnOYMjp4o9hxaCd8vCzo8UI9t1IWQRXt2ysfibFrCzMh1g==
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr633129wmh.15.1639504738260;
        Tue, 14 Dec 2021 09:58:58 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id a1sm540407wru.113.2021.12.14.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 09:58:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: Empty IN_FORMATS in sun4i-drm
Date: Tue, 14 Dec 2021 18:58:56 +0100
Message-ID: <2084377.irdbgypaU6@kista>
In-Reply-To: <20211214120248.y2zdzr5zsqowixjx@luna>
References: <20211214120248.y2zdzr5zsqowixjx@luna>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 14. december 2021 ob 13:02:48 CET je Emmanuel Gil Peyrot=20
napisal(a):
> Hi,
>=20
> After updating Weston from 9f8561e9 to 07326040 (latest master), it
> fails to run on my PinePhone saying =E2=80=9Cformat 0x34325258 not suppor=
ted by
> output DSI-1=E2=80=9D and then exiting.
>=20
> This format is XR24, which would be extremely surprising not to be
> present, and drm_info[1] says it is present.  Looking into Weston=E2=80=
=99s
> code, I found that drm_plane_populate_formats()=E2=80=99s docstring says =
it uses
> =E2=80=9Ceither the IN_FORMATS blob property (if available), or the plane=
's
> format list if not.=E2=80=9D  Looking back at drm_info, I saw said IN_FOR=
MATS
> blob being empty of formats (while the format list is fully populated):
> "IN_FORMATS" (immutable): blob =3D 32
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR (0x0)

Does this solve your issue? http://ix.io/3Ipo

Best regards,
Jernej

>=20
> This makes me think the kernel should populate IN_FORMATS with at least
> the same formats as the format list when supported, or stop advertising
> this property altogether.
>=20
> Other compositors (such as phoc) still run file, probably because they
> use the format list exclusively, without consideration for modifiers.
>=20
> Besides fixing this driver, would it make sense to also make Weston
> ignore an empty IN_FORMATS and fall back to the format list?
>=20
> Thanks,
>=20
> [1] https://github.com/ascent12/drm_info
>=20
> --=20
> Emmanuel Gil Peyrot
>=20


