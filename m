Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD57B
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Mar 2022 14:45:43 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id z30so4860257ybi.2
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Mar 2022 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDxwxI7sXDfb+b36liCBjMX3NW7CAhbvcM5a4UCs5v4=;
        b=i7W91ZT+engSvxyFtitwW4zJoC2KJUH7GAoAeYnyBpSwStQEEQ/Bt2ZPndrmmXFsaO
         SsLBfPJbwfzEbp/wz46GBMErlD2L2WZEIImm7VsCRGt1X07GsDEyM1coyhR8i6mnOUu4
         9wso3n2Bs4AjvFg0MP2q34vrvW1lLTiXpwegmpTr3Mp9LEawsZSMB+Ks1eJWqJLQRDWS
         XyYIB3ObyHBjVVcM2iujZ5q7d0vXuDd7kbHHFsl0PJy4R3LYLrpZOsflS+3lJrOE1Yf4
         XF3nQi6sxWKYxDM72bwcjYM0g6t+haBgmTB1M136HKO8++mbKENP5zHOBuvsy3Scw6uU
         rOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDxwxI7sXDfb+b36liCBjMX3NW7CAhbvcM5a4UCs5v4=;
        b=Pc6KwFAbVIIBUgEQFmNQcbi4kURn416cSFckqq/W0Fj/AbcKKTST+UmeAkIisHKyl+
         WLn7NGMqQ5sumVZHPm368L1etFkNkUVELVXU7s4KH+0CPw43HQ4TIYpaXpXqhampzMDh
         A0pcwBHSWW8r/yjwi+M09CMBwVrGlnb4xsc6T3M79ZwHo8jnbvXGaUXtoiWrxJLZeBoI
         +ke2FNl0unEOnFiv1+a93JMG+R9JzyA9KbWghX3STiXjbKs2B7vWDFaw4JX52YBoRxLa
         GPmr4/xZkaswU1Yg1MNrfBJrrMEW/IXWPqEelbsQyF38H5YNauWIrj0bM88Y42Rhlfjm
         17Aw==
X-Gm-Message-State: AOAM5306sKuNG3etaw4pnM+xgQhwNNUoMQNQxhd35HPn0OnDdFlFfSpP
	v8UlhEUJ2fEEoOg/qa91A8EquIlJCiT84M1FKwI=
X-Google-Smtp-Source: ABdhPJyJ4ZlBOxxqgJg5t84MuLjlLqtsmqVAaSTchLmm8kQRhAwvtLzf/tmkTFVdgMHjStEAfGt8JYiqQwzL0WNk4qg=
X-Received: by 2002:a05:6902:603:b0:625:989:c675 with SMTP id
 d3-20020a056902060300b006250989c675mr16523687ybt.470.1646837142397; Wed, 09
 Mar 2022 06:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com> <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com> <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
 <1e828df4-7c5d-01af-cc49-3ef9de2cf6de@gmail.com> <1j8rts76te.fsf@starbuckisacylon.baylibre.com>
 <a4d3fef1-d410-c029-cdff-4d90f578e2da@gmail.com> <CAK4VdL08sdZV7o7Bw=cutdmoCEi1NYB-yisstLqRuH7QcHOHvA@mail.gmail.com>
 <435b2a9d-c3c6-a162-331f-9f47f69be5ac@gmail.com>
In-Reply-To: <435b2a9d-c3c6-a162-331f-9f47f69be5ac@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 9 Mar 2022 15:45:31 +0100
Message-ID: <CAK4VdL28nWstiS09MYq5nbtiL+aMbNc=Hzv5F0-VMuNKmX9R+Q@mail.gmail.com>
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 6, 2022 at 1:56 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> You could try the following (quick and dirty) test patch that fully mimics
> the vendor driver as found here:
> https://github.com/khadas/linux/blob/buildroot-aml-4.9/drivers/amlogic/ethernet/phy/amlogic.c
>
> First apply
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=a502a8f04097e038c3daa16c5202a9538116d563
> This patch is in the net tree currently and should show up in linux-next
> beginning of the week.
>
> On top please apply the following (it includes the test patch your working with).

I triggered test jobs with this configuration (latest mainline +
a502a8f0409 + test patch for vendor driver behaviour), and the results
are pretty much the same as with the previous test patch from this
thread only.
That is, I never got the issue with non-functional link up anymore,
but I get the (rare) issue with link not going up.
The reproducibility is still extremely low, in the >1% range.

So at this point, I'm not sure how much more effort to invest into
this. Given the rate is very low and the fallback is it will just
reset the link and proceed to work, I think the situation would
already be much better with the solution from that test patch being
merged. If you propose that as a patch separately, I'm happy to test
the final submitted patch again and provide feedback there. Or if
there is another solution to try, I can try with that too.

Thanks


Erico
