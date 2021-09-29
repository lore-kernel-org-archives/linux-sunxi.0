Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52672
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Sep 2021 10:05:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 246476141B
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Sep 2021 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632909914;
	bh=Xxn9/SD1dYhlDwttos3PuGBQ5U/2yCNeeOkyqW/lvMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ORjEaY8oVoBe/kc1cZJj2pdtkHjlj8HbwEZxZTWQ2RJxE3GmpxNBmdNmOnphEgvSX
	 ZOxvvBYGhy3vPJuqA7LfPTEfGfZd04jb5pa8GODKkdyshK6wcZoWwPGMWC+MS9U+hB
	 xbVhK4m/Jq2Iwa6W/3givlEv93HsBHlrwK8xareW519JavUdMcvSDsFayE2ZD0oN8U
	 pIltEb8rvFoy0z9I8Y2vMLwBlDucBVUKGTbifrVUXnBcQOBZxHm/pShHiIlrwCdByI
	 22paW8ns7SMXCobLPJLkLp0xaLAaB7vuo8aCGQL+Oy4kg80h0CJMOIrD0tYnYvfS9M
	 gE71ALaohzM2g==
Received: by mail-wm1-f48.google.com with SMTP id o19so1388174wms.1
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Sep 2021 03:05:14 -0700 (PDT)
X-Gm-Message-State: AOAM530m6LykITK8A4VC4PZ9VwO1ZidlbvaMpO6xiMVKlRxFkJf7aFVQ
	7thV+8yjTvzw4KWbxxa0N8ho0iikQBc0MimO+T0=
X-Google-Smtp-Source: ABdhPJxj45zzIMnN/HHyq+6nU2KpFjlg3Tr2+Q2ZpxFzEZguNBmccSscTdNWt05AmI9I9AwUnU3a/laQUUwcLa8ETFA=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr9378065wmp.173.1632909912585;
 Wed, 29 Sep 2021 03:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927152412.2900928-1-arnd@kernel.org> <20210929095107.GA21057@willie-the-truck>
In-Reply-To: <20210929095107.GA21057@willie-the-truck>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 29 Sep 2021 12:04:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
Message-ID: <CAK8P3a2QnJkYCoEWhziYYXQusb-25_wUhA5ZTGtBsyfFx3NWzQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
To: Will Deacon <will@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Kalle Valo <kvalo@codeaurora.org>, Andy Gross <agross@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno <freedreno@lists.freedesktop.org>, 
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 11:51 AM Will Deacon <will@kernel.org> wrote:
> On Mon, Sep 27, 2021 at 05:22:13PM +0200, Arnd Bergmann wrote:
> >
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 124c41adeca1..989c83acbfee 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -308,7 +308,7 @@ config APPLE_DART
> >  config ARM_SMMU
> >       tristate "ARM Ltd. System MMU (SMMU) Support"
> >       depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > -     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > +     select QCOM_SCM
> >       select IOMMU_API
> >       select IOMMU_IO_PGTABLE_LPAE
> >       select ARM_DMA_USE_IOMMU if ARM
>
> I don't want to get in the way of this patch because I'm also tired of the
> randconfig failures caused by QCOM_SCM. However, ARM_SMMU is applicable to
> a wide variety of (non-qcom) SoCs and so it seems a shame to require the
> QCOM_SCM code to be included for all of those when it's not strictly needed
> at all.

Good point, I agree that needs to be fixed. I think this additional
change should do the trick:

--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -308,7 +308,6 @@ config APPLE_DART
 config ARM_SMMU
        tristate "ARM Ltd. System MMU (SMMU) Support"
        depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-       select QCOM_SCM
        select IOMMU_API
        select IOMMU_IO_PGTABLE_LPAE
        select ARM_DMA_USE_IOMMU if ARM
@@ -438,7 +437,7 @@ config QCOM_IOMMU
        # Note: iommu drivers cannot (yet?) be built as modules
        bool "Qualcomm IOMMU Support"
        depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-       depends on QCOM_SCM=y
+       select QCOM_SCM
        select IOMMU_API
        select IOMMU_IO_PGTABLE_LPAE
        select ARM_DMA_USE_IOMMU

I'll see if that causes any problems for the randconfig builds.

       Arnd
