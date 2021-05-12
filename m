Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939E72
	for <linux-sunxi@lists.linux.dev>; Wed, 12 May 2021 05:47:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id u13so25586816edd.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 May 2021 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=mime-version:content-transfer-encoding:cc:subject:from:to:date
         :message-id:in-reply-to;
        bh=vbFsoh9ohEb7zIVWzV5ptiOiSycRks0c/6rvERhMVHc=;
        b=X7z5/Q1J6VgjxQXIPRS4M7F8EB971FbvpD6spXEJPRMIV094dHGOUwj2QtHG04F4xE
         VQ6rSu2guj5N278pG+aqYjl5C+hgxstxPuRUlVfHscWoxoGzPnD4I3r0xrvbz+t0H3Hf
         gTc8xaEKMFC0yymEVeRpCOt+CF9T2IVUnHPui8cBKJrCz99uamFGuFcrG3iXsjdMfBoh
         RmmWdw7/cMp0kRpWPgTaENwBoJPdTPrpophFfeUqRrbvnNgm0W/qeKdlNrw3+fndHOt1
         jyS9QIox54zKW0kGkqQMaJKtjZRFv4P/w5dBXdzpBEGkXQomozl7KMuo1RIHTddhcPVd
         ev1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:cc
         :subject:from:to:date:message-id:in-reply-to;
        bh=vbFsoh9ohEb7zIVWzV5ptiOiSycRks0c/6rvERhMVHc=;
        b=AcyDiU2EGpViocwlUqY8APXX8FxC02jLe6rFuUiwB16Lq7U6Pt+Fmn0sdwpiQuwPw3
         SoFYSg4A8DhZbBQIcpmpF6nngP0LOZGLq5Rss5TakdqDuSzqrmD1a260hCe+2jPFOx3L
         yh1kykC10OoCU6r1uFbokXAtNt2j/WsyCOkrqIkXUvJ+OWfMCwleEWtn0OZqzbbCeSMJ
         vn0hPcsOnmqyJBbAEfDk+4P9xhSJ8rI36D6+SG5+JjhEtmTVDymq+a02z3aIwjpKdm3m
         VwdqSX030Kk0U/844MZQVrVsK7OqZPQvCDpcQUw1qd5DSd2qVr3Y8Aor0t1kVIR/kWuH
         Oopw==
X-Gm-Message-State: AOAM5325zWhQgzuKepRJ6fR46K/lWHw4rJX9Ni1NEPqJjuvpnCLC2em8
	thu5KzlVIQtyCqZ78tW2iQcLJg==
X-Google-Smtp-Source: ABdhPJx672mmykcbTexM9EAbZb31PEj0Rgd48inNYK/ucSswpGdvEzIdldedEHafGcqcqaChx4r5OQ==
X-Received: by 2002:a05:6402:2050:: with SMTP id bc16mr40819009edb.179.1620798448337;
        Tue, 11 May 2021 22:47:28 -0700 (PDT)
Received: from localhost (ip-89-102-194-33.net.upcbroadband.cz. [89.102.194.33])
        by smtp.gmail.com with ESMTPSA id r17sm16639423edt.33.2021.05.11.22.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 22:47:27 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Lee Jones"
 <lee.jones@linaro.org>, "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu
 Tsai" <wens@csie.org>, <linux-pwm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-sunxi@googlegroups.com>, "Roman Beranek" <roman.beranek@prusa3d.com>
Subject: Re: [PATCH] pwm: sun4i: Avoid waiting until the next period
From: "Roman Beranek" <roman.beranek@prusa3d.cz>
To: "Emil Lenngren" <emil.lenngren@gmail.com>
Date: Wed, 12 May 2021 07:31:10 +0200
Message-Id: <CBB0R32KLDNX.1JIF8XT3UECRZ@zen.local>
In-Reply-To: <CAO1O6seU7t==O=yCVBQK0iAkeEyO3dbRQ71obJh3Jm26xxWobw@mail.gmail.com>

On Wed May 12, 2021 at 2:55 AM CEST, Emil Lenngren wrote:
> By closing the gate when the pwm should be disabled, I guess we could
> save some nanoampere or microampere (is this important?)

Or perhaps I could add suspend/resume ops and have the gate closed for
disabled channels after a fixed-duration delay of 2 cycles * 72k prsclr
(6 ms) until the system is resumed?

Cheers,
Roman
