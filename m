Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC163FC2
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 18:49:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so219052wma.0
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ttx6bMAS94NZgVYt3K54B5DCBv1SzFZ1QKmkOM0BMAg=;
        b=Dq4GrPtWYnjI7PdaRg1IumGNlB44PZSucGm9dkqcxaFRVTtR7mBHN0AWl7woAcYqVa
         SpVwV3DJp67FH2aL7ESf87/ZHT4YX9a0dWmiL6wsA90raBTueNXG3y/s+LuJOybUPv0S
         nhyItsTCAonsIFzohuEh6tIzkb3lDSoiwOmo0wgUJp74UZorJ0mUvTs0l0rlFbGRoCil
         Al86cXeBVzIcTLWC716gBirbwVpbEHr8ARyrLhY+Qt4W6r6JVD5y/Cpu7ej3qLTmVpxa
         iR8Gq9CF1ogUW1TQENSq0YD9gGt1SNG2zTrga4D+yGCEKca/GW/WJ+B1gOCoVK7uc+tU
         NtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ttx6bMAS94NZgVYt3K54B5DCBv1SzFZ1QKmkOM0BMAg=;
        b=JolPTCvbNuU0GXA1Poc48smyCaD5wt4Ba2pVnbUq7Mner7BkGh7ZARz5MVJi5EJuch
         iimUxP2uV4ouPIMt3PHWXlv+uQwtJpvnrAm1RIl325eUw7zcE/XRlA8O4YxBuDu2omPT
         kOD8eqHxiZAzq9tsxFTY/lTBO54HbB4Kr9QajOytWgpbcnjs3yG7OiU8QCc8M3vgI8th
         WAJxr2cu1pbNMifroclqyycpPWjOIfueiIAlTwAJ9s7gONQ9WXKDvzNBhdzE0EIEMfTk
         xlC2niLOVmRMxLHYraZvqbD8FSvoxNLacUQd78drgvdeQs37VFc0rcpwXUewimCjZ7cn
         JKig==
X-Gm-Message-State: AOAM530/qnQmMHaxNJi3s3uCSsPyFfpVfEuQ9MAeQEwDly3aeUyaSdlW
	GjOFGjDr2FxKuaES3h9Qcws=
X-Google-Smtp-Source: ABdhPJwAEe8emf73MKBgtwUTkWNiQwV7+aOlGc21X5WxoUr2WhNG7cEgbtVvKlNEZqofi4z1CN+rYw==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr5745302wmj.44.1630435771581;
        Tue, 31 Aug 2021 11:49:31 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id a133sm3354391wme.5.2021.08.31.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:49:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 20:49:30 +0200
Message-ID: <8627733.mJVyAx2qjc@kista>
In-Reply-To: <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com> <2072790.9m3SFDGqga@kista> <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 31. avgust 2021 ob 19:18:42 CEST je Roman Stratiienko napisal(a):
> Hi Jernej,
>=20
> =D0=B2=D1=82, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 19:52, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Hi!
> >
> > Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko=20
napisal(a):
> > > +CC: jernej.skrabec@gmail.com
> > >
> > > =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman=
 Stratiienko=20
<r.stratiienko@gmail.com>:
> > > >
> > > > Hello Jernej,
> > > >
> > > > During local testing I faced an issue where YV12 buffers are displa=
yed
> > > > all in blue.
> > > >
> > > > Issue can be fixed by reverting:
> > > > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> > > >
> > > > Could you have a look please?
> >
> > I believe I found the issue. Can you try replacing this line:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
> > sun8i_csc.h#L20
> >
> > with:
> > #define SUN8I_CSC_COEFF(base, i)        (base + 0x10 + 4 * (i))
> >
> > Note that "i" is in parenthesis.
>=20
> Thank you for your quick response.
> Yeah, that's it. Adding parenthesis solves the issue.

Thanks for reporting & testing!

Best regards,
Jernej

>=20
> >
> > Best regards,
> > Jernej
> >
> > > >
> > > > Best regards,
> > > > Roman Stratiienko
> > >
> >
> >
>=20


