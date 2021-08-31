Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98772
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 16:38:56 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q14so53264wrp.3
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w8Pqc83PIRgH3BzycVik/NXM5xJcLHU0opchQoMghiA=;
        b=ohTmwadsjLj+nN9yVdB0KWJYMalk079iIuEW2E0omzhq/AkuPSQ99UXMoJH2rflYHr
         9Pn3ebrbpXnxZNYEQ4cDlPF/2gmVFY8BLNVmmFpfPn4BCYKLn8D9x6iJpW8Js/PWJCkr
         dsDxNsrbxzJ7/B6vv6l4/S7unoT3U7AWp3/ZLHG8W92wecrU9PwH/+a00Tmh+A1nGQfE
         9KQ3LJ7x1vfuFaeP/3ejee2Ppwu/7xzG3gkqX8ZlrQpLAkENLjQtGCeWyUVbNVWy1jdJ
         T3FklFix0j3n7hpqQG1Bj17BRk1xLrnty32xfekHcFbvGqteswksRbZXZAiIS9CMxFlh
         Sccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8Pqc83PIRgH3BzycVik/NXM5xJcLHU0opchQoMghiA=;
        b=Gi9ME+OBDJH5Qec4SFMaSnEKvF3tK650q3FXM//EflwRXGdT2+QRuoE/a/AWFaWJ34
         nD1KnLUv/iBy/JQSXgkjeZ4+za7cMNm6y/G7cAJF3jkW3fOf1K5Bl0vkTT/17QDgdAZl
         KCnPvyE/mHPPYi27qPM5X2OKSTz7S++5ek9ZhrDgohPaMdlFtuz+LrKi5dONWc/Bf4Lp
         NMMPLGfhJFPrZuPOB6fSV9D0YproasyOMyLt3y5kIXKS/8YPY54pash++xOOlMz625u7
         xf0Zu0aq8IjGN47Z+H+82CNAKSi1Xcuk61Rtd2wFhhkDLf0/lO46YBXI70j4y/7NF4xL
         zdPw==
X-Gm-Message-State: AOAM532df/jnXs+/7dwXlakz5jkCogpf/eoibgGXyB6JpUvpbKqC9xlt
	0vyFAebQAcymLyLOT8ObfYo=
X-Google-Smtp-Source: ABdhPJxzc5ivgUekzySQzRU9Vf+RmAdoZOerJx8PIQ3ULePwuTt/SuSyqiJrF4TtZ4s91DT7Ap4x9w==
X-Received: by 2002:adf:c104:: with SMTP id r4mr12682824wre.404.1630427934982;
        Tue, 31 Aug 2021 09:38:54 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id d9sm23133899wrb.36.2021.08.31.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:38:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 18:38:53 +0200
Message-ID: <5260533.ZaFvgIizOL@kista>
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

Hi Roman!

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

Yes, but I need more info - which SoCs are you using? Different routes are=
=20
taken for DE3 and DE2. In theory, they should be the same...

Best regards,
Jernej

> >
> > Best regards,
> > Roman Stratiienko
>=20


