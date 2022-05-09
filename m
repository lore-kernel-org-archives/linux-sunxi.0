Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B191FA0
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 15:06:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 125-20020a1c1983000000b003941f354c62so8458274wmz.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vtuult+HXOI7ZtF/5BeS7qYq/jPa50ON+a9bpjtA634=;
        b=pgM6nmm4hymS4A6ysjr+inu879QqK9kEaxseJfecvNfSf4ksYX99cBKbLO7yZcX74J
         pCs2urfaw5fX7fzbhoP08fziLPQBtjnpysD0YFKqjJLmEX9+7bqcu9nA6PIgu0tGaV10
         MqFL/WtRVB3uzsGeNxl+6a3yI0dSnhg7Oa4OtMrf5386cfuk1W04xtIWEQxJcc4Nli1h
         tgE80prFkmOwQHvwiE6ZYBIDTV5eyRbtOevjK/XSqcyhk2ubQITMCub4UPYXjfcyrxjx
         WvPWpKu/L3AHeuJENWieIn8T8f3z2sufVz4K1ETqWwVeNrgW2Vfw1OP6c1o3NNlkEpQ8
         IORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vtuult+HXOI7ZtF/5BeS7qYq/jPa50ON+a9bpjtA634=;
        b=Nh+eoVmYVjJHnkweUy1gOloWurmEs8zG8ErPnFXJLumMfNW+9JL8oeqtQu90/oW2YJ
         pkXLC3Z4Q9SQYceiPJALeMYnQlaXJEUR84NeWa62Ahi5GNBHPzdV0rC6hyHVTK/0dFNt
         pLpLqMyEq7t66F6px91gFoTUyzOW62BbFID/1Xf1bsivVQERX5iuMEp/YKrhD3Z1FWFh
         ACvKgkDbjwGE7Jh451RBb/5fUqYhgp4Pj1a5MqG+G8F+JOEcYR957pxVO1TVE3sWS+YQ
         WnRpGyKMOCeg6OAH0v72d4WvJvoG5qAprcP6ft4fcIefuJR7wNmPkh1Ju1kjZ7/1svDR
         uBMQ==
X-Gm-Message-State: AOAM532hJDD7Ebo/7LIajyaVugGNum6tWu4/UON/ekI+6goHBPBuOtw8
	w28NGOsAnVM5/AHrI0ZESzA=
X-Google-Smtp-Source: ABdhPJzd2YKTa7mT7VfKRjs9oRnYPy836QDekr6iO5gL5PTiA2RYsK898fSfq3OMC/h7EM4qRoeb2g==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id z21-20020a1cf415000000b0037fab4d1df2mr22572130wma.75.1652108786180;
        Mon, 09 May 2022 08:06:26 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id y14-20020adfe6ce000000b0020c5253d8bbsm11230631wrm.7.2022.05.09.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 08:06:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Subject: Re: Re: [GIT PULL] Allwinner DT changes for 5.19
Date: Mon, 09 May 2022 17:06:25 +0200
Message-ID: <2368089.jE0xQCEvom@kista>
In-Reply-To: <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
References: <YnVUmSLE1MZFkApt@kista.localdomain> <1789096.atdPhlSkOF@kista> <CAK8P3a3ePzJbh3p9edaDfZhZoYc=0-GvFCs3+2oLGjSoAhgvhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 09. maj 2022 ob 16:21:29 CEST je Arnd Bergmann napisal(a):
> On Sun, May 8, 2022 at 10:52 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
=2Ecom>=20
wrote:
> >
> > Dne petek, 06. maj 2022 ob 19:02:17 CEST je Jernej Skrabec napisal(a):
> > > Hi!
> > >
> > > Please pull following DT changes for 5.19.
> >
> > I missed one patch, please disregard.
>=20
> I had already merged this one, merging the new branch on top, while editi=
ng
> the merge log to not mention the duplicate commits. You can always follow=
 up
> with additional changes based on a branch that is already merged like thi=
s=20
one.

Ok, thanks! I'll follow up with new PR next time.

Best regards,
Jernej

>=20
>         Arnd
>=20


