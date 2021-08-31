Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DC572
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 17:18:53 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id q3so11044843plx.4
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y5Uf1K3wDCeqoUx5LFBv8PuASnv8aSshBfO5ZolPGLU=;
        b=BQbVUMseEZiAwjJGXXk5i96hSb+bHz6BSGwUXWvDLpwKT+wD1/RYHV1DXowG1KaUe7
         ft3ajX36YVpgXsT/V7XBYtw+WDxAUTl1TSfx9P4aJ6veywne/evL0JZUt4+YwWAjkos6
         3SATU+WkFaskG5Fi45HfZIBS1uD+oCtTLs6YPjhISyFzHrfxLzXf/KI6RAqdO7kg3cjs
         n2DxerOy2j1vsnKRzLxLjn7BqfAaVCYtkZnwHIEFZiIW0CtBjofNq6jZ56F8JFqujPOI
         TxRxR8Vun1Y0t/LkXtpynQC2Q1GZL2zuMOhxvu20U7AIas33pCoEOnKJimNhhb/t2p+Q
         u/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y5Uf1K3wDCeqoUx5LFBv8PuASnv8aSshBfO5ZolPGLU=;
        b=pbUxkgedWxqLpvQMlF0eQo9eevb18Gc8U1PAczA8TZQzwV15+wU0lVh4ZgJRuDtyMs
         qJ1DlShiMP3rOcrcQgZ41MWMySbR2IgFsVE6vzryVb74sUsfkQp7kP5r/XRh8qX1lNPL
         TajAlYYwRpAoLg14xKTtbatzjBsPlOFkoU87TPeXM1HAzTxRfkxDXg2WYdGyoibDzPpU
         nTaTJCpRq5sxzrJJf9jutsNR+MNYXIsmyLkUUltKhboO2iB8yK9y+i+n1cEV7Thz5eKX
         KRMXXQ+EthG+VOBxuthGU+ATVZeByR5HjdAmwt3YLmvu0pgQeT1lLXq9bewfyf3HVTIN
         p9og==
X-Gm-Message-State: AOAM533VmoRCEpE/jLC4WV0iifMp+z21pUVuYRiaqPfCxhJtW/7SV8Su
	qfAUPgczJ5KyI5UGyveu1/MJD4oLK68o0tDS308=
X-Google-Smtp-Source: ABdhPJxUaW7jmxkndZ20dba6dPiovaVp/eFi2R5ZJX6+QV4tnK1p+ImhEGj9ov0cLcEs6tJwKCG+QcCZ4JFa/qL+7cs=
X-Received: by 2002:a17:90a:2c0c:: with SMTP id m12mr6593628pjd.107.1630430333208;
 Tue, 31 Aug 2021 10:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
 <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com> <2072790.9m3SFDGqga@kista>
In-Reply-To: <2072790.9m3SFDGqga@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Tue, 31 Aug 2021 20:18:42 +0300
Message-ID: <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

=D0=B2=D1=82, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 19:52, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Hi!
>
> Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko napisal(=
a):
> > +CC: jernej.skrabec@gmail.com
> >
> > =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman S=
tratiienko <r.stratiienko@gmail.com>:
> > >
> > > Hello Jernej,
> > >
> > > During local testing I faced an issue where YV12 buffers are displaye=
d
> > > all in blue.
> > >
> > > Issue can be fixed by reverting:
> > > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> > >
> > > Could you have a look please?
>
> I believe I found the issue. Can you try replacing this line:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
> sun8i_csc.h#L20
>
> with:
> #define SUN8I_CSC_COEFF(base, i)        (base + 0x10 + 4 * (i))
>
> Note that "i" is in parenthesis.

Thank you for your quick response.
Yeah, that's it. Adding parenthesis solves the issue.

>
> Best regards,
> Jernej
>
> > >
> > > Best regards,
> > > Roman Stratiienko
> >
>
>
