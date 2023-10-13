Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE8224C7
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5KH3Tko"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-405524e6768so24835925e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697224983; x=1697829783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsychVIow/LXp2PohZlsx410ZOet1ssLl3dK2R5eP+M=;
        b=L5KH3Tko81ysI3Pyp034P9aUbjpfpheusEmDQ4W7Up0ZLKjvCYllAdWTdGnoMVTwv4
         QMzj/EVLy3tpKTKvKmmeA6LNarGrKx5ELWosM/giY1aVMYJxHfLiSLIShfQ0/dUjJIlP
         v8G//KU4on2rbcADzLuQ0qDJuSDC7THF/pbmdugdtNPaAFlxporkXjR3p/G/F24NGdm4
         YuhXQIDbO1mdMe/aRdWKdBTw+mclMUvIFcSgXv3es4UJGM0cpICy8IRM5AaKGC8MShgJ
         oJHQZTPi6r3usWaaC4wPJnOyuhY7SHTpG6ge5C2o9bv+XM+dMPvlYDwya4m11rasEFpG
         7oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697224983; x=1697829783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsychVIow/LXp2PohZlsx410ZOet1ssLl3dK2R5eP+M=;
        b=G5XCN/q3/ibGjEH0HIoj6aSNIWjRFYQZBi7/KTapIX8PCXXlJ1ArOxeMeTLwMjfqme
         hlz5mQjXXtVl0bXYJagI86+A29aLqhz7WlyYD6Kcxwgbh/NSWCb1K4rmK9abUT0xkM8N
         82muXmKEvRWFGMZ07Ph2716nm18rgentqLnLeFNoNLTmv1khLAcNY0g2cw84iBi0apuz
         0DINEYdrtC5v/Wqj2DJTQYowVw4XGF5qJf4YqjrVDvdGyTOJNR6hb0POuww4qh7NXq19
         WoooCQrzUJTpa83TGBBYaU3lj4hQPMjRP24MclP58BW5XsLEFyd1Q1sBsbKURl741++r
         Dnvw==
X-Gm-Message-State: AOJu0YzMVw9EzujmOUv0YI0qDFAwoXEGdnHyi1m/SXd4qRqq9eLcNejA
	QhMsJZ7+Y4lgvdTse/oy9F8=
X-Google-Smtp-Source: AGHT+IGfN1n0GDWRfCpstC/wYf82yEUkZGvW0rhjc/aMs+cNpzwBigLxmYYgJNoWgMo5BSJ35G1ZCw==
X-Received: by 2002:a05:6000:b02:b0:32d:a10d:90dd with SMTP id dj2-20020a0560000b0200b0032da10d90ddmr1244863wrb.50.1697224983078;
        Fri, 13 Oct 2023 12:23:03 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d6309000000b0032da40fd7bdsm44594wru.24.2023.10.13.12.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:23:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sun8i-r40: Add interconnect to video-codec
Date: Fri, 13 Oct 2023 21:23:01 +0200
Message-ID: <9177751.CDJkKcVGEf@jernej-laptop>
In-Reply-To:
 <CAGb2v65BnLK2PWh_vnntCtQhCMrAu6segShTFzrfnZMp+VV5+Q@mail.gmail.com>
References:
 <20230911171407.1572030-1-jernej.skrabec@gmail.com>
 <CAGb2v65BnLK2PWh_vnntCtQhCMrAu6segShTFzrfnZMp+VV5+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 12. oktober 2023 ob 04:53:04 CEST je Chen-Yu Tsai napisal=
(a):
> On Mon, Sep 11, 2023 at 10:14=E2=80=AFAM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > Video codec needs interconnect, so driver knows that it needs to adjust
> > DMA addresses.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>=20

Thanks!

Applied.

Jernej



