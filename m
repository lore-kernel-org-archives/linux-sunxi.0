Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D88C0A
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 07:56:02 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59e6ebdf949so9186317b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Sep 2023 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695196562; x=1695801362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W2F0GXbbtqn7CRR5nnsH3NJIOvd/wi06m4wX+wnCSk=;
        b=gWU43+TRgjPARn5Pgc9NjpA9nOCGADxH2djWEjyuFi8kFZ5udDJ95KGurGTTqBeeCu
         dT5sOAvSGt4BxuYj5vhN82heDatXUDTFWEys3nzKIb+23s1SqE8pCTGD321j8YakY/cN
         DSf1VQGKuEHdHPKolnQuCHJ+hs6S6H2kQV0XcUfDC8gT+o8kYeGWmoZjkOb5xBrDu5ny
         acq2cR3D9SMR2ldeFmd3k4Ohhv9xz0VJjNP6mAOXLt8loFQ3yTq5mK85gV2hnm5Ep/Se
         65F+x1dWeGNMNgGyPQAmCquln9sAl7JmNHfkd2g8kVi3eW+zVSNaYjbSfVZbIfUJkzYs
         OYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196562; x=1695801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W2F0GXbbtqn7CRR5nnsH3NJIOvd/wi06m4wX+wnCSk=;
        b=XNr3dR61FIONnF+Zyhdr3xQSGFNydvZFksExYVygd65IGHLKXVzucQa6yMiJjovUkw
         gXeYomsSeZ0gFtfJCXeCt92ztu8sILAvtJtLhvY/4YJZkcOat3pmw/222iiJ+VOsBrL3
         4WbYx3fVSHXa2061yp35qOxzBqiizRem9EYsztZLcnr43q04djcK6uN1tjo44wOQIlDL
         Dai/EUkezSE8aWJexIYTblBZsgnA13O+5i1Sjexjbyz5SpaYKxSldKXn7sECJzvQT9d8
         qebZj3pHH1BiZy+t3p6Wq+jMIKOrFTAR/E7Ke+pvzOAlAbqyClEgRz1chDExH0Qbg5MY
         cRig==
X-Gm-Message-State: AOJu0YwP56JHay0DBosWD2RnZA+6Jusn8Q6o3uzGuB+62E+Z3OCGAzUs
	1Lr0nmw4YQFjBe7QAYSWJW7T0SFpbzOObuFNxa0iOg==
X-Google-Smtp-Source: AGHT+IE8ZqLABHkmB1AmVdyVdn+zBjcBgUb4lYtT3ybz6pYiTkDfaC6C0g3wu5g0PMG3zmMsCIys38gLD8uinlOnnuw=
X-Received: by 2002:a81:6dd1:0:b0:59b:cf74:ee8d with SMTP id
 i200-20020a816dd1000000b0059bcf74ee8dmr5249310ywc.10.1695196561782; Wed, 20
 Sep 2023 00:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230916081615.4237-1-iuncuim@gmail.com>
In-Reply-To: <20230916081615.4237-1-iuncuim@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Sep 2023 09:55:49 +0200
Message-ID: <CACRpkdYPtxAZrf4=btbF53U3CGgSMOZ_39eJDWjBTwBU21XYaQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: h616: add extra gpio banks
To: Mikhail Kalashnikov <iuncuim@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 10:16=E2=80=AFAM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:

> From: iuncuim <iuncuim@gmail.com>
>
> Some SoCs from the H616 family (such as the T507) have the same die but
> more output pins that are used for additional peripherals. The T507 SoC
> don't have a built-in multiphy like the AC200 or AC300 connected to the
> bank A. With the T507 these pins can be freely used for any other applica=
tion.
> This patch adds the missing muxes on banks A, D and E.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Changes from v2:
>  * replaced gpio alt functions from "h_i2s0" to "i2s0"
> https://lore.kernel.org/linux-sunxi/20230909094529.6083-1-iuncuim@gmail.c=
om/

No review on this yet, but I think Neil Armstrong is familiar with
the AMLogic stuff so paging him!

Yours,
Linus Walleij
