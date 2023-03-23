Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA328E8
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 08:30:00 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-544787916d9so382482507b3.13
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
        b=auh9w4//9ZjxHavJWL3nkpB/8hz0Qp657Qd/SCGI99yNlonXV4rVy5V4S1re8qkcn1
         wkHuP4yLqaLpr3BATeYTwZhpHFNYMfhfFvBhiaCPBw/43c/9AHaP5/WD1W6q26CxW/vS
         lDzn2Qownfc29i6U6Qtbr59OzMfkO34zvh/5tfqdspVIwECXzBhf/LUIKt4b4RECX1wZ
         0CNn004ZOkQV1DzcmtML/tSlFQkB2aeZRstUu/ubRvYRPMUI0u3BBd1ay5qU/mNNTDqk
         sZdrN1sJgL8NQhS71hyQ6ktPfYar/qav4R/fpkO1+qUOzmGfL8gHp/MFV+mULzky+X56
         ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESqicvrtxMjgfv2DQ/MbAC2UcJgHBWQRNQuYleU6Lxc=;
        b=n3BrNMBhxFuU9nu+m8Fb34X0JQoQgyz7yuS+lCEuFVC6koRHZzwdbysApi3Sr/l1hG
         q6Onk20KimAiJMBk2Y929/z4G1MZ7WMolCDAcg5ISOVy1VPArz6NN43R7qEtCam7i8PX
         hO2mUBTN2s6rvEnd7COYVjkBzRtC/tlrEkFi0TJ1HY82YNTyH7vvUE02J31rrBQK8ul2
         P7uLam3XxhunAB7LhQDlP3Goc1Vm13u1LMwt6TCir7qOP3tmHdn9I1PeuS0rcDJyM7mh
         bNYurAYyZHBKkE6JSJegz0h52qm+pYu7XSlKHpo3Ai5Nw+VlzyOo8dx1+YRFcg5dtJU/
         wgig==
X-Gm-Message-State: AAQBX9d4GqLlU8yGnUFlzipbVeA3GgVzzdD2DgzX++untB7WMpo8QgWK
	0D1alKD69Z4001MQ3UAabV//Pav9z2lhbZUTwHL6vg==
X-Google-Smtp-Source: AKy350ZNlg5R5/BZzQajdKFhT8TJ5d/EfLNOqmBrkrroUQh7Bq9HML1sAQV9tmcb+eMmwJWymvt43FU84C+ft7dowAo=
X-Received: by 2002:a0d:ec4a:0:b0:541:753d:32f9 with SMTP id
 r10-20020a0dec4a000000b00541753d32f9mr1395590ywn.9.1679560199380; Thu, 23 Mar
 2023 01:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
 <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com> <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:29:48 +0100
Message-ID: <CACRpkdbaCX0Fdr5guWZqCO_iVQrnOMmN-FYMV=LfFDsz9cdULA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sean Wang <sean.wang@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 7:18=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> > So I need a new version of this patch before I can apply it
> > I guess, or there will be conflict with Reseas stuff?
>
> Can you just drop drivers/pinctrl/renesas/pinctrl.c from this patch?

You just exposed how lazy I am ;)

OK I did that, patch applied sans the renesas hunk.

Yours,
Linus Walleij
