Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8672
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 16:52:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id i3so11702855wmq.3
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f9giteliJAtEnVgz5jyMBJVJCFtkiv4aYEa6F9VgWIM=;
        b=IcqDYtCokPsFYNoeXUnJILa7Ee9A4Cg3TAHXhCdSEa7S2p/WLttIMFc5nbf+AB2Jwg
         WjFNKNSaFbp9H8+h1NJNMdNaEcN28EvHhvLHfuy2LTwYqukSqfReN1ogza1dcWtYVhj2
         9yyF9c69AWjZvDxSMnJlHCr++xPfUhf0DNmBmQ3Q22gfVaaPcXXhwAq6NHMqQWTlCip+
         uiC581S3EHWDfgbpyW9vx1r0e+7Cc69Oa0KpNU+FTawU64FhCWa5s8ibk2a5a+uXZwnF
         sqmlqIrMAanNEQQ5ELlvQMMuC/Hw4WcxFRQfjA2JAtCtSYcAFhwDKjgi81b5v8f4QFXQ
         H0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f9giteliJAtEnVgz5jyMBJVJCFtkiv4aYEa6F9VgWIM=;
        b=WTLRQWiv+E3JVMhAbAf5OTAr7nu+F+lZzqMcyFXl2yH5bdRWsa0Rbm08jtVTJDlAah
         2VfFEkmVJ1hLv5ssefx9QhMsMX22wu4Zu+2nzko7wH0Cixe7Ys6iBQJssh1t/UFPDuwJ
         DjIGOIHrQwLvSMVYCNrVfEaUCm+COj1ssVqZEHc0WSiNSydNYTOFWHzGyYifOhLtznta
         vzGMHsD4msgS3FSO0uKFV9oEOdswUZc1CwpuhmqU3/DaXc8dwNmuObkYPed5gk8CvLoU
         QQorseb6DeVHaP3VuJi9L45rIaz47/5JongPdz7378PiS7lrTGChI5sN951C8fWD/BaO
         EQvQ==
X-Gm-Message-State: AOAM533HrBRM2mNPDzv1fk/1ttzkiTwapF5DEbGdMH5MRB5JnPFU/3c8
	pRf9ghvYmvV0CaKFxfu3OKI=
X-Google-Smtp-Source: ABdhPJwe2+aS5B8R/c7+WFZ9DMhcnbesD4e1kSKShnIL9q5iGMqlw8fGbEABsp7fiCPDMVAfFWV0cQ==
X-Received: by 2002:a05:600c:a05:: with SMTP id z5mr5399978wmp.73.1630428755077;
        Tue, 31 Aug 2021 09:52:35 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id c1sm2872693wml.33.2021.08.31.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:52:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 18:52:33 +0200
Message-ID: <2072790.9m3SFDGqga@kista>
In-Reply-To: <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com> <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi!

Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko napisal(a):
> +CC: jernej.skrabec@gmail.com
>=20
> =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman Str=
atiienko <r.stratiienko@gmail.com>:
> >
> > Hello Jernej,
> >
> > During local testing I faced an issue where YV12 buffers are displayed
> > all in blue.
> >
> > Issue can be fixed by reverting:
> > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> >
> > Could you have a look please?

I believe I found the issue. Can you try replacing this line:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
sun8i_csc.h#L20

with:
#define SUN8I_CSC_COEFF(base, i)	(base + 0x10 + 4 * (i))

Note that "i" is in parenthesis.

Best regards,
Jernej

> >
> > Best regards,
> > Roman Stratiienko
>=20


