Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398237491;
	Tue,  2 May 2023 21:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACACC433A1;
	Tue,  2 May 2023 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683062874;
	bh=jCPU9c2wabBAGUXBx0w4fzzWZn23Up45NdgJcoiuHoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeycS2K3ewctYzTEloVu2+psY1yqWMXDLYjl/hvzEsuI/rCoQyIWWrcInlG2NU5Vt
	 ZhiIh1MtTKjd9pFeckk+tiJy1vVp29OFdMTgDcx/WJ8LIp4BhfJ3MXtCJQAtf7GADC
	 ZJdBo0RViTWUfEfA3DXuXjn1fFMM3XfEJZyZ5wmhns7RNVlUIWAnXy7ypOpLvEIpYJ
	 r4LQxZKMQxJG/FTUbYhGjyuF3Mv044AWIzcT07DI6ofTS/0sY0cUV9ehQof2sSRQE/
	 DSdSrQeAczbNO8taFydoCq3ou1kt6VgqPZ91Zx6Dw9OIFvc9BxWvsfCMDi0PxjaTpH
	 o/TXDp3yhtUmA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2a8bbea12d7so44323371fa.3;
        Tue, 02 May 2023 14:27:53 -0700 (PDT)
X-Gm-Message-State: AC+VfDzjR5sHil0jzOV2c+G7/IOazb214APkHHmBppkrDeRXjQSlR83x
	rlyp8d/giR075Xj3yS9Aiu8q0yo+KsT8Yog+Yg==
X-Google-Smtp-Source: ACHHUZ4VmzJ58Blp8vkFEMpnZTP3rUtg0aygjDIMYeTMpSWAwJvPoANOd1LtrOl749GRPWYY5WO4jHHB7hvvVyp4ngc=
X-Received: by 2002:a2e:860b:0:b0:2a8:bb99:250d with SMTP id
 a11-20020a2e860b000000b002a8bb99250dmr5156347lji.6.1683062871907; Tue, 02 May
 2023 14:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
In-Reply-To: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 16:27:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, 
	Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 4:19=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> w=
rote:
>
> > I've dusted off my script and made a branch[1] with the result.
> > There's just a couple of fixes needed after the script is run (see the
> > top commit). The cross arch includes are all fixed up by the script.
> > dtbs_install maintains a flat install. I compared the number of .dtbs
> > before and after to check the script.
> >
> > I think the only issue remaining is finalizing the mapping of
> > platforms to subdirs. What I have currently is a mixture of SoC
> > families and vendors. The most notable are all the Freescale/NXP
> > platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> > either. Once that's finalized, I still need to go update MAINTAINERS.
>
> I see my nits were fixed like I wanted them, and it's now mostly a
> mix of soc and vendor names that make sense so from my point of view:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> NB:
> arch/arm64/boot/dts/arm$
> vexpress-v2m-rs1.dtsi -> ../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi
>
> This still works after the script, yes?

Yes, because in the script I do:

git grep -l -F "vexpress-v2m-rs1" arch/arm64/boot/dts | xargs perl -p
-i -e "s/vexpress-v2m-rs1/arm\/arm\/vexpress-v2m-rs1/"

Rob
